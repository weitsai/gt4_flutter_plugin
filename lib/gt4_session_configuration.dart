import 'dart:ui';

import 'gt4_enum.dart';

class GT4SessionConfiguration {
  /*
  静态资源文件的路径, 默认为空。
  如果为远程文件，则应为完成路径。
  如果为本地文件，则应为文件所在路径（不包含文件）。
   */
  String? resourcePath;

  // 远程访问静态资源时的协议，默认 @“https”。
  String? protocol;

  // 界面样式，4个枚举值，默认 `GTC4UserInterfaceStyleLight`
  GTC4UserInterfaceStyle? userInterfaceStyle;

  // 界面的展示方式，4个枚举值，默认 `GTC4DisplayStyleCenter`
  GTC4DisplayStyle? displayStyle;

  // 背景颜色，默认透明
  Color? backgroundColor;

  // 调试模式开关，默认关闭
  bool? debugEnable;

  // 点击背景的交互，默认开启。
  bool? canceledOnTouchOutside;

  // 单位为秒，ios 默认 8000，安卓 10000
  int? timeout;

  /*
  语言，默认跟随系统。
  如果系统为不支持的语言，则为中文简体。
  指定语言请参考文档中的语言短码清单（ISO 639-2 标准）
  */
  String? language;

  // 额外的参数, 默认为空。参数将被组装后提交到验证服务。
  Map<String,String>? additionalParameter;


  Map<String, dynamic> toMap() {
    return {
      "resourcePath": resourcePath,
      "protocol": protocol,
      "userInterfaceStyle": userInterfaceStyle?.index,
      "displayStyle": displayStyle?.index,
      "backgroundColor": backgroundColor?.value.toRadixString(16),
      "debugEnable": debugEnable,
      "canceledOnTouchOutside": canceledOnTouchOutside,
      "language": language,
      "additionalParameter": additionalParameter
    }..removeWhere((key, value) => value == null);
  }
}