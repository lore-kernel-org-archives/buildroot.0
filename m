From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 19 May 2018 17:37:32 +0200
Subject: [Buildroot] [PATCH for-next] package/terminology: bump version to
 1.2.1
Message-ID: <20180519153732.17320-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Switch to meson build system introduced with 1.2.0 release.
Handle NLS option with BR2_SYSTEM_ENABLE_NLS.
Add license file hash.

See release note:
(1.2.0) https://sourceforge.net/p/enlightenment/mailman/message/36294478/
(1.2.1) https://sourceforge.net/p/enlightenment/mailman/message/36317484/

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/terminology/terminology.hash |  5 +++--
 package/terminology/terminology.mk   | 32 ++++++++++++++++++++++++++++----
 2 files changed, 31 insertions(+), 6 deletions(-)

diff --git a/package/terminology/terminology.hash b/package/terminology/terminology.hash
index 81ae5d8d61..f341d5c2f7 100644
--- a/package/terminology/terminology.hash
+++ b/package/terminology/terminology.hash
@@ -1,2 +1,3 @@
-# From https://sourceforge.net/p/enlightenment/mailman/message/36026490/
-sha256	da12b8a24ca5248b2d292d9b1e19cabc61ae29b21f96d4b6f4f3e7b4feeecc16	terminology-1.1.1.tar.xz
+# From https://sourceforge.net/p/enlightenment/mailman/message/36317484/
+sha256  ac8673a129ed78ef669a8c04e7a136f5ca95226ce5ef375a451421bac41828c6  terminology-1.2.1.tar.xz
+sha256  605988548c7a52562d6f64d936a579b53f690e62ca92261b6a440bf9023ff521  COPYING
diff --git a/package/terminology/terminology.mk b/package/terminology/terminology.mk
index ed811b3a85..af37187d90 100644
--- a/package/terminology/terminology.mk
+++ b/package/terminology/terminology.mk
@@ -4,13 +4,37 @@
 #
 ################################################################################
 
-TERMINOLOGY_VERSION = 1.1.1
+TERMINOLOGY_VERSION = 1.2.1
 TERMINOLOGY_SOURCE = terminology-$(TERMINOLOGY_VERSION).tar.xz
 TERMINOLOGY_SITE = https://download.enlightenment.org/rel/apps/terminology
 TERMINOLOGY_LICENSE = BSD-2-Clause
 TERMINOLOGY_LICENSE_FILES = COPYING
 
-TERMINOLOGY_DEPENDENCIES = efl host-pkgconf
-TERMINOLOGY_CONF_OPTS = --with-edje-cc=$(HOST_DIR)/bin/edje_cc
+TERMINOLOGY_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES) efl host-meson host-pkgconf
+TERMINOLOGY_MESON_OPTS = \
+	--prefix=/usr \
+	--buildtype=$(if $(BR2_ENABLE_DEBUG),debug,release) \
+	--cross-file=$(HOST_DIR)/etc/meson/cross-compilation.conf \
+	-Dedje-cc=$(HOST_DIR)/bin/edje_cc
 
-$(eval $(autotools-package))
+ifeq ($(BR2_SYSTEM_ENABLE_NLS),y)
+TERMINOLOGY_MESON_OPTS += -Dnls=true
+else
+TERMINOLOGY_MESON_OPTS += -Dnls=false
+endif
+
+define TERMINOLOGY_CONFIGURE_CMDS
+	rm -rf $(@D)/build
+	mkdir -p $(@D)/build
+	$(TARGET_MAKE_ENV) meson $(TERMINOLOGY_MESON_OPTS) $(@D) $(@D)/build
+endef
+
+define TERMINOLOGY_BUILD_CMDS
+	$(TARGET_MAKE_ENV) ninja -C $(@D)/build
+endef
+
+define TERMINOLOGY_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) DESTDIR=$(TARGET_DIR) ninja -C $(@D)/build install
+endef
+
+$(eval $(generic-package))
-- 
2.14.3
