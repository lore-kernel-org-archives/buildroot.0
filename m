From: Anton Kolesov <Anton.Kolesov@synopsys.com>
Date: Mon, 28 Jul 2014 22:02:06 +0400
Subject: [Buildroot] [PATCH 7/9] icu: arc: Disable if ARC atomics are
	disabled
In-Reply-To: <1406570528-31516-1-git-send-email-Anton.Kolesov@synopsys.com>
References: <1406570528-31516-1-git-send-email-Anton.Kolesov@synopsys.com>
Message-ID: <1406570528-31516-7-git-send-email-Anton.Kolesov@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ICU requires GCC built-in atomic functions which are optional in ARC
toolchain.

Signed-off-by: Anton Kolesov <Anton.Kolesov@synopsys.com>
---
 package/beecrypt/Config.in    | 6 ++++--
 package/cppcms/Config.in      | 6 ++++--
 package/icu/Config.in         | 6 ++++--
 package/php/Config.ext        | 6 ++++--
 package/qt5/qt5base/Config.in | 5 ++++-
 5 files changed, 20 insertions(+), 9 deletions(-)

diff --git a/package/beecrypt/Config.in b/package/beecrypt/Config.in
index 462c8a6..2c17685 100644
--- a/package/beecrypt/Config.in
+++ b/package/beecrypt/Config.in
@@ -15,15 +15,17 @@ config BR2_PACKAGE_BEECRYPT_CPP
 	bool "C++ support"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR # icu
-	depends on !BR2_arc # icu
+	depends on !BR2_arc || BR2_ARC_ATOMIC_EXT
 	depends on !BR2_BINFMT_FLAT # icu
 	select BR2_PACKAGE_ICU
 	help
 	  Enable C++ support. This pulls in the (large) icu package.
 
 comment "C++ support needs a toolchain w/ wchar"
-	depends on !BR2_arc
 	depends on !BR2_BINFMT_FLAT
 	depends on BR2_INSTALL_LIBSTDCPP && !BR2_USE_WCHAR
 
+comment "C++ support needs an ARC CPU w/ atomic extension"
+	depends on BR2_arc && !BR2_ARC_ATOMIC_EXT
+
 endif # BR2_PACKAGE_BEECRYPT
diff --git a/package/cppcms/Config.in b/package/cppcms/Config.in
index 614abeb..467025a 100644
--- a/package/cppcms/Config.in
+++ b/package/cppcms/Config.in
@@ -24,7 +24,7 @@ if BR2_PACKAGE_CPPCMS
 
 config BR2_PACKAGE_CPPCMS_ICU
 	bool "enable icu support"
-	depends on !BR2_arc # icu -> atomic builtins
+	depends on !BR2_arc || BR2_ARC_ATOMIC_EXT
 	depends on !BR2_BINFMT_FLAT # icu
 	depends on BR2_USE_WCHAR # icu
 	select BR2_PACKAGE_ICU
@@ -33,10 +33,12 @@ config BR2_PACKAGE_CPPCMS_ICU
 	  in another hand ICU is heavier than iconv.
 
 comment "icu support needs a toolchain w/ wchar"
-	depends on !BR2_arc
 	depends on !BR2_BINFMT_FLAT
 	depends on !BR2_USE_WCHAR
 
+comment "icu support needs an ARC CPU w/ atomic extension"
+	depends on BR2_arc && !BR2_ARC_ATOMIC_EXT
+
 endif
 
 comment "cppcms needs a toolchain w/ C++, NPTL, dynamic library"
diff --git a/package/icu/Config.in b/package/icu/Config.in
index 9a27894..33a2724 100644
--- a/package/icu/Config.in
+++ b/package/icu/Config.in
@@ -7,14 +7,16 @@ config BR2_PACKAGE_ICU
 	# file, and it cannot easily be changed to generate FLAT
 	# format.
 	depends on !BR2_BINFMT_FLAT
-	depends on !BR2_arc # atomic builtins
+	depends on !BR2_arc || BR2_ARC_ATOMIC_EXT
 	help
 	  International Components for Unicode.
 
 	  http://site.icu-project.org/
 
 comment "icu needs a toolchain w/ C++, wchar, threads"
-	depends on !BR2_arc
 	depends on !BR2_BINFMT_FLAT
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_HAS_THREADS
+
+comment "icu needs an ARC CPU w/ atomic extension"
+	depends on BR2_arc && !BR2_ARC_ATOMIC_EXT
diff --git a/package/php/Config.ext b/package/php/Config.ext
index ff9a6ad..90cb6af 100644
--- a/package/php/Config.ext
+++ b/package/php/Config.ext
@@ -166,17 +166,19 @@ config BR2_PACKAGE_PHP_EXT_INTL
 	select BR2_PACKAGE_ICU
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
-	depends on !BR2_arc # icu -> atomic builtins
+	depends on !BR2_arc || BR2_ARC_ATOMIC_EXT
 	depends on !BR2_BINFMT_FLAT # icu
 	depends on BR2_TOOLCHAIN_HAS_THREADS # icu
 	help
 	  Internationalization support
 
 comment "intl support needs a toolchain w/ C++, wchar, threads"
-	depends on !BR2_arc
 	depends on !BR2_BINFMT_FLAT
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
 
+comment "intl supports needs an ARC CPU w/ atomic extension"
+	depends on BR2_arc && !BR2_ARC_ATOMIC_EXT
+
 comment "Image processing"
 
 config BR2_PACKAGE_PHP_EXT_EXIF
diff --git a/package/qt5/qt5base/Config.in b/package/qt5/qt5base/Config.in
index b95a74a..5789eb9 100644
--- a/package/qt5/qt5base/Config.in
+++ b/package/qt5/qt5base/Config.in
@@ -241,12 +241,15 @@ config BR2_PACKAGE_QT5BASE_DBUS
 config BR2_PACKAGE_QT5BASE_ICU
 	bool "Enable ICU support"
 	select BR2_PACKAGE_ICU
-	depends on !BR2_arc # icu -> atomic builtins
+	depends on !BR2_arc || BR2_ARC_ATOMIC_EXT
 	depends on !BR2_BINFMT_FLAT # icu
 	help
 	  This option enables ICU support in Qt5. This is for example
 	  needed for Qt5Webkit.
 
+comment "icu needs an ARC CPU w/ atomic extension"
+	depends on BR2_arc && !BR2_ARC_ATOMIC_EXT
+
 config BR2_PACKAGE_QT5BASE_TSLIB
 	bool "Enable Tslib support"
 	depends on !BR2_PREFER_STATIC_LIB # dlopen
-- 
1.8.4.1
