From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Dec 2009 20:30:45 +0100
Subject: [Buildroot] [PATCH 14/39] cairo: convert to autotools
	infrastructure for host package
In-Reply-To: <cover.1260905467.git.thomas.petazzoni@free-electrons.com>
References: <cover.1260905467.git.thomas.petazzoni@free-electrons.com>
Message-ID: <5d772cd06980e7e752123ba358e0d574b0fba308.1260905467.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cairo/cairo.mk |   48 +++++-------------------------------------------
 1 files changed, 5 insertions(+), 43 deletions(-)

diff --git a/package/cairo/cairo.mk b/package/cairo/cairo.mk
index 2608e14..0ca99aa 100644
--- a/package/cairo/cairo.mk
+++ b/package/cairo/cairo.mk
@@ -79,53 +79,15 @@ else
 	CAIRO_CONF_OPT += --disable-svg
 endif
 
-$(eval $(call AUTOTARGETS,package,cairo))
-
-# cairo for the host
-CAIRO_HOST_DIR:=$(BUILD_DIR)/cairo-$(CAIRO_VERSION)-host
-
-$(DL_DIR)/$(CAIRO_SOURCE):
-	$(call DOWNLOAD,$(CAIRO_SITE),$(CAIRO_SOURCE))
+HOST_CAIRO_DEPENDENCIES = host-pkg-config host-pixman host-fontconfig
 
-$(STAMP_DIR)/host_cairo_unpacked: $(DL_DIR)/$(CAIRO_SOURCE)
-	mkdir -p $(CAIRO_HOST_DIR)
-	$(INFLATE$(suffix $(CAIRO_SOURCE))) $< | \
-		$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(CAIRO_HOST_DIR) $(TAR_OPTIONS) -
-	touch $@
-
-$(STAMP_DIR)/host_cairo_configured: $(STAMP_DIR)/host_cairo_unpacked $(STAMP_DIR)/host_pkgconfig_installed $(STAMP_DIR)/host_fontconfig_installed $(STAMP_DIR)/host_pixman_installed
-	(cd $(CAIRO_HOST_DIR); rm -rf config.cache; \
-		$(HOST_CONFIGURE_OPTS) \
-		CFLAGS="$(HOST_CFLAGS)" \
-		LDFLAGS="$(HOST_LDFLAGS)" \
-		./configure $(QUIET) \
-		--prefix="$(HOST_DIR)/usr" \
-		--sysconfdir="$(HOST_DIR)/etc" \
+HOST_CAIRO_CONF_OPT = \
 		--enable-ps \
 		--enable-pdf \
 		--enable-xlib \
 		--with-x \
 		--disable-png \
-		--disable-svg \
-	)
-	touch $@
-
-$(STAMP_DIR)/host_cairo_compiled: $(STAMP_DIR)/host_cairo_configured
-	$(HOST_MAKE_ENV) $(MAKE) -C $(CAIRO_HOST_DIR)
-	touch $@
+		--disable-svg
 
-$(STAMP_DIR)/host_cairo_installed: $(STAMP_DIR)/host_cairo_compiled
-	$(HOST_MAKE_ENV) $(MAKE) -C $(CAIRO_HOST_DIR) install
-	touch $@
-
-host-cairo: $(STAMP_DIR)/host_cairo_installed
-
-host-cairo-source: cairo-source
-
-host-cairo-clean:
-	rm -f $(addprefix $(STAMP_DIR)/host_cairo_,unpacked configured compiled installed)
-	-$(MAKE) -C $(CAIRO_HOST_DIR) uninstall
-	-$(MAKE) -C $(CAIRO_HOST_DIR) clean
-
-host-cairo-dirclean:
-	rm -rf $(CAIRO_HOST_DIR)
+$(eval $(call AUTOTARGETS,package,cairo))
+$(eval $(call AUTOTARGETS,package,cairo,host))
-- 
1.6.3.3
