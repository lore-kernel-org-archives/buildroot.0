From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Dec 2009 20:31:04 +0100
Subject: [Buildroot] [PATCH 33/39] pixman: convert to autotools
	infrastructure for host package
In-Reply-To: <cover.1260905467.git.thomas.petazzoni@free-electrons.com>
References: <cover.1260905467.git.thomas.petazzoni@free-electrons.com>
Message-ID: <46ed37494b0cfe2f9241f6795ba62a5471dda029.1260905467.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pixman/pixman.mk |   44 +-------------------------------------------
 1 files changed, 1 insertions(+), 43 deletions(-)

diff --git a/package/pixman/pixman.mk b/package/pixman/pixman.mk
index 3a76c96..9507bbf 100644
--- a/package/pixman/pixman.mk
+++ b/package/pixman/pixman.mk
@@ -10,46 +10,4 @@ PIXMAN_AUTORECONF = NO
 PIXMAN_INSTALL_STAGING = YES
 
 $(eval $(call AUTOTARGETS,package,pixman))
-
-# pixman for the host
-PIXMAN_HOST_DIR:=$(BUILD_DIR)/pixman-$(PIXMAN_VERSION)-host
-
-$(DL_DIR)/$(PIXMAN_SOURCE):
-	$(call DOWNLOAD,$(PIXMAN_SITE),$(PIXMAN_SOURCE))
-
-$(STAMP_DIR)/host_pixman_unpacked: $(DL_DIR)/$(PIXMAN_SOURCE)
-	mkdir -p $(PIXMAN_HOST_DIR)
-	$(INFLATE$(suffix $(PIXMAN_SOURCE))) $< | \
-		$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(PIXMAN_HOST_DIR) $(TAR_OPTIONS) -
-	touch $@
-
-$(STAMP_DIR)/host_pixman_configured: $(STAMP_DIR)/host_pixman_unpacked
-	(cd $(PIXMAN_HOST_DIR); rm -rf config.cache; \
-		$(HOST_CONFIGURE_OPTS) \
-		CFLAGS="$(HOST_CFLAGS)" \
-		LDFLAGS="$(HOST_LDFLAGS)" \
-		./configure $(QUIET) \
-		--prefix="$(HOST_DIR)/usr" \
-		--sysconfdir="$(HOST_DIR)/etc" \
-	)
-	touch $@
-
-$(STAMP_DIR)/host_pixman_compiled: $(STAMP_DIR)/host_pixman_configured
-	$(HOST_MAKE_ENV) $(MAKE) -C $(PIXMAN_HOST_DIR)
-	touch $@
-
-$(STAMP_DIR)/host_pixman_installed: $(STAMP_DIR)/host_pixman_compiled
-	$(HOST_MAKE_ENV) $(MAKE) -C $(PIXMAN_HOST_DIR) install
-	touch $@
-
-host-pixman: $(STAMP_DIR)/host_pixman_installed
-
-host-pixman-source: pixman-source
-
-host-pixman-clean:
-	rm -f $(addprefix $(STAMP_DIR)/host_pixman_,unpacked configured compiled installed)
-	-$(MAKE) -C $(PIXMAN_HOST_DIR) uninstall
-	-$(MAKE) -C $(PIXMAN_HOST_DIR) clean
-
-host-pixman-dirclean:
-	rm -rf $(PIXMAN_HOST_DIR)
+$(eval $(call AUTOTARGETS,package,pixman,host))
-- 
1.6.3.3
