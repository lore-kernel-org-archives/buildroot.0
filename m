From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Jul 2015 11:56:18 +0200
Subject: [Buildroot] [git commit] package/cryptodev-linux: use the
	kernel-module helper
Message-ID: <20150712095704.7F44F8010C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=be2b20be6e9a7478f3fc2ee162b85e8b75f6d5fe
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cryptodev-linux/cryptodev-linux.mk |   12 ++++--------
 1 files changed, 4 insertions(+), 8 deletions(-)

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
