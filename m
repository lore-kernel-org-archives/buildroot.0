From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Dec 2009 20:30:51 +0100
Subject: [Buildroot] [PATCH 20/39] directfb: convert to autotools
	infrastructure for host package
In-Reply-To: <cover.1260905467.git.thomas.petazzoni@free-electrons.com>
References: <cover.1260905467.git.thomas.petazzoni@free-electrons.com>
Message-ID: <d6e53ad0a955900eae9b9447bedd216380cbe3f8.1260905467.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/directfb/directfb.mk |   55 ++++++++---------------------------------
 1 files changed, 11 insertions(+), 44 deletions(-)

diff --git a/package/directfb/directfb.mk b/package/directfb/directfb.mk
index eb492cd..57b2e17 100644
--- a/package/directfb/directfb.mk
+++ b/package/directfb/directfb.mk
@@ -150,56 +150,23 @@ DIRECTFB_CONF_OPT = \
 
 DIRECTFB_DEPENDENCIES = $(DIRECTFB_DEP) freetype $(DIRECTFB_FUSION)
 
-$(eval $(call AUTOTARGETS,package,directfb))
-
-
-# directfb-csource for the host
-
-DIRECTFB_HOST_DIR:=$(BUILD_DIR)/directfb-$(DIRECTFB_VERSION)-host
-DIRECTFB_HOST_BINARY:=$(HOST_DIR)/usr/bin/directfb-csource
-
-$(DL_DIR)/$(DIRECTFB_SOURCE):
-	$(call DOWNLOAD,$(DIRECTFB_SITE),$(DIRECTFB_SOURCE))
-
-$(STAMP_DIR)/host_directfb_unpacked: $(DL_DIR)/$(DIRECTFB_SOURCE)
-	mkdir -p $(DIRECTFB_HOST_DIR)
-	$(INFLATE$(suffix $(DIRECTFB_SOURCE))) $< | \
-		$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(DIRECTFB_HOST_DIR) $(TAR_OPTIONS) -
-	touch $@
-
-$(STAMP_DIR)/host_directfb_configured: $(STAMP_DIR)/host_directfb_unpacked $(STAMP_DIR)/host_pkgconfig_installed
-	(cd $(DIRECTFB_HOST_DIR); rm -rf config.cache; \
-		$(HOST_CONFIGURE_OPTS) \
-		CFLAGS="$(HOST_CFLAGS)" \
-		LDFLAGS="$(HOST_LDFLAGS)" \
-		./configure \
-		--prefix="$(HOST_DIR)/usr" \
-		--sysconfdir="$(HOST_DIR)/etc" \
+HOST_DIRECTFB_DEPENDENCIES = host-pkg-config
+HOST_DIRECTFB_CONF_OPT = \
 		--enable-shared \
 		--disable-static \
 		--disable-debug \
 		--disable-multi \
 		--with-gfxdrivers=none \
-		--with-inputdrivers=none \
-	)
-	touch $@
-
-$(STAMP_DIR)/host_directfb_compiled: $(STAMP_DIR)/host_directfb_configured
-	$(MAKE) -C $(DIRECTFB_HOST_DIR)/tools directfb-csource
-	touch $@
-
-$(STAMP_DIR)/host_directfb_installed: $(STAMP_DIR)/host_directfb_compiled
-	$(INSTALL) -m 0755 $(DIRECTFB_HOST_DIR)/tools/directfb-csource $(HOST_DIR)/usr/bin
-	touch $@
+		--with-inputdrivers=none
 
-host-directfb: $(STAMP_DIR)/host_directfb_installed
+HOST_DIRECTFB_BUILD_CMDS = \
+	$(MAKE) -C $(@D)/tools directfb-csource
 
-host-directfb-source: directfb-source
+HOST_DIRECTFB_INSTALL_CMDS = \
+	$(INSTALL) -m 0755 $(@D)/tools/directfb-csource $(HOST_DIR)/usr/bin
 
-host-directfb-clean:
-	rm -f $(addprefix $(STAMP_DIR)/host_directfb_,unpacked configured compiled installed)
-	rm -f $(HOST_DIR)/usr/bin/directfb-csource
-	-$(MAKE) -C $(DIRECTFB_HOST_DIR)/tools clean
+$(eval $(call AUTOTARGETS,package,directfb))
+$(eval $(call AUTOTARGETS,package,directfb,host))
 
-host-directfb-dirclean:
-	rm -rf $(DIRECTFB_HOST_DIR)
+# directfb-csource for the host
+DIRECTFB_HOST_BINARY:=$(HOST_DIR)/usr/bin/directfb-csource
-- 
1.6.3.3
