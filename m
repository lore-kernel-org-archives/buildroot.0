From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 17 Jan 2011 21:23:00 +0100
Subject: [Buildroot] [git commit master 1/1] wipe: convert to gentargets and
	bump to version 0.22
Message-ID: <20110117202413.5EBA58A6AD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=613ad08dd5f62a839bcb79501c94e36358fee71f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/wipe/Config.in |    3 +-
 package/wipe/wipe.mk   |   67 ++++++++++++++++-------------------------------
 2 files changed, 24 insertions(+), 46 deletions(-)

diff --git a/package/wipe/Config.in b/package/wipe/Config.in
index bfb6199..a053a72 100644
--- a/package/wipe/Config.in
+++ b/package/wipe/Config.in
@@ -4,5 +4,4 @@ config BR2_PACKAGE_WIPE
 	  Wipe is a little command for securely erasing files
 	  from magnetic media. It compiles under various unix platforms.
 
-	  http://abaababa.ouvaton.org/wipe/
-
+	  http://lambda-diode.com/software/wipe
diff --git a/package/wipe/wipe.mk b/package/wipe/wipe.mk
index 2b2d14e..d227389 100644
--- a/package/wipe/wipe.mk
+++ b/package/wipe/wipe.mk
@@ -2,56 +2,35 @@
 #
 # wipe
 #
-# http://abaababa.ouvaton.org/wipe/wipe-$(WIPE_VERSION).tar.gz
 #############################################################
-WIPE_VERSION:=0.20
-WIPE_SOURCE:=wipe-$(WIPE_VERSION).tar.gz
-#WIPE_PATCH:=wipe_0.2-19.diff.gz
-WIPE_SITE:=http://abaababa.ouvaton.org/wipe
-WIPE_CAT:=$(ZCAT)
-WIPE_DIR:=$(BUILD_DIR)/wipe-$(WIPE_VERSION)
-WIPE_BINARY:=wipe
-WIPE_TARGET_BINARY:=bin/wipe
 
-$(DL_DIR)/$(WIPE_SOURCE):
-	 $(call DOWNLOAD,$(WIPE_SITE),$(WIPE_SOURCE))
+WIPE_VERSION = 0.22
+WIPE_SITE = http://lambda-diode.com/resources/wipe
+WIPE_CFLAGS = $(TARGET_CFLAGS) -DHAVE_DEV_URANDOM -DHAVE_OSYNC -DHAVE_STRCASECMP -DHAVE_RANDOM -DSYNC_WAITS_FOR_SYNC -DFIND_DEVICE_SIZE_BY_BLKGETSIZE
 
-ifneq ($(WIPE_PATCH),)
-$(DL_DIR)/$(WIPE_PATCH):
-	 $(call DOWNLOAD,$(WIPE_SITE),$(WIPE_PATCH))
+ifeq ($(BR2_LARGEFILE),y)
+WIPE_CFLAGS += -DSIXTYFOUR
 endif
 
-wipe-source: $(DL_DIR)/$(WIPE_SOURCE) $(DL_DIR)/$(WIPE_PATCH)
+define WIPE_BUILD_CMDS
+	# Fix busted git version logic
+	$(SED) "s/which/!which/" $(@D)/Makefile
+	$(MAKE) -C $(@D) linux CC_LINUX="$(TARGET_CC)" \
+		CCO_LINUX="$(WIPE_CFLAGS)"
+endef
 
-$(WIPE_DIR)/.unpacked: $(DL_DIR)/$(WIPE_SOURCE) $(DL_DIR)/$(WIPE_PATCH)
-	$(WIPE_CAT) $(DL_DIR)/$(WIPE_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	#toolchain/patch-kernel.sh $(WIPE_DIR) $(DL_DIR) $(WIPE_PATCH)
-	touch $(WIPE_DIR)/.unpacked
+define WIPE_INSTALL_TARGET_CMDS
+	$(INSTALL) -D $(@D)/wipe $(TARGET_DIR)/usr/bin/wipe
+	$(INSTALL) -D $(@D)/wipe.1 $(TARGET_DIR)/usr/share/man/man1/wipe.1
+endef
 
-$(WIPE_DIR)/.configured: $(WIPE_DIR)/.unpacked
-	touch $@
+define WIPE_UNINSTALL_TARGET_CMDS
+	rm -f $(TARGET_DIR)/usr/bin/wipe
+	rm -f $(TARGET_DIR)/usr/share/man/man1/wipe.1
+endef
 
-$(WIPE_DIR)/$(WIPE_BINARY): $(WIPE_DIR)/.configured
-	rm -f $(WIPE_DIR)/$(WIPE_BINARY)
-	$(MAKE) CC="$(TARGET_CC)" CC_GENERIC="$(TARGET_CC)" CCO_GENERIC="$(TARGET_CFLAGS)" -C $(WIPE_DIR) generic
+define WIPE_CLEAN_CMDS
+	$(MAKE) -C $(@D) clean
+endef
 
-$(TARGET_DIR)/$(WIPE_TARGET_BINARY): $(WIPE_DIR)/$(WIPE_BINARY)
-	cp -a $(WIPE_DIR)/$(WIPE_BINARY) $(TARGET_DIR)/$(WIPE_TARGET_BINARY)
-
-wipe: $(TARGET_DIR)/$(WIPE_TARGET_BINARY)
-
-wipe-clean:
-	#$(MAKE) DESTDIR=$(TARGET_DIR) CC="$(TARGET_CC)" -C $(WIPE_DIR) uninstall
-	-$(MAKE) -C $(WIPE_DIR) clean
-
-wipe-dirclean:
-	rm -rf $(WIPE_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_WIPE),y)
-TARGETS+=wipe
-endif
+$(eval $(call GENTARGETS,package,wipe))
-- 
1.7.3.4
