From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 18 Jul 2009 00:16:48 +0200
Subject: [Buildroot] [git commit] mesa3d: compile makedepend (and in turn
	xproto) for the host
Message-ID: <20090717221845.E538B77828@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d0f902e82ed70db599325894d3ab58428164ef08
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master


The mesa3d build needs makedepend on the host, so compile one in $HOST_DIR.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/mesa3d/mesa3d.mk                     |    2 +-
 package/x11r7/xproto_xproto/xproto_xproto.mk       |   43 ++++++++++++++++++++
 package/x11r7/xutil_makedepend/xutil_makedepend.mk |   43 ++++++++++++++++++++
 3 files changed, 87 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/mesa3d/mesa3d.mk b/package/x11r7/mesa3d/mesa3d.mk
index 644c1bc..945765f 100644
--- a/package/x11r7/mesa3d/mesa3d.mk
+++ b/package/x11r7/mesa3d/mesa3d.mk
@@ -72,7 +72,7 @@ $(MESA3D_DIR)/.installed: $(MESA3D_DIR)/.built
 	rm -Rf $(TARGET_DIR)/usr/include/GL
 	touch $@
 
-mesa3d-depends: xproto_glproto xproto_xf86vidmodeproto xlib_libXxf86vm xlib_libXmu xlib_libXdamage libdrm xlib_libpciaccess
+mesa3d-depends: xproto_glproto xproto_xf86vidmodeproto xlib_libXxf86vm xlib_libXmu xlib_libXdamage libdrm xlib_libpciaccess host-makedepend
 mesa3d-source: $(DL_DIR)/$(MESA3D_SOURCE)
 mesa3d-configure: $(MESA3D_DIR)/.configured
 mesa3d-build: $(MESA3D_DIR)/.built
diff --git a/package/x11r7/xproto_xproto/xproto_xproto.mk b/package/x11r7/xproto_xproto/xproto_xproto.mk
index 9d4faf4..d46743e 100644
--- a/package/x11r7/xproto_xproto/xproto_xproto.mk
+++ b/package/x11r7/xproto_xproto/xproto_xproto.mk
@@ -12,3 +12,46 @@ XPROTO_XPROTO_INSTALL_STAGING = YES
 XPROTO_XPROTO_INSTALL_TARGET = NO
 
 $(eval $(call AUTOTARGETS,package/x11r7,xproto_xproto))
+
+# xproto_xproto for the host
+XPROTO_XPROTO_HOST_DIR:=$(BUILD_DIR)/xproto_xproto-$(XPROTO_XPROTO_VERSION)-host
+
+$(DL_DIR)/$(XPROTO_XPROTO_SOURCE):
+	$(call DOWNLOAD,$(XPROTO_XPROTO_SITE),$(XPROTO_XPROTO_SOURCE))
+
+$(STAMP_DIR)/host_xproto_xproto_unpacked: $(DL_DIR)/$(XPROTO_XPROTO_SOURCE)
+	mkdir -p $(XPROTO_XPROTO_HOST_DIR)
+	$(INFLATE$(suffix $(XPROTO_XPROTO_SOURCE))) $< | \
+		$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(XPROTO_XPROTO_HOST_DIR) $(TAR_OPTIONS) -
+	touch $@
+
+$(STAMP_DIR)/host_xproto_xproto_configured: $(STAMP_DIR)/host_xproto_xproto_unpacked
+	(cd $(XPROTO_XPROTO_HOST_DIR); rm -rf config.cache; \
+		$(HOST_CONFIGURE_OPTS) \
+		CFLAGS="$(HOST_CFLAGS)" \
+		LDFLAGS="$(HOST_LDFLAGS)" \
+		./configure \
+		--prefix="$(HOST_DIR)/usr" \
+		--sysconfdir="$(HOST_DIR)/etc" \
+	)
+	touch $@
+
+$(STAMP_DIR)/host_xproto_xproto_compiled: $(STAMP_DIR)/host_xproto_xproto_configured
+	$(HOST_MAKE_ENV) $(MAKE) -C $(XPROTO_XPROTO_HOST_DIR)
+	touch $@
+
+$(STAMP_DIR)/host_xproto_xproto_installed: $(STAMP_DIR)/host_xproto_xproto_compiled
+	$(MAKE) -C $(XPROTO_XPROTO_HOST_DIR) install
+	touch $@
+
+host-xproto_xproto: $(STAMP_DIR)/host_xproto_xproto_installed
+
+host-xproto_xproto-source: xproto_xproto-source
+
+host-xproto_xproto-clean:
+	rm -f $(addprefix $(STAMP_DIR)/host_xproto_xproto_,unpacked configured compiled installed)
+	-$(MAKE) -C $(XPROTO_XPROTO_HOST_DIR) uninstall
+	-$(MAKE) -C $(XPROTO_XPROTO_HOST_DIR) clean
+
+host-xproto_xproto-dirclean:
+	rm -rf $(XPROTO_XPROTO_HOST_DIR)
diff --git a/package/x11r7/xutil_makedepend/xutil_makedepend.mk b/package/x11r7/xutil_makedepend/xutil_makedepend.mk
index b698783..f562f5d 100644
--- a/package/x11r7/xutil_makedepend/xutil_makedepend.mk
+++ b/package/x11r7/xutil_makedepend/xutil_makedepend.mk
@@ -12,3 +12,46 @@ XUTIL_MAKEDEPEND_INSTALL_STAGING = YES
 XUTIL_MAKEDEPEND_INSTALL_TARGET = NO
 
 $(eval $(call AUTOTARGETS,package/x11r7,xutil_makedepend))
+
+# makedepend for the host
+MAKEDEPEND_HOST_DIR:=$(BUILD_DIR)/makedepend-$(XUTIL_MAKEDEPEND_VERSION)-host
+
+$(DL_DIR)/$(XUTIL_MAKEDEPEND_SOURCE):
+	$(call DOWNLOAD,$(XUTIL_MAKEDEPEND_SITE),$(XUTIL_MAKEDEPEND_SOURCE))
+
+$(STAMP_DIR)/host_makedepend_unpacked: $(DL_DIR)/$(XUTIL_MAKEDEPEND_SOURCE)
+	mkdir -p $(MAKEDEPEND_HOST_DIR)
+	$(INFLATE$(suffix $(XUTIL_MAKEDEPEND_SOURCE))) $< | \
+		$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(MAKEDEPEND_HOST_DIR) $(TAR_OPTIONS) -
+	touch $@
+
+$(STAMP_DIR)/host_makedepend_configured: $(STAMP_DIR)/host_makedepend_unpacked $(STAMP_DIR)/host_xproto_xproto_installed
+	(cd $(MAKEDEPEND_HOST_DIR); rm -rf config.cache; \
+		$(HOST_CONFIGURE_OPTS) \
+		CFLAGS="$(HOST_CFLAGS)" \
+		LDFLAGS="$(HOST_LDFLAGS)" \
+		./configure \
+		--prefix="$(HOST_DIR)/usr" \
+		--sysconfdir="$(HOST_DIR)/etc" \
+	)
+	touch $@
+
+$(STAMP_DIR)/host_makedepend_compiled: $(STAMP_DIR)/host_makedepend_configured
+	$(HOST_MAKE_ENV) $(MAKE) -C $(MAKEDEPEND_HOST_DIR)
+	touch $@
+
+$(STAMP_DIR)/host_makedepend_installed: $(STAMP_DIR)/host_makedepend_compiled
+	$(MAKE) -C $(MAKEDEPEND_HOST_DIR) install
+	touch $@
+
+host-makedepend: $(STAMP_DIR)/host_makedepend_installed
+
+host-makedepend-source: makedepend-source
+
+host-makedepend-clean:
+	rm -f $(addprefix $(STAMP_DIR)/host_makedepend_,unpacked configured compiled installed)
+	-$(MAKE) -C $(MAKEDEPEND_HOST_DIR) uninstall
+	-$(MAKE) -C $(MAKEDEPEND_HOST_DIR) clean
+
+host-makedepend-dirclean:
+	rm -rf $(MAKEDEPEND_HOST_DIR)
-- 
1.6.3.3
