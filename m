From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 18 Aug 2014 10:56:42 +0200
Subject: [Buildroot] [git commit] package/icu: use the new ARCH_HAS_ATOMICS
	as dependency
Message-ID: <20140818090639.EC2129D415@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=19237110da2d026216fc787ae55a7444877742cc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And propagate to the reverse dependencies of icu.
Also, fix beecrypt's comment: only the C++ support needs atomics.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Anton Kolesov <Anton.Kolesov@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/beecrypt/Config.in    |   12 ++++++------
 package/cppcms/Config.in      |    7 ++++---
 package/icu/Config.in         |    7 ++++---
 package/php/Config.ext        |    8 ++++----
 package/qt5/qt5base/Config.in |    5 +----
 5 files changed, 19 insertions(+), 20 deletions(-)

diff --git a/package/beecrypt/Config.in b/package/beecrypt/Config.in
index e0f9181..b9685ef 100644
--- a/package/beecrypt/Config.in
+++ b/package/beecrypt/Config.in
@@ -1,5 +1,5 @@
-comment "beecrypt needs a toolchain w/ threads, atomic intrinsics"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_HAS_ATOMIC_INTRINSICS
+comment "beecrypt needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_BEECRYPT
 	bool "beecrypt"
@@ -15,15 +15,15 @@ config BR2_PACKAGE_BEECRYPT_CPP
 	bool "C++ support"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR # icu
-	depends on BR2_TOOLCHAIN_HAS_ATOMIC_INTRINSICS # icu
 	depends on !BR2_BINFMT_FLAT # icu
+	depends on BR2_ARCH_HAS_ATOMICS # icu
 	select BR2_PACKAGE_ICU
 	help
 	  Enable C++ support. This pulls in the (large) icu package.
 
-comment "C++ support needs a toolchain w/ wchar, atomic intrinsics"
+comment "C++ support needs a toolchain w/ wchar"
 	depends on !BR2_BINFMT_FLAT
-	depends on BR2_INSTALL_LIBSTDCPP && (!BR2_USE_WCHAR || \
-		!BR2_TOOLCHAIN_HAS_ATOMIC_INTRINSICS)
+	depends on BR2_ARCH_HAS_ATOMICS
+	depends on BR2_INSTALL_LIBSTDCPP && !BR2_USE_WCHAR
 
 endif # BR2_PACKAGE_BEECRYPT
diff --git a/package/cppcms/Config.in b/package/cppcms/Config.in
index 297c514..dbe4786 100644
--- a/package/cppcms/Config.in
+++ b/package/cppcms/Config.in
@@ -26,14 +26,15 @@ config BR2_PACKAGE_CPPCMS_ICU
 	bool "enable icu support"
 	depends on !BR2_BINFMT_FLAT # icu
 	depends on BR2_USE_WCHAR # icu
-	depends on BR2_TOOLCHAIN_HAS_ATOMIC_INTRINSICS # icu
+	depends on BR2_ARCH_HAS_ATOMICS # icu
 	select BR2_PACKAGE_ICU
 	help
 	  Using ICU allows advanced localization features into CppCMS,
 	  in another hand ICU is heavier than iconv.
 
-comment "icu support needs a toolchain w/ wchar, atomic intrinsics"
-	depends on !BR2_BINFMT_FLAT || !BR2_TOOLCHAIN_HAS_ATOMIC_INTRINSICS
+comment "icu support needs a toolchain w/ wchar"
+	depends on !BR2_BINFMT_FLAT
+	depends on BR2_ARCH_HAS_ATOMICS
 	depends on !BR2_USE_WCHAR
 
 endif
diff --git a/package/icu/Config.in b/package/icu/Config.in
index d4521ac..d7bf2fe 100644
--- a/package/icu/Config.in
+++ b/package/icu/Config.in
@@ -7,7 +7,7 @@ config BR2_PACKAGE_ICU
 	# file, and it cannot easily be changed to generate FLAT
 	# format.
 	depends on !BR2_BINFMT_FLAT
-	depends on BR2_TOOLCHAIN_HAS_ATOMIC_INTRINSICS
+	depends on BR2_ARCH_HAS_ATOMICS
 	help
 	  International Components for Unicode.
 
@@ -25,7 +25,8 @@ config BR2_PACKAGE_ICU_CUSTOM_DATA_PATH
 
 endif
 
-comment "icu needs a toolchain w/ C++, wchar, threads, atomic intrinsics"
+comment "icu needs a toolchain w/ C++, wchar, threads"
 	depends on !BR2_BINFMT_FLAT
+	depends on BR2_ARCH_HAS_ATOMICS
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
-		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_HAS_ATOMIC_INTRINSICS
+		!BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/php/Config.ext b/package/php/Config.ext
index 078be8d..e07779a 100644
--- a/package/php/Config.ext
+++ b/package/php/Config.ext
@@ -168,14 +168,14 @@ config BR2_PACKAGE_PHP_EXT_INTL
 	depends on BR2_USE_WCHAR
 	depends on !BR2_BINFMT_FLAT # icu
 	depends on BR2_TOOLCHAIN_HAS_THREADS # icu
-	depends on BR2_TOOLCHAIN_HAS_ATOMIC_INTRINSICS # icu
+	depends on BR2_ARCH_HAS_ATOMICS # icu
 	help
 	  Internationalization support
 
-comment "intl support needs a toolchain w/ C++, wchar, threads, atomic intrinsics"
+comment "intl support needs a toolchain w/ C++, wchar, threads"
 	depends on !BR2_BINFMT_FLAT
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS \
-		|| !BR2_TOOLCHAIN_HAS_ATOMIC_INTRINSICS
+	depends on BR2_ARCH_HAS_ATOMICS
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
 
 comment "Image processing"
 
diff --git a/package/qt5/qt5base/Config.in b/package/qt5/qt5base/Config.in
index 67f211c..7a34d6f 100644
--- a/package/qt5/qt5base/Config.in
+++ b/package/qt5/qt5base/Config.in
@@ -241,15 +241,12 @@ config BR2_PACKAGE_QT5BASE_DBUS
 config BR2_PACKAGE_QT5BASE_ICU
 	bool "Enable ICU support"
 	select BR2_PACKAGE_ICU
-	depends on BR2_TOOLCHAIN_HAS_ATOMIC_INTRINSICS # icu
+	depends on BR2_ARCH_HAS_ATOMICS # icu
 	depends on !BR2_BINFMT_FLAT # icu
 	help
 	  This option enables ICU support in Qt5. This is for example
 	  needed for Qt5Webkit.
 
-comment "icu needs a toolchain w/ atomic intrinsics"
-	depends on !BR2_TOOLCHAIN_HAS_ATOMIC_INTRINSICS
-
 config BR2_PACKAGE_QT5BASE_TSLIB
 	bool "Enable Tslib support"
 	depends on !BR2_PREFER_STATIC_LIB # dlopen
