From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 8 Oct 2012 23:16:00 +0200
Subject: [Buildroot] [git commit] netkitbase: convert to the generic-package
	infrastructure
Message-ID: <20121009073904.564429980B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9288d4ba71c5bb2033188c694fba55ada212866d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/netkitbase/netkitbase.mk |   79 ++++++++++----------------------------
 1 files changed, 21 insertions(+), 58 deletions(-)

diff --git a/package/netkitbase/netkitbase.mk b/package/netkitbase/netkitbase.mk
index 56480fc..3899b78 100644
--- a/package/netkitbase/netkitbase.mk
+++ b/package/netkitbase/netkitbase.mk
@@ -3,69 +3,32 @@
 # netkitbase
 #
 #############################################################
-NETKITBASE_VERSION:=0.17
-NETKITBASE_SOURCE:=netkit-base-$(NETKITBASE_VERSION).tar.gz
-NETKITBASE_SITE:=ftp://ftp.uk.linux.org/pub/linux/Networking/netkit/
-NETKITBASE_DIR:=$(BUILD_DIR)/netkit-base-$(NETKITBASE_VERSION)
-NETKITBASE_CAT:=$(ZCAT)
-NETKITBASE_BINARY:=inetd/inetd
-NETKITBASE_TARGET_BINARY:=usr/sbin/inetd
+NETKITBASE_VERSION = 0.17
+NETKITBASE_SOURCE  = netkit-base-$(NETKITBASE_VERSION).tar.gz
+NETKITBASE_SITE    = ftp://ftp.uk.linux.org/pub/linux/Networking/netkit/
+NETKITBASE_LICENSE = BSD-4c
 
-$(DL_DIR)/$(NETKITBASE_SOURCE):
-	 $(call DOWNLOAD,$(NETKITBASE_SITE)/$(NETKITBASE_SOURCE))
-
-netkitbase-source: $(DL_DIR)/$(NETKITBASE_SOURCE)
-
-$(NETKITBASE_DIR)/.unpacked: $(DL_DIR)/$(NETKITBASE_SOURCE)
-	$(NETKITBASE_CAT) $(DL_DIR)/$(NETKITBASE_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+define NETKITBASE_CONFIGURE_CMDS
 	# use ANSI syntax
 	$(SED) "s/main()/main(void)/;" $(NETKITBASE_DIR)/configure
 	# don't try to run cross compiled binaries while configuring things
 	$(SED) "s~./__conftest~#./__conftest~;" $(NETKITBASE_DIR)/configure
-	support/scripts/apply-patches.sh $(NETKITBASE_DIR) package/netkitbase/ netkitbase\*.patch
-	touch $(NETKITBASE_DIR)/.unpacked
-
-$(NETKITBASE_DIR)/.configured: $(NETKITBASE_DIR)/.unpacked
-	(cd $(NETKITBASE_DIR); rm -f config.cache; \
-	 PATH=$(TARGET_PATH) CC="$(TARGET_CC)" \
-	./configure --installroot=$(TARGET_DIR) --with-c-compiler="$(TARGET_CC)" \
-	)
-	touch $(NETKITBASE_DIR)/.configured
-
-$(NETKITBASE_DIR)/$(NETKITBASE_BINARY): $(NETKITBASE_DIR)/.configured
-	$(MAKE) CC="$(TARGET_CC)" -C $(NETKITBASE_DIR)
-	$(STRIPCMD) $(NETKITBASE_DIR)/$(NETKITBASE_BINARY)
-
-$(TARGET_DIR)/$(NETKITBASE_TARGET_BINARY): $(NETKITBASE_DIR)/$(NETKITBASE_BINARY)
-	# Only install a few selected items...
-	mkdir -p $(TARGET_DIR)/usr/sbin
-	cp $(NETKITBASE_DIR)/$(NETKITBASE_BINARY) $(TARGET_DIR)/$(NETKITBASE_TARGET_BINARY)
-	@if [ ! -f $(TARGET_DIR)/etc/inetd.conf ]; then \
-		mkdir -p $(TARGET_DIR)/etc; \
-		cp $(NETKITBASE_DIR)/etc.sample/inetd.conf $(TARGET_DIR)/etc/; \
+	(cd $(@D); \
+		$(TARGET_CONFIGURE_OPTS) \
+		./configure \
+		--installroot=$(TARGET_DIR))
+endef
+
+define NETKITBASE_BUILD_CMDS
+	$(MAKE) -C $(@D)
+endef
+
+define NETKITBASE_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/inetd/inetd $(TARGET_DIR)/usr/sbin/inetd
+	if [ ! -f $(TARGET_DIR)/etc/inetd.conf ]; then \
+		$(INSTALL) -D -m 0644 $(@D)/etc.sample/inetd.conf $(TARGET_DIR)/etc/inetd.conf; \
 		$(SED) "s/^\([a-z]\)/#\1/;" $(TARGET_DIR)/etc/inetd.conf; \
 	fi
-	touch -c $(TARGET_DIR)/$(NETKITBASE_TARGET_BINARY)
-
-netkitbase-legal-info:
-	@$(call legal-warning-pkg,netkitbase,legal-info not yet implemented)
-
-netkitbase: $(TARGET_DIR)/$(NETKITBASE_TARGET_BINARY)
+endef
 
-netkitbase-clean:
-	#$(MAKE) DESTDIR=$(TARGET_DIR) CC="$(TARGET_CC)" -C $(NETKITBASE_DIR) uninstall
-	-rm -f $(TARGET_DIR)/usr/sbin/inetd $(TARGET_DIR)/etc/inetd.conf
-	-rm -f $(TARGET_DIR)/etc/inetd.conf
-	-$(MAKE) -C $(NETKITBASE_DIR) clean
-
-netkitbase-dirclean:
-	rm -rf $(NETKITBASE_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_NETKITBASE),y)
-TARGETS+=netkitbase
-endif
+$(eval $(generic-package))
