From: Andreas Naumann <anaumann@ultratronik.de>
Date: Thu,  8 Nov 2018 14:04:16 +0100
Subject: [Buildroot] [PATCH 1/2] fs: Add common rootfs dependencies to
 PACKAGES
In-Reply-To: <20181108130417.1277-1-anaumann@ultratronik.de>
References: <20181108130417.1277-1-anaumann@ultratronik.de>
Message-ID: <20181108130417.1277-2-anaumann@ultratronik.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Up to now only the filesystem-specific dependencies are explicitely
added to PACKAGES. The common dependencies, e.g. host-fakeroot, were
built indirectly via the rootfs-common/rootfs-tar dependency.

However, when switching to per-package host/target, we need to assemble
the global host from the per-package folders. In order to do this by
looping through PACKAGES, we need to directly add the common rootfs
dependencies.
That way then the filesystem recipes may continue to use these tools
from the global host directory.

Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
---
 fs/common.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/common.mk b/fs/common.mk
index 2a5a202a89..a4a178c88a 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -65,6 +65,7 @@ ROOTFS_COMMON_DEPENDENCIES = \
 	host-fakeroot host-makedevs \
 	$(BR2_TAR_HOST_DEPENDENCY) \
 	$(if $(PACKAGES_USERS)$(ROOTFS_USERS_TABLES),host-mkpasswd)
+PACKAGES += $(ROOTFS_COMMON_DEPENDENCIES)
 
 $(ROOTFS_COMMON_TAR): ROOTFS=COMMON
 $(ROOTFS_COMMON_TAR): FAKEROOT_SCRIPT=$(FS_DIR)/fakeroot.fs
-- 
2.19.1
