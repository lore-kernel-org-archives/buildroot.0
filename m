From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Dec 2009 16:29:02 +0100
Subject: [Buildroot] [git commit master] xutil_makedepend: convert to
	autotools infrastructure for host package
Message-ID: <20091216153059.C3ED177738@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=b9c569347d24a0ba90240ec6d74235375c320172
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xutil_makedepend/xutil_makedepend.mk |   46 +------------------
 1 files changed, 3 insertions(+), 43 deletions(-)

diff --git a/package/x11r7/xutil_makedepend/xutil_makedepend.mk b/package/x11r7/xutil_makedepend/xutil_makedepend.mk
index edbe251..b0bbafd 100644
--- a/package/x11r7/xutil_makedepend/xutil_makedepend.mk
+++ b/package/x11r7/xutil_makedepend/xutil_makedepend.mk
@@ -11,47 +11,7 @@ XUTIL_MAKEDEPEND_AUTORECONF = NO
 XUTIL_MAKEDEPEND_INSTALL_STAGING = NO
 XUTIL_MAKEDEPEND_INSTALL_TARGET = YES
 
-$(eval $(call AUTOTARGETS,package/x11r7,xutil_makedepend))
-
-# makedepend for the host
-MAKEDEPEND_HOST_DIR:=$(BUILD_DIR)/makedepend-$(XUTIL_MAKEDEPEND_VERSION)-host
-
-$(DL_DIR)/$(XUTIL_MAKEDEPEND_SOURCE):
-	$(call DOWNLOAD,$(XUTIL_MAKEDEPEND_SITE),$(XUTIL_MAKEDEPEND_SOURCE))
-
-$(STAMP_DIR)/host_makedepend_unpacked: $(DL_DIR)/$(XUTIL_MAKEDEPEND_SOURCE)
-	mkdir -p $(MAKEDEPEND_HOST_DIR)
-	$(INFLATE$(suffix $(XUTIL_MAKEDEPEND_SOURCE))) $< | \
-		$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(MAKEDEPEND_HOST_DIR) $(TAR_OPTIONS) -
-	touch $@
-
-$(STAMP_DIR)/host_makedepend_configured: $(STAMP_DIR)/host_makedepend_unpacked $(STAMP_DIR)/host_xproto_xproto_installed
-	(cd $(MAKEDEPEND_HOST_DIR); rm -rf config.cache; \
-		$(HOST_CONFIGURE_OPTS) \
-		CFLAGS="$(HOST_CFLAGS)" \
-		LDFLAGS="$(HOST_LDFLAGS)" \
-		./configure $(QUIET) \
-		--prefix="$(HOST_DIR)/usr" \
-		--sysconfdir="$(HOST_DIR)/etc" \
-	)
-	touch $@
-
-$(STAMP_DIR)/host_makedepend_compiled: $(STAMP_DIR)/host_makedepend_configured
-	$(HOST_MAKE_ENV) $(MAKE) -C $(MAKEDEPEND_HOST_DIR)
-	touch $@
+HOST_XUTIL_MAKEDEPEND_DEPENDENCIES = host-xproto-xproto
 
-$(STAMP_DIR)/host_makedepend_installed: $(STAMP_DIR)/host_makedepend_compiled
-	$(MAKE) -C $(MAKEDEPEND_HOST_DIR) install
-	touch $@
-
-host-makedepend: $(STAMP_DIR)/host_makedepend_installed
-
-host-makedepend-source: makedepend-source
-
-host-makedepend-clean:
-	rm -f $(addprefix $(STAMP_DIR)/host_makedepend_,unpacked configured compiled installed)
-	-$(MAKE) -C $(MAKEDEPEND_HOST_DIR) uninstall
-	-$(MAKE) -C $(MAKEDEPEND_HOST_DIR) clean
-
-host-makedepend-dirclean:
-	rm -rf $(MAKEDEPEND_HOST_DIR)
+$(eval $(call AUTOTARGETS,package/x11r7,xutil_makedepend))
+$(eval $(call AUTOTARGETS,package/x11r7,xutil_makedepend,host))
-- 
1.6.3.3
