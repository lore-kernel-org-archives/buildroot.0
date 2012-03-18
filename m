From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 18 Mar 2012 22:35:12 +0100
Subject: [Buildroot] [git commit] doom-wad: convert to gentargets
Message-ID: <20120318215010.7A20190E98@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c4b6fea3a36697e45acd55935cbc79374eec1d03
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/games/doom-wad/doom-wad.mk  |   24 ++++++++++++++++++++++++
 package/games/doom-wad/doom-wads.mk |   35 -----------------------------------
 2 files changed, 24 insertions(+), 35 deletions(-)

diff --git a/package/games/doom-wad/doom-wad.mk b/package/games/doom-wad/doom-wad.mk
new file mode 100644
index 0000000..1143b3d
--- /dev/null
+++ b/package/games/doom-wad/doom-wad.mk
@@ -0,0 +1,24 @@
+#############################################################
+#
+# doom-wad
+#
+#############################################################
+
+DOOM_WAD_VERSION = 1.8
+DOOM_WAD_SOURCE = doom-$(DOOM_WAD_VERSION).wad.gz
+DOOM_WAD_SITE = ftp://ftp.idsoftware.com/idstuff/doom/
+
+define DOOM_WAD_EXTRACT_CMDS
+	$(ZCAT) $(DL_DIR)/$($(PKG)_SOURCE) > $(@D)/doom1.wad
+endef
+
+define DOOM_WAD_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0644 -D $(@D)/doom1.wad \
+		$(TARGET_DIR)/usr/share/games/doom/doom1.wad
+endef
+
+define DOOM_WAD_UNINSTALL_TARGET_CMDS
+	rm -f $(TARGET_DIR)/usr/share/games/doom/doom1.wad
+endef
+
+$(eval $(call GENTARGETS))
diff --git a/package/games/doom-wad/doom-wads.mk b/package/games/doom-wad/doom-wads.mk
deleted file mode 100644
index c0bf4fb..0000000
--- a/package/games/doom-wad/doom-wads.mk
+++ /dev/null
@@ -1,35 +0,0 @@
-#############################################################
-#
-# doom-wad
-#
-#############################################################
-
-DOOM_WAD_VERSION = 1.8
-DOOM_WAD_SOURCE = doom-$(DOOM_WAD_VERSION).wad.gz
-DOOM_WAD_SITE = ftp://ftp.idsoftware.com/idstuff/doom/
-DOOM_WAD_DIR=$(BUILD_DIR)/doom-wad-$(DOOM_WAD_VERSION)
-
-$(DL_DIR)/$(DOOM_WAD_SOURCE):
-	 $(call DOWNLOAD,$(DOOM_WAD_SITE)/$(DOOM_WAD_SOURCE))
-
-doom-wad-source: $(DL_DIR)/$(DOOM_WAD_SOURCE)
-
-$(DOOM_WAD_DIR)/.unpacked: $(DL_DIR)/$(DOOM_WAD_SOURCE)
-	$(INSTALL) -D $(DL_DIR)/$(DOOM_WAD_SOURCE) $(DOOM_WAD_DIR)/$(DOOM_WAD_SOURCE)
-	$(ZCAT) $(DOOM_WAD_DIR)/$(DOOM_WAD_SOURCE) > \
-		$(DOOM_WAD_DIR)/doom-$(DOOM_WAD_VERSION).wad
-	touch $@
-
-$(TARGET_DIR)/usr/share/games/doom/doom1.wad: $(DOOM_WAD_DIR)/.unpacked
-	$(INSTALL) -D $(DOOM_WAD_DIR)/doom-$(DOOM_WAD_VERSION).wad $@
-
-doom-wad: $(TARGET_DIR)/usr/share/games/doom/doom1.wad
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_DOOM_WAD),y)
-TARGETS+=doom-wad
-endif
