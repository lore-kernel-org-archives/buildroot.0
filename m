From: Mischa Jonker <Mischa.Jonker@synopsys.com>
Date: Mon, 11 Nov 2013 17:10:53 +0100
Subject: [Buildroot] [PATCH v2] icu: Doesn't work on ARC yet
Message-ID: <1384186253-5968-1-git-send-email-mjonker@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

icu depends on __sync_sub_and_fetch and other atomic primitives that
don't exist in the ARC toolchain yet.

Signed-off-by: Mischa Jonker <mjonker@synopsys.com>
---
v2:
 Added !arc dependency to comment line
 Propagated dependency to icu's reverse dependencies, except for webkit
  (webkit already cannot be selected for ARC)

 package/beecrypt/Config.in    |    3 ++-
 package/cppcms/Config.in      |    1 +
 package/icu/Config.in         |    5 +++--
 package/php/Config.ext        |    1 +
 package/qt5/qt5base/Config.in |    1 +
 5 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/beecrypt/Config.in b/package/beecrypt/Config.in
index caa6d17..83cbf96 100644
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
 
diff --git a/package/cppcms/Config.in b/package/cppcms/Config.in
index 11daf7c..d07dc76 100644
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
index 585bffb..b1c23f8 100644
--- a/package/icu/Config.in
+++ b/package/icu/Config.in
@@ -3,11 +3,12 @@ config BR2_PACKAGE_ICU
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_arc # atomic builtins
 	help
 	  International Components for Unicode.
 
 	  http://site.icu-project.org/
 
-comment "icu needs a toolchain w/ C++, wchar, threads"
+comment "icu needs a toolchain w/ C++, wchar, threads, atomic builtins"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
-		!BR2_TOOLCHAIN_HAS_THREADS
+		!BR2_TOOLCHAIN_HAS_THREADS || BR2_arc
diff --git a/package/php/Config.ext b/package/php/Config.ext
index c0c85f1..380c3cf 100644
--- a/package/php/Config.ext
+++ b/package/php/Config.ext
@@ -172,6 +172,7 @@ config BR2_PACKAGE_PHP_EXT_INTL
 	select BR2_PACKAGE_ICU
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
+	depends on !BR2_arc # icu -> atomic builtins
 	help
 	  Internationalization support
 
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
-- 
1.7.9.5
