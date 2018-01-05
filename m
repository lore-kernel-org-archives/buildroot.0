From: Romain Naour <romain.naour@gmail.com>
Date: Fri,  5 Jan 2018 17:32:23 +0100
Subject: [Buildroot] [PATCH] package/enlightenment: bump to 0.22.1
Message-ID: <20180105163223.10142-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

See https://www.enlightenment.org/news/e22_release and
https://www.enlightenment.org/news/e0.22.1_release

Switch to the meson build system.

The autotools build system has been removed upstream by commit
https://git.enlightenment.org/core/enlightenment.git/commit/?id=bd8828204779509a2f47fffc4031abcab2b34d79

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
---
 package/enlightenment/enlightenment.hash |  4 ++--
 package/enlightenment/enlightenment.mk   | 41 +++++++++++++++++++++++---------
 2 files changed, 32 insertions(+), 13 deletions(-)

diff --git a/package/enlightenment/enlightenment.hash b/package/enlightenment/enlightenment.hash
index 6fb29a2c75..10e8facf35 100644
--- a/package/enlightenment/enlightenment.hash
+++ b/package/enlightenment/enlightenment.hash
@@ -1,3 +1,3 @@
-# From https://www.enlightenment.org/news/e0.21.10_release
-sha256	9bb915caa5b390b2e212ff5f6f75b57a3d082f80d2f7b5b278bd902e2fad7f14	enlightenment-0.21.10.tar.xz
+# From https://www.enlightenment.org/news/e0.22.1_release
+sha256	207b6b88dafc4932ab007a835510823c5a1dd8c191876ac037628176ca77a7e0	enlightenment-0.22.1.tar.xz
 sha256	34dbd501ec9d1c8dcc569c01db9cf9a4b7ee5981614cc9f8f613a97463d27350	COPYING
diff --git a/package/enlightenment/enlightenment.mk b/package/enlightenment/enlightenment.mk
index 1c88c8b261..1586c2af7e 100644
--- a/package/enlightenment/enlightenment.mk
+++ b/package/enlightenment/enlightenment.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ENLIGHTENMENT_VERSION = 0.21.10
+ENLIGHTENMENT_VERSION = 0.22.1
 ENLIGHTENMENT_SOURCE = enlightenment-$(ENLIGHTENMENT_VERSION).tar.xz
 ENLIGHTENMENT_SITE = http://download.enlightenment.org/rel/apps/enlightenment
 ENLIGHTENMENT_LICENSE = BSD-2-Clause
@@ -13,30 +13,49 @@ ENLIGHTENMENT_LICENSE_FILES = COPYING
 ENLIGHTENMENT_DEPENDENCIES = \
 	host-pkgconf \
 	host-efl \
+	host-meson \
 	efl \
 	xcb-util-keysyms
 
-ENLIGHTENMENT_CONF_OPTS = \
-	--with-edje-cc=$(HOST_DIR)/bin/edje_cc \
-	--with-eet-eet=$(HOST_DIR)/bin/eet \
-	--with-eldbus_codegen=$(HOST_DIR)/bin/eldbus-codegen \
-	--disable-pam \
-	--disable-rpath
+ENLIGHTENMENT_MESON_OPTS += \
+	--prefix=/usr \
+	--buildtype $(if $(BR2_ENABLE_DEBUG),debug,release) \
+	--cross-file $(HOST_DIR)/etc/meson/cross-compilation.conf \
+	-Dedje-cc=$(HOST_DIR)/bin/edje_cc \
+	-Deet-eet=$(HOST_DIR)/bin/eet \
+	-Deldbus_codegen=$(HOST_DIR)/bin/eldbus-codegen \
+	-Dpam=false \
+	-Drpath=false
 
 ifeq ($(BR2_PACKAGE_SYSTEMD),y)
-ENLIGHTENMENT_CONF_OPTS += --enable-systemd
+ENLIGHTENMENT_MESON_OPTS += -Dsystemd=true
 ENLIGHTENMENT_DEPENDENCIES += systemd
 else
-ENLIGHTENMENT_CONF_OPTS += --disable-systemd
+ENLIGHTENMENT_MESON_OPTS += -Dsystemd=false
 endif
 
 # alsa backend needs mixer support
 ifeq ($(BR2_PACKAGE_ALSA_LIB)$(BR2_PACKAGE_ALSA_LIB_MIXER),yy)
+ENLIGHTENMENT_MESON_OPTS += -Dmixer=true
 ENLIGHTENMENT_DEPENDENCIES += alsa-lib
 else
-ENLIGHTENMENT_CONF_ENV += enable_alsa=no
+ENLIGHTENMENT_MESON_OPTS += -Dmixer=false
 endif
 
+define ENLIGHTENMENT_CONFIGURE_CMDS
+	rm -rf $(@D)/build
+	mkdir -p $(@D)/build
+	$(TARGET_MAKE_ENV) meson $(ENLIGHTENMENT_MESON_OPTS) $(@D) $(@D)/build
+endef
+
+define ENLIGHTENMENT_BUILD_CMDS
+	$(TARGET_MAKE_ENV) ninja -C $(@D)/build
+endef
+
+define ENLIGHTENMENT_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) DESTDIR=$(TARGET_DIR) ninja -C $(@D)/build install
+endef
+
 define ENLIGHTENMENT_REMOVE_DOCUMENTATION
 	rm -rf $(TARGET_DIR)/usr/share/enlightenment/doc/
 	rm -f $(TARGET_DIR)/usr/share/enlightenment/COPYING
@@ -44,4 +63,4 @@ define ENLIGHTENMENT_REMOVE_DOCUMENTATION
 endef
 ENLIGHTENMENT_POST_INSTALL_TARGET_HOOKS += ENLIGHTENMENT_REMOVE_DOCUMENTATION
 
-$(eval $(autotools-package))
+$(eval $(generic-package))
-- 
2.14.3
