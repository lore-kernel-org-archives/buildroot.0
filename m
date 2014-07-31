From: Anton Kolesov <Anton.Kolesov@synopsys.com>
Date: Thu, 31 Jul 2014 17:24:48 +0400
Subject: [Buildroot] [PATCH v2 7/9] icu: Add dependency on atomic intrinsics
In-Reply-To: <1406813090-32472-1-git-send-email-Anton.Kolesov@synopsys.com>
References: <20140730084548.05bd6dec@free-electrons.com>
 <1406813090-32472-1-git-send-email-Anton.Kolesov@synopsys.com>
Message-ID: <1406813090-32472-7-git-send-email-Anton.Kolesov@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ICU requires GCC built-in atomic functions which are architecture specific
and may not be implemented.

Signed-off-by: Anton Kolesov <Anton.Kolesov@synopsys.com>
---
 package/beecrypt/Config.in    | 12 ++++++------
 package/cppcms/Config.in      |  7 +++----
 package/icu/Config.in         |  7 +++----
 package/php/Config.ext        |  8 ++++----
 package/qt5/qt5base/Config.in |  5 ++++-
 5 files changed, 20 insertions(+), 19 deletions(-)

diff --git a/package/beecrypt/Config.in b/package/beecrypt/Config.in
index 462c8a6..e0f9181 100644
--- a/package/beecrypt/Config.in
+++ b/package/beecrypt/Config.in
@@ -1,5 +1,5 @@
-comment "beecrypt needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+comment "beecrypt needs a toolchain w/ threads, atomic intrinsics"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_HAS_ATOMIC_INTRINSICS
 
 config BR2_PACKAGE_BEECRYPT
 	bool "beecrypt"
@@ -15,15 +15,15 @@ config BR2_PACKAGE_BEECRYPT_CPP
 	bool "C++ support"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR # icu
-	depends on !BR2_arc # icu
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC_INTRINSICS # icu
 	depends on !BR2_BINFMT_FLAT # icu
 	select BR2_PACKAGE_ICU
 	help
 	  Enable C++ support. This pulls in the (large) icu package.
 
-comment "C++ support needs a toolchain w/ wchar"
-	depends on !BR2_arc
+comment "C++ support needs a toolchain w/ wchar, atomic intrinsics"
 	depends on !BR2_BINFMT_FLAT
-	depends on BR2_INSTALL_LIBSTDCPP && !BR2_USE_WCHAR
+	depends on BR2_INSTALL_LIBSTDCPP && (!BR2_USE_WCHAR || \
+		!BR2_TOOLCHAIN_HAS_ATOMIC_INTRINSICS)
 
 endif # BR2_PACKAGE_BEECRYPT
diff --git a/package/cppcms/Config.in b/package/cppcms/Config.in
index 614abeb..297c514 100644
--- a/package/cppcms/Config.in
+++ b/package/cppcms/Config.in
@@ -24,17 +24,16 @@ if BR2_PACKAGE_CPPCMS
 
 config BR2_PACKAGE_CPPCMS_ICU
 	bool "enable icu support"
-	depends on !BR2_arc # icu -> atomic builtins
 	depends on !BR2_BINFMT_FLAT # icu
 	depends on BR2_USE_WCHAR # icu
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC_INTRINSICS # icu
 	select BR2_PACKAGE_ICU
 	help
 	  Using ICU allows advanced localization features into CppCMS,
 	  in another hand ICU is heavier than iconv.
 
-comment "icu support needs a toolchain w/ wchar"
-	depends on !BR2_arc
-	depends on !BR2_BINFMT_FLAT
+comment "icu support needs a toolchain w/ wchar, atomic intrinsics"
+	depends on !BR2_BINFMT_FLAT || !BR2_TOOLCHAIN_HAS_ATOMIC_INTRINSICS
 	depends on !BR2_USE_WCHAR
 
 endif
diff --git a/package/icu/Config.in b/package/icu/Config.in
index d14f8d8..d4521ac 100644
--- a/package/icu/Config.in
+++ b/package/icu/Config.in
@@ -7,7 +7,7 @@ config BR2_PACKAGE_ICU
 	# file, and it cannot easily be changed to generate FLAT
 	# format.
 	depends on !BR2_BINFMT_FLAT
-	depends on !BR2_arc # atomic builtins
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC_INTRINSICS
 	help
 	  International Components for Unicode.
 
@@ -25,8 +25,7 @@ config BR2_PACKAGE_ICU_CUSTOM_DATA_PATH
 
 endif
 
-comment "icu needs a toolchain w/ C++, wchar, threads"
-	depends on !BR2_arc
+comment "icu needs a toolchain w/ C++, wchar, threads, atomic intrinsics"
 	depends on !BR2_BINFMT_FLAT
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
-		!BR2_TOOLCHAIN_HAS_THREADS
+		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_HAS_ATOMIC_INTRINSICS
diff --git a/package/php/Config.ext b/package/php/Config.ext
index ff9a6ad..078be8d 100644
--- a/package/php/Config.ext
+++ b/package/php/Config.ext
@@ -166,16 +166,16 @@ config BR2_PACKAGE_PHP_EXT_INTL
 	select BR2_PACKAGE_ICU
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
-	depends on !BR2_arc # icu -> atomic builtins
 	depends on !BR2_BINFMT_FLAT # icu
 	depends on BR2_TOOLCHAIN_HAS_THREADS # icu
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC_INTRINSICS # icu
 	help
 	  Internationalization support
 
-comment "intl support needs a toolchain w/ C++, wchar, threads"
-	depends on !BR2_arc
+comment "intl support needs a toolchain w/ C++, wchar, threads, atomic intrinsics"
 	depends on !BR2_BINFMT_FLAT
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS \
+		|| !BR2_TOOLCHAIN_HAS_ATOMIC_INTRINSICS
 
 comment "Image processing"
 
diff --git a/package/qt5/qt5base/Config.in b/package/qt5/qt5base/Config.in
index b95a74a..67f211c 100644
--- a/package/qt5/qt5base/Config.in
+++ b/package/qt5/qt5base/Config.in
@@ -241,12 +241,15 @@ config BR2_PACKAGE_QT5BASE_DBUS
 config BR2_PACKAGE_QT5BASE_ICU
 	bool "Enable ICU support"
 	select BR2_PACKAGE_ICU
-	depends on !BR2_arc # icu -> atomic builtins
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC_INTRINSICS # icu
 	depends on !BR2_BINFMT_FLAT # icu
 	help
 	  This option enables ICU support in Qt5. This is for example
 	  needed for Qt5Webkit.
 
+comment "icu needs a toolchain w/ atomic intrinsics"
+	depends on !BR2_TOOLCHAIN_HAS_ATOMIC_INTRINSICS
+
 config BR2_PACKAGE_QT5BASE_TSLIB
 	bool "Enable Tslib support"
 	depends on !BR2_PREFER_STATIC_LIB # dlopen
-- 
1.8.4.1
