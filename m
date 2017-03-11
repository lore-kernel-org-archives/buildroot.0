From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 11 Mar 2017 16:12:05 +0100
Subject: [Buildroot] [PATCH 1/1] package/exim: bump version to 4.89
Message-ID: <20170311151205.16649-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Rebased patch #0003, added uClibc compatibility patch.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...ip-version-check-and-symlink-installation.patch | 11 +++++----
 package/exim/0004-glibc.patch                      | 27 ++++++++++++++++++++++
 package/exim/exim.hash                             |  2 +-
 package/exim/exim.mk                               |  4 ++--
 4 files changed, 36 insertions(+), 8 deletions(-)
 create mode 100644 package/exim/0004-glibc.patch

diff --git a/package/exim/0003-Skip-version-check-and-symlink-installation.patch b/package/exim/0003-Skip-version-check-and-symlink-installation.patch
index 94d21ae11..a342d6ed3 100644
--- a/package/exim/0003-Skip-version-check-and-symlink-installation.patch
+++ b/package/exim/0003-Skip-version-check-and-symlink-installation.patch
@@ -9,6 +9,8 @@ Inspired by:
 http://patch-tracker.debian.org/patch/series/view/exim4/4.76-2/35_install.dpatch
 
 Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
+(rebased against exim 4.89)
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 ---
  scripts/exim_install |    7 +++++--
  1 files changed, 5 insertions(+), 2 deletions(-)
@@ -17,7 +19,7 @@ diff --git a/scripts/exim_install b/scripts/exim_install
 index e68e7d5..487a4e1 100755
 --- a/scripts/exim_install
 +++ b/scripts/exim_install
-@@ -59,6 +59,8 @@ while [ $# -gt 0 ] ; do
+@@ -58,6 +58,8 @@
    shift
  done
  
@@ -26,15 +28,14 @@ index e68e7d5..487a4e1 100755
  # Get the values of BIN_DIRECTORY, CONFIGURE_FILE, INFO_DIRECTORY, NO_SYMLINK,
  # SYSTEM_ALIASES_FILE, and EXE from the global Makefile (in the build
  # directory). EXE is empty except in the Cygwin environment. In each case, keep
-@@ -218,8 +220,9 @@ while [ $# -gt 0 ]; do
+@@ -217,9 +219,7 @@
    # The exim binary is handled specially
  
    if [ $name = exim${EXE} ]; then
--    version=exim-`./exim -bV -C /dev/null | \
+-    exim="./exim -bV -C /dev/null"
+-    version=exim-`$exim 2>/dev/null | \
 -      awk '/Exim version/ { OFS=""; print $3,"-",substr($4,2,length($4)-1) }'`${EXE}
 +    version=exim
-+#    version=exim-`./exim -bV -C /dev/null | \
-+#      awk '/Exim version/ { OFS=""; print $3,"-",substr($4,2,length($4)-1) }'`${EXE}
  
      if [ "${version}" = "exim-${EXE}" ]; then
        echo $com ""
diff --git a/package/exim/0004-glibc.patch b/package/exim/0004-glibc.patch
new file mode 100644
index 000000000..7ae2ef8c7
--- /dev/null
+++ b/package/exim/0004-glibc.patch
@@ -0,0 +1,27 @@
+uClibc does not contain gnu/libc-version.h
+
+Patch sent upstream: https://bugs.exim.org/show_bug.cgi?id=2070
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -uNr exim-4.88.org/src/exim.c exim-4.88/src/exim.c
+--- exim-4.88.org/src/exim.c	2016-12-18 15:02:28.000000000 +0100
++++ exim-4.88/src/exim.c	2016-12-26 12:12:57.000000000 +0100
+@@ -12,7 +12,7 @@
+ 
+ #include "exim.h"
+ 
+-#ifdef __GLIBC__
++#if defined(__GLIBC__) && !defined(__UCLIBC__)
+ # include <gnu/libc-version.h>
+ #endif
+ 
+@@ -1044,7 +1044,7 @@
+   fprintf(f, "Compiler: <unknown>\n");
+ #endif
+ 
+-#ifdef __GLIBC__
++#if defined(__GLIBC__) && !defined(__UCLIBC__)
+   fprintf(f, "Library version: Glibc: Compile: %d.%d\n",
+ 	       	__GLIBC__, __GLIBC_MINOR__);
+   if (__GLIBC_PREREQ(2, 1))
diff --git a/package/exim/exim.hash b/package/exim/exim.hash
index ef2d03ba2..29b9989c3 100644
--- a/package/exim/exim.hash
+++ b/package/exim/exim.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	d4b7994c89240d2f9a9fcd7a2dffa4b72f14379001a24266f4dbb0fbe5131514	exim-4.87.1.tar.bz2
+sha256 912f2ee03c8dba06a3a4c0ee40522d367e1b65dc59e38dfcc1f5d9eecff51ab0  exim-4.89.tar.bz2
diff --git a/package/exim/exim.mk b/package/exim/exim.mk
index a9f4685eb..86383880a 100644
--- a/package/exim/exim.mk
+++ b/package/exim/exim.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-EXIM_VERSION = 4.87.1
+EXIM_VERSION = 4.89
 EXIM_SOURCE = exim-$(EXIM_VERSION).tar.bz2
-EXIM_SITE = ftp://ftp.exim.org/pub/exim/exim4/old
+EXIM_SITE = ftp://ftp.exim.org/pub/exim/exim4
 EXIM_LICENSE = GPLv2+
 EXIM_LICENSE_FILES = LICENCE
 EXIM_DEPENDENCIES = pcre berkeleydb host-pkgconf
-- 
2.11.0
