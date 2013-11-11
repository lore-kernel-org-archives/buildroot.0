From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 Nov 2013 22:27:25 +0100
Subject: [Buildroot] [git commit] icu: Doesn't work on ARC yet
Message-ID: <20131111213334.EBFE49BB28@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9b6c5e9c989f4a099efe8d438a47dd465bdcffc8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

icu depends on __sync_sub_and_fetch and other atomic primitives that
don't exist in the ARC toolchain yet.

[Peter: adjust beecrypt/php comment dependency, don't mention atomic builtins]
Signed-off-by: Mischa Jonker <mjonker@synopsys.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/beecrypt/Config.in    |    4 +++-
 package/cppcms/Config.in      |    1 +
 package/icu/Config.in         |    2 ++
 package/php/Config.ext        |    2 ++
 package/qt5/qt5base/Config.in |    1 +
 5 files changed, 9 insertions(+), 1 deletions(-)

diff --git a/package/beecrypt/Config.in b/package/beecrypt/Config.in
index caa6d17..033742c 100644
--- a/package/beecrypt/Config.in
+++ b/package/beecrypt/Config.in
@@ -1,7 +1,8 @@
 config BR2_PACKAGE_BEECRYPT
 	bool "beecrypt"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	select BR2_PACKAGE_ICU if BR2_INSTALL_LIBSTDCPP && BR2_USE_WCHAR
+	select BR2_PACKAGE_ICU if BR2_INSTALL_LIBSTDCPP && BR2_USE_WCHAR && \
+	       !BR2_arc
 	help
 	  Beecrypt is a general-purpose cryptography library.
 
@@ -11,4 +12,5 @@ comment "beecrypt needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
 
 comment "beecrypt C++ support needs a toolchain w/ wchar"
+	depends on !BR2_arc
 	depends on BR2_INSTALL_LIBSTDCPP && !BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/cppcms/Config.in b/package/cppcms/Config.in
index e13e076..c5d64ce 100644
--- a/package/cppcms/Config.in
+++ b/package/cppcms/Config.in
@@ -23,6 +23,7 @@ config BR2_PACKAGE_CPPCMS
 config BR2_PACKAGE_CPPCMS_ICU
 	bool "enable icu support"
 	depends on BR2_PACKAGE_CPPCMS
+	depends on !BR2_arc # icu -> atomic builtins
 	select BR2_PACKAGE_ICU
 	help
 	  Using ICU allows advanced localization features into CppCMS,
diff --git a/package/icu/Config.in b/package/icu/Config.in
index 585bffb..b736b43 100644
--- a/package/icu/Config.in
+++ b/package/icu/Config.in
@@ -3,11 +3,13 @@ config BR2_PACKAGE_ICU
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_arc # atomic builtins
 	help
 	  International Components for Unicode.
 
 	  http://site.icu-project.org/
 
 comment "icu needs a toolchain w/ C++, wchar, threads"
+	depends on !BR2_arc
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/php/Config.ext b/package/php/Config.ext
index c0c85f1..23d2306 100644
--- a/package/php/Config.ext
+++ b/package/php/Config.ext
@@ -172,10 +172,12 @@ config BR2_PACKAGE_PHP_EXT_INTL
 	select BR2_PACKAGE_ICU
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
+	depends on !BR2_arc # icu -> atomic builtins
 	help
 	  Internationalization support
 
 comment "intl support needs a toolchain w/ C++, wchar"
+	depends on !BR2_arc
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR
 
 comment "Image processing"
diff --git a/package/qt5/qt5base/Config.in b/package/qt5/qt5base/Config.in
index 83f17e3..e932e24 100644
--- a/package/qt5/qt5base/Config.in
+++ b/package/qt5/qt5base/Config.in
@@ -181,6 +181,7 @@ config BR2_PACKAGE_QT5BASE_DBUS
 config BR2_PACKAGE_QT5BASE_ICU
 	bool "Enable ICU support"
 	select BR2_PACKAGE_ICU
+	depends on !BR2_arc # icu -> atomic builtins
 	help
 	  This option enables ICU support in Qt5. This is for example
 	  needed for Qt5Webkit.
