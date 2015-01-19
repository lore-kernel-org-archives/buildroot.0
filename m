From: Steve Kenton <skenton@ou.edu>
Date: Mon, 19 Jan 2015 14:36:54 -0600
Subject: [Buildroot] [PATCH V4] dvd+rw-tools: new package
Message-ID: <54BD6AE6.9090007@ou.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The dvd+rw-tools are used to master Blu-ray Disc
and DVD Disc media, both +RW/+R and -RW/-R. The
+RW in the name is a historical artifact. This
package contains the widely used growisofs program.
	
http://fy.chalmers.se/~appro/linux/DVD+RW/tools

Patch to dvd+rw-tools mkisofs->xorrisofs based on LFS instructions.
http://www.linuxfromscratch.org/blfs/view/svn/multimedia/dvd-rw-tools.html

sed -i '/stdlib/a #include <limits.h>' transport.hxx &&
sed -i 's#mkisofs"#xorrisofs"#' growisofs.c &&
sed -i 's#mkisofs#xorrisofs#;s#MKISOFS#XORRISOFS#' growisofs.1 &&

Signed-off-by Stephen M. Kenton <skenton@ou.edu>
---
The xorriso dependency is only needed at run time, not build time
so it is selected in Config.in but not a dependency in dvdrw-tools.mk

V4 - added mmu and thread dependencies and locally computed hash file

V3 - added xorriso dependency and followed LFS directions
     for replacing cdrtools with GNU xorriso

V2 - added the licensing information

diff -pruN buildroot.ori/package/Config.in buildroot/package/Config.in
--- buildroot.ori/package/Config.in	2015-01-16 15:37:56.000000000 -0600
+++ buildroot/package/Config.in	2015-01-19 14:17:23.425515990 -0600
@@ -7,6 +7,7 @@ menu "Audio and video applications"
 	source "package/aumix/Config.in"
 	source "package/bellagio/Config.in"
 	source "package/dvdauthor/Config.in"
+	source "package/dvdrw-tools/Config.in"
 	source "package/espeak/Config.in"
 	source "package/faad2/Config.in"
 	source "package/ffmpeg/Config.in"
diff -pruN buildroot.ori/package/dvdrw-tools/0001-cdrtools_and_limits.h.patch buildroot/package/dvdrw-tools/0001-cdrtools_and_limits.h.patch
--- buildroot.ori/package/dvdrw-tools/0001-cdrtools_and_limits.h.patch	1969-12-31 18:00:00.000000000 -0600
+++ buildroot/package/dvdrw-tools/0001-cdrtools_and_limits.h.patch	2015-01-18 15:48:15.873864621 -0600
@@ -0,0 +1,19 @@
+diff -pruN dvd+rw-tools-7.1.ori/transport.hxx dvd+rw-tools-7.1/transport.hxx
+--- dvd+rw-tools-7.1.ori/transport.hxx	2008-03-01 04:34:43.000000000 -0600
++++ dvd+rw-tools-7.1/transport.hxx	2015-01-18 15:47:24.245863631 -0600
+@@ -9,6 +9,7 @@
+ #if defined(__unix) || defined(__unix__)
+ #include <stdio.h>
+ #include <stdlib.h>
++#include <limits.h>
+ #include <unistd.h>
+ #include <string.h>
+ #include <sys/types.h>
+@@ -40,6 +41,7 @@ inline long getmsecs()
+ #include <stddef.h>
+ #include <stdio.h>
+ #include <stdlib.h>
++#include <limits.h>
+ #define ssize_t		LONG_PTR
+ #define off64_t		__int64
+
diff -pruN buildroot.ori/package/dvdrw-tools/Config.in buildroot/package/dvdrw-tools/Config.in
--- buildroot.ori/package/dvdrw-tools/Config.in	1969-12-31 18:00:00.000000000 -0600
+++ buildroot/package/dvdrw-tools/Config.in	2015-01-19 14:05:54.545502775 -0600
@@ -0,0 +1,18 @@
+config BR2_PACKAGE_DVDRW_TOOLS
+	bool "dvdrw-tools"
+	select BR2_PACKAGE_XORRISO
+	depends on BR2_USE_WCHAR
+	depends on BR2_LARGEFILE
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU # fork()
+	help
+	  The dvd+rw-tools are used to master Blu-ray Disc
+	  and DVD Disc media, both +RW/+R and -RW/-R. The
+	  +RW in the name is a historical artifact. This
+	  package contains the widely used growisofs program.
+	
+	  http://fy.chalmers.se/~appro/linux/DVD+RW/tools
+
+comment "dvdrw-tools needs a toolchain w/ wchar, largefile"
+	depends on !BR2_USE_WCHAR || !BR2_LARGEFILE \
+		|| !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_MMU
diff -pruN buildroot.ori/package/dvdrw-tools/dvdrw-tools.hash buildroot/package/dvdrw-tools/dvdrw-tools.hash
--- buildroot.ori/package/dvdrw-tools/dvdrw-tools.hash	1969-12-31 18:00:00.000000000 -0600
+++ buildroot/package/dvdrw-tools/dvdrw-tools.hash	2015-01-19 14:33:11.133534169 -0600
@@ -0,0 +1,4 @@
+# Locally computed using openssl dgst
+md5	8acb3c885c87f6838704a0025e435871	dvd+rw-tools-7.1.tar.gz
+sha1	6400e013934ff589b4b224eced03fd9f42ed719b	dvd+rw-tools-7.1.tar.gz
+
diff -pruN buildroot.ori/package/dvdrw-tools/dvdrw-tools.mk buildroot/package/dvdrw-tools/dvdrw-tools.mk
--- buildroot.ori/package/dvdrw-tools/dvdrw-tools.mk	1969-12-31 18:00:00.000000000 -0600
+++ buildroot/package/dvdrw-tools/dvdrw-tools.mk	2015-01-19 13:58:42.697494491 -0600
@@ -0,0 +1,24 @@
+#############################################################
+#
+# dvdrw-tools
+#
+#############################################################
+DVDRW_TOOLS_VERSION = 7.1
+DVDRW_TOOLS_SOURCE = dvd+rw-tools-$(DVDRW_TOOLS_VERSION).tar.gz
+DVDRW_TOOLS_SITE = http://fy.chalmers.se/~appro/linux/DVD+RW/tools
+DVDRW_TOOLS_LICENSE = GPLv2
+DVDRW_TOOLS_LICENSE_FILES = LICENSE
+
+define DVDRW_TOOLS_BUILD_CMDS
+	$(MAKE) -C $(@D)
+endef
+
+define DVDRW_TOOLS_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 -D $(@D)/dvd-ram-control $(TARGET_DIR)/usr/bin/dvd-ram-control
+	$(INSTALL) -m 0755 -D $(@D)/dvd+rw-booktype $(TARGET_DIR)/usr/bin/dvd+rw-booktype
+	$(INSTALL) -m 0755 -D $(@D)/dvd+rw-format $(TARGET_DIR)/usr/bin/dvd+rw-format
+	$(INSTALL) -m 0755 -D $(@D)/dvd+rw-mediainfo $(TARGET_DIR)/usr/bin/dvd+rw-mediainfo
+	$(INSTALL) -m 0755 -D $(@D)/growisofs $(TARGET_DIR)/usr/bin/growisofs
+endef
+
+$(eval $(generic-package))
