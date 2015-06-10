From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 10 Jun 2015 21:22:10 +0200
Subject: [Buildroot] [PATCH 06/11 v2] package/cryptodev-linux: use the
	kernel-module helper
In-Reply-To: <cover.1433964001.git.yann.morin.1998@free.fr>
References: <cover.1433964001.git.yann.morin.1998@free.fr>
Message-ID: <329d95315f937a0cbd912b8035fb0ccc0e94a9ed.1433964001.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
[Doug: add pre-build hook to build version.h]
Signed-off-by: Doug Kehn <rdkehn@yahoo.com>

---
Cyhanges v1 -> v2:
  - fix missing version.h  (Doug)
---
 package/cryptodev-linux/cryptodev-linux.mk | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/cryptodev-linux/cryptodev-linux.mk b/package/cryptodev-linux/cryptodev-linux.mk
index 6f41930..6eec602 100644
--- a/package/cryptodev-linux/cryptodev-linux.mk
+++ b/package/cryptodev-linux/cryptodev-linux.mk
@@ -6,23 +6,23 @@
 
 CRYPTODEV_LINUX_VERSION = 1.7
 CRYPTODEV_LINUX_SITE = http://download.gna.org/cryptodev-linux
-CRYPTODEV_LINUX_DEPENDENCIES = linux
 CRYPTODEV_LINUX_INSTALL_STAGING = YES
 CRYPTODEV_LINUX_LICENSE = GPLv2+
 CRYPTODEV_LINUX_LICENSE_FILES = COPYING
 
-define CRYPTODEV_LINUX_BUILD_CMDS
-	$(MAKE) -C $(@D) $(LINUX_MAKE_FLAGS) KERNEL_DIR=$(LINUX_DIR)
+define CRYPTODEV_LINUX_VERSION_H
+	$(MAKE) -C $(@D) version.h
 endef
+CRYPTODEV_LINUX_PRE_BUILD_HOOKS += CRYPTODEV_LINUX_VERSION_H
 
-define CRYPTODEV_LINUX_INSTALL_TARGET_CMDS
-	$(MAKE) -C $(@D) $(LINUX_MAKE_FLAGS) KERNEL_DIR=$(LINUX_DIR) \
-		PREFIX=$(TARGET_DIR) modules_install
-endef
+CRYPTODEV_LINUX_MODULE_MAKE_OPTS = \
+	KERNEL_DIR=$(LINUX_DIR) \
+	PREFIX=$(TARGET_DIR)
 
 define CRYPTODEV_LINUX_INSTALL_STAGING_CMDS
 	$(INSTALL) -D -m 644 $(@D)/crypto/cryptodev.h \
 		$(STAGING_DIR)/usr/include/crypto/cryptodev.h
 endef
 
+$(eval $(kernel-module))
 $(eval $(generic-package))
-- 
1.9.1
