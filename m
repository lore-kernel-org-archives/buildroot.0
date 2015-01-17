From: Steve Kenton <skenton@ou.edu>
Date: Fri, 16 Jan 2015 18:04:11 -0600
Subject: [Buildroot] [PATCH] dvd+rw-tools: new package
Message-ID: <54B9A6FB.5080801@ou.edu>
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

Signed-off-by Stephen M. Kenton <skenton@ou.edu>
---
This is the last new package I currently have in the pipeline.
Build tested with both uClibc and glibc against last nights snapshot.

uClibc make savedefconfig
BR2_PACKAGE_DVDRW_TOOLS=y

glibc make savedefconfig
BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
BR2_PACKAGE_DVDRW_TOOLS=y

diff -pruN buildroot.ori/package/Config.in buildroot/package/Config.in
--- buildroot.ori/package/Config.in	2015-01-15 02:41:42.000000000 -0600
+++ buildroot/package/Config.in	2015-01-16 17:25:21.126029016 -0600
@@ -7,6 +7,7 @@ menu "Audio and video applications"
 	source "package/aumix/Config.in"
 	source "package/bellagio/Config.in"
 	source "package/dvdauthor/Config.in"
+	source "package/dvdrw-tools/Config.in"
 	source "package/espeak/Config.in"
 	source "package/faad2/Config.in"
 	source "package/ffmpeg/Config.in"
diff -pruN buildroot.ori/package/dvdrw-tools/0001-limits.h.patch buildroot/package/dvdrw-tools/0001-limits.h.patch
--- buildroot.ori/package/dvdrw-tools/0001-limits.h.patch	1969-12-31 18:00:00.000000000 -0600
+++ buildroot/package/dvdrw-tools/0001-limits.h.patch	2015-01-16 17:25:02.558028659 -0600
@@ -0,0 +1,12 @@
+diff -ru dvd+rw-tools-7.1.clean/transport.hxx dvd+rw-tools-7.1.modified/transport.hxx
+--- dvd+rw-tools-7.1.clean/transport.hxx	2008-03-01 04:34:43.000000000 -0600
++++ dvd+rw-tools-7.1.modified/transport.hxx	2014-12-16 16:34:04.208459745 -0600
+@@ -9,6 +9,7 @@
+ #if defined(__unix) || defined(__unix__)
+ #include <stdio.h>
+ #include <stdlib.h>
++#include <limits.h>
+ #include <unistd.h>
+ #include <string.h>
+ #include <sys/types.h>
+
diff -pruN buildroot.ori/package/dvdrw-tools/Config.in buildroot/package/dvdrw-tools/Config.in
--- buildroot.ori/package/dvdrw-tools/Config.in	1969-12-31 18:00:00.000000000 -0600
+++ buildroot/package/dvdrw-tools/Config.in	2015-01-16 17:25:02.558028659 -0600
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_DVDRW_TOOLS
+	bool "dvdrw-tools"
+	help
+	  The dvd+rw-tools are used to master Blu-ray Disc
+	  and DVD Disc media, both +RW/+R and -RW/-R. The
+	  +RW in the name is a historical artifact. This
+	  package contains the widely used growisofs program.
+	
+	  http://fy.chalmers.se/~appro/linux/DVD+RW/tools
diff -pruN buildroot.ori/package/dvdrw-tools/dvdrw-tools.mk buildroot/package/dvdrw-tools/dvdrw-tools.mk
--- buildroot.ori/package/dvdrw-tools/dvdrw-tools.mk	1969-12-31 18:00:00.000000000 -0600
+++ buildroot/package/dvdrw-tools/dvdrw-tools.mk	2015-01-16 17:25:02.558028659 -0600
@@ -0,0 +1,23 @@
+#############################################################
+#
+# dvdrw-tools
+#
+#############################################################
+DVDRW_TOOLS_VERSION = 7.1
+DVDRW_TOOLS_SOURCE = dvd+rw-tools-$(DVDRW_TOOLS_VERSION).tar.gz
+DVDRW_TOOLS_SITE = http://fy.chalmers.se/~appro/linux/DVD+RW/tools
+DVDRW_TOOLS_INSTALL_TARGET = YES
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
