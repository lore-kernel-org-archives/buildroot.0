From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 3 Apr 2012 22:49:06 +0200
Subject: [Buildroot] [git commit] tinyhttpd: convert to gentargets
Message-ID: <20120403205317.D3E40969F0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=21fb8e68ee656733a02ff3f574b991d5032cdfc3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: misc fixes, make invocation, use install -D]
Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/tinyhttpd/tinyhttpd.mk |   66 +++++++++++-----------------------------
 1 files changed, 18 insertions(+), 48 deletions(-)

diff --git a/package/tinyhttpd/tinyhttpd.mk b/package/tinyhttpd/tinyhttpd.mk
index 0f95d06..6bc37d4 100644
--- a/package/tinyhttpd/tinyhttpd.mk
+++ b/package/tinyhttpd/tinyhttpd.mk
@@ -3,54 +3,24 @@
 # tinyhttpd
 #
 #############################################################
-TINYHTTPD_VER:=0.1.0
-TINYHTTPD_SOURCE:=tinyhttpd-$(TINYHTTPD_VER).tar.gz
-TINYHTTPD_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/tinyhttpd/$(TINYHTTPD_SOURCE)
-TINYHTTPD_DIR:=$(BUILD_DIR)/tinyhttpd-$(TINYHTTPD_VER)
-TINYHTTPD_CAT:=$(ZCAT)
-TINYHTTPD_BINARY:=httpd
-TINYHTTPD_TARGET_BINARY:=usr/sbin/tinyhttpd
-
-$(DL_DIR)/$(TINYHTTPD_SOURCE):
-	 $(call DOWNLOAD,$(TINYHTTPD_SITE)/$(TINYHTTPD_SOURCE))
-
-tinyhttpd-source: $(DL_DIR)/$(TINYHTTPD_SOURCE)
-
-#############################################################
-#
-# build tinyhttpd for use on the target system
-#
-#############################################################
-$(TINYHTTPD_DIR)/.unpacked: $(DL_DIR)/$(TINYHTTPD_SOURCE)
-	$(TINYHTTPD_CAT) $(DL_DIR)/$(TINYHTTPD_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	support/scripts/apply-patches.sh $(TINYHTTPD_DIR) package/tinyhttpd/ tinyhttpd\*.patch
-	touch $(TINYHTTPD_DIR)/.unpacked
-
-$(TINYHTTPD_DIR)/$(TINYHTTPD_BINARY): $(TINYHTTPD_DIR)/.unpacked
-	$(TARGET_CONFIGURE_OPTS) CFLAGS="$(TARGET_CFLAGS)" LDFLAGS="$(TARGET_LDFLAGS)" $(MAKE) -C $(TINYHTTPD_DIR)
-
-$(TARGET_DIR)/$(TINYHTTPD_TARGET_BINARY): $(TINYHTTPD_DIR)/$(TINYHTTPD_BINARY)
-	$(INSTALL) -m 0755 $(TINYHTTPD_DIR)/$(TINYHTTPD_BINARY) $(TARGET_DIR)/$(TINYHTTPD_TARGET_BINARY)
-	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/$(TINYHTTPD_TARGET_BINARY)
-	$(INSTALL) -m 0755 package/tinyhttpd/S85tinyhttpd $(TARGET_DIR)/etc/init.d
+TINYHTTPD_VERSION = 0.1.0
+TINYHTTPD_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/tinyhttpd/
+
+define TINYHTTPD_BUILD_CMDS
+	$(MAKE) -C $(@D) CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" \
+		LDFLAGS="$(TARGET_LDFLAGS)"
+endef
+
+define TINYHTTPD_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 -D $(@D)/httpd $(TARGET_DIR)/usr/sbin/httpd
+	$(INSTALL) -m 0755 -D package/tinyhttpd/S85tinyhttpd \
+		$(TARGET_DIR)/etc/init.d/S85tinyhttpd
 	mkdir -p $(TARGET_DIR)/var/www
+endef
 
-tinyhttpd: $(TARGET_DIR)/$(TINYHTTPD_TARGET_BINARY)
-
-tinyhttpd-clean:
-	-$(MAKE) -C $(TINYHTTPD_DIR) clean
-	@rm -f $(TARGET_DIR)/$(TINYHTTPD_TARGET_BINARY)
-	@rm -f $(TARGET_DIR)/etc/init.d/S85tinyhttpd
-	@rmdir --ignore-fail-on-non-empty $(TARGET_DIR)/var/www
+define TINYHTTPD_CLEAN_CMDS
+	rm -f $(TARGET_DIR)/usr/sbin/httpd
+	rm -f $(TARGET_DIR)/etc/init.d/S85tinyhttpd
+endef
 
-tinyhttpd-dirclean:
-	rm -rf $(TINYHTTPD_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_TINYHTTPD),y)
-TARGETS+=tinyhttpd
-endif
+$(eval $(call GENTARGETS))
