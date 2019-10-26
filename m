From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 26 Oct 2019 10:31:09 +0200
Subject: [Buildroot] [PATCH 1/1] package/arp-scan: bump version to 1.9.6
Message-ID: <20191026083109.9067-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed patch which was applied upstream:
https://github.com/royhills/arp-scan/commit/cbeda6a9c5e154fd5e5d56e3e6e6bdc5ddd2b088

We still need autoreconf however due to using source code retrieved by
the github helper.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...nking-to-detect-stack-protector-supp.patch | 39 -------------------
 package/arp-scan/arp-scan.hash                |  2 +-
 package/arp-scan/arp-scan.mk                  |  4 +-
 3 files changed, 2 insertions(+), 43 deletions(-)
 delete mode 100644 package/arp-scan/0001-configure-try-linking-to-detect-stack-protector-supp.patch

diff --git a/package/arp-scan/0001-configure-try-linking-to-detect-stack-protector-supp.patch b/package/arp-scan/0001-configure-try-linking-to-detect-stack-protector-supp.patch
deleted file mode 100644
index 8eb9d6eff4..0000000000
--- a/package/arp-scan/0001-configure-try-linking-to-detect-stack-protector-supp.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From f406041b58eadc716d6227408d3af553d566ffeb Mon Sep 17 00:00:00 2001
-From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
-Date: Tue, 4 Apr 2017 17:31:29 +0200
-Subject: [PATCH] configure: try linking to detect stack-protector support
-
-Even if gcc accepts the -fstack-protector argument, it is possible that
-the libssp support library is missing. Detect this by linking instead
-of just compiling.
-
-Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
----
- acinclude.m4 | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/acinclude.m4 b/acinclude.m4
-index 3c84118..4725154 100644
---- a/acinclude.m4
-+++ b/acinclude.m4
-@@ -243,7 +243,7 @@ AC_DEFUN([GCC_STACK_PROTECT_CC],[
-     AC_MSG_CHECKING([whether ${CC} accepts -fstack-protector])
-     ssp_old_cflags="$CFLAGS"
-     CFLAGS="$CFLAGS -fstack-protector"
--    AC_TRY_COMPILE(,,, ssp_cc=no)
-+    AC_TRY_LINK(,,, ssp_cc=no)
-     echo $ssp_cc
-     if test "X$ssp_cc" = "Xno"; then
-       CFLAGS="$ssp_old_cflags"
-@@ -259,7 +259,7 @@ AC_DEFUN([GCC_STACK_PROTECT_CXX],[
-     AC_MSG_CHECKING([whether ${CXX} accepts -fstack-protector])
-     ssp_old_cxxflags="$CXXFLAGS"
-     CXXFLAGS="$CXXFLAGS -fstack-protector"
--    AC_TRY_COMPILE(,,, ssp_cxx=no)
-+    AC_TRY_LINK(,,, ssp_cxx=no)
-     echo $ssp_cxx
-     if test "X$ssp_cxx" = "Xno"; then
-         CXXFLAGS="$ssp_old_cxxflags"
--- 
-2.11.0
-
diff --git a/package/arp-scan/arp-scan.hash b/package/arp-scan/arp-scan.hash
index 62f12d3d20..d14e6ba270 100644
--- a/package/arp-scan/arp-scan.hash
+++ b/package/arp-scan/arp-scan.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	aa9498af84158a315b7e0ea6c2cddfa746660ca3987cbe7e32c0c90f5382d9d2	arp-scan-1.9.5.tar.gz
+sha256	971b45c3369816467994797fbcd0076eb8f0ffb9c42764ea6dba25ab3fd490da	arp-scan-1.9.6.tar.gz
 sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	COPYING
diff --git a/package/arp-scan/arp-scan.mk b/package/arp-scan/arp-scan.mk
index a87fa35151..20e9cb62fe 100644
--- a/package/arp-scan/arp-scan.mk
+++ b/package/arp-scan/arp-scan.mk
@@ -4,13 +4,11 @@
 #
 ################################################################################
 
-ARP_SCAN_VERSION = 1.9.5
+ARP_SCAN_VERSION = 1.9.6
 ARP_SCAN_SITE = $(call github,royhills,arp-scan,$(ARP_SCAN_VERSION))
 ARP_SCAN_LICENSE = GPL-3.0+
 ARP_SCAN_LICENSE_FILES = COPYING
 ARP_SCAN_DEPENDENCIES = libpcap
-
-# 0001-configure-try-linking-to-detect-stack-protector-supp.patch touches acinclude.m4
 ARP_SCAN_AUTORECONF = YES
 
 ifeq ($(BR2_STATIC_LIBS),y)
-- 
2.20.1
