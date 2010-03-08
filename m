From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump xcursor-themes to 1.0.2
Message-ID: <20100308133640.89A74776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=dca77c2f2f2dbeea2860f7ced7e0969e20141a54
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also convert to autotools.

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 .../xdata_xcursor-themes/xdata_xcursor-themes.mk   |   90 ++------------------
 1 files changed, 8 insertions(+), 82 deletions(-)

diff --git a/package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.mk b/package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.mk
index f28fbac..aa68c65 100644
--- a/package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.mk
+++ b/package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.mk
@@ -3,85 +3,11 @@
 # xdata_xcursor-themes - No description available
 #
 #############################################################
-XDATA_XCURSOR_THEMES_VERSION:=1.0.1
-XDATA_XCURSOR_THEMES_SOURCE:=xcursor-themes-$(XDATA_XCURSOR_THEMES_VERSION).tar.bz2
-XDATA_XCURSOR_THEMES_SITE:=http://xorg.freedesktop.org/releases/individual/data
-XDATA_XCURSOR_THEMES_DIR:=$(BUILD_DIR)/xcursor-themes-$(XDATA_XCURSOR_THEMES_VERSION)
-
-$(DL_DIR)/$(XDATA_XCURSOR_THEMES_SOURCE):
-	$(call DOWNLOAD,$(XDATA_XCURSOR_THEMES_SITE),$(XDATA_XCURSOR_THEMES_SOURCE))
-
-$(XDATA_XCURSOR_THEMES_DIR)/.extracted: $(DL_DIR)/$(XDATA_XCURSOR_THEMES_SOURCE)
-	$(BZCAT) $(DL_DIR)/$(XDATA_XCURSOR_THEMES_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	touch $@
-
-$(XDATA_XCURSOR_THEMES_DIR)/.patched: $(XDATA_XCURSOR_THEMES_DIR)/.extracted
-	toolchain/patch-kernel.sh $(XDATA_XCURSOR_THEMES_DIR) package/x11r7/xdata_xcursor-themes/ xdata_xcursor-themes\*.patch
-	touch $@
-
-$(XDATA_XCURSOR_THEMES_DIR)/.configured: $(XDATA_XCURSOR_THEMES_DIR)/.patched
-	(cd $(XDATA_XCURSOR_THEMES_DIR) && \
-		aclocal -I . -I $(STAGING_DIR)/usr/share/aclocal --install && \
-		autoconf -I $(STAGING_DIR)/usr/share/aclocal && \
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
-		--disable-static \
-		--disable-IPv6 \
-		$(DISABLE_NLS) \
- \
-	)
-	touch $@
-
-$(XDATA_XCURSOR_THEMES_DIR)/.built: $(XDATA_XCURSOR_THEMES_DIR)/.configured
-	$(MAKE) CC=$(TARGET_CC) CXX=$(TARGET_CC) -C $(XDATA_XCURSOR_THEMES_DIR)
-	touch $@
-
-$(XDATA_XCURSOR_THEMES_DIR)/.installed: $(XDATA_XCURSOR_THEMES_DIR)/.built
-	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(XDATA_XCURSOR_THEMES_DIR) install-exec install-data
-	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(XDATA_XCURSOR_THEMES_DIR) install
-#	toolchain/replace.sh $(STAGING_DIR)/usr/lib ".*\.la" "\(['= ]\)/usr" "\\1$(STAGING_DIR)/usr"
-#	find $(TARGET_DIR)/usr -name '*.la' -print -delete
-	ln -s -f ./redglass $(TARGET_DIR)/usr/share/icons/default
-	cd
-	touch $@
-
-xdata_xcursor-themes-clean:
-	-$(MAKE) prefix=$(STAGING_DIR)/usr -C $(XDATA_XCURSOR_THEMES_DIR) uninstall
-	-$(MAKE) prefix=$(TARGET_DIR)/usr -C $(XDATA_XCURSOR_THEMES_DIR) uninstall
-	-$(MAKE) -C $(XDATA_XCURSOR_THEMES_DIR) clean
-	-rm $(XDATA_XCURSOR_THEMES_DIR)/.installed
-	-rm $(XDATA_XCURSOR_THEMES_DIR)/.built
-
-xdata_xcursor-themes-dirclean:
-	rm -rf $(XDATA_XCURSOR_THEMES_DIR)
-
-xdata_xcursor-themes-depends:
-xdata_xcursor-themes-source: $(DL_DIR)/$(XDATA_XCURSOR_THEMES_SOURCE)
-xdata_xcursor-themes-patch: $(XDATA_XCURSOR_THEMES_DIR)/.patched
-xdata_xcursor-themes-configure: $(XDATA_XCURSOR_THEMES_DIR)/.configured
-xdata_xcursor-themes-build: $(XDATA_XCURSOR_THEMES_DIR)/.built
-
-xdata_xcursor-themes: xdata_xcursor-themes-depends $(XDATA_XCURSOR_THEMES_DIR)/.installed
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_XDATA_XCURSOR_THEMES),y)
-TARGETS+=xdata_xcursor-themes
-endif
-
-# :mode=makefile:
+XDATA_XCURSOR_THEMES_VERSION = 1.0.2
+XDATA_XCURSOR_THEMES_SOURCE = xcursor-themes-$(XDATA_XCURSOR_THEMES_VERSION).tar.bz2
+XDATA_XCURSOR_THEMES_SITE = http://xorg.freedesktop.org/releases/individual/data
+XDATA_XCURSOR_THEMES_AUTORECONF = NO
+XDATA_XCURSOR_THEMES_INSTALL_STAGING = YES
+XDATA_XCURSOR_THEMES_INSTALL_TARGET = YES
+
+$(eval $(call AUTOTARGETS,package/x11r7,xdata_xcursor-themes))
-- 
1.6.3.3
