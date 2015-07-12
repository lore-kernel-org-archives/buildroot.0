From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 12 Jul 2015 02:21:36 +0200
Subject: [Buildroot] [PATCH 06/11 v3] package/cryptodev-linux: use the
	kernel-module helper
In-Reply-To: <cover.1436660369.git.yann.morin.1998@free.fr>
References: <cover.1436660369.git.yann.morin.1998@free.fr>
Message-ID: <d96a880b7d6775e63855ba64ca7276d79ea29368.1436660369.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The kernel module needs the version.h headers at build-time, but the
Makefile only generates it when the module is built with that Makefile,
because it has this rule:

    build: version.h
        make ${KERNEL_MAKE_OPTS} modules

So, we must explicitly build this header, which we do in a pre-build hook
to ensure it comes before the kernel-module's own hooks. This header needs
not be installed in staging.

However, the cryptodev.h header still needs to be installed in staging,
which we still do in a staging-install command.

The KERNEL_DIR and PREFIX variables are no longer needed, because we're
no longer calling the rules that needed them (build, above, and
modules_install, both now handled by the kernel-module infra).

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
[Doug: add pre-build hook to build version.h]
Signed-off-by: Doug Kehn <rdkehn@yahoo.com>

---
Changes v2 -> v3;
  - expand commit log  (Arnout, Doug)
  - PREFIX and KERNEL_DIR are not needed  (Arnout)
  - rename hook

Changes v1 -> v2:
  - fix missing version.h  (Doug)
---
 package/cryptodev-linux/cryptodev-linux.mk | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/package/cryptodev-linux/cryptodev-linux.mk b/package/cryptodev-linux/cryptodev-linux.mk
index 6f41930..6001c71 100644
--- a/package/cryptodev-linux/cryptodev-linux.mk
+++ b/package/cryptodev-linux/cryptodev-linux.mk
@@ -6,23 +6,19 @@
 
 CRYPTODEV_LINUX_VERSION = 1.7
 CRYPTODEV_LINUX_SITE = http://download.gna.org/cryptodev-linux
-CRYPTODEV_LINUX_DEPENDENCIES = linux
 CRYPTODEV_LINUX_INSTALL_STAGING = YES
 CRYPTODEV_LINUX_LICENSE = GPLv2+
 CRYPTODEV_LINUX_LICENSE_FILES = COPYING
 
-define CRYPTODEV_LINUX_BUILD_CMDS
-	$(MAKE) -C $(@D) $(LINUX_MAKE_FLAGS) KERNEL_DIR=$(LINUX_DIR)
-endef
-
-define CRYPTODEV_LINUX_INSTALL_TARGET_CMDS
-	$(MAKE) -C $(@D) $(LINUX_MAKE_FLAGS) KERNEL_DIR=$(LINUX_DIR) \
-		PREFIX=$(TARGET_DIR) modules_install
+define CRYPTODEV_LINUX_MODULE_GEN_VERSION_H
+	$(MAKE) -C $(@D) version.h
 endef
+CRYPTODEV_LINUX_PRE_BUILD_HOOKS += CRYPTODEV_LINUX_MODULE_GEN_VERSION_H
 
 define CRYPTODEV_LINUX_INSTALL_STAGING_CMDS
 	$(INSTALL) -D -m 644 $(@D)/crypto/cryptodev.h \
 		$(STAGING_DIR)/usr/include/crypto/cryptodev.h
 endef
 
+$(eval $(kernel-module))
 $(eval $(generic-package))
-- 
1.9.1
