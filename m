From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 Apr 2010 21:50:46 +0200
Subject: [Buildroot] [git commit master] madplay: convert to the autotools
	infrastructure
Message-ID: <20100413195158.79A1120F99@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=8e4a53cf8c5ddb3f0ea5b8d084e1b8b2b81139d4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/multimedia/madplay/madplay.mk |   64 +++------------------------------
 1 files changed, 5 insertions(+), 59 deletions(-)

diff --git a/package/multimedia/madplay/madplay.mk b/package/multimedia/madplay/madplay.mk
index fce9a61..a2ac14d 100644
--- a/package/multimedia/madplay/madplay.mk
+++ b/package/multimedia/madplay/madplay.mk
@@ -6,68 +6,14 @@
 MADPLAY_VERSION:=0.15.2b
 MADPLAY_SOURCE:=madplay-$(MADPLAY_VERSION).tar.gz
 MADPLAY_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/mad
-MADPLAY_CAT:=$(ZCAT)
-MADPLAY_DIR:=$(BUILD_DIR)/madplay-$(MADPLAY_VERSION)
-MADPLAY_BIN:=madplay
-MADPLAY_TARGET_BIN:=usr/bin/$(MADPLAY_BIN)
+MADPLAY_LIBTOOL_PATCH=NO
+MADPLAY_DEPENDENCIES=libmad libid3tag
 
 # Check if ALSA is built, then we should configure after alsa-lib so
 # ./configure can find alsa-lib.
 ifeq ($(BR2_PACKAGE_MADPLAY_ALSA),y)
-MADPLAY_USE_ALSA:=--with-alsa
-MADPLAY_ALSA_DEP:=alsa-lib
+MADPLAY_CONF_OPT+=--with-alsa
+MADPLAY_DEPENDENCIES+=alsa-lib
 endif
 
-$(DL_DIR)/$(MADPLAY_SOURCE):
-	 $(call DOWNLOAD,$(MADPLAY_SITE),$(MADPLAY_SOURCE))
-
-$(MADPLAY_DIR)/.unpacked: $(DL_DIR)/$(MADPLAY_SOURCE)
-	$(MADPLAY_CAT) $(DL_DIR)/$(MADPLAY_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(MADPLAY_DIR) package/multimedia/madplay madplay\*.patch\*
-	$(CONFIG_UPDATE) $(MADPLAY_DIR)
-	touch $@
-
-$(MADPLAY_DIR)/.configured: $(MADPLAY_DIR)/.unpacked
-	(cd $(MADPLAY_DIR); rm -rf config.cache; \
-		$(TARGET_CONFIGURE_ARGS) \
-		$(TARGET_CONFIGURE_OPTS) \
-		CFLAGS="$(TARGET_CFLAGS) $(BR2_MADPLAY_CFLAGS)" \
-		LDFLAGS="$(TARGET_LDFLAGS)" \
-		./configure $(QUIET) \
-		--target=$(REAL_GNU_TARGET_NAME) \
-		--host=$(REAL_GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
-		--sysconfdir=/etc \
-		$(MADPLAY_USE_ALSA) \
-		$(DISABLE_NLS) \
-		$(DISABLE_LARGEFILE) \
-	)
-	touch $@
-
-$(MADPLAY_DIR)/$(MADPLAY_BIN): $(MADPLAY_DIR)/.configured
-	$(MAKE) -C $(MADPLAY_DIR)
-
-$(TARGET_DIR)/$(MADPLAY_TARGET_BIN): $(MADPLAY_DIR)/$(MADPLAY_BIN)
-	$(INSTALL) -D $(MADPLAY_DIR)/$(MADPLAY_BIN) $(TARGET_DIR)/$(MADPLAY_TARGET_BIN)
-	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/$(MADPLAY_TARGET_BIN)
-
-madplay: $(MADPLAY_ALSA_DEP) libmad libid3tag $(TARGET_DIR)/$(MADPLAY_TARGET_BIN)
-
-madplay-clean:
-	rm -f $(TARGET_DIR)/$(MADPLAY_TARGET_BIN)
-	-$(MAKE) -C $(MADPLAY_DIR) clean
-
-madplay-dirclean:
-	rm -rf $(MADPLAY_DIR)
-
-madplay-source: $(DL_DIR)/$(MADPLAY_SOURCE)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_MADPLAY),y)
-TARGETS+=madplay
-endif
+$(eval $(call AUTOTARGETS,package/multimedia,madplay))
-- 
1.6.3.3
