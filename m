From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Dec 2009 16:29:02 +0100
Subject: [Buildroot] [git commit master] freetype: convert to autotools
	infrastructure for host package
Message-ID: <20091216153053.5C63277738@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=fc1163d22d905db1a6813d3493a19885f5e97ace
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/freetype/freetype.mk |   46 ++---------------------------------------
 1 files changed, 3 insertions(+), 43 deletions(-)

diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
index 06bf6f4..ed73253 100644
--- a/package/freetype/freetype.mk
+++ b/package/freetype/freetype.mk
@@ -13,7 +13,10 @@ FREETYPE_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 FREETYPE_MAKE_OPT = CCexe="$(HOSTCC)"
 FREETYPE_DEPENDENCIES = host-pkg-config $(if $(BR2_PACKAGE_ZLIB),zlib)
 
+HOST_FREETYPE_DEPENDENCIES = host-pkg-config
+
 $(eval $(call AUTOTARGETS,package,freetype))
+$(eval $(call AUTOTARGETS,package,freetype,host))
 
 $(FREETYPE_HOOK_POST_INSTALL):
 	$(SED) "s,^prefix=.*,prefix=\'$(STAGING_DIR)/usr\',g" \
@@ -26,46 +29,3 @@ ifneq ($(BR2_HAVE_DEVFILES),y)
 	rm -f $(TARGET_DIR)/usr/bin/freetype-config
 endif
 	touch $@
-
-# freetype for the host
-FREETYPE_HOST_DIR:=$(BUILD_DIR)/freetype-$(FREETYPE_VERSION)-host
-
-$(DL_DIR)/$(FREETYPE_SOURCE):
-	$(call DOWNLOAD,$(FREETYPE_SITE),$(FREETYPE_SOURCE))
-
-$(STAMP_DIR)/host_freetype_unpacked: $(DL_DIR)/$(FREETYPE_SOURCE)
-	mkdir -p $(FREETYPE_HOST_DIR)
-	$(INFLATE$(suffix $(FREETYPE_SOURCE))) $< | \
-		$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(FREETYPE_HOST_DIR) $(TAR_OPTIONS) -
-	touch $@
-
-$(STAMP_DIR)/host_freetype_configured: $(STAMP_DIR)/host_freetype_unpacked $(STAMP_DIR)/host_pkgconfig_installed
-	(cd $(FREETYPE_HOST_DIR); rm -rf config.cache; \
-		$(HOST_CONFIGURE_OPTS) \
-		CFLAGS="$(HOST_CFLAGS)" \
-		LDFLAGS="$(HOST_LDFLAGS)" \
-		./configure $(QUIET) \
-		--prefix="$(HOST_DIR)/usr" \
-		--sysconfdir="$(HOST_DIR)/etc" \
-	)
-	touch $@
-
-$(STAMP_DIR)/host_freetype_compiled: $(STAMP_DIR)/host_freetype_configured
-	$(MAKE) -C $(FREETYPE_HOST_DIR)
-	touch $@
-
-$(STAMP_DIR)/host_freetype_installed: $(STAMP_DIR)/host_freetype_compiled
-	$(HOST_MAKE_ENV) $(MAKE) -C $(FREETYPE_HOST_DIR) install
-	touch $@
-
-host-freetype: $(STAMP_DIR)/host_freetype_installed
-
-host-freetype-source: freetype-source
-
-host-freetype-clean:
-	rm -f $(addprefix $(STAMP_DIR)/host_freetype_,unpacked configured compiled installed)
-	-$(MAKE) -C $(FREETYPE_HOST_DIR) uninstall
-	-$(MAKE) -C $(FREETYPE_HOST_DIR) clean
-
-host-freetype-dirclean:
-	rm -rf $(FREETYPE_HOST_DIR)
-- 
1.6.3.3
