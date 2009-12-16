From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Dec 2009 16:29:02 +0100
Subject: [Buildroot] [git commit master] atk: convert to autotools
	infrastructure for host package
Message-ID: <20091216153051.3ABF277738@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=e6882586be87d15111e5fa4cfc75a2fb4667f1fc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/atk/atk.mk |   48 +++++-------------------------------------------
 1 files changed, 5 insertions(+), 43 deletions(-)

diff --git a/package/atk/atk.mk b/package/atk/atk.mk
index 1e8e576..e357f49 100644
--- a/package/atk/atk.mk
+++ b/package/atk/atk.mk
@@ -53,50 +53,12 @@ endif
 
 ATK_DEPENDENCIES = libglib2 host-pkg-config
 
-$(eval $(call AUTOTARGETS,package,atk))
-
-# atk for the host
-ATK_HOST_DIR:=$(BUILD_DIR)/atk-$(ATK_VERSION)-host
-
-$(DL_DIR)/$(ATK_SOURCE):
-	$(call DOWNLOAD,$(ATK_SITE),$(ATK_SOURCE))
+HOST_ATK_DEPENDENCIES = host-libglib2 host-pkg-config
 
-$(STAMP_DIR)/host_atk_unpacked: $(DL_DIR)/$(ATK_SOURCE)
-	mkdir -p $(ATK_HOST_DIR)
-	$(INFLATE$(suffix $(ATK_SOURCE))) $< | \
-		$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(ATK_HOST_DIR) $(TAR_OPTIONS) -
-	touch $@
-
-$(STAMP_DIR)/host_atk_configured: $(STAMP_DIR)/host_atk_unpacked $(STAMP_DIR)/host_libglib2_installed $(STAMP_DIR)/host_pkgconfig_installed
-	(cd $(ATK_HOST_DIR); rm -rf config.cache; \
-		$(HOST_CONFIGURE_OPTS) \
-		CFLAGS="$(HOST_CFLAGS)" \
-		LDFLAGS="$(HOST_LDFLAGS)" \
-		./configure $(QUIET) \
-		--prefix="$(HOST_DIR)/usr" \
-		--sysconfdir="$(HOST_DIR)/etc" \
+HOST_ATK_CONF_OPT = \
 		--enable-shared \
 		--disable-static \
-		--disable-glibtest \
-	)
-	touch $@
-
-$(STAMP_DIR)/host_atk_compiled: $(STAMP_DIR)/host_atk_configured
-	$(HOST_MAKE_ENV) $(MAKE) -C $(ATK_HOST_DIR)
-	touch $@
+		--disable-glibtest
 
-$(STAMP_DIR)/host_atk_installed: $(STAMP_DIR)/host_atk_compiled
-	$(HOST_MAKE_ENV) $(MAKE) -C $(ATK_HOST_DIR) install
-	touch $@
-
-host-atk: $(STAMP_DIR)/host_atk_installed
-
-host-atk-source: atk-source
-
-host-atk-clean:
-	rm -f $(addprefix $(STAMP_DIR)/host_atk_,unpacked configured compiled installed)
-	-$(MAKE) -C $(ATK_HOST_DIR) uninstall
-	-$(MAKE) -C $(ATK_HOST_DIR) clean
-
-host-atk-dirclean:
-	rm -rf $(ATK_HOST_DIR)
+$(eval $(call AUTOTARGETS,package,atk))
+$(eval $(call AUTOTARGETS,package,atk,host))
-- 
1.6.3.3
