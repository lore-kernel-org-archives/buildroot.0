From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 30 Dec 2018 16:57:19 +0100
Subject: [Buildroot] [git commit] package/terminology: convert to the
 meson-package infrastructure
Message-ID: <20181230155239.5D07F813FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8c818885de6e85396fe5052d4c53eb6a62994800
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This conversion reduces the complexity of the .mk file, but also
allows to prepare terminology for per-package meson
cross-compilation.conf, where the cross-compilation.conf file will not
be located in $(HOST_DIR)/etc/meson/cross-compilation.conf.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Reviewed-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/terminology/terminology.mk | 28 +++++-----------------------
 1 file changed, 5 insertions(+), 23 deletions(-)

diff --git a/package/terminology/terminology.mk b/package/terminology/terminology.mk
index af37187d90..3d144f8655 100644
--- a/package/terminology/terminology.mk
+++ b/package/terminology/terminology.mk
@@ -10,31 +10,13 @@ TERMINOLOGY_SITE = https://download.enlightenment.org/rel/apps/terminology
 TERMINOLOGY_LICENSE = BSD-2-Clause
 TERMINOLOGY_LICENSE_FILES = COPYING
 
-TERMINOLOGY_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES) efl host-meson host-pkgconf
-TERMINOLOGY_MESON_OPTS = \
-	--prefix=/usr \
-	--buildtype=$(if $(BR2_ENABLE_DEBUG),debug,release) \
-	--cross-file=$(HOST_DIR)/etc/meson/cross-compilation.conf \
-	-Dedje-cc=$(HOST_DIR)/bin/edje_cc
+TERMINOLOGY_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES) efl host-pkgconf
+TERMINOLOGY_CONF_OPTS = -Dedje-cc=$(HOST_DIR)/bin/edje_cc
 
 ifeq ($(BR2_SYSTEM_ENABLE_NLS),y)
-TERMINOLOGY_MESON_OPTS += -Dnls=true
+TERMINOLOGY_CONF_OPTS += -Dnls=true
 else
-TERMINOLOGY_MESON_OPTS += -Dnls=false
+TERMINOLOGY_CONF_OPTS += -Dnls=false
 endif
 
-define TERMINOLOGY_CONFIGURE_CMDS
-	rm -rf $(@D)/build
-	mkdir -p $(@D)/build
-	$(TARGET_MAKE_ENV) meson $(TERMINOLOGY_MESON_OPTS) $(@D) $(@D)/build
-endef
-
-define TERMINOLOGY_BUILD_CMDS
-	$(TARGET_MAKE_ENV) ninja -C $(@D)/build
-endef
-
-define TERMINOLOGY_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) DESTDIR=$(TARGET_DIR) ninja -C $(@D)/build install
-endef
-
-$(eval $(generic-package))
+$(eval $(meson-package))
