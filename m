From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 21 Apr 2018 11:10:56 +0200
Subject: [Buildroot] [PATCH 7/7] fs: always depend on build host-tar if
 needed
In-Reply-To: <cover.1524301847.git.yann.morin.1998@free.fr>
References: <cover.1524301847.git.yann.morin.1998@free.fr>
Message-ID: <021f6b14835ca89bc6ecb4b36aa09fd246f7d896.1524301847.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, the filesystems do not depend on building host-tar when it is
needed, even though all of them have to extract the intermediate tarball.

However, in degenerate (but legally valid) configurations with no
user-selectable package selected, host-tar would not be built, so the
rootfs images would use whatever improper tar the system has.

Add the conditional dependency to host-tar to the rootfs-common
intermediate image. Since this is the internal step that all real rootfs
generators depend on, they now properly depend on host-tar when needed.

In practice, when host-tar is needed, it will always be built before the
rootfs inages, because it is a dependency of all packages (except a very
few, like the skeleton), of which host-fakeroot, which is a mandatory
dependency of rootfs-comon anyway. But for consistency sake, let's
explicitly add host-tar as a dependency to rootfs-common too.

Note that rootfs-tar already had that dependency, and we leave it as-is
because it is semantically correct, even if superfluous.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

---
Note: yes, I had a randpackageconfig turn up a configuration with no
user-selectable package enabled... I should just stop coding and go
play bingo. Too bad there is no big jackpot tonight... ;-]
---
 fs/common.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/common.mk b/fs/common.mk
index 9baf367729..d106783813 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -63,6 +63,7 @@ ROOTFS_COMMON_TARGET_DIR = $(FS_DIR)/target
 
 ROOTFS_COMMON_DEPENDENCIES = \
 	host-fakeroot host-makedevs \
+	$(BR2_TAR_HOST_DEPENDENCY) \
 	$(if $(PACKAGES_USERS)$(ROOTFS_USERS_TABLES),host-mkpasswd)
 
 $(ROOTFS_COMMON_TAR): ROOTFS=COMMON
-- 
2.14.1
