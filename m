From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Dec 2009 16:29:02 +0100
Subject: [Buildroot] [git commit master] fontconfig: convert to autotools
	infrastructure for host package
Message-ID: <20091216153052.D6D0477738@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=1ef81c0c9c57bb4bfad4d320debd16a84feb8dba
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/fontconfig/fontconfig.mk |   49 ++++----------------------------------
 1 files changed, 5 insertions(+), 44 deletions(-)

diff --git a/package/fontconfig/fontconfig.mk b/package/fontconfig/fontconfig.mk
index df618d0..6cbe2ea 100644
--- a/package/fontconfig/fontconfig.mk
+++ b/package/fontconfig/fontconfig.mk
@@ -23,49 +23,10 @@ FONTCONFIG_CONF_OPT = --with-arch=$(GNU_TARGET_NAME) \
 
 FONTCONFIG_DEPENDENCIES = freetype expat
 
-$(eval $(call AUTOTARGETS,package,fontconfig))
-
-# fontconfig for the host
-FONTCONFIG_HOST_DIR:=$(BUILD_DIR)/fontconfig-$(FONTCONFIG_VERSION)-host
-
-$(DL_DIR)/$(FONTCONFIG_SOURCE):
-	$(call DOWNLOAD,$(FONTCONFIG_SITE),$(FONTCONFIG_SOURCE))
-
-$(STAMP_DIR)/host_fontconfig_unpacked: $(DL_DIR)/$(FONTCONFIG_SOURCE)
-	mkdir -p $(FONTCONFIG_HOST_DIR)
-	$(INFLATE$(suffix $(FONTCONFIG_SOURCE))) $< | \
-		$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(FONTCONFIG_HOST_DIR) $(TAR_OPTIONS) -
-	touch $@
-
-$(STAMP_DIR)/host_fontconfig_configured: $(STAMP_DIR)/host_fontconfig_unpacked $(STAMP_DIR)/host_freetype_installed $(STAMP_DIR)/host_expat_installed
-	(cd $(FONTCONFIG_HOST_DIR); rm -rf config.cache; \
-		$(HOST_CONFIGURE_OPTS) \
-		CFLAGS="$(HOST_CFLAGS)" \
-		LDFLAGS="$(HOST_LDFLAGS)" \
-		./configure $(QUIET) \
-		--prefix="$(HOST_DIR)/usr" \
-		--sysconfdir="$(HOST_DIR)/etc" \
+HOST_FONTCONFIG_DEPENDENCIES = host-freetype host-expat
+HOST_FONTCONFIG_CONF_OPT = \
 		--disable-docs \
-		--disable-static \
-	)
-	touch $@
-
-$(STAMP_DIR)/host_fontconfig_compiled: $(STAMP_DIR)/host_fontconfig_configured
-	$(HOST_MAKE_ENV) $(MAKE) -C $(FONTCONFIG_HOST_DIR)
-	touch $@
+		--disable-static
 
-$(STAMP_DIR)/host_fontconfig_installed: $(STAMP_DIR)/host_fontconfig_compiled
-	$(HOST_MAKE_ENV) $(MAKE) -C $(FONTCONFIG_HOST_DIR) install
-	touch $@
-
-host-fontconfig: $(STAMP_DIR)/host_fontconfig_installed
-
-host-fontconfig-source: fontconfig-source
-
-host-fontconfig-clean:
-	rm -f $(addprefix $(STAMP_DIR)/host_fontconfig_,unpacked configured compiled installed)
-	-$(MAKE) -C $(FONTCONFIG_HOST_DIR) uninstall
-	-$(MAKE) -C $(FONTCONFIG_HOST_DIR) clean
-
-host-fontconfig-dirclean:
-	rm -rf $(FONTCONFIG_HOST_DIR)
+$(eval $(call AUTOTARGETS,package,fontconfig))
+$(eval $(call AUTOTARGETS,package,fontconfig,host))
-- 
1.6.3.3
