From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 1 May 2012 22:39:35 +0200
Subject: [Buildroot] [git commit] uemacs: convert to GENTARGETS
Message-ID: <20120501204006.45F7296C3B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ba030e960f011a4840f6b1a499cadbefdb8e50b2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/uemacs/uemacs.mk |   54 +++++++++++++--------------------------------
 1 files changed, 16 insertions(+), 38 deletions(-)

diff --git a/package/uemacs/uemacs.mk b/package/uemacs/uemacs.mk
index 62b0911..b7b942c 100644
--- a/package/uemacs/uemacs.mk
+++ b/package/uemacs/uemacs.mk
@@ -3,46 +3,24 @@
 # uemacs
 #
 #############################################################
-UEMACS_VERSION:=4.0.15-lt
-UEMACS_SOURCE:=em-$(UEMACS_VERSION).tar.bz2
-UEMACS_CAT:=$(BZCAT)
-UEMACS_SITE:=$(BR2_KERNEL_MIRROR)/software/editors/uemacs/
-UEMACS_DIR:=$(BUILD_DIR)/em-$(UEMACS_VERSION)
-UEMACS_BINARY:=em
-UEMACS_TARGET_BINARY:=usr/bin/emacs
 
-$(DL_DIR)/$(UEMACS_SOURCE):
-	 $(call DOWNLOAD,$(UEMACS_SITE)/$(UEMACS_SOURCE))
+UEMACS_VERSION = 4.0.15-lt
+UEMACS_SOURCE = em-$(UEMACS_VERSION).tar.bz2
+UEMACS_SITE = $(BR2_KERNEL_MIRROR)/software/editors/uemacs/
+UEMACS_DEPENDENCIES = ncurses
 
-uemacs-source: $(DL_DIR)/$(UEMACS_SOURCE)
+define UEMACS_BUILD_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
+		CC="$(TARGET_CC)" DEFINES="-DAUTOCONF -DPOSIX -DUSG" \
+		CFLAGS+="$(TARGET_CFLAGS) " LIBS="$(TARGET_CFLAGS) -lncurses"
+endef
 
-$(UEMACS_DIR)/.unpacked: $(DL_DIR)/$(UEMACS_SOURCE)
-	$(UEMACS_CAT) $(DL_DIR)/$(UEMACS_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	support/scripts/apply-patches.sh $(UEMACS_DIR) package/uemacs/ uemacs\*.patch
-	touch $(UEMACS_DIR)/.unpacked
+define UEMACS_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 -D $(@D)/em $(TARGET_DIR)/usr/bin/em
+endef
 
-$(UEMACS_DIR)/$(UEMACS_BINARY): $(UEMACS_DIR)/.unpacked
-	$(MAKE) -C $(UEMACS_DIR) \
-	CC="$(TARGET_CC)" DEFINES="-DAUTOCONF -DPOSIX -DUSG" CFLAGS+="$(TARGET_CFLAGS) " LIBS="$(TARGET_CFLAGS) -lncurses"
-	$(STRIPCMD) $(UEMACS_DIR)/$(UEMACS_BINARY)
+define UEMACS_UNINSTALL_TARGET_CMDS
+	rm -f $(TARGET_DIR)/usr/bin/em
+endef
 
-$(TARGET_DIR)/$(UEMACS_TARGET_BINARY): $(UEMACS_DIR)/$(UEMACS_BINARY)
-	$(INSTALL) -m 0755 -D $(UEMACS_DIR)/$(UEMACS_BINARY) $(TARGET_DIR)/$(UEMACS_TARGET_BINARY)
-
-uemacs: ncurses $(TARGET_DIR)/$(UEMACS_TARGET_BINARY)
-
-uemacs-clean:
-	rm -f $(TARGET_DIR)/$(UEMACS_TARGET_BINARY)
-	-$(MAKE) -C $(UEMACS_DIR) clean
-
-uemacs-dirclean:
-	rm -rf $(UEMACS_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_UEMACS),y)
-TARGETS+=uemacs
-endif
+$(eval $(call GENTARGETS))
