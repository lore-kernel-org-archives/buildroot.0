From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Mon,  7 May 2018 12:57:41 +0200
Subject: [Buildroot] [RFC PATCH 7/7] enlightenment: convert to pkg-meson
 infra
In-Reply-To: <20180507105741.31747-1-eric.le.bihan.dev@free.fr>
References: <20180507105741.31747-1-eric.le.bihan.dev@free.fr>
Message-ID: <20180507105741.31747-8-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 package/enlightenment/enlightenment.mk | 30 ++++++------------------------
 1 file changed, 6 insertions(+), 24 deletions(-)

diff --git a/package/enlightenment/enlightenment.mk b/package/enlightenment/enlightenment.mk
index 480e9e9da8..5bc1c5d6de 100644
--- a/package/enlightenment/enlightenment.mk
+++ b/package/enlightenment/enlightenment.mk
@@ -13,14 +13,10 @@ ENLIGHTENMENT_LICENSE_FILES = COPYING
 ENLIGHTENMENT_DEPENDENCIES = \
 	host-pkgconf \
 	host-efl \
-	host-meson \
 	efl \
 	xcb-util-keysyms
 
-ENLIGHTENMENT_MESON_OPTS += \
-	--prefix=/usr \
-	--buildtype=$(if $(BR2_ENABLE_DEBUG),debug,release) \
-	--cross-file=$(HOST_DIR)/etc/meson/cross-compilation.conf \
+ENLIGHTENMENT_CONF_OPTS = \
 	-Dedje-cc=$(HOST_DIR)/bin/edje_cc \
 	-Deet=$(HOST_DIR)/bin/eet \
 	-Deldbus-codegen=$(HOST_DIR)/bin/eldbus-codegen \
@@ -30,38 +26,24 @@ ENLIGHTENMENT_MESON_OPTS += \
 ENLIGHTENMENT_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_SYSTEMD),y)
-ENLIGHTENMENT_MESON_OPTS += -Dsystemd=true
+ENLIGHTENMENT_CONF_OPTS += -Dsystemd=true
 ENLIGHTENMENT_DEPENDENCIES += systemd
 else
-ENLIGHTENMENT_MESON_OPTS += -Dsystemd=false
+ENLIGHTENMENT_CONF_OPTS += -Dsystemd=false
 endif
 
 # alsa backend needs mixer support
 ifeq ($(BR2_PACKAGE_ALSA_LIB)$(BR2_PACKAGE_ALSA_LIB_MIXER),yy)
-ENLIGHTENMENT_MESON_OPTS += -Dmixer=true
+ENLIGHTENMENT_CONF_OPTS += -Dmixer=true
 ENLIGHTENMENT_DEPENDENCIES += alsa-lib
 else
-ENLIGHTENMENT_MESON_OPTS += -Dmixer=false
+ENLIGHTENMENT_CONF_OPTS += -Dmixer=false
 endif
 
 ifeq ($(BR2_PACKAGE_XKEYBOARD_CONFIG),y)
 ENLIGHTENMENT_DEPENDENCIES += xkeyboard-config
 endif
 
-define ENLIGHTENMENT_CONFIGURE_CMDS
-	rm -rf $(@D)/build
-	mkdir -p $(@D)/build
-	$(TARGET_MAKE_ENV) meson $(ENLIGHTENMENT_MESON_OPTS) $(@D) $(@D)/build
-endef
-
-define ENLIGHTENMENT_BUILD_CMDS
-	$(TARGET_MAKE_ENV) ninja -C $(@D)/build
-endef
-
-define ENLIGHTENMENT_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) DESTDIR=$(TARGET_DIR) ninja -C $(@D)/build install
-endef
-
 define ENLIGHTENMENT_REMOVE_DOCUMENTATION
 	rm -rf $(TARGET_DIR)/usr/share/enlightenment/doc/
 	rm -f $(TARGET_DIR)/usr/share/enlightenment/COPYING
@@ -69,4 +51,4 @@ define ENLIGHTENMENT_REMOVE_DOCUMENTATION
 endef
 ENLIGHTENMENT_POST_INSTALL_TARGET_HOOKS += ENLIGHTENMENT_REMOVE_DOCUMENTATION
 
-$(eval $(generic-package))
+$(eval $(meson-package))
-- 
2.14.3
