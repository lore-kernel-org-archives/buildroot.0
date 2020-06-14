From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 14 Jun 2020 21:19:48 +0200
Subject: [Buildroot] [PATCH v2,
 1/1] package/icu: needs gcc >= 4.9 and host gcc >= 4.9
Message-ID: <20200614191948.413010-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

icu uses std::max_align_t since version 67-1 and
https://github.com/unicode-org/icu/commit/a3078fb8c89b61c35ccebb04cf6b189bc81093b3

This raises the following build failure with gcc 4.8:

utext.cpp:572:5: error: 'max_align_t' in namespace 'std' does not name a type
     std::max_align_t    extension;
     ^

This build failure is due to GCC bug 56019:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=56019

Instead of adding BR2_TOOLCHAIN_HAS_GCC_BUG_56019, just bumps gcc
dependency from 4.8 to 4.9

As this issue also affects host-icu, add Config.in.host with a
host gcc >= 4.9 dependency

Fixes:
 - http://autobuild.buildroot.org/results/6d2658a3c165c99df3eae87b2970e738bd386245
 - http://autobuild.buildroot.org/results/d204f1a528765d1440620a1eed8c29cbb5ec93c3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2:
 - Add host gcc >= 4.9 dependency

 package/Config.in.host                 | 1 +
 package/cppcms/Config.in               | 8 +++++---
 package/icu/Config.in                  | 9 ++++++---
 package/icu/Config.in.host             | 7 +++++++
 package/midori/Config.in               | 4 +++-
 package/php/Config.ext                 | 8 +++++---
 package/python-mwscrape2slob/Config.in | 8 +++++---
 package/python-pyicu/Config.in         | 8 +++++---
 package/python-slob/Config.in          | 8 +++++---
 package/qt-webkit-kiosk/Config.in      | 8 +++++---
 package/qt5/qt5base/Config.in          | 8 +++++---
 package/qt5/qt5webengine/Config.in     | 8 +++++---
 package/qt5/qt5webkit/Config.in        | 8 +++++---
 package/webkitgtk/Config.in            | 6 ++++--
 package/wpewebkit/Config.in            | 6 ++++--
 15 files changed, 70 insertions(+), 35 deletions(-)
 create mode 100644 package/icu/Config.in.host

diff --git a/package/Config.in.host b/package/Config.in.host
index f1246c708f..f79b2defcb 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -33,6 +33,7 @@ menu "Host utilities"
 	source "package/go-bootstrap/Config.in.host"
 	source "package/google-breakpad/Config.in.host"
 	source "package/gptfdisk/Config.in.host"
+	source "package/icu/Config.in.host"
 	source "package/imagemagick/Config.in.host"
 	source "package/imx-mkimage/Config.in.host"
 	source "package/imx-usb-loader/Config.in.host"
diff --git a/package/cppcms/Config.in b/package/cppcms/Config.in
index f02b283482..1d7635a83e 100644
--- a/package/cppcms/Config.in
+++ b/package/cppcms/Config.in
@@ -27,15 +27,17 @@ if BR2_PACKAGE_CPPCMS
 config BR2_PACKAGE_CPPCMS_ICU
 	bool "enable icu support"
 	depends on !BR2_BINFMT_FLAT # icu
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # icu
+	depends on BR2_HOST_GCC_AT_LEAST_4_9 # icu
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # icu
 	select BR2_PACKAGE_ICU
 	help
 	  Using ICU allows advanced localization features into CppCMS,
 	  in another hand ICU is heavier than iconv.
 
-comment "icu support needs a toolchain w/ gcc >= 4.8"
+comment "icu support needs a toolchain w/ gcc >= 4.9, host gcc >= 4.9"
 	depends on !BR2_BINFMT_FLAT
-	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
+		!BR2_HOST_GCC_AT_LEAST_4_9
 
 endif
 
diff --git a/package/icu/Config.in b/package/icu/Config.in
index 32f35b9d96..1b792de5ba 100644
--- a/package/icu/Config.in
+++ b/package/icu/Config.in
@@ -1,13 +1,15 @@
 config BR2_PACKAGE_ICU
 	bool "icu"
+	depends on BR2_HOST_GCC_AT_LEAST_4_9 # host-icu
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++11 PR56019
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	# icu does some funky things by generating by itself an ELF
 	# file, and it cannot easily be changed to generate FLAT
 	# format.
 	depends on !BR2_BINFMT_FLAT
+	select BR2_PACKAGE_HOST_ICU
 	help
 	  International Components for Unicode.
 
@@ -26,8 +28,9 @@ config BR2_PACKAGE_ICU_CUSTOM_DATA_PATH
 
 endif
 
-comment "icu needs a toolchain w/ C++, wchar, threads, gcc >= 4.8"
+comment "icu needs a toolchain w/ C++, wchar, threads, gcc >= 4.9, host gcc >= 4.9"
 	depends on !BR2_BINFMT_FLAT
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
+		!BR2_HOST_GCC_AT_LEAST_4_9
diff --git a/package/icu/Config.in.host b/package/icu/Config.in.host
new file mode 100644
index 0000000000..220e268a59
--- /dev/null
+++ b/package/icu/Config.in.host
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_HOST_ICU
+	bool "host icu"
+	depends on BR2_HOST_GCC_AT_LEAST_4_9 # C++11 PR56019
+	help
+	  International Components for Unicode.
+
+	  http://site.icu-project.org/
diff --git a/package/midori/Config.in b/package/midori/Config.in
index 089f36ced8..f4b8905c85 100644
--- a/package/midori/Config.in
+++ b/package/midori/Config.in
@@ -1,13 +1,15 @@
-comment "midori needs libgtk3 and a glibc toolchain w/ C++, gcc >= 7"
+comment "midori needs libgtk3 and a glibc toolchain w/ C++, gcc >= 7, host gcc >= 4.9"
 	depends on BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_PACKAGE_LIBGTK3 || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_7 || \
+		!BR2_HOST_GCC_AT_LEAST_4_9 || \
 		!BR2_TOOLCHAIN_USES_GLIBC
 
 config BR2_PACKAGE_MIDORI
 	bool "midori"
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt, gcr, gnupg2
 	depends on BR2_PACKAGE_LIBGTK3
+	depends on BR2_HOST_GCC_AT_LEAST_4_9 # webkitgtk
 	depends on BR2_INSTALL_LIBSTDCPP # webkitgtk
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # webkitgtk
 	depends on BR2_TOOLCHAIN_USES_GLIBC # webkitgtk
diff --git a/package/php/Config.ext b/package/php/Config.ext
index 66ee935cf0..b0ab2c9ec7 100644
--- a/package/php/Config.ext
+++ b/package/php/Config.ext
@@ -222,9 +222,10 @@ config BR2_PACKAGE_PHP_EXT_ICONV
 
 config BR2_PACKAGE_PHP_EXT_INTL
 	bool "intl"
+	depends on BR2_HOST_GCC_AT_LEAST_4_9 # icu
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # icu
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # icu
 	depends on !BR2_BINFMT_FLAT # icu
 	depends on BR2_TOOLCHAIN_HAS_THREADS # icu
 	depends on !BR2_STATIC_LIBS
@@ -232,11 +233,12 @@ config BR2_PACKAGE_PHP_EXT_INTL
 	help
 	  Internationalization support
 
-comment "intl support needs a toolchain w/ C++, wchar, threads, dynamic library, gcc >= 4.8"
+comment "intl support needs a toolchain w/ C++, wchar, threads, dynamic library, gcc >= 4.9, host gcc >= 4.9"
 	depends on !BR2_BINFMT_FLAT
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
+		!BR2_HOST_GCC_AT_LEAST_4_9
 
 config BR2_PACKAGE_PHP_EXT_MBSTRING
 	bool "mbstring"
diff --git a/package/python-mwscrape2slob/Config.in b/package/python-mwscrape2slob/Config.in
index dc2b2ae3bd..6d543bda28 100644
--- a/package/python-mwscrape2slob/Config.in
+++ b/package/python-mwscrape2slob/Config.in
@@ -1,8 +1,9 @@
 config BR2_PACKAGE_PYTHON_MWSCRAPE2SLOB
 	bool "python-mwscrape2slob"
 	depends on !BR2_BINFMT_FLAT # python-slob -> python-pyicu -> icu
+	depends on BR2_HOST_GCC_AT_LEAST_4_9 # python-slob -> python-pyicu -> icu
 	depends on BR2_INSTALL_LIBSTDCPP # python-slob -> python-pyicu -> icu
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # python-slob -> python-pyicu -> icu
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # python-slob -> python-pyicu -> icu
 	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON_COUCHDB # runtime
 	select BR2_PACKAGE_PYTHON_CSSSELECT # runtime
@@ -15,7 +16,8 @@ config BR2_PACKAGE_PYTHON_MWSCRAPE2SLOB
 
 	  https://github.com/itkach/mwscrape2slob
 
-comment "python-mwscrape2slob needs a toolchain w/ C++, gcc >= 4.8"
+comment "python-mwscrape2slob needs a toolchain w/ C++, gcc >= 4.9, host gcc >= 4.9"
 	depends on BR2_PACKAGE_PYTHON3 && !BR2_BINFMT_FLAT
 	depends on !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
+		!BR2_HOST_GCC_AT_LEAST_4_9
diff --git a/package/python-pyicu/Config.in b/package/python-pyicu/Config.in
index efab0853e4..93eac53387 100644
--- a/package/python-pyicu/Config.in
+++ b/package/python-pyicu/Config.in
@@ -1,15 +1,17 @@
 config BR2_PACKAGE_PYTHON_PYICU
 	bool "python-pyicu"
 	depends on !BR2_BINFMT_FLAT # icu
+	depends on BR2_HOST_GCC_AT_LEAST_4_9 # icu
 	depends on BR2_INSTALL_LIBSTDCPP # icu
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # icu
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # icu
 	select BR2_PACKAGE_ICU
 	help
 	  Python extension wrapping the ICU C++ API.
 
 	  https://github.com/ovalhub/pyicu
 
-comment "python-pyicu needs a toolchain w/ C++, gcc >= 4.8"
+comment "python-pyicu needs a toolchain w/ C++, gcc >= 4.9, host gcc >= 4.9"
 	depends on !BR2_BINFMT_FLAT
 	depends on !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
+		!BR2_HOST_GCC_AT_LEAST_4_9
diff --git a/package/python-slob/Config.in b/package/python-slob/Config.in
index a8b6e45da4..07d04d49a2 100644
--- a/package/python-slob/Config.in
+++ b/package/python-slob/Config.in
@@ -1,8 +1,9 @@
 config BR2_PACKAGE_PYTHON_SLOB
 	bool "python-slob"
 	depends on !BR2_BINFMT_FLAT # python-pyicu -> icu
+	depends on BR2_HOST_GCC_AT_LEAST_4_9 # python-pyicu -> icu
 	depends on BR2_INSTALL_LIBSTDCPP # python-pyicu -> icu
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # python-pyicu -> icu
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # python-pyicu -> icu
 	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON_PYICU # runtime
 	# although optional, it is used as default compression
@@ -13,7 +14,8 @@ config BR2_PACKAGE_PYTHON_SLOB
 
 	  https://github.com/itkach/slob
 
-comment "python-slob needs a toolchain w/ C++, gcc >= 4.8"
+comment "python-slob needs a toolchain w/ C++, gcc >= 4.9, host gcc >= 4.9"
 	depends on BR2_PACKAGE_PYTHON3 && !BR2_BINFMT_FLAT
 	depends on !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
+		!BR2_HOST_GCC_AT_LEAST_4_9
diff --git a/package/qt-webkit-kiosk/Config.in b/package/qt-webkit-kiosk/Config.in
index 46688a227b..80f8e7c464 100644
--- a/package/qt-webkit-kiosk/Config.in
+++ b/package/qt-webkit-kiosk/Config.in
@@ -3,7 +3,8 @@ config BR2_PACKAGE_QT_WEBKIT_KIOSK
 	depends on BR2_PACKAGE_QT5
 	depends on !BR2_STATIC_LIBS # qt5webkit
 	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE # qt5webkit
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # qt5webkit -> icu
+	depends on BR2_HOST_GCC_AT_LEAST_4_9 # qt5webkit -> icu
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # qt5webkit -> icu
 	depends on !BR2_BINFMT_FLAT # qt5webkit -> icu
 	depends on !BR2_MIPS_SOFT_FLOAT # qt5webkit
 	select BR2_PACKAGE_OPENSSL
@@ -25,8 +26,9 @@ config BR2_PACKAGE_QT_WEBKIT_KIOSK_SOUNDS
 
 endif
 
-comment "qt-webkit-kiosk needs a toolchain w/ dynamic library, gcc >= 4.8"
-	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+comment "qt-webkit-kiosk needs a toolchain w/ dynamic library, gcc >= 4.9, host gcc >= 4.9"
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
+		!BR2_HOST_GCC_AT_LEAST_4_9
 	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
 	depends on !BR2_BINFMT_FLAT
 	depends on !BR2_MIPS_SOFT_FLOAT
diff --git a/package/qt5/qt5base/Config.in b/package/qt5/qt5base/Config.in
index 60a611e292..28b03f5438 100644
--- a/package/qt5/qt5base/Config.in
+++ b/package/qt5/qt5base/Config.in
@@ -273,15 +273,17 @@ config BR2_PACKAGE_QT5BASE_DBUS
 config BR2_PACKAGE_QT5BASE_ICU
 	bool "Enable ICU support"
 	depends on !BR2_BINFMT_FLAT # icu
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # icu
+	depends on BR2_HOST_GCC_AT_LEAST_4_9 # icu
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # icu
 	select BR2_PACKAGE_ICU
 	help
 	  This option enables ICU support in Qt5. This is for example
 	  needed for Qt5Webkit.
 
-comment "icu support needs a toolchain w/ gcc >= 4.8"
+comment "icu support needs a toolchain w/ gcc >= 4.9, host gcc >= 4.9"
 	depends on !BR2_BINFMT_FLAT
-	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
+		!BR2_HOST_GCC_AT_LEAST_4_9
 
 config BR2_PACKAGE_QT5BASE_TSLIB
 	bool "Enable Tslib support"
diff --git a/package/qt5/qt5webengine/Config.in b/package/qt5/qt5webengine/Config.in
index a05205c7ad..215afbb616 100644
--- a/package/qt5/qt5webengine/Config.in
+++ b/package/qt5/qt5webengine/Config.in
@@ -10,10 +10,11 @@ config BR2_PACKAGE_QT5WEBENGINE_ARCH_SUPPORTS
 	depends on !BR2_BINFMT_FLAT # qt5base-icu
 	depends on BR2_USE_MMU # libglib2, qt5base-dbus
 
-comment "qt5webengine needs udev /dev management and a glibc toolchain w/ gcc >= 4.8, threads, wchar"
+comment "qt5webengine needs udev /dev management and a glibc toolchain w/ gcc >= 4.9, host gcc >= 4.9, threads, wchar"
 	depends on BR2_PACKAGE_QT5WEBENGINE_ARCH_SUPPORTS
 	depends on !BR2_PACKAGE_HAS_UDEV || !BR2_TOOLCHAIN_USES_GLIBC || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
+		!BR2_HOST_GCC_AT_LEAST_4_9 || \
 		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
 
 comment "qt5webengine needs an OpenGL and EGL-capable backend"
@@ -24,7 +25,8 @@ config BR2_PACKAGE_QT5WEBENGINE
 	bool "qt5webengine"
 	depends on BR2_PACKAGE_QT5WEBENGINE_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_USES_GLIBC # execinfo.h, mallinfo
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # qt5base-icu
+	depends on BR2_HOST_GCC_AT_LEAST_4_9 # qt5base-icu
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # qt5base-icu
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2, libvpx, qt5base-dbus
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_PACKAGE_QT5_GL_AVAILABLE # qt5declarative, qt5base-eglfs
diff --git a/package/qt5/qt5webkit/Config.in b/package/qt5/qt5webkit/Config.in
index e071dff208..6933090973 100644
--- a/package/qt5/qt5webkit/Config.in
+++ b/package/qt5/qt5webkit/Config.in
@@ -3,7 +3,8 @@ config BR2_PACKAGE_QT5WEBKIT
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
 	depends on BR2_INSTALL_LIBSTDCPP # leveldb
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # icu
+	depends on BR2_HOST_GCC_AT_LEAST_4_9 # icu
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # icu
 	depends on BR2_TOOLCHAIN_HAS_THREADS # leveldb
 	depends on !BR2_BINFMT_FLAT # icu
 	# assumes a FPU is available on MIPS
@@ -31,8 +32,9 @@ config BR2_PACKAGE_QT5WEBKIT
 
 	  http://doc.qt.io/archives/qt-5.5/qtwebkit-index.html
 
-comment "qt5webkit needs a toolchain w/ dynamic library, gcc >= 4.8"
-	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+comment "qt5webkit needs a toolchain w/ dynamic library, gcc >= 4.9, host gcc >= 4.9"
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
+		!BR2_HOST_GCC_AT_LEAST_4_9
 	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
 	depends on !BR2_BINFMT_FLAT
 	depends on !BR2_MIPS_SOFT_FLOAT
diff --git a/package/webkitgtk/Config.in b/package/webkitgtk/Config.in
index 86f58821a3..4ea931fde1 100644
--- a/package/webkitgtk/Config.in
+++ b/package/webkitgtk/Config.in
@@ -12,15 +12,17 @@ config BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt
 
-comment "webkitgtk needs libgtk3 and a glibc toolchain w/ C++, gcc >= 7"
+comment "webkitgtk needs libgtk3 and a glibc toolchain w/ C++, gcc >= 7, host gcc >= 4.9"
 	depends on BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
 	depends on !BR2_PACKAGE_LIBGTK3 || !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_USES_GLIBC || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_7
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_7 || \
+		!BR2_HOST_GCC_AT_LEAST_4_9
 	depends on BR2_USE_MMU
 
 config BR2_PACKAGE_WEBKITGTK
 	bool "webkitgtk"
+	depends on BR2_HOST_GCC_AT_LEAST_4_9 # icu
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7
 	depends on BR2_TOOLCHAIN_USES_GLIBC
diff --git a/package/wpewebkit/Config.in b/package/wpewebkit/Config.in
index f3029976f1..640f7c7011 100644
--- a/package/wpewebkit/Config.in
+++ b/package/wpewebkit/Config.in
@@ -12,12 +12,13 @@ config BR2_PACKAGE_WPEWEBKIT_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt
 
-comment "wpewebkit needs a toolchain w/ C++, wchar, threads, dynamic library, gcc >= 7"
+comment "wpewebkit needs a toolchain w/ C++, wchar, threads, dynamic library, gcc >= 7, host gcc >= 4.9"
 	depends on BR2_PACKAGE_WPEWEBKIT_ARCH_SUPPORTS
 	depends on !BR2_BINFMT_FLAT
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR \
 		|| !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS \
-		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_7
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_7 \
+		|| !BR2_HOST_GCC_AT_LEAST_4_9
 
 comment "wpewebkit needs an OpenGL ES w/ EGL-capable Wayland backend"
 	depends on BR2_PACKAGE_WPEWEBKIT_ARCH_SUPPORTS
@@ -29,6 +30,7 @@ config BR2_PACKAGE_WPEWEBKIT
 	bool "wpewebkit"
 	depends on !BR2_STATIC_LIBS # wayland
 	depends on !BR2_BINFMT_FLAT # icu
+	depends on BR2_HOST_GCC_AT_LEAST_4_9 # icu
 	depends on BR2_INSTALL_LIBSTDCPP # harfbuzz, icu
 	depends on BR2_TOOLCHAIN_HAS_THREADS # wayland, icu, libsoup
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7
-- 
2.26.2
