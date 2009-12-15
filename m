From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Dec 2009 20:30:38 +0100
Subject: [Buildroot] [PATCH 07/39] pkg-config: convert to autotools
	infrastructure for host package
In-Reply-To: <cover.1260905467.git.thomas.petazzoni@free-electrons.com>
References: <cover.1260905467.git.thomas.petazzoni@free-electrons.com>
Message-ID: <d5d5d2942f388a22fd808406645c7033a7d27048.1260905467.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-config/pkg-config.mk |   51 ++++++-------------------------------
 1 files changed, 9 insertions(+), 42 deletions(-)

diff --git a/package/pkg-config/pkg-config.mk b/package/pkg-config/pkg-config.mk
index e328544..7caf37b 100644
--- a/package/pkg-config/pkg-config.mk
+++ b/package/pkg-config/pkg-config.mk
@@ -15,51 +15,18 @@ PKG_CONFIG_DEPENDENCIES = libglib2
 
 PKG_CONFIG_CONF_OPT = --with-installed-glib
 
-$(eval $(call AUTOTARGETS,package,pkg-config))
-
-# pkg-config for the host
-PKG_CONFIG_HOST_DIR:=$(BUILD_DIR)/pkg-config-$(PKG_CONFIG_VERSION)-host
-PKG_CONFIG_HOST_BINARY:=$(HOST_DIR)/usr/bin/pkg-config
-
-$(DL_DIR)/$(PKG_CONFIG_SOURCE):
-	$(call DOWNLOAD,$(PKG_CONFIG_SITE),$(PKG_CONFIG_SOURCE))
-
-$(STAMP_DIR)/host_pkgconfig_unpacked: $(DL_DIR)/$(PKG_CONFIG_SOURCE)
-	mkdir -p $(PKG_CONFIG_HOST_DIR)
-	$(INFLATE$(suffix $(PKG_CONFIG_SOURCE))) $< | \
-		$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(PKG_CONFIG_HOST_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(PKG_CONFIG_HOST_DIR) package/pkg-config/ \*.patch
-	touch $@
-
-$(STAMP_DIR)/host_pkgconfig_configured: $(STAMP_DIR)/host_pkgconfig_unpacked
-	(cd $(PKG_CONFIG_HOST_DIR); rm -rf config.cache; \
-		$(HOST_CONFIGURE_OPTS) \
-		CFLAGS="$(HOST_CFLAGS)" \
-		LDFLAGS="$(HOST_LDFLAGS)" \
-		./configure $(QUIET) \
-		--prefix="$(HOST_DIR)/usr" \
-		--sysconfdir="$(HOST_DIR)/etc" \
+HOST_PKG_CONFIG_CONF_OPT = \
 		--with-pc-path="$(STAGING_DIR)/usr/lib/pkgconfig" \
-		--disable-static \
-	)
-	touch $@
-
-$(STAMP_DIR)/host_pkgconfig_compiled: $(STAMP_DIR)/host_pkgconfig_configured
-	$(MAKE) -C $(PKG_CONFIG_HOST_DIR)
-	touch $@
+		--disable-static
 
-$(STAMP_DIR)/host_pkgconfig_installed: $(STAMP_DIR)/host_pkgconfig_compiled
-	$(MAKE) -C $(PKG_CONFIG_HOST_DIR) install
-	install -D -m 0644 $(HOST_DIR)/usr/share/aclocal/pkg.m4 \
+define HOST_PKG_CONFIG_INSTALL_M4
+install -D -m 0644 $(HOST_DIR)/usr/share/aclocal/pkg.m4 \
 		$(STAGING_DIR)/usr/share/aclocal/pkg.m4
-	touch $@
+endef
 
-host-pkgconfig: $(STAMP_DIR)/host_pkgconfig_installed
+HOST_PKG_CONFIG_POST_INSTALL_HOOKS += HOST_PKG_CONFIG_INSTALL_M4
 
-host-pkgconfig-clean:
-	rm -f $(addprefix $(STAMP_DIR)/host_pkgconfig_,unpacked configured compiled installed)
-	-$(MAKE) -C $(PKG_CONFIG_HOST_DIR) uninstall
-	-$(MAKE) -C $(PKG_CONFIG_HOST_DIR) clean
+$(eval $(call AUTOTARGETS,package,pkg-config))
+$(eval $(call AUTOTARGETS,package,pkg-config,host))
 
-host-pkgconfig-dirclean:
-	rm -rf $(PKG_CONFIG_HOST_DIR)
+PKG_CONFIG_HOST_BINARY:=$(HOST_DIR)/usr/bin/pkg-config
-- 
1.6.3.3
