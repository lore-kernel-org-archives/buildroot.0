From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 14 Jun 2020 20:26:13 +0200
Subject: [Buildroot] [PATCH 1/1] package/icu: needs gcc >= 4.9
Message-ID: <20200614182613.408052-1-fontaine.fabrice@gmail.com>
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

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/cppcms/Config.in               | 6 +++---
 package/icu/Config.in                  | 6 +++---
 package/php/Config.ext                 | 6 +++---
 package/python-mwscrape2slob/Config.in | 6 +++---
 package/python-pyicu/Config.in         | 6 +++---
 package/python-slob/Config.in          | 6 +++---
 package/qt-webkit-kiosk/Config.in      | 6 +++---
 package/qt5/qt5base/Config.in          | 6 +++---
 package/qt5/qt5webengine/Config.in     | 6 +++---
 package/qt5/qt5webkit/Config.in        | 6 +++---
 10 files changed, 30 insertions(+), 30 deletions(-)

diff --git a/package/cppcms/Config.in b/package/cppcms/Config.in
index f02b283482..39a242cc68 100644
--- a/package/cppcms/Config.in
+++ b/package/cppcms/Config.in
@@ -27,15 +27,15 @@ if BR2_PACKAGE_CPPCMS
 config BR2_PACKAGE_CPPCMS_ICU
 	bool "enable icu support"
 	depends on !BR2_BINFMT_FLAT # icu
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # icu
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # icu
 	select BR2_PACKAGE_ICU
 	help
 	  Using ICU allows advanced localization features into CppCMS,
 	  in another hand ICU is heavier than iconv.
 
-comment "icu support needs a toolchain w/ gcc >= 4.8"
+comment "icu support needs a toolchain w/ gcc >= 4.9"
 	depends on !BR2_BINFMT_FLAT
-	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 
 endif
 
diff --git a/package/icu/Config.in b/package/icu/Config.in
index 32f35b9d96..3afe12f717 100644
--- a/package/icu/Config.in
+++ b/package/icu/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_ICU
 	bool "icu"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++11 PR56019
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	# icu does some funky things by generating by itself an ELF
 	# file, and it cannot easily be changed to generate FLAT
@@ -26,8 +26,8 @@ config BR2_PACKAGE_ICU_CUSTOM_DATA_PATH
 
 endif
 
-comment "icu needs a toolchain w/ C++, wchar, threads, gcc >= 4.8"
+comment "icu needs a toolchain w/ C++, wchar, threads, gcc >= 4.9"
 	depends on !BR2_BINFMT_FLAT
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/php/Config.ext b/package/php/Config.ext
index 66ee935cf0..b030bfce86 100644
--- a/package/php/Config.ext
+++ b/package/php/Config.ext
@@ -224,7 +224,7 @@ config BR2_PACKAGE_PHP_EXT_INTL
 	bool "intl"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # icu
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # icu
 	depends on !BR2_BINFMT_FLAT # icu
 	depends on BR2_TOOLCHAIN_HAS_THREADS # icu
 	depends on !BR2_STATIC_LIBS
@@ -232,11 +232,11 @@ config BR2_PACKAGE_PHP_EXT_INTL
 	help
 	  Internationalization support
 
-comment "intl support needs a toolchain w/ C++, wchar, threads, dynamic library, gcc >= 4.8"
+comment "intl support needs a toolchain w/ C++, wchar, threads, dynamic library, gcc >= 4.9"
 	depends on !BR2_BINFMT_FLAT
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 
 config BR2_PACKAGE_PHP_EXT_MBSTRING
 	bool "mbstring"
diff --git a/package/python-mwscrape2slob/Config.in b/package/python-mwscrape2slob/Config.in
index dc2b2ae3bd..70256d2e99 100644
--- a/package/python-mwscrape2slob/Config.in
+++ b/package/python-mwscrape2slob/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_PYTHON_MWSCRAPE2SLOB
 	bool "python-mwscrape2slob"
 	depends on !BR2_BINFMT_FLAT # python-slob -> python-pyicu -> icu
 	depends on BR2_INSTALL_LIBSTDCPP # python-slob -> python-pyicu -> icu
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # python-slob -> python-pyicu -> icu
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # python-slob -> python-pyicu -> icu
 	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON_COUCHDB # runtime
 	select BR2_PACKAGE_PYTHON_CSSSELECT # runtime
@@ -15,7 +15,7 @@ config BR2_PACKAGE_PYTHON_MWSCRAPE2SLOB
 
 	  https://github.com/itkach/mwscrape2slob
 
-comment "python-mwscrape2slob needs a toolchain w/ C++, gcc >= 4.8"
+comment "python-mwscrape2slob needs a toolchain w/ C++, gcc >= 4.9"
 	depends on BR2_PACKAGE_PYTHON3 && !BR2_BINFMT_FLAT
 	depends on !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/python-pyicu/Config.in b/package/python-pyicu/Config.in
index efab0853e4..cda071a173 100644
--- a/package/python-pyicu/Config.in
+++ b/package/python-pyicu/Config.in
@@ -2,14 +2,14 @@ config BR2_PACKAGE_PYTHON_PYICU
 	bool "python-pyicu"
 	depends on !BR2_BINFMT_FLAT # icu
 	depends on BR2_INSTALL_LIBSTDCPP # icu
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # icu
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # icu
 	select BR2_PACKAGE_ICU
 	help
 	  Python extension wrapping the ICU C++ API.
 
 	  https://github.com/ovalhub/pyicu
 
-comment "python-pyicu needs a toolchain w/ C++, gcc >= 4.8"
+comment "python-pyicu needs a toolchain w/ C++, gcc >= 4.9"
 	depends on !BR2_BINFMT_FLAT
 	depends on !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/python-slob/Config.in b/package/python-slob/Config.in
index a8b6e45da4..b4e438117c 100644
--- a/package/python-slob/Config.in
+++ b/package/python-slob/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_PYTHON_SLOB
 	bool "python-slob"
 	depends on !BR2_BINFMT_FLAT # python-pyicu -> icu
 	depends on BR2_INSTALL_LIBSTDCPP # python-pyicu -> icu
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # python-pyicu -> icu
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # python-pyicu -> icu
 	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON_PYICU # runtime
 	# although optional, it is used as default compression
@@ -13,7 +13,7 @@ config BR2_PACKAGE_PYTHON_SLOB
 
 	  https://github.com/itkach/slob
 
-comment "python-slob needs a toolchain w/ C++, gcc >= 4.8"
+comment "python-slob needs a toolchain w/ C++, gcc >= 4.9"
 	depends on BR2_PACKAGE_PYTHON3 && !BR2_BINFMT_FLAT
 	depends on !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/qt-webkit-kiosk/Config.in b/package/qt-webkit-kiosk/Config.in
index 46688a227b..52e5e66bb2 100644
--- a/package/qt-webkit-kiosk/Config.in
+++ b/package/qt-webkit-kiosk/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_QT_WEBKIT_KIOSK
 	depends on BR2_PACKAGE_QT5
 	depends on !BR2_STATIC_LIBS # qt5webkit
 	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE # qt5webkit
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # qt5webkit -> icu
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # qt5webkit -> icu
 	depends on !BR2_BINFMT_FLAT # qt5webkit -> icu
 	depends on !BR2_MIPS_SOFT_FLOAT # qt5webkit
 	select BR2_PACKAGE_OPENSSL
@@ -25,8 +25,8 @@ config BR2_PACKAGE_QT_WEBKIT_KIOSK_SOUNDS
 
 endif
 
-comment "qt-webkit-kiosk needs a toolchain w/ dynamic library, gcc >= 4.8"
-	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+comment "qt-webkit-kiosk needs a toolchain w/ dynamic library, gcc >= 4.9"
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
 	depends on !BR2_BINFMT_FLAT
 	depends on !BR2_MIPS_SOFT_FLOAT
diff --git a/package/qt5/qt5base/Config.in b/package/qt5/qt5base/Config.in
index 60a611e292..23d9715765 100644
--- a/package/qt5/qt5base/Config.in
+++ b/package/qt5/qt5base/Config.in
@@ -273,15 +273,15 @@ config BR2_PACKAGE_QT5BASE_DBUS
 config BR2_PACKAGE_QT5BASE_ICU
 	bool "Enable ICU support"
 	depends on !BR2_BINFMT_FLAT # icu
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # icu
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # icu
 	select BR2_PACKAGE_ICU
 	help
 	  This option enables ICU support in Qt5. This is for example
 	  needed for Qt5Webkit.
 
-comment "icu support needs a toolchain w/ gcc >= 4.8"
+comment "icu support needs a toolchain w/ gcc >= 4.9"
 	depends on !BR2_BINFMT_FLAT
-	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 
 config BR2_PACKAGE_QT5BASE_TSLIB
 	bool "Enable Tslib support"
diff --git a/package/qt5/qt5webengine/Config.in b/package/qt5/qt5webengine/Config.in
index a05205c7ad..18b99a6745 100644
--- a/package/qt5/qt5webengine/Config.in
+++ b/package/qt5/qt5webengine/Config.in
@@ -10,10 +10,10 @@ config BR2_PACKAGE_QT5WEBENGINE_ARCH_SUPPORTS
 	depends on !BR2_BINFMT_FLAT # qt5base-icu
 	depends on BR2_USE_MMU # libglib2, qt5base-dbus
 
-comment "qt5webengine needs udev /dev management and a glibc toolchain w/ gcc >= 4.8, threads, wchar"
+comment "qt5webengine needs udev /dev management and a glibc toolchain w/ gcc >= 4.9, threads, wchar"
 	depends on BR2_PACKAGE_QT5WEBENGINE_ARCH_SUPPORTS
 	depends on !BR2_PACKAGE_HAS_UDEV || !BR2_TOOLCHAIN_USES_GLIBC || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
 		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
 
 comment "qt5webengine needs an OpenGL and EGL-capable backend"
@@ -24,7 +24,7 @@ config BR2_PACKAGE_QT5WEBENGINE
 	bool "qt5webengine"
 	depends on BR2_PACKAGE_QT5WEBENGINE_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_USES_GLIBC # execinfo.h, mallinfo
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # qt5base-icu
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # qt5base-icu
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2, libvpx, qt5base-dbus
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_PACKAGE_QT5_GL_AVAILABLE # qt5declarative, qt5base-eglfs
diff --git a/package/qt5/qt5webkit/Config.in b/package/qt5/qt5webkit/Config.in
index e071dff208..718369b813 100644
--- a/package/qt5/qt5webkit/Config.in
+++ b/package/qt5/qt5webkit/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_QT5WEBKIT
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
 	depends on BR2_INSTALL_LIBSTDCPP # leveldb
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # icu
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # icu
 	depends on BR2_TOOLCHAIN_HAS_THREADS # leveldb
 	depends on !BR2_BINFMT_FLAT # icu
 	# assumes a FPU is available on MIPS
@@ -31,8 +31,8 @@ config BR2_PACKAGE_QT5WEBKIT
 
 	  http://doc.qt.io/archives/qt-5.5/qtwebkit-index.html
 
-comment "qt5webkit needs a toolchain w/ dynamic library, gcc >= 4.8"
-	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+comment "qt5webkit needs a toolchain w/ dynamic library, gcc >= 4.9"
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
 	depends on !BR2_BINFMT_FLAT
 	depends on !BR2_MIPS_SOFT_FLOAT
-- 
2.26.2
