From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Dec 2009 20:30:57 +0100
Subject: [Buildroot] [PATCH 26/39] expat: convert to autotools
	infrastructure for host package
In-Reply-To: <cover.1260905467.git.thomas.petazzoni@free-electrons.com>
References: <cover.1260905467.git.thomas.petazzoni@free-electrons.com>
Message-ID: <57fbbfa775a91989ed4c328a386ec1e0d73cd560.1260905467.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/expat/expat.mk |   44 +-------------------------------------------
 1 files changed, 1 insertions(+), 43 deletions(-)

diff --git a/package/expat/expat.mk b/package/expat/expat.mk
index 9dcb0e7..5b4eb97 100644
--- a/package/expat/expat.mk
+++ b/package/expat/expat.mk
@@ -19,50 +19,8 @@ EXPAT_CONF_OPT = --enable-shared
 EXPAT_DEPENDENCIES = host-pkg-config
 
 $(eval $(call AUTOTARGETS,package,expat))
+$(eval $(call AUTOTARGETS,package,expat,host))
 
 $(EXPAT_HOOK_POST_INSTALL): $(EXPAT_TARGET_INSTALL_TARGET)
 	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libexpat.so.*
 	touch $@
-
-# expat for the host
-EXPAT_HOST_DIR:=$(BUILD_DIR)/expat-$(EXPAT_VERSION)-host
-
-$(DL_DIR)/$(EXPAT_SOURCE):
-	$(call DOWNLOAD,$(EXPAT_SITE),$(EXPAT_SOURCE))
-
-$(STAMP_DIR)/host_expat_unpacked: $(DL_DIR)/$(EXPAT_SOURCE)
-	mkdir -p $(EXPAT_HOST_DIR)
-	$(INFLATE$(suffix $(EXPAT_SOURCE))) $< | \
-		$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(EXPAT_HOST_DIR) $(TAR_OPTIONS) -
-	touch $@
-
-$(STAMP_DIR)/host_expat_configured: $(STAMP_DIR)/host_expat_unpacked
-	(cd $(EXPAT_HOST_DIR); rm -rf config.cache; \
-		$(HOST_CONFIGURE_OPTS) \
-		CFLAGS="$(HOST_CFLAGS)" \
-		LDFLAGS="$(HOST_LDFLAGS)" \
-		./configure $(QUIET) \
-		--prefix="$(HOST_DIR)/usr" \
-		--sysconfdir="$(HOST_DIR)/etc" \
-	)
-	touch $@
-
-$(STAMP_DIR)/host_expat_compiled: $(STAMP_DIR)/host_expat_configured
-	$(HOST_MAKE_ENV) $(MAKE) -C $(EXPAT_HOST_DIR)
-	touch $@
-
-$(STAMP_DIR)/host_expat_installed: $(STAMP_DIR)/host_expat_compiled
-	$(MAKE) -C $(EXPAT_HOST_DIR) installlib
-	touch $@
-
-host-expat: $(STAMP_DIR)/host_expat_installed
-
-host-expat-source: expat-source
-
-host-expat-clean:
-	rm -f $(addprefix $(STAMP_DIR)/host_expat_,unpacked configured compiled installed)
-	-$(MAKE) -C $(EXPAT_HOST_DIR) uninstall
-	-$(MAKE) -C $(EXPAT_HOST_DIR) clean
-
-host-expat-dirclean:
-	rm -rf $(EXPAT_HOST_DIR)
-- 
1.6.3.3
