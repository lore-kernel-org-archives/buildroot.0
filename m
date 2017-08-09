From: Baruch Siach <baruch@tkos.co.il>
Date: Wed,  9 Aug 2017 09:59:10 +0300
Subject: [Buildroot] [PATCH 2/2] nvme: remove the udev optional dependency
In-Reply-To: <f2563e1cd77f4d5ca181a015d57d36ea3f561bc7.1502261950.git.baruch@tkos.co.il>
References: <f2563e1cd77f4d5ca181a015d57d36ea3f561bc7.1502261950.git.baruch@tkos.co.il>
Message-ID: <1892dc09ec94bf6def17ca97c64192e6e60d10b8.1502261950.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Upstream removed the udev dependent code in commit 4cbe5888f4bc (nvme-cli:
fabrics: remove libudev dependency).

Cc: Mamatha Inamdar <mamatha4@linux.vnet.ibm.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/nvme/nvme.mk | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/package/nvme/nvme.mk b/package/nvme/nvme.mk
index 27fbde215870..8eab1dacfa80 100644
--- a/package/nvme/nvme.mk
+++ b/package/nvme/nvme.mk
@@ -9,19 +9,8 @@ NVME_SITE = $(call github,linux-nvme,nvme-cli,$(NVME_VERSION))
 NVME_LICENSE = GPL-2.0+
 NVME_LICENSE_FILES = LICENSE
 
-# Yes LIBUDEV=0 means udev support enabled, LIBUDEV=1 means udev
-# support disabled.
-ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
-NVME_DEPENDENCIES += udev
-NVME_MAKE_OPTS += LIBUDEV=0
-else
-NVME_MAKE_OPTS += LIBUDEV=1
-endif
-
-# LIBUDEV=1 means that libudev is _disabled_
 define NVME_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) \
-		$(NVME_MAKE_OPTS) -C $(@D)
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
 endef
 
 define NVME_INSTALL_TARGET_CMDS
-- 
2.13.2
