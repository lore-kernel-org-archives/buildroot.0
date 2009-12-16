From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Dec 2009 16:29:02 +0100
Subject: [Buildroot] [git commit master] xproto_xproto: convert to autotools
	infrastructure for host package
Message-ID: <20091216153059.4359477738@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=e8929df01711b7a5fe893c58fe14989e6e2a64b1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xproto_xproto/xproto_xproto.mk |   44 +-------------------------
 1 files changed, 1 insertions(+), 43 deletions(-)

diff --git a/package/x11r7/xproto_xproto/xproto_xproto.mk b/package/x11r7/xproto_xproto/xproto_xproto.mk
index 879b554..ff2a042 100644
--- a/package/x11r7/xproto_xproto/xproto_xproto.mk
+++ b/package/x11r7/xproto_xproto/xproto_xproto.mk
@@ -12,46 +12,4 @@ XPROTO_XPROTO_INSTALL_STAGING = YES
 XPROTO_XPROTO_INSTALL_TARGET = NO
 
 $(eval $(call AUTOTARGETS,package/x11r7,xproto_xproto))
-
-# xproto_xproto for the host
-XPROTO_XPROTO_HOST_DIR:=$(BUILD_DIR)/xproto_xproto-$(XPROTO_XPROTO_VERSION)-host
-
-$(DL_DIR)/$(XPROTO_XPROTO_SOURCE):
-	$(call DOWNLOAD,$(XPROTO_XPROTO_SITE),$(XPROTO_XPROTO_SOURCE))
-
-$(STAMP_DIR)/host_xproto_xproto_unpacked: $(DL_DIR)/$(XPROTO_XPROTO_SOURCE)
-	mkdir -p $(XPROTO_XPROTO_HOST_DIR)
-	$(INFLATE$(suffix $(XPROTO_XPROTO_SOURCE))) $< | \
-		$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(XPROTO_XPROTO_HOST_DIR) $(TAR_OPTIONS) -
-	touch $@
-
-$(STAMP_DIR)/host_xproto_xproto_configured: $(STAMP_DIR)/host_xproto_xproto_unpacked
-	(cd $(XPROTO_XPROTO_HOST_DIR); rm -rf config.cache; \
-		$(HOST_CONFIGURE_OPTS) \
-		CFLAGS="$(HOST_CFLAGS)" \
-		LDFLAGS="$(HOST_LDFLAGS)" \
-		./configure $(QUIET) \
-		--prefix="$(HOST_DIR)/usr" \
-		--sysconfdir="$(HOST_DIR)/etc" \
-	)
-	touch $@
-
-$(STAMP_DIR)/host_xproto_xproto_compiled: $(STAMP_DIR)/host_xproto_xproto_configured
-	$(HOST_MAKE_ENV) $(MAKE) -C $(XPROTO_XPROTO_HOST_DIR)
-	touch $@
-
-$(STAMP_DIR)/host_xproto_xproto_installed: $(STAMP_DIR)/host_xproto_xproto_compiled
-	$(MAKE) -C $(XPROTO_XPROTO_HOST_DIR) install
-	touch $@
-
-host-xproto_xproto: $(STAMP_DIR)/host_xproto_xproto_installed
-
-host-xproto_xproto-source: xproto_xproto-source
-
-host-xproto_xproto-clean:
-	rm -f $(addprefix $(STAMP_DIR)/host_xproto_xproto_,unpacked configured compiled installed)
-	-$(MAKE) -C $(XPROTO_XPROTO_HOST_DIR) uninstall
-	-$(MAKE) -C $(XPROTO_XPROTO_HOST_DIR) clean
-
-host-xproto_xproto-dirclean:
-	rm -rf $(XPROTO_XPROTO_HOST_DIR)
+$(eval $(call AUTOTARGETS,package/x11r7,xproto_xproto,host))
-- 
1.6.3.3
