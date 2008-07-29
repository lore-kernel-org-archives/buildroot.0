From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Tue, 29 Jul 2008 08:46:44 +0200
Subject: [Buildroot] [PATCH v2 1/5] lxdoom-wad: make installation of Doom
	shareware wad file be more generic
Message-ID: <1217314008-22850-1-git-send-email-hans-christian.egtvedt@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch will let the user install the Doom shareware wad file if lxdoom or
lsdldoom is selected. The wad file will also be installed into
/usr/share/games/doom directory, since the client will search this directory
when starting.

The Makefile rule has also been altered to depend on the installed wad file, so
it will be multiple project safe.

Signed-off-by: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
---
 package/lxdoom/Config.in     |    6 ++++--
 package/lxdoom/lxdoom-wad.mk |   14 ++++++--------
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/package/lxdoom/Config.in b/package/lxdoom/Config.in
index 892e45c..087183d 100644
--- a/package/lxdoom/Config.in
+++ b/package/lxdoom/Config.in
@@ -3,7 +3,9 @@ config BR2_PACKAGE_LXDOOM
 	help
 	  This is the linux version of the popular doom game.
 config BR2_PACKAGE_LXDOOM_WAD
-	bool "lxdoom-wad"
+	bool "doom shareware wad file"
 	depends on BR2_PACKAGE_LXDOOM
 	help
-	  This is the shareware wad data files for the doom game.
+	  This will install the shareware wad data file for the doom game.
+
+	  The wad file will be placed in /usr/share/games/doom/doom1.wad
diff --git a/package/lxdoom/lxdoom-wad.mk b/package/lxdoom/lxdoom-wad.mk
index 41b8ed8..6a4dfc8 100644
--- a/package/lxdoom/lxdoom-wad.mk
+++ b/package/lxdoom/lxdoom-wad.mk
@@ -3,7 +3,6 @@
 # lxdoom-wad
 #
 #############################################################
-
 LXDOOM_WAD_VERSION = 1.8
 LXDOOM_WAD_SOURCE = doom-$(LXDOOM_WAD_VERSION).wad.gz
 LXDOOM_WAD_SITE = ftp://ftp.idsoftware.com/idstuff/doom/
@@ -13,16 +12,15 @@ $(DL_DIR)/$(LXDOOM_WAD_SOURCE):
 	 $(WGET) -P $(DL_DIR) $(LXDOOM_WAD_SITE)/$(LXDOOM_WAD_SOURCE)
 
 $(LXDOOM_WAD_DIR)/.unpacked: $(DL_DIR)/$(LXDOOM_WAD_SOURCE)
-	mkdir -p $(LXDOOM_WAD_DIR)
-	cp -f $(DL_DIR)/$(LXDOOM_WAD_SOURCE) $(LXDOOM_WAD_DIR)
-	gunzip -d $(LXDOOM_WAD_DIR)/$(LXDOOM_WAD_SOURCE) 
+	$(INSTALL) -D $(DL_DIR)/$(LXDOOM_WAD_SOURCE) $(LXDOOM_WAD_DIR)/$(LXDOOM_WAD_SOURCE)
+	$(ZCAT) $(LXDOOM_WAD_DIR)/$(LXDOOM_WAD_SOURCE) > \
+		$(LXDOOM_WAD_DIR)/doom-$(LXDOOM_WAD_VERSION).wad
 	touch $@
 
-$(LXDOOM_WAD_DIR)/.installed: $(LXDOOM_WAD_DIR)/.unpacked
-	cp -f $(LXDOOM_WAD_DIR)/* $(TARGET_DIR)/usr/games
-	touch $@
+$(TARGET_DIR)/usr/share/games/doom/doom1.wad: $(LXDOOM_WAD_DIR)/.unpacked
+	$(INSTALL) -D $(LXDOOM_WAD_DIR)/doom-$(LXDOOM_WAD_VERSION).wad $@
 
-lxdoom-wad: lxdoom $(LXDOOM_WAD_DIR)/.installed
+lxdoom-wad: uclibc $(TARGET_DIR)/usr/share/games/doom/doom1.wad
 
 #############################################################
 #
-- 
1.5.4.3
