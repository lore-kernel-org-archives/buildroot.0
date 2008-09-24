From: egtvedt at uclibc.org <egtvedt@uclibc.org>
Date: Wed, 24 Sep 2008 05:53:45 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/games: doom-wad
	lxdoom
Message-ID: <20080924125345.D233B3C2C9@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: egtvedt
Date: 2008-09-24 05:53:45 -0700 (Wed, 24 Sep 2008)
New Revision: 23464

Log:
doom-wad: split out and fix installation of Doom shareware wad file

This patch splits the installation of the shareware WAD file into a separate
package. The wad file will also be installed into /usr/share/games/doom
directory, since the client will search this directory when starting.

The Makefile rule has also been altered to use tools defined by Buildroot to
extract and install the wad file. The package is also multiple project safe
now.

Signed-off-by: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>



Added:
   trunk/buildroot/package/games/doom-wad/
   trunk/buildroot/package/games/doom-wad/Config.in
   trunk/buildroot/package/games/doom-wad/doom-wads.mk

Removed:
   trunk/buildroot/package/games/lxdoom/lxdoom-wad.mk

Modified:
   trunk/buildroot/package/games/Config.in
   trunk/buildroot/package/games/lxdoom/Config.in


Changeset:
Modified: trunk/buildroot/package/games/Config.in
===================================================================
--- trunk/buildroot/package/games/Config.in	2008-09-24 12:06:59 UTC (rev 23463)
+++ trunk/buildroot/package/games/Config.in	2008-09-24 12:53:45 UTC (rev 23464)
@@ -6,6 +6,7 @@
 
 if BR2_GAMES
 source "package/games/ace_of_penguins/Config.in"
+source "package/games/doom-wad/Config.in"
 source "package/games/gnuchess/Config.in"
 source "package/games/lxdoom/Config.in"
 source "package/games/magiccube4d/Config.in"

Added: trunk/buildroot/package/games/doom-wad/Config.in
===================================================================
--- trunk/buildroot/package/games/doom-wad/Config.in	                        (rev 0)
+++ trunk/buildroot/package/games/doom-wad/Config.in	2008-09-24 12:53:45 UTC (rev 23464)
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_DOOM_WAD
+	bool "shareware Doom WAD file"
+	depends on BR2_PACKAGE_LXDOOM
+	help
+          This will install the shareware wad data file for the doom game.
+
+          The wad file will be placed in the /usr/share/games/doom directory.

Added: trunk/buildroot/package/games/doom-wad/doom-wads.mk
===================================================================
--- trunk/buildroot/package/games/doom-wad/doom-wads.mk	                        (rev 0)
+++ trunk/buildroot/package/games/doom-wad/doom-wads.mk	2008-09-24 12:53:45 UTC (rev 23464)
@@ -0,0 +1,35 @@
+#############################################################
+#
+# doom-wad
+#
+#############################################################
+
+DOOM_WAD_VERSION = 1.8
+DOOM_WAD_SOURCE = doom-$(DOOM_WAD_VERSION).wad.gz
+DOOM_WAD_SITE = ftp://ftp.idsoftware.com/idstuff/doom/
+DOOM_WAD_DIR=$(BUILD_DIR)/doom-wad-$(DOOM_WAD_VERSION)
+
+$(DL_DIR)/$(DOOM_WAD_SOURCE):
+	 $(WGET) -P $(DL_DIR) $(DOOM_WAD_SITE)/$(DOOM_WAD_SOURCE)
+
+doom-wad-source: $(DL_DIR)/$(DOOM_WAD_SOURCE)
+
+$(DOOM_WAD_DIR)/.unpacked: $(DL_DIR)/$(DOOM_WAD_SOURCE)
+	$(INSTALL) -D $(DL_DIR)/$(DOOM_WAD_SOURCE) $(DOOM_WAD_DIR)/$(DOOM_WAD_SOURCE)
+	$(ZCAT) $(DOOM_WAD_DIR)/$(DOOM_WAD_SOURCE) > \
+		$(DOOM_WAD_DIR)/doom-$(DOOM_WAD_VERSION).wad
+	touch $@
+
+$(TARGET_DIR)/usr/share/games/doom/doom1.wad: $(DOOM_WAD_DIR)/.unpacked
+	$(INSTALL) -D $(DOOM_WAD_DIR)/doom-$(DOOM_WAD_VERSION).wad $@
+
+doom-wad: $(TARGET_DIR)/usr/share/games/doom/doom1.wad
+
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(strip $(BR2_PACKAGE_DOOM_WAD)),y)
+TARGETS+=doom-wad
+endif

Modified: trunk/buildroot/package/games/lxdoom/Config.in
===================================================================
--- trunk/buildroot/package/games/lxdoom/Config.in	2008-09-24 12:06:59 UTC (rev 23463)
+++ trunk/buildroot/package/games/lxdoom/Config.in	2008-09-24 12:53:45 UTC (rev 23464)
@@ -2,8 +2,3 @@
 	bool "lxdoom"
 	help
 	  This is the linux version of the popular doom game.
-config BR2_PACKAGE_LXDOOM_WAD
-	bool "lxdoom-wad"
-	depends on BR2_PACKAGE_LXDOOM
-	help
-	  This is the shareware wad data files for the doom game.

Deleted: trunk/buildroot/package/games/lxdoom/lxdoom-wad.mk
===================================================================
--- trunk/buildroot/package/games/lxdoom/lxdoom-wad.mk	2008-09-24 12:06:59 UTC (rev 23463)
+++ trunk/buildroot/package/games/lxdoom/lxdoom-wad.mk	2008-09-24 12:53:45 UTC (rev 23464)
@@ -1,35 +0,0 @@
-#############################################################
-#
-# lxdoom-wad
-#
-#############################################################
-
-LXDOOM_WAD_VERSION = 1.8
-LXDOOM_WAD_SOURCE = doom-$(LXDOOM_WAD_VERSION).wad.gz
-LXDOOM_WAD_SITE = ftp://ftp.idsoftware.com/idstuff/doom/
-LXDOOM_WAD_DIR=$(BUILD_DIR)/lxdoom-$(LXDOOM_WAD_VERSION)-wad
-
-$(DL_DIR)/$(LXDOOM_WAD_SOURCE):
-	 $(WGET) -P $(DL_DIR) $(LXDOOM_WAD_SITE)/$(LXDOOM_WAD_SOURCE)
-
-$(LXDOOM_WAD_DIR)/.unpacked: $(DL_DIR)/$(LXDOOM_WAD_SOURCE)
-	mkdir -p $(LXDOOM_WAD_DIR)
-	cp -f $(DL_DIR)/$(LXDOOM_WAD_SOURCE) $(LXDOOM_WAD_DIR)
-	gunzip -d $(LXDOOM_WAD_DIR)/$(LXDOOM_WAD_SOURCE)
-	touch $@
-
-$(LXDOOM_WAD_DIR)/.installed: $(LXDOOM_WAD_DIR)/.unpacked
-	cp -f $(LXDOOM_WAD_DIR)/* $(TARGET_DIR)/usr/games
-	touch $@
-
-lxdoom-wad: lxdoom $(LXDOOM_WAD_DIR)/.installed
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(strip $(BR2_PACKAGE_LXDOOM_WAD)),y)
-TARGETS+=lxdoom-wad
-endif
-
