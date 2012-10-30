From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 30 Oct 2012 22:37:16 +0100
Subject: [Buildroot] [git commit] php: bump to version 5.3.18
Message-ID: <20121030213943.8BC5B99664@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=45072fc407e6d826f2bee56898e2139faf07b153
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/php/Config.in                     |    4 ++
 package/php/php-force-cross-compile.patch |   50 -----------------------------
 package/php/php.mk                        |    2 +-
 3 files changed, 5 insertions(+), 51 deletions(-)

diff --git a/package/php/Config.in b/package/php/Config.in
index c8c100c..6d15da5 100644
--- a/package/php/Config.in
+++ b/package/php/Config.in
@@ -25,6 +25,8 @@ choice
 
 config BR2_PACKAGE_PHP_SAPI_CGI
 	bool "CGI"
+	# CGI uses fork()
+	depends on BR2_USE_MMU
 	select BR2_PACKAGE_PHP_CGI
 	help
 	  Common Gateway Interface
@@ -37,6 +39,8 @@ config BR2_PACKAGE_PHP_SAPI_CLI
 
 config BR2_PACKAGE_PHP_SAPI_CLI_CGI
         bool "CGI and CLI"
+	# CGI uses fork()
+	depends on BR2_USE_MMU
 	select BR2_PACKAGE_PHP_CLI
 	select BR2_PACKAGE_PHP_CGI
 	help
diff --git a/package/php/php-force-cross-compile.patch b/package/php/php-force-cross-compile.patch
deleted file mode 100644
index f14b477..0000000
--- a/package/php/php-force-cross-compile.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-php: force cross-compilation
-
-In its configure script, PHP detects whether we're cross-compiling or
-not, by compiling and running a simple C program. Depending on whether
-cross-compiling has been detected or not, then PHP enables or disables
-the AC_TRY_RUN tests (which verify the availability of something by
-*executing* a program, which, by definition, cannot work in
-cross-compilation mode).
-
-This works just fine when the target architecture is ARM or PowerPC
-and the build machine is x86 or x86_64. Unfortunately, when the target
-architecture is x86_64 and the build machine is also x86_64, the
-cross-compilation mode detection concludes that we are not
-cross-compiling, because it succeeds in running this small program.
-
-However, while it succeeds in running this basic small program, some
-other programs executed later through AC_TRY_RUN tests do not work,
-because they have target library dependencies that are not available
-on the build machine. For example, the libxml2 test fails to *run*
-because libxml2 is not available on the build machine, only in the
-target/staging directories. So trying to run a program linked against
-libxml2, on the build machine, simply doesn't make sense.
-
-We fix this problem by just forcing PHP to think that we're
-cross-compiling (which is always the case with Buildroot, as we're at
-the moment never building PHP for the host). Unfortunately, the
-configure.in file dates back from the autoconf 2.13 era, so the
-configure script does not understand the ac_cv_prog_cc_cross cache
-variable, and we cannot easily regenerate the configure script using
-our package autoconf version. The easiest solution is therefore to
-simply patch the configure script to make the cross-compilation test
-fail: we replace the execution of the program by a call to false,
-which always fail, leading the configure script to understand that we
-*are* cross-compiling.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: b/configure
-===================================================================
---- a/configure
-+++ b/configure
-@@ -2387,7 +2387,7 @@
- if { (eval echo configure:2388: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
-   ac_cv_prog_cc_works=yes
-   # If we can't run a trivial program, we are probably using a cross compiler.
--  if (./conftest; exit) 2>/dev/null; then
-+  if (false; exit) 2>/dev/null; then
-     ac_cv_prog_cc_cross=no
-   else
-     ac_cv_prog_cc_cross=yes
diff --git a/package/php/php.mk b/package/php/php.mk
index 2f8e99e..6ac9f29 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-PHP_VERSION = 5.3.16
+PHP_VERSION = 5.3.18
 PHP_SOURCE = php-$(PHP_VERSION).tar.bz2
 PHP_SITE = http://www.php.net/distributions
 PHP_INSTALL_STAGING = YES
