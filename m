From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 9 Aug 2017 23:00:57 +0200
Subject: [Buildroot] [git commit] nvme: remove the udev optional dependency
Message-ID: <20170809210702.94B41816A2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=73240a5b680d208931f0a42916b6cdaf9917ff6d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream removed the udev dependent code in commit 4cbe5888f4bc (nvme-cli:
fabrics: remove libudev dependency).

Cc: Mamatha Inamdar <mamatha4@linux.vnet.ibm.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/nvme/nvme.mk | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/package/nvme/nvme.mk b/package/nvme/nvme.mk
index 27fbde2..8eab1da 100644
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
