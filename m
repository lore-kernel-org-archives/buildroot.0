From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Feb 2014 14:32:45 +0100
Subject: [Buildroot] [PATCH] icu: not available when BR2_BINFMT_FLAT is used
Message-ID: <1392903165-8858-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

icu does not recognize 'uclinux' as a supported platform. While making
it recognize uclinux is easy, there is another problem down the road:
icu does very weird things to generate an ELF library containing
static data (libicudata.a), and the generated library being ELF, it is
not compatible with the FLAT binary format expected by uclinux
platforms such as Blackfin in FLAT format.

Therefore, we simply disallow the selection of icu on FLAT
platforms.

Note that adding a dependency on BR2_BINFMT_ELF doesn't work, because
BR2_BINFMT_FDPIC is considered to be separate (even if technically
FDPIC is a derivative of ELF). That's why the dependency we're adding
is "depends on !BR2_BINFMT_FLAT" and not "depends on BR2_BINFMT_ELF".

Fixes:

  http://autobuild.buildroot.org/results/b41/b415fed7fae4012bad7d8b53a481bd71bdab716f/build-end.log

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/beecrypt/Config.in    | 3 ++-
 package/cppcms/Config.in      | 1 +
 package/icu/Config.in         | 5 +++++
 package/php/Config.ext        | 2 ++
 package/qt5/qt5base/Config.in | 1 +
 package/webkit/Config.in      | 1 +
 6 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/package/beecrypt/Config.in b/package/beecrypt/Config.in
index 033742c..8d63e5e 100644
--- a/package/beecrypt/Config.in
+++ b/package/beecrypt/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_BEECRYPT
 	bool "beecrypt"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_ICU if BR2_INSTALL_LIBSTDCPP && BR2_USE_WCHAR && \
-	       !BR2_arc
+	       !BR2_arc && !BR2_BINFMT_FLAT
 	help
 	  Beecrypt is a general-purpose cryptography library.
 
@@ -13,4 +13,5 @@ comment "beecrypt needs a toolchain w/ threads"
 
 comment "beecrypt C++ support needs a toolchain w/ wchar"
 	depends on !BR2_arc
+	depends on !BR2_BINFMT_FLAT
 	depends on BR2_INSTALL_LIBSTDCPP && !BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/cppcms/Config.in b/package/cppcms/Config.in
index 2df83ba..c88ae1e 100644
--- a/package/cppcms/Config.in
+++ b/package/cppcms/Config.in
@@ -25,6 +25,7 @@ if BR2_PACKAGE_CPPCMS
 config BR2_PACKAGE_CPPCMS_ICU
 	bool "enable icu support"
 	depends on !BR2_arc # icu -> atomic builtins
+	depends on !BR2_BINFMT_FLAT # icu
 	select BR2_PACKAGE_ICU
 	help
 	  Using ICU allows advanced localization features into CppCMS,
diff --git a/package/icu/Config.in b/package/icu/Config.in
index b736b43..9a27894 100644
--- a/package/icu/Config.in
+++ b/package/icu/Config.in
@@ -3,6 +3,10 @@ config BR2_PACKAGE_ICU
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	# icu does some funky things by generating by itself an ELF
+	# file, and it cannot easily be changed to generate FLAT
+	# format.
+	depends on !BR2_BINFMT_FLAT
 	depends on !BR2_arc # atomic builtins
 	help
 	  International Components for Unicode.
@@ -11,5 +15,6 @@ config BR2_PACKAGE_ICU
 
 comment "icu needs a toolchain w/ C++, wchar, threads"
 	depends on !BR2_arc
+	depends on !BR2_BINFMT_FLAT
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/php/Config.ext b/package/php/Config.ext
index df02047..463334b 100644
--- a/package/php/Config.ext
+++ b/package/php/Config.ext
@@ -162,11 +162,13 @@ config BR2_PACKAGE_PHP_EXT_INTL
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
 	depends on !BR2_arc # icu -> atomic builtins
+	depends on !BR2_BINFMT_FLAT # icu
 	help
 	  Internationalization support
 
 comment "intl support needs a toolchain w/ C++, wchar"
 	depends on !BR2_arc
+	depends on !BR2_BINFMT_FLAT
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR
 
 comment "Image processing"
diff --git a/package/qt5/qt5base/Config.in b/package/qt5/qt5base/Config.in
index 2fca9d2..5c404d1 100644
--- a/package/qt5/qt5base/Config.in
+++ b/package/qt5/qt5base/Config.in
@@ -189,6 +189,7 @@ config BR2_PACKAGE_QT5BASE_ICU
 	bool "Enable ICU support"
 	select BR2_PACKAGE_ICU
 	depends on !BR2_arc # icu -> atomic builtins
+	depends on !BR2_BINFMT_FLAT # icu
 	help
 	  This option enables ICU support in Qt5. This is for example
 	  needed for Qt5Webkit.
diff --git a/package/webkit/Config.in b/package/webkit/Config.in
index daaec36..45f2058 100644
--- a/package/webkit/Config.in
+++ b/package/webkit/Config.in
@@ -13,6 +13,7 @@ config BR2_PACKAGE_WEBKIT
 	depends on BR2_TOOLCHAIN_HAS_THREADS # enchant -> libglib2
 	depends on BR2_PACKAGE_LIBGTK2
 	depends on BR2_PACKAGE_WEBKIT_ARCH_SUPPORTS
+	depends on !BR2_BINFMT_FLAT # icu
 	select BR2_PACKAGE_CAIRO_PNG
 	select BR2_PACKAGE_ENCHANT
 	select BR2_PACKAGE_HARFBUZZ
-- 
1.8.3.2
