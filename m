From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  7 Jun 2015 00:20:42 +0200
Subject: [Buildroot] [PATCH 06/11] package/cryptodev-linux: use the
	kernel-module helper
In-Reply-To: <cover.1433628825.git.yann.morin.1998@free.fr>
References: <cover.1433628825.git.yann.morin.1998@free.fr>
Message-ID: <0f3d2e118ecb2c6250751eb42bebe811652ca162.1433628825.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/cryptodev-linux/cryptodev-linux.mk | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/package/cryptodev-linux/cryptodev-linux.mk b/package/cryptodev-linux/cryptodev-linux.mk
index 6f41930..02f59f8 100644
--- a/package/cryptodev-linux/cryptodev-linux.mk
+++ b/package/cryptodev-linux/cryptodev-linux.mk
@@ -6,23 +6,18 @@
 
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
