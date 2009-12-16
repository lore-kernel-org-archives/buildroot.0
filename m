From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Dec 2009 16:29:02 +0100
Subject: [Buildroot] [git commit master] lzo: convert to autotools
	infrastructure for host package
Message-ID: <20091216153057.672DA77738@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=ab92ca91ac3ef3862b7866bd73a47bf9aa738311
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lzo/lzo.mk |   43 +------------------------------------------
 1 files changed, 1 insertions(+), 42 deletions(-)

diff --git a/package/lzo/lzo.mk b/package/lzo/lzo.mk
index 3c3b832..ed30056 100644
--- a/package/lzo/lzo.mk
+++ b/package/lzo/lzo.mk
@@ -12,45 +12,4 @@ LZO_INSTALL_TARGET = YES
 LZO_INSTALL_STAGING_OPT = CC="$(TARGET_CC)" DESTDIR=$(STAGING_DIR) install
 
 $(eval $(call AUTOTARGETS,package,lzo))
-
-# lzo for the host
-LZO_HOST_DIR:=$(BUILD_DIR)/lzo-$(LZO_VERSION)-host
-
-$(DL_DIR)/$(LZO_SOURCE):
-	$(call DOWNLOAD,$(LZO_SITE),$(LZO_SOURCE))
-
-$(STAMP_DIR)/host_lzo_unpacked: $(DL_DIR)/$(LZO_SOURCE)
-	mkdir -p $(LZO_HOST_DIR)
-	$(INFLATE$(suffix $(LZO_SOURCE))) $< | \
-		$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(LZO_HOST_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(LZO_HOST_DIR) package/lzo/ \*.patch
-	touch $@
-
-$(STAMP_DIR)/host_lzo_configured: $(STAMP_DIR)/host_lzo_unpacked
-	(cd $(LZO_HOST_DIR); rm -rf config.cache; \
-		$(HOST_CONFIGURE_OPTS) \
-		CFLAGS="$(HOST_CFLAGS)" \
-		LDFLAGS="$(HOST_LDFLAGS)" \
-		./configure $(QUIET) \
-		--prefix="$(HOST_DIR)/usr" \
-		--sysconfdir="$(HOST_DIR)/etc" \
-	)
-	touch $@
-
-$(STAMP_DIR)/host_lzo_compiled: $(STAMP_DIR)/host_lzo_configured
-	$(MAKE) -C $(LZO_HOST_DIR)
-	touch $@
-
-$(STAMP_DIR)/host_lzo_installed: $(STAMP_DIR)/host_lzo_compiled
-	$(MAKE) -C $(LZO_HOST_DIR) install
-	touch $@
-
-host-lzo: $(STAMP_DIR)/host_lzo_installed
-
-host-lzo-clean:
-	rm -f $(addprefix $(STAMP_DIR)/host_lzo_,unpacked configured compiled installed)
-	-$(MAKE) -C $(LZO_HOST_DIR) uninstall
-	-$(MAKE) -C $(LZO_HOST_DIR) clean
-
-host-lzo-dirclean:
-	rm -rf $(LZO_HOST_DIR)
+$(eval $(call AUTOTARGETS,package,lzo,host))
-- 
1.6.3.3
