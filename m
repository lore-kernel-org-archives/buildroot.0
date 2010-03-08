From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Fix xman building and convert to
	autotools
Message-ID: <20100308133622.8BC97776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=876f04a5e4dee1f79f06d61958a712f32d4c2428
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xapp_xman/xapp_xman.mk |   81 +++------------------------------
 1 files changed, 8 insertions(+), 73 deletions(-)

diff --git a/package/x11r7/xapp_xman/xapp_xman.mk b/package/x11r7/xapp_xman/xapp_xman.mk
index be03ddf..d9729d4 100644
--- a/package/x11r7/xapp_xman/xapp_xman.mk
+++ b/package/x11r7/xapp_xman/xapp_xman.mk
@@ -6,80 +6,15 @@
 XAPP_XMAN_VERSION:=1.0.3
 XAPP_XMAN_SOURCE:=xman-$(XAPP_XMAN_VERSION).tar.bz2
 XAPP_XMAN_SITE:=http://xorg.freedesktop.org/releases/individual/app
-XAPP_XMAN_DIR:=$(BUILD_DIR)/xman-$(XAPP_XMAN_VERSION)
+XAPP_XMAN_AUTORECONF = NO
+XAPP_XMAN_INSTALL_TARGET = YES
 
-$(DL_DIR)/$(XAPP_XMAN_SOURCE):
-	$(call DOWNLOAD,$(XAPP_XMAN_SITE),$(XAPP_XMAN_SOURCE))
+XAPP_XMAN_CONF_ENV = ac_cv_file__etc_man_conf=no \
+		ac_cv_file__etc_man_config=no \
+		ac_cv_file__etc_manpath_config=no
 
-$(XAPP_XMAN_DIR)/.extracted: $(DL_DIR)/$(XAPP_XMAN_SOURCE)
-	$(BZCAT) $(DL_DIR)/$(XAPP_XMAN_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	touch $@
-
-$(XAPP_XMAN_DIR)/.patched: $(XAPP_XMAN_DIR)/.extracted
-	toolchain/patch-kernel.sh $(XAPP_XMAN_DIR) package/x11r7/xapp_xman/ xapp_xman\*.patch
-	touch $@
-
-$(XAPP_XMAN_DIR)/.configured: $(XAPP_XMAN_DIR)/.patched
-	(cd $(XAPP_XMAN_DIR) && \
-		aclocal -I. -I$(STAGING_DIR)/usr/share/aclocal --install && \
-		autoconf -I$(STAGING_DIR)/usr/share/aclocal && \
-		automake -ac && \
-		rm -rf config.cache && \
-		$(TARGET_CONFIGURE_OPTS) \
-		CFLAGS="$(TARGET_CFLAGS)" \
-		LDFLAGS="$(TARGET_LDFLAGS)" \
-		STAGING_DIR=$(STAGING_DIR) \
- \
-		./configure $(QUIET) \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
-		--sysconfdir=/etc \
-		--enable-shared \
+XAPP_XMAN_CONF_OPT = --enable-shared \
 		--disable-static \
-		--disable-IPv6 \
-		$(DISABLE_NLS) \
- \
-	)
-	touch $@
-
-$(XAPP_XMAN_DIR)/.built: $(XAPP_XMAN_DIR)/.configured
-	$(MAKE) CC=$(TARGET_CC) CXX=$(TARGET_CC) -C $(XAPP_XMAN_DIR)
-	touch $@
-
-$(XAPP_XMAN_DIR)/.installed: $(XAPP_XMAN_DIR)/.built
-	$(MAKE) prefix=$(TARGET_DIR)/usr -C $(XAPP_XMAN_DIR) install-exec
-	$(MAKE) prefix=$(STAGING_DIR)/usr -C $(XAPP_XMAN_DIR) install
-	toolchain/replace.sh $(STAGING_DIR)/usr/lib ".*\.la" "\(['= ]\)/usr" "\\1$(STAGING_DIR)/usr"
-	find $(TARGET_DIR)/usr -name '*.la' -print -delete
-	touch $@
-
-xapp_xman-clean:
-	$(MAKE) prefix=$(STAGING_DIR)/usr -C $(XAPP_XMAN_DIR) uninstall
-	$(MAKE) prefix=$(TARGET_DIR)/usr -C $(XAPP_XMAN_DIR) uninstall
-	-$(MAKE) -C $(XAPP_XMAN_DIR) clean
-	-rm $(XAPP_XMAN_DIR)/.installed
-	-rm $(XAPP_XMAN_DIR)/.built
-
-xapp_xman-dirclean:
-	rm -rf $(XAPP_XMAN_DIR)
-
-xapp_xman-depends: xlib_libXprintUtil xlib_libXprintUtil
-xapp_xman-source: $(XAPP_XMAN_DIR)/.extracted
-xapp_xman-patch: $(XAPP_XMAN_DIR)/.patched
-xapp_xman-configure: $(XAPP_XMAN_DIR)/.configured
-xapp_xman-build: $(XAPP_XMAN_DIR)/.built
-
-xapp_xman: xapp_xman-depends $(XAPP_XMAN_DIR)/.installed
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_XAPP_XMAN),y)
-TARGETS+=xapp_xman
-endif
+		--disable-IPv6
 
-# :mode=makefile:
+$(eval $(call AUTOTARGETS,package/x11r7,xapp_xman))
-- 
1.6.3.3
