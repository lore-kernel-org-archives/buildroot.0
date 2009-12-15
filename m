From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Dec 2009 20:31:03 +0100
Subject: [Buildroot] [PATCH 32/39] m4: convert to autotools infrastructure
	for host package
In-Reply-To: <cover.1260905467.git.thomas.petazzoni@free-electrons.com>
References: <cover.1260905467.git.thomas.petazzoni@free-electrons.com>
Message-ID: <adc8542d95c5cd6bbc02fcf1da0bb82e940e796c.1260905467.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/m4/m4.mk |   46 +++-------------------------------------------
 1 files changed, 3 insertions(+), 43 deletions(-)

diff --git a/package/m4/m4.mk b/package/m4/m4.mk
index b772185..a0b56c4 100644
--- a/package/m4/m4.mk
+++ b/package/m4/m4.mk
@@ -17,47 +17,7 @@ ifneq ($(BR2_USE_WCHAR),y)
 M4_CONF_ENV += gt_cv_c_wchar_t=no gl_cv_absolute_wchar_h=__fpending.h
 endif
 
-$(eval $(call AUTOTARGETS,package,m4))
-
-# m4 for the host
-M4_HOST_DIR:=$(BUILD_DIR)/m4-$(M4_VERSION)-host
-
-$(DL_DIR)/$(M4_SOURCE):
-	$(call DOWNLOAD,$(M4_SITE),$(M4_SOURCE))
-
-$(STAMP_DIR)/host_m4_unpacked: $(DL_DIR)/$(M4_SOURCE)
-	mkdir -p $(M4_HOST_DIR)
-	$(INFLATE$(suffix $(M4_SOURCE))) $< | \
-		$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(M4_HOST_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(M4_HOST_DIR) package/m4/ \*.patch
-	touch $@
-
-$(STAMP_DIR)/host_m4_configured: $(STAMP_DIR)/host_m4_unpacked
-	(cd $(M4_HOST_DIR); rm -rf config.cache; \
-		$(HOST_CONFIGURE_OPTS) \
-		CFLAGS="$(HOST_CFLAGS)" \
-		LDFLAGS="$(HOST_LDFLAGS)" \
-		./configure $(QUIET) \
-		--prefix="$(HOST_DIR)/usr" \
-		--sysconfdir="$(HOST_DIR)/etc" \
-		--disable-static \
-	)
-	touch $@
+HOST_M4_CONF_OPT = --disable-static
 
-$(STAMP_DIR)/host_m4_compiled: $(STAMP_DIR)/host_m4_configured
-	$(MAKE) -C $(M4_HOST_DIR)
-	touch $@
-
-$(STAMP_DIR)/host_m4_installed: $(STAMP_DIR)/host_m4_compiled
-	$(MAKE) -C $(M4_HOST_DIR) install
-	touch $@
-
-host-m4: $(STAMP_DIR)/host_m4_installed
-
-host-m4-clean:
-	rm -f $(addprefix $(STAMP_DIR)/host_m4_,unpacked configured compiled installed)
-	-$(MAKE) -C $(M4_HOST_DIR) uninstall
-	-$(MAKE) -C $(M4_HOST_DIR) clean
-
-host-m4-dirclean:
-	rm -rf $(M4_HOST_DIR)
+$(eval $(call AUTOTARGETS,package,m4))
+$(eval $(call AUTOTARGETS,package,m4,host))
-- 
1.6.3.3
