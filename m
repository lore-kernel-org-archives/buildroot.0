From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 5 Apr 2017 12:08:28 +0200
Subject: [Buildroot] [PATCH] arp-scan: new package
Message-ID: <20170405100828.27539-1-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On the br-arm-cortex-m4-full toolchain, the build fails with a
segmentation fault in elf2flt, so add an exception for ARM FLAT
toolchains. Other FLAT toolchains (e.g. br-m68k-5208-full) work fine.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
I tried to debug the elf2flt segfault but elf2flt isn't exactly the
most low-entry-bar source code...
---
 package/Config.in                                  |  1 +
 ...ry-linking-to-detect-stack-protector-supp.patch | 39 ++++++++++++++++++++++
 package/arp-scan/Config.in                         | 11 ++++++
 package/arp-scan/arp-scan.hash                     |  2 ++
 package/arp-scan/arp-scan.mk                       | 18 ++++++++++
 5 files changed, 71 insertions(+)
 create mode 100644 package/arp-scan/0001-configure-try-linking-to-detect-stack-protector-supp.patch
 create mode 100644 package/arp-scan/Config.in
 create mode 100644 package/arp-scan/arp-scan.hash
 create mode 100644 package/arp-scan/arp-scan.mk

diff --git a/package/Config.in b/package/Config.in
index d6d134d0ca..aa304eb0ff 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1494,6 +1494,7 @@ menu "Networking applications"
 	source "package/aircrack-ng/Config.in"
 	source "package/apache/Config.in"
 	source "package/argus/Config.in"
+	source "package/arp-scan/Config.in"
 	source "package/arptables/Config.in"
 	source "package/atftp/Config.in"
 	source "package/autossh/Config.in"
diff --git a/package/arp-scan/0001-configure-try-linking-to-detect-stack-protector-supp.patch b/package/arp-scan/0001-configure-try-linking-to-detect-stack-protector-supp.patch
new file mode 100644
index 0000000000..8eb9d6eff4
--- /dev/null
+++ b/package/arp-scan/0001-configure-try-linking-to-detect-stack-protector-supp.patch
@@ -0,0 +1,39 @@
+From f406041b58eadc716d6227408d3af553d566ffeb Mon Sep 17 00:00:00 2001
+From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
+Date: Tue, 4 Apr 2017 17:31:29 +0200
+Subject: [PATCH] configure: try linking to detect stack-protector support
+
+Even if gcc accepts the -fstack-protector argument, it is possible that
+the libssp support library is missing. Detect this by linking instead
+of just compiling.
+
+Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
+---
+ acinclude.m4 | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/acinclude.m4 b/acinclude.m4
+index 3c84118..4725154 100644
+--- a/acinclude.m4
++++ b/acinclude.m4
+@@ -243,7 +243,7 @@ AC_DEFUN([GCC_STACK_PROTECT_CC],[
+     AC_MSG_CHECKING([whether ${CC} accepts -fstack-protector])
+     ssp_old_cflags="$CFLAGS"
+     CFLAGS="$CFLAGS -fstack-protector"
+-    AC_TRY_COMPILE(,,, ssp_cc=no)
++    AC_TRY_LINK(,,, ssp_cc=no)
+     echo $ssp_cc
+     if test "X$ssp_cc" = "Xno"; then
+       CFLAGS="$ssp_old_cflags"
+@@ -259,7 +259,7 @@ AC_DEFUN([GCC_STACK_PROTECT_CXX],[
+     AC_MSG_CHECKING([whether ${CXX} accepts -fstack-protector])
+     ssp_old_cxxflags="$CXXFLAGS"
+     CXXFLAGS="$CXXFLAGS -fstack-protector"
+-    AC_TRY_COMPILE(,,, ssp_cxx=no)
++    AC_TRY_LINK(,,, ssp_cxx=no)
+     echo $ssp_cxx
+     if test "X$ssp_cxx" = "Xno"; then
+         CXXFLAGS="$ssp_old_cxxflags"
+-- 
+2.11.0
+
diff --git a/package/arp-scan/Config.in b/package/arp-scan/Config.in
new file mode 100644
index 0000000000..8fa3235434
--- /dev/null
+++ b/package/arp-scan/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_ARP_SCAN
+	bool "arp-scan"
+	depends on !(BR2_arm && BR2_BINFMT_FLAT) # SEGV in elf2flt
+	select BR2_PACKAGE_LIBPCAP
+	help
+	  The ARP scanner
+
+	  arp-scan is a command-line tool that uses the ARP protocol to
+	  discover and fingerprint IP hosts on the local network.
+
+	  http://www.nta-monitor.com/wiki/index.php/Arp-scan_Documentation
diff --git a/package/arp-scan/arp-scan.hash b/package/arp-scan/arp-scan.hash
new file mode 100644
index 0000000000..4b2ddf1816
--- /dev/null
+++ b/package/arp-scan/arp-scan.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	ce908ac71c48e85dddf6dd4fe5151d13c7528b1f49717a98b2a2535bd797d892	arp-scan-1.9.tar.gz
diff --git a/package/arp-scan/arp-scan.mk b/package/arp-scan/arp-scan.mk
new file mode 100644
index 0000000000..fc3740bf57
--- /dev/null
+++ b/package/arp-scan/arp-scan.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# arp-scan
+#
+################################################################################
+
+ARP_SCAN_VERSION = 1.9
+ARP_SCAN_SITE = https://github.com/royhills/arp-scan/releases/download/$(ARP_SCAN_VERSION)
+ARP_SCAN_LICENSE = GPL-3.0+
+ARP_SCAN_LICENSE_FILES = COPYING
+ARP_SCAN_DEPENDENCIES = libpcap
+
+# 0001-configure-try-linking-to-detect-stack-protector-supp.patch touches acinclude.m4
+ARP_SCAN_AUTORECONF = YES
+
+ARP_SCAN_CONF_ENV = pgac_cv_snprintf_long_long_int_format='%lld'
+
+$(eval $(autotools-package))
-- 
2.11.0
