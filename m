From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 17 Sep 2013 14:39:34 -0300
Subject: [Buildroot] [PATCH] ltrace: bump to version 0.7.3
Message-ID: <1379439574-9353-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now with proper mips support!

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/ltrace/Config.in                             |  4 ++--
 .../{ltrace-events.patch => ltrace-01-events.patch}  |  0
 package/ltrace/ltrace-uclibc.patch                   | 20 --------------------
 package/ltrace/ltrace.mk                             | 12 ++----------
 4 files changed, 4 insertions(+), 32 deletions(-)
 rename package/ltrace/{ltrace-events.patch => ltrace-01-events.patch} (100%)
 delete mode 100644 package/ltrace/ltrace-uclibc.patch

diff --git a/package/ltrace/Config.in b/package/ltrace/Config.in
index 4f1c42f..943af8d 100644
--- a/package/ltrace/Config.in
+++ b/package/ltrace/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LTRACE
 	bool "ltrace"
-	depends on !(BR2_avr32 || BR2_mips || BR2_sh || BR2_sh64 || BR2_xtensa || BR2_aarch64 || BR2_arc)
+	depends on !(BR2_avr32 || BR2_sh || BR2_sh64 || BR2_xtensa || BR2_aarch64 || BR2_arc)
 	select BR2_PACKAGE_LIBELF
 	help
 	  Debugging program which runs a specified command until it exits.
@@ -8,4 +8,4 @@ config BR2_PACKAGE_LTRACE
 	  the dynamic library calls which are called by the executed
 	  process and the signals received by that process.
 
-	  http://packages.debian.org/unstable/utils/ltrace.html
+	  http://ltrace.org
diff --git a/package/ltrace/ltrace-events.patch b/package/ltrace/ltrace-01-events.patch
similarity index 100%
rename from package/ltrace/ltrace-events.patch
rename to package/ltrace/ltrace-01-events.patch
diff --git a/package/ltrace/ltrace-uclibc.patch b/package/ltrace/ltrace-uclibc.patch
deleted file mode 100644
index c1041fb..0000000
--- a/package/ltrace/ltrace-uclibc.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-[PATCH] configure.ac: Recognize linux-uclibc as well
-
-Ltrace works on uClibc as well as on glibc, so accept it.
-
-[Gustavo: update for ltrace 0.7.1]
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-diff -Nura ltrace-0.7.1.orig/configure.ac ltrace-0.7.1/configure.ac
---- ltrace-0.7.1.orig/configure.ac	2012-12-03 09:02:32.995352741 -0300
-+++ ltrace-0.7.1/configure.ac	2012-12-03 09:02:56.579096389 -0300
-@@ -32,7 +32,7 @@
- AC_CANONICAL_HOST
- 
- case "${host_os}" in
--    linux-gnu*)	HOST_OS="linux-gnu" ;;
-+    linux-gnu* | linux-uclibc*)	HOST_OS="linux-gnu" ;;
-     *)		AC_MSG_ERROR([unkown host-os ${host_os}]) ;;
- esac
- AC_SUBST(HOST_OS)
diff --git a/package/ltrace/ltrace.mk b/package/ltrace/ltrace.mk
index 0ea8ff3..b42c252 100644
--- a/package/ltrace/ltrace.mk
+++ b/package/ltrace/ltrace.mk
@@ -4,22 +4,14 @@
 #
 ################################################################################
 
-LTRACE_VERSION = 0.7.2
-LTRACE_SITE = http://alioth.debian.org/frs/download.php/file/3848
+LTRACE_VERSION = 0.7.3
+LTRACE_SITE = http://alioth.debian.org/frs/download.php/file/3947
 LTRACE_SOURCE = ltrace-$(LTRACE_VERSION).tar.bz2
 LTRACE_DEPENDENCIES = libelf
-LTRACE_AUTORECONF = YES
 LTRACE_CONF_OPT = --disable-werror
 LTRACE_LICENSE = GPLv2
 LTRACE_LICENSE_FILES = COPYING
 
-# symlink missing from tarball
-define LTRACE_MIPS_SYMLINK
-	cd $(@D)/sysdeps/linux-gnu; ln -sf mipsel mips
-endef
-
-LTRACE_POST_EXTRACT_HOOKS += LTRACE_MIPS_SYMLINK
-
 # ltrace can use libunwind only if libc has backtrace() support
 # We don't normally do so for uClibc and we can't know if it's external
 ifeq ($(BR2_PACKAGE_LIBUNWIND),y)
-- 
1.8.1.5
