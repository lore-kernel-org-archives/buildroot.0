From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Feb 2010 21:06:34 +0100
Subject: [Buildroot] [PATCH 10/40] xfont_font-util: convert to the autotools
	infrastructure
In-Reply-To: <cover.1266955555.git.thomas.petazzoni@free-electrons.com>
References: <cover.1266955555.git.thomas.petazzoni@free-electrons.com>
Message-ID: <abc1479ea795a18a743ea513e33179058bdfe6b6.1266955555.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xfont_font-util/xfont_font-util.mk |   74 ++--------------------
 1 files changed, 6 insertions(+), 68 deletions(-)

diff --git a/package/x11r7/xfont_font-util/xfont_font-util.mk b/package/x11r7/xfont_font-util/xfont_font-util.mk
index 38e7e80..88dce38 100644
--- a/package/x11r7/xfont_font-util/xfont_font-util.mk
+++ b/package/x11r7/xfont_font-util/xfont_font-util.mk
@@ -5,76 +5,14 @@
 ################################################################################
 
 XFONT_FONT_UTIL_VERSION = 1.0.1
-XFONT_FONT_UTIL_NAME = font-util-$(XFONT_FONT_UTIL_VERSION)
 XFONT_FONT_UTIL_SOURCE = font-util-$(XFONT_FONT_UTIL_VERSION).tar.bz2
 XFONT_FONT_UTIL_SITE = http://xorg.freedesktop.org/releases/individual/font
-XFONT_FONT_UTIL_AUTORECONF = NO
-XFONT_FONT_UTIL_DIR=$(BUILD_DIR)/$(XFONT_FONT_UTIL_NAME)
-XFONT_FONT_UTIL_CAT:=$(BZCAT)
+XFONT_FONT_UTIL_DEPENDENCIES = host-pkg-config
 
-$(DL_DIR)/$(XFONT_FONT_UTIL_SOURCE):
-	 $(call DOWNLOAD,$(XFONT_FONT_UTIL_SITE),$(XFONT_FONT_UTIL_SOURCE))
+define XFONT_FONT_UTIL_POST_INSTALL_FIXES
+ $(@D)/post-install.sh $(STAGING_DIR)
+endef
 
-xfont_font-util-source: $(DL_DIR)/$(XFONT_FONT_UTIL_SOURCE)
-
-$(XFONT_FONT_UTIL_DIR)/.unpacked: $(DL_DIR)/$(XFONT_FONT_UTIL_SOURCE)
-	$(XFONT_FONT_UTIL_CAT) $(DL_DIR)/$(XFONT_FONT_UTIL_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(XFONT_FONT_UTIL_DIR) package/x11r7/xfont_font-util/ \*.patch
-	$(CONFIG_UPDATE) $(XFONT_FONT_UTIL_DIR)
-	touch $@
-
-$(XFONT_FONT_UTIL_DIR)/.configured: $(XFONT_FONT_UTIL_DIR)/.unpacked
-	(cd $(XFONT_FONT_UTIL_DIR) && rm -rf config.cache)
-	(cd $(XFONT_FONT_UTIL_DIR) && \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		./configure $(QUIET) \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
-		--exec-prefix=/usr \
-		--bindir=/usr/bin \
-		--sbindir=/usr/sbin \
-		--libdir=/usr/lib \
-		--libexecdir=/usr/lib \
-		--sysconfdir=/etc \
-		--datadir=/usr/share \
-		--localstatedir=/var \
-		--includedir=/usr/include \
-		--mandir=/usr/share/man \
-		--infodir=/usr/share/info \
-	)
-	touch $@
-
-$(XFONT_FONT_UTIL_DIR)/.compiled: $(XFONT_FONT_UTIL_DIR)/.configured
-	$(MAKE) -C $(XFONT_FONT_UTIL_DIR)
-	touch $@
-
-$(XFONT_FONT_UTIL_DIR)/.installed: $(XFONT_FONT_UTIL_DIR)/.compiled
-	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(XFONT_FONT_UTIL_DIR) install
-	touch $@
-
-$(XFONT_FONT_UTIL_DIR)/.hacked: $(XFONT_FONT_UTIL_DIR)/.installed
-	( package/x11r7/xfont_font-util/post-install.sh $(STAGING_DIR) )
-	touch $@
-
-xfont_font-util: host-pkg-config $(XFONT_FONT_UTIL_DIR)/.hacked
-
-xfont_font-util-unpacked: $(XFONT_FONT_UTIL_DIR)/.unpacked
-
-xfont_font-util-clean:
-	-$(MAKE) -C $(XFONT_FONT_UTIL_DIR) clean
-
-xfont_font-util-dirclean:
-	rm -rf $(XFONT_FONT_UTIL_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_XFONT_FONT_UTIL),y)
-TARGETS+=xfont_font-util
-endif
+XFONT_FONT_UTIL_POST_INSTALL_STAGING_HOOKS += XFONT_FONT_UTIL_POST_INSTALL_FIXES
 
+$(eval $(call AUTOTARGETS,package/x11r7,xfont_font-util))
\ No newline at end of file
-- 
1.6.3.3
