From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@savoirfairelinux.com>
Date: Wed, 22 Mar 2017 14:13:29 -0400
Subject: [Buildroot] [RFC 1/3] qt5webengine: new package
In-Reply-To: <20170322181331.23500-1-gael.portay@savoirfairelinux.com>
References: <20170322181331.23500-1-gael.portay@savoirfairelinux.com>
Message-ID: <20170322181331.23500-2-gael.portay@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch is based on works [1] and [2].

[1]: http://lists.busybox.net/pipermail/buildroot/2015-July/132010.html
[2]: https://patchwork.ozlabs.org/patch/640633/

Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
---
 package/qt5/Config.in                              |   1 +
 .../qt5/qt5webengine/0001-prefer-arm_tune.patch    |  19 ++
 .../qt5webengine/0002-change-default-ssl-dir.patch |  18 ++
 package/qt5/qt5webengine/Config.in                 |  44 ++++
 package/qt5/qt5webengine/chromium.inc              | 238 +++++++++++++++++++++
 package/qt5/qt5webengine/qt5webengine.hash         |   5 +
 package/qt5/qt5webengine/qt5webengine.mk           |  82 +++++++
 7 files changed, 407 insertions(+)
 create mode 100644 package/qt5/qt5webengine/0001-prefer-arm_tune.patch
 create mode 100644 package/qt5/qt5webengine/0002-change-default-ssl-dir.patch
 create mode 100644 package/qt5/qt5webengine/Config.in
 create mode 100644 package/qt5/qt5webengine/chromium.inc
 create mode 100644 package/qt5/qt5webengine/qt5webengine.hash
 create mode 100644 package/qt5/qt5webengine/qt5webengine.mk

diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index 4bcbc6ef5..a45c9e027 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -78,6 +78,7 @@ source "package/qt5/qt5svg/Config.in"
 source "package/qt5/qt5tools/Config.in"
 source "package/qt5/qt5webchannel/Config.in"
 source "package/qt5/qt5webkit/Config.in"
+source "package/qt5/qt5webengine/Config.in"
 source "package/qt5/qt5websockets/Config.in"
 source "package/qt5/qt5x11extras/Config.in"
 source "package/qt5/qt5xmlpatterns/Config.in"
diff --git a/package/qt5/qt5webengine/0001-prefer-arm_tune.patch b/package/qt5/qt5webengine/0001-prefer-arm_tune.patch
new file mode 100644
index 000000000..a4662d0c3
--- /dev/null
+++ b/package/qt5/qt5webengine/0001-prefer-arm_tune.patch
@@ -0,0 +1,19 @@
+Prefer arm_tune to arm_arch
+
+If user specifies arm_tune, ignore default arm_arch.
+
+Signed-off-by: Akihiko Odaki <akihiko.odaki.4i@stu.hosei.ac.jp>
+---
+Index: qt5webengine-5.6.1/src/3rdparty/chromium/build/common.gypi
+===================================================================
+--- qt5webengine-5.6.1.orig/src/3rdparty/chromium/build/common.gypi
++++ qt5webengine-5.6.1/src/3rdparty/chromium/build/common.gypi
+@@ -3977,7 +3977,7 @@
+                       '-target arm-linux-gnueabihf',
+                     ],
+                   }],
+-                  ['arm_arch!=""', {
++                  ['arm_arch!="" and arm_tune==""', {
+                     'cflags': [
+                       '-march=<(arm_arch)',
+                     ],
diff --git a/package/qt5/qt5webengine/0002-change-default-ssl-dir.patch b/package/qt5/qt5webengine/0002-change-default-ssl-dir.patch
new file mode 100644
index 000000000..35cc1902a
--- /dev/null
+++ b/package/qt5/qt5webengine/0002-change-default-ssl-dir.patch
@@ -0,0 +1,18 @@
+Change the default SSL directory, as buildroot ca-cert package is
+installed at /etc/ssl. That way, we don't have to use the SSL_CERT_DIR
+environment at runtime.
+
+Signed-off-by: Damien Riegel <damien.riegel@savoirfairelinux.com>
+
+diff -Nura qt5webengine-5.8.0.orig/src/core/qtwebengine_extras.gypi qt5webengine-5.8.0/src/core/qtwebengine_extras.gypi
+--- qt5webengine-5.8.0.orig/src/core/qtwebengine_extras.gypi	2017-01-03 05:35:11.000000000 -0500
++++ qt5webengine-5.8.0/src/core/qtwebengine_extras.gypi	2017-03-03 16:24:34.947416678 -0500
+@@ -103,7 +103,7 @@
+             'GL_GLEXT_PROTOTYPES',
+             'EGL_EGLEXT_PROTOTYPES',
+             # At runtime the env variable SSL_CERT_DIR can be used to override this
+-            'OPENSSLDIR="/usr/lib/ssl"',
++            'OPENSSLDIR="/etc/ssl"',
+             'OPENSSL_LOAD_CONF',
+             'EGL_API_FB=1',
+             'LINUX=1',
diff --git a/package/qt5/qt5webengine/Config.in b/package/qt5/qt5webengine/Config.in
new file mode 100644
index 000000000..1cd650293
--- /dev/null
+++ b/package/qt5/qt5webengine/Config.in
@@ -0,0 +1,44 @@
+comment "qt5webengine needs an Open(E)GL-capable backend"
+	depends on BR2_PACKAGE_QT5
+	depends on !BR2_PACKAGE_QT5_GL_AVAILABLE || !BR2_PACKAGE_HAS_LIBEGL
+
+config BR2_PACKAGE_QT5WEBENGINE
+	bool "qt5webengine"
+	depends on BR2_PACKAGE_QT5
+	depends on BR2_PACKAGE_QT5_GL_AVAILABLE && BR2_PACKAGE_HAS_LIBEGL
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_QT5BASE
+	select BR2_PACKAGE_QT5BASE_DBUS
+	select BR2_PACKAGE_QT5BASE_FONTCONFIG
+	select BR2_PACKAGE_QT5BASE_ICU
+	select BR2_PACKAGE_QT5BASE_GUI
+	select BR2_PACKAGE_QT5BASE_EGLFS
+	select BR2_PACKAGE_QT5BASE_WIDGETS
+	select BR2_PACKAGE_QT5DECLARATIVE
+	select BR2_PACKAGE_QT5DECLARATIVE_QUICK
+	select BR2_PACKAGE_QT5WEBCHANNEL
+	select BR2_PACKAGE_XLIB_LIBXCOMPOSITE if BR2_PACKAGE_QT5BASE_XCB
+	select BR2_PACKAGE_XLIB_LIBXCURSOR if BR2_PACKAGE_QT5BASE_XCB
+	select BR2_PACKAGE_XLIB_LIBXI if BR2_PACKAGE_QT5BASE_XCB
+	select BR2_PACKAGE_XLIB_LIBXRANDR if BR2_PACKAGE_QT5BASE_XCB
+	select BR2_PACKAGE_XLIB_LIBXSCRNSAVER if BR2_PACKAGE_QT5BASE_XCB
+	select BR2_PACKAGE_XLIB_LIBXTST if BR2_PACKAGE_QT5BASE_XCB
+	help
+	  The Qt WebEngine module provides a web browser engine that makes it
+	  easy to embed content from the World Wide Web into your Qt application
+	  on platforms that do not have a native web engine.
+
+	  Qt WebEngine provides C++ classes and QML types for rendering HTML,
+	  XHTML, and SVG documents, styled using Cascading Style Sheets (CSS)
+	  and scripted with JavaScript. HTML documents can be made fully
+	  editable by the user through the use of the contenteditable attribute
+	  on HTML elements.
+
+if BR2_PACKAGE_QT5WEBENGINE
+config BR2_PACKAGE_QT5WEBENGINE_PROPRIETARY_CODECS
+	bool "proprietary codecs"
+	help
+	  Qt WebEngine supports the MPEG-4 Part 14 (MP4) file format; which
+	  includes required proprietary audio and video codecs, such as H.264
+	  and MPEG layer-3 (MP3).
+endif
diff --git a/package/qt5/qt5webengine/chromium.inc b/package/qt5/qt5webengine/chromium.inc
new file mode 100644
index 000000000..14befcbf2
--- /dev/null
+++ b/package/qt5/qt5webengine/chromium.inc
@@ -0,0 +1,238 @@
+CHROMIUM_LICENSE_FILES = \
+	src/3rdparty/chromium/chrome/third_party/chromevox/third_party/closure-library/LICENSE \
+	src/3rdparty/chromium/chrome/third_party/chromevox/LICENSE \
+	src/3rdparty/chromium/v8/LICENSE.strongtalk \
+	src/3rdparty/chromium/v8/LICENSE.valgrind \
+	src/3rdparty/chromium/v8/LICENSE.v8 \
+	src/3rdparty/chromium/v8/LICENSE.fdlibm \
+	src/3rdparty/chromium/v8/LICENSE \
+	src/3rdparty/chromium/v8/src/third_party/vtune/LICENSE \
+	src/3rdparty/chromium/v8/src/third_party/fdlibm/LICENSE \
+	src/3rdparty/chromium/v8/src/third_party/valgrind/LICENSE \
+	src/3rdparty/chromium/testing/gtest/LICENSE \
+	src/3rdparty/chromium/testing/gmock/scripts/generator/LICENSE \
+	src/3rdparty/chromium/testing/gmock/LICENSE \
+	src/3rdparty/chromium/base/third_party/dynamic_annotations/LICENSE \
+	src/3rdparty/chromium/base/third_party/nspr/LICENSE \
+	src/3rdparty/chromium/base/third_party/libevent/LICENSE \
+	src/3rdparty/chromium/base/third_party/icu/LICENSE \
+	src/3rdparty/chromium/base/third_party/symbolize/LICENSE \
+	src/3rdparty/chromium/base/third_party/dmg_fp/LICENSE \
+	src/3rdparty/chromium/base/third_party/xdg_user_dirs/LICENSE \
+	src/3rdparty/chromium/base/third_party/superfasthash/LICENSE \
+	src/3rdparty/chromium/base/third_party/xdg_mime/LICENSE \
+	src/3rdparty/chromium/base/third_party/valgrind/LICENSE \
+	src/3rdparty/chromium/third_party/blimp_fonts/LICENSE.OFL \
+	src/3rdparty/chromium/third_party/blimp_fonts/LICENSE \
+	src/3rdparty/chromium/third_party/blimp_fonts/LICENSE.Apache \
+	src/3rdparty/chromium/third_party/decklink/LICENSE \
+	src/3rdparty/chromium/third_party/ced/LICENSE \
+	src/3rdparty/chromium/third_party/ced/src/LICENSE \
+	src/3rdparty/chromium/third_party/modp_b64/LICENSE \
+	src/3rdparty/chromium/third_party/ow2_asm/LICENSE \
+	src/3rdparty/chromium/third_party/isimpledom/LICENSE \
+	src/3rdparty/chromium/third_party/minigbm/LICENSE \
+	src/3rdparty/chromium/third_party/cros_system_api/MODULE_LICENSE_BSD \
+	src/3rdparty/chromium/third_party/cros_system_api/LICENSE \
+	src/3rdparty/chromium/third_party/gardiner_mod/LICENSE \
+	src/3rdparty/chromium/third_party/tlslite/LICENSE \
+	src/3rdparty/chromium/third_party/wayland/LICENSE \
+	src/3rdparty/chromium/third_party/webpagereplay/third_party/ipfw_win32/LICENSE \
+	src/3rdparty/chromium/third_party/webpagereplay/third_party/jsmin/LICENSE.txt \
+	src/3rdparty/chromium/third_party/webpagereplay/third_party/dns/LICENSE \
+	src/3rdparty/chromium/third_party/pyelftools/elftools/construct/LICENSE \
+	src/3rdparty/chromium/third_party/pyelftools/LICENSE \
+	src/3rdparty/chromium/third_party/closure_compiler/LICENSE \
+	src/3rdparty/chromium/third_party/libsync/LICENSE \
+	src/3rdparty/chromium/third_party/requests/LICENSE \
+	src/3rdparty/chromium/third_party/mach_override/LICENSE \
+	src/3rdparty/chromium/third_party/pymock/LICENSE.txt \
+	src/3rdparty/chromium/third_party/cardboard-java/LICENSE \
+	src/3rdparty/chromium/third_party/usb_ids/LICENSE \
+	src/3rdparty/chromium/third_party/checkstyle/LICENSE \
+	src/3rdparty/chromium/third_party/checkstyle/LICENSE.apache20 \
+	src/3rdparty/chromium/third_party/apache-portable-runtime/LICENSE \
+	src/3rdparty/chromium/third_party/zlib/LICENSE \
+	src/3rdparty/chromium/third_party/protobuf/LICENSE \
+	src/3rdparty/chromium/third_party/blanketjs/LICENSE \
+	src/3rdparty/chromium/third_party/vulkan/LICENSE \
+	src/3rdparty/chromium/third_party/pywebsocket/src/LICENSE \
+	src/3rdparty/chromium/third_party/gif_player/LICENSE \
+	src/3rdparty/chromium/third_party/py_trace_event/src/LICENSE \
+	src/3rdparty/chromium/third_party/woff2/LICENSE \
+	src/3rdparty/chromium/third_party/lzma_sdk/LICENSE \
+	src/3rdparty/chromium/third_party/pdfium/third_party/bigint/LICENSE \
+	src/3rdparty/chromium/third_party/pdfium/third_party/pymock/LICENSE.txt \
+	src/3rdparty/chromium/third_party/pdfium/LICENSE \
+	src/3rdparty/chromium/third_party/tcmalloc/LICENSE \
+	src/3rdparty/chromium/third_party/x86inc/LICENSE \
+	src/3rdparty/chromium/third_party/mt19937ar/LICENSE \
+	src/3rdparty/chromium/third_party/closure_linter/LICENSE \
+	src/3rdparty/chromium/third_party/mesa/LICENSE \
+	src/3rdparty/chromium/third_party/mesa/src/src/gallium/drivers/radeon/LICENSE.TXT \
+	src/3rdparty/chromium/third_party/Python-Markdown/LICENSE.md \
+	src/3rdparty/chromium/third_party/jmake/LICENSE \
+	src/3rdparty/chromium/third_party/motemplate/LICENSE \
+	src/3rdparty/chromium/third_party/fontconfig/LICENSE \
+	src/3rdparty/chromium/third_party/iaccessible2/LICENSE \
+	src/3rdparty/chromium/third_party/class-dump/LICENSE \
+	src/3rdparty/chromium/third_party/icu/scripts/LICENSE \
+	src/3rdparty/chromium/third_party/icu/LICENSE \
+	src/3rdparty/chromium/third_party/webdriver/LICENSE \
+	src/3rdparty/chromium/third_party/libyuv/third_party/gflags/LICENSE \
+	src/3rdparty/chromium/third_party/libyuv/LICENSE \
+	src/3rdparty/chromium/third_party/libyuv/LICENSE_THIRD_PARTY \
+	src/3rdparty/chromium/third_party/hwcplus/LICENSE \
+	src/3rdparty/chromium/third_party/boringssl/src/third_party/android-cmake/LICENSE \
+	src/3rdparty/chromium/third_party/boringssl/src/LICENSE \
+	src/3rdparty/chromium/third_party/ffmpeg/LICENSE.md \
+	src/3rdparty/chromium/third_party/mozilla/LICENSE \
+	src/3rdparty/chromium/third_party/sqlite/LICENSE \
+	src/3rdparty/chromium/third_party/webrtc/LICENSE \
+	src/3rdparty/chromium/third_party/webrtc/LICENSE_THIRD_PARTY \
+	src/3rdparty/chromium/third_party/webrtc/examples/objc/AppRTCDemo/third_party/SocketRocket/LICENSE \
+	src/3rdparty/chromium/third_party/webrtc/examples/androidapp/third_party/autobanh/LICENSE.md \
+	src/3rdparty/chromium/third_party/webrtc/examples/androidapp/third_party/autobanh/LICENSE \
+	src/3rdparty/chromium/third_party/khronos/LICENSE \
+	src/3rdparty/chromium/third_party/drmemory/LICENSE \
+	src/3rdparty/chromium/third_party/skia/platform_tools/android/third_party/ashmem/LICENSE \
+	src/3rdparty/chromium/third_party/skia/third_party/libpng/LICENSE \
+	src/3rdparty/chromium/third_party/skia/third_party/etc1/LICENSE \
+	src/3rdparty/chromium/third_party/skia/LICENSE \
+	src/3rdparty/chromium/third_party/javax_inject/LICENSE \
+	src/3rdparty/chromium/third_party/glslang/LICENSE \
+	src/3rdparty/chromium/third_party/robolectric/LICENSE \
+	src/3rdparty/chromium/third_party/netty4/LICENSE \
+	src/3rdparty/chromium/third_party/accessibility_test_framework/LICENSE \
+	src/3rdparty/chromium/third_party/libvpx/source/libvpx/third_party/x86inc/LICENSE \
+	src/3rdparty/chromium/third_party/libvpx/source/libvpx/third_party/googletest/src/LICENSE \
+	src/3rdparty/chromium/third_party/libvpx/source/libvpx/third_party/libwebm/LICENSE.TXT \
+	src/3rdparty/chromium/third_party/libvpx/source/libvpx/LICENSE \
+	src/3rdparty/chromium/third_party/sqlite4java/LICENSE \
+	src/3rdparty/chromium/third_party/libFuzzer/LICENSE.TXT \
+	src/3rdparty/chromium/third_party/jsoncpp/LICENSE \
+	src/3rdparty/chromium/third_party/haha/LICENSE \
+	src/3rdparty/chromium/third_party/hamcrest/LICENSE \
+	src/3rdparty/chromium/third_party/dom_distiller_js/LICENSE \
+	src/3rdparty/chromium/third_party/xdg-utils/LICENSE \
+	src/3rdparty/chromium/third_party/iccjpeg/LICENSE \
+	src/3rdparty/chromium/third_party/wds/LICENSE \
+	src/3rdparty/chromium/third_party/sinonjs/LICENSE \
+	src/3rdparty/chromium/third_party/mockito/LICENSE \
+	src/3rdparty/chromium/third_party/proguard/LICENSE \
+	src/3rdparty/chromium/third_party/web-animations-js/LICENSE \
+	src/3rdparty/chromium/third_party/molokocacao/LICENSE \
+	src/3rdparty/chromium/third_party/libXNVCtrl/LICENSE \
+	src/3rdparty/chromium/third_party/apple_apsl/LICENSE \
+	src/3rdparty/chromium/third_party/libsecret/LICENSE \
+	src/3rdparty/chromium/third_party/libwebp/LICENSE \
+	src/3rdparty/chromium/third_party/ply/LICENSE \
+	src/3rdparty/chromium/third_party/custom_tabs_client/LICENSE \
+	src/3rdparty/chromium/third_party/polymer/v1_0/components-chromium/polymer/LICENSE.txt \
+	src/3rdparty/chromium/third_party/markupsafe/LICENSE \
+	src/3rdparty/chromium/third_party/shaderc/LICENSE \
+	src/3rdparty/chromium/third_party/shaderc/src/third_party/LICENSE.glslang \
+	src/3rdparty/chromium/third_party/shaderc/src/third_party/LICENSE.spirv-tools \
+	src/3rdparty/chromium/third_party/shaderc/src/LICENSE \
+	src/3rdparty/chromium/third_party/libpng/LICENSE \
+	src/3rdparty/chromium/third_party/swiftshader/LICENSE \
+	src/3rdparty/chromium/third_party/ots/LICENSE \
+	src/3rdparty/chromium/third_party/mocha/LICENSE \
+	src/3rdparty/chromium/third_party/bspatch/LICENSE \
+	src/3rdparty/chromium/third_party/ub-uiautomator/LICENSE \
+	src/3rdparty/chromium/third_party/guava/LICENSE \
+	src/3rdparty/chromium/third_party/crashpad/crashpad/third_party/apple_cf/APPLE_LICENSE \
+	src/3rdparty/chromium/third_party/crashpad/crashpad/third_party/apple_cctools/cctools/APPLE_LICENSE \
+	src/3rdparty/chromium/third_party/crashpad/crashpad/third_party/getopt/LICENSE \
+	src/3rdparty/chromium/third_party/crashpad/crashpad/LICENSE \
+	src/3rdparty/chromium/third_party/grpc/third_party/rake-compiler-dock/LICENSE.txt \
+	src/3rdparty/chromium/third_party/grpc/LICENSE \
+	src/3rdparty/chromium/third_party/grpc/src/php/ext/grpc/LICENSE \
+	src/3rdparty/chromium/third_party/libjpeg/LICENSE \
+	src/3rdparty/chromium/third_party/re2/LICENSE \
+	src/3rdparty/chromium/third_party/re2/src/LICENSE \
+	src/3rdparty/chromium/third_party/catapult/tracing/third_party/jszip/LICENSE.markdown \
+	src/3rdparty/chromium/third_party/catapult/tracing/third_party/gl-matrix/LICENSE.md \
+	src/3rdparty/chromium/third_party/catapult/tracing/third_party/chai/LICENSE \
+	src/3rdparty/chromium/third_party/catapult/tracing/third_party/mocha/LICENSE \
+	src/3rdparty/chromium/third_party/catapult/tracing/third_party/css-element-queries/LICENSE \
+	src/3rdparty/chromium/third_party/catapult/tracing/third_party/d3/LICENSE \
+	src/3rdparty/chromium/third_party/catapult/third_party/py_vulcanize/third_party/rcssmin/bench/LICENSE.cssmin \
+	src/3rdparty/chromium/third_party/catapult/third_party/py_vulcanize/third_party/rcssmin/LICENSE \
+	src/3rdparty/chromium/third_party/catapult/third_party/py_vulcanize/third_party/rjsmin/LICENSE \
+	src/3rdparty/chromium/third_party/opus/src/LICENSE_PLEASE_READ.txt \
+	src/3rdparty/chromium/third_party/leakcanary/LICENSE \
+	src/3rdparty/chromium/third_party/flot/LICENSE.txt \
+	src/3rdparty/chromium/third_party/pexpect/LICENSE \
+	src/3rdparty/chromium/third_party/bintrees/LICENSE.txt \
+	src/3rdparty/chromium/third_party/usrsctp/LICENSE \
+	src/3rdparty/chromium/third_party/usrsctp/usrsctplib/LICENSE.md \
+	src/3rdparty/chromium/third_party/simplejson/LICENSE.txt \
+	src/3rdparty/chromium/third_party/wayland-protocols/LICENSE \
+	src/3rdparty/chromium/third_party/WebKit/LICENSE_FOR_ABOUT_CREDITS \
+	src/3rdparty/chromium/third_party/WebKit/Source/devtools/front_end/cm_modes/LICENSE \
+	src/3rdparty/chromium/third_party/WebKit/Source/devtools/front_end/cm/LICENSE \
+	src/3rdparty/chromium/third_party/WebKit/Source/devtools/front_end/cm/LICENSE_python \
+	src/3rdparty/chromium/third_party/WebKit/Source/devtools/front_end/acorn/LICENSE \
+	src/3rdparty/chromium/third_party/WebKit/Source/devtools/front_end/gonzales/MIT-LICENSE.txt \
+	src/3rdparty/chromium/third_party/WebKit/Source/wtf/dtoa/LICENSE \
+	src/3rdparty/chromium/third_party/WebKit/Source/core/LICENSE-APPLE \
+	src/3rdparty/chromium/third_party/WebKit/Source/core/LICENSE-LGPL-2 \
+	src/3rdparty/chromium/third_party/WebKit/Source/core/LICENSE-LGPL-2.1 \
+	src/3rdparty/chromium/third_party/WebKit/LICENSE \
+	src/3rdparty/chromium/third_party/WebKit/Tools/Scripts/webkitpy/thirdparty/wpt/wpt/tools/wptserve/LICENSE \
+	src/3rdparty/chromium/third_party/WebKit/Tools/Scripts/webkitpy/thirdparty/wpt/wpt/tools/LICENSE \
+	src/3rdparty/chromium/third_party/WebKit/Tools/Scripts/webkitpy/thirdparty/wpt/wpt/LICENSE \
+	src/3rdparty/chromium/third_party/libaddressinput/LICENSE \
+	src/3rdparty/chromium/third_party/libaddressinput/src/cpp/LICENSE.chromium \
+	src/3rdparty/chromium/third_party/libaddressinput/src/LICENSE \
+	src/3rdparty/chromium/third_party/brotli/LICENSE \
+	src/3rdparty/chromium/third_party/apache_velocity/LICENSE \
+	src/3rdparty/chromium/third_party/d3/src/LICENSE \
+	src/3rdparty/chromium/third_party/flatbuffers/LICENSE \
+	src/3rdparty/chromium/third_party/flatbuffers/src/LICENSE.txt \
+	src/3rdparty/chromium/third_party/openh264/src/LICENSE \
+	src/3rdparty/chromium/third_party/SPIRV-Tools/LICENSE \
+	src/3rdparty/chromium/third_party/SPIRV-Tools/src/LICENSE \
+	src/3rdparty/chromium/third_party/sudden_motion_sensor/LICENSE \
+	src/3rdparty/chromium/third_party/netty-tcnative/LICENSE \
+	src/3rdparty/chromium/third_party/bouncycastle/LICENSE \
+	src/3rdparty/chromium/third_party/icu4j/LICENSE \
+	src/3rdparty/chromium/third_party/libwebm/source/LICENSE.TXT \
+	src/3rdparty/chromium/third_party/jinja2/LICENSE \
+	src/3rdparty/chromium/third_party/v4l2capture/LICENSE \
+	src/3rdparty/chromium/third_party/ijar/LICENSE \
+	src/3rdparty/chromium/third_party/openmax_dl/LICENSE \
+	src/3rdparty/chromium/third_party/chaijs/LICENSE \
+	src/3rdparty/chromium/third_party/leveldatabase/src/LICENSE \
+	src/3rdparty/chromium/third_party/libsrtp/srtp/LICENSE \
+	src/3rdparty/chromium/third_party/libudev/LICENSE \
+	src/3rdparty/chromium/third_party/appurify-python/LICENSE \
+	src/3rdparty/chromium/third_party/espresso/LICENSE \
+	src/3rdparty/chromium/third_party/errorprone/LICENSE \
+	src/3rdparty/chromium/third_party/freetype2/src/docs/LICENSE.TXT \
+	src/3rdparty/chromium/third_party/pyftpdlib/src/LICENSE \
+	src/3rdparty/chromium/third_party/typ/LICENSE \
+	src/3rdparty/chromium/third_party/pycoverage/LICENSE \
+	src/3rdparty/chromium/third_party/qunit/LICENSE \
+	src/3rdparty/chromium/third_party/freetype-android/src/docs/LICENSE.TXT \
+	src/3rdparty/chromium/third_party/angle/LICENSE \
+	src/3rdparty/chromium/third_party/angle/src/third_party/murmurhash/LICENSE \
+	src/3rdparty/chromium/third_party/angle/src/third_party/libXNVCtrl/LICENSE \
+	src/3rdparty/chromium/third_party/angle/src/third_party/compiler/LICENSE \
+	src/3rdparty/chromium/third_party/libjpeg_turbo/LICENSE.md \
+	src/3rdparty/chromium/third_party/smhasher/LICENSE \
+	src/3rdparty/chromium/LICENSE.chromium_os \
+	src/3rdparty/chromium/tools/page_cycler/acid3/LICENSE \
+	src/3rdparty/chromium/tools/win/ChromeDebug/ChromeDebug/LICENSE \
+	src/3rdparty/chromium/tools/origin_trials/third_party/ed25519/LICENSE \
+	src/3rdparty/chromium/tools/gyp/LICENSE \
+	src/3rdparty/chromium/LICENSE \
+	src/3rdparty/chromium/mojo/public/LICENSE \
+	src/3rdparty/chromium/url/third_party/mozilla/LICENSE.txt \
+	src/3rdparty/chromium/ppapi/LICENSE \
+	src/3rdparty/chromium/net/third_party/nss/LICENSE \
+	src/3rdparty/chromium/net/third_party/mozilla_security_manager/LICENSE \
+	src/3rdparty/chromium/buildtools/third_party/libc++abi/trunk/LICENSE.TXT \
+	src/3rdparty/chromium/buildtools/third_party/libc++/trunk/LICENSE.TXT \
+	src/3rdparty/chromium/buildtools/LICENSE
diff --git a/package/qt5/qt5webengine/qt5webengine.hash b/package/qt5/qt5webengine/qt5webengine.hash
new file mode 100644
index 000000000..3e1fde2dd
--- /dev/null
+++ b/package/qt5/qt5webengine/qt5webengine.hash
@@ -0,0 +1,5 @@
+# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtwebengine-opensource-src-5.6.2.tar.xz.mirrorlist
+sha256 c80e90237bb7bd52a3fa843415c17a8e8e6d779b65efd1393472f24f8642e04c  qtwebengine-opensource-src-5.6.2.tar.xz
+
+# Hash from: http://download.qt.io/official_releases/qt/5.8/5.8.0/submodules/qtwebengine-opensource-src-5.8.0.tar.xz
+sha256 223d22f1660811e60677afe0a85f2f385823e25157689561489700c5d1da79be  qtwebengine-opensource-src-5.8.0.tar.xz
diff --git a/package/qt5/qt5webengine/qt5webengine.mk b/package/qt5/qt5webengine/qt5webengine.mk
new file mode 100644
index 000000000..bc7de1f5b
--- /dev/null
+++ b/package/qt5/qt5webengine/qt5webengine.mk
@@ -0,0 +1,82 @@
+################################################################################
+#
+# qt5webengine
+#
+################################################################################
+
+QT5WEBENGINE_VERSION = $(QT5_VERSION)
+QT5WEBENGINE_SITE = $(QT5_SITE)
+QT5WEBENGINE_SOURCE = qtwebengine-opensource-src-$(QT5WEBENGINE_VERSION).tar.xz
+QT5WEBENGINE_DEPENDENCIES = qt5base qt5declarative qt5webchannel host-gperf \
+	host-python
+QT5WEBENGINE_INSTALL_STAGING = YES
+
+ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
+include package/qt5/qt5webengine/chromium.inc
+QT5WEBENGINE_LICENSE = GPLv2 or LGPLv3 or GPLv3 or GPLv3 with exception
+QT5WEBENGINE_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPL3 LICENSE.GPL3-EXCEPT \
+	LICENSE.GPLv3 LICENSE.LGPL3 $(CHROMIUM_LICENSE_FILES)
+else
+QT5WEBENGINE_LICENSE = Commercial license
+QT5WEBENGINE_REDISTRIBUTE = NO
+endif
+
+ifeq ($(BR2_PACKAGE_QT5BASE_XCB),y)
+QT5WEBENGINE_DEPENDENCIES += xlib_libXScrnSaver xlib_libXcomposite \
+	xlib_libXcursor xlib_libXi xlib_libXrandr xlib_libXtst
+endif
+
+ifeq ($(BR2_PACKAGE_QT5WEBENGINE_PROPRIETARY_CODECS),y)
+QMAKEFLAGS += WEBENGINE_CONFIG+=use_proprietary_codecs
+endif
+
+# QtWebengine's build system uses python, but only supports python2. We work
+# around this by forcing python2 early in the PATH, via a python->python2
+# symlink.
+QT5WEBENGINE_ENV = PATH=$(@D)/host-bin:$(BR_PATH)
+define QT5WEBENGINE_PYTHON2_SYMLINK
+	mkdir -p $(@D)/host-bin
+	ln -sf $(HOST_DIR)/usr/bin/python2 $(@D)/host-bin/python
+endef
+QT5WEBENGINE_PRE_CONFIGURE_HOOKS += QT5WEBENGINE_PYTHON2_SYMLINK
+
+define QT5WEBENGINE_CONFIGURE_CMDS
+	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5WEBENGINE_ENV) $(HOST_DIR)/usr/bin/qmake $(QMAKEFLAGS))
+endef
+
+define QT5WEBENGINE_BUILD_CMDS
+	$(QT5WEBENGINE_ENV) $(MAKE) -C $(@D)
+endef
+
+define QT5WEBENGINE_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(QT5WEBENGINE_ENV) $(MAKE) -C $(@D) install
+	$(QT5_LA_PRL_FILES_FIXUP)
+endef
+
+define QT5WEBENGINE_INSTALL_TARGET_QMLS
+	cp -dpfr $(STAGING_DIR)/usr/qml/QtWebEngine $(TARGET_DIR)/usr/qml/
+endef
+
+ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
+define QT5WEBENGINE_INSTALL_TARGET_EXAMPLES
+	cp -dpfr $(STAGING_DIR)/usr/lib/qt/examples/webengine* $(TARGET_DIR)/usr/lib/qt/examples/
+endef
+endif
+
+ifneq ($(BR2_STATIC_LIBS),y)
+define QT5WEBENGINE_INSTALL_TARGET_LIBS
+	cp -dpf $(STAGING_DIR)/usr/lib/libQt5WebEngine*.so.* $(TARGET_DIR)/usr/lib
+	cp -dpf $(STAGING_DIR)/usr/libexec/QtWebEngineProcess $(TARGET_DIR)/usr/libexec/
+	cp -dpfr $(STAGING_DIR)/usr/resources/ $(TARGET_DIR)/usr/
+	mkdir -p $(TARGET_DIR)/usr/translations/qtwebengine_locales/
+	cp -dpfr $(STAGING_DIR)/usr/translations/qtwebengine_locales $(TARGET_DIR)/usr/translations/qtwebengine_locales/
+endef
+endif
+
+define QT5WEBENGINE_INSTALL_TARGET_CMDS
+	$(QT5WEBENGINE_INSTALL_TARGET_LIBS)
+	$(QT5WEBENGINE_INSTALL_TARGET_QMLS)
+	$(QT5WEBENGINE_INSTALL_TARGET_EXAMPLES)
+endef
+
+$(eval $(generic-package))
-- 
2.12.0
