From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 1 Nov 2018 22:01:46 +0100
Subject: [Buildroot] [git commit] fs/common: always depend on build host-tar
 if needed
Message-ID: <20181101210018.CD644870DC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=89c92487cf3268fd679e1b92bfad85fedcde22e4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, the filesystems do not depend on building host-tar when it
is needed, even though all of them have to extract the intermediate
tarball.

However, in degenerate (but legally valid) configurations with no
user-selectable package selected, host-tar would not be built, so the
rootfs images would use whatever improper tar the system has.

Add the conditional dependency to host-tar to the rootfs-common
intermediate image. Since this is the internal step that all real rootfs
generators depend on, they now properly depend on host-tar when needed.

In practice, when host-tar is needed, it will always be built before the
rootfs images, because it is a dependency of all packages (except a very
few, like the skeleton), of which host-fakeroot, which is a mandatory
dependency of rootfs-comon anyway. But for consistency sake, let's
explicitly add host-tar as a dependency to rootfs-common too.

Note that rootfs-tar already had that dependency, and we leave it as-is
because it is semantically correct, even if superfluous.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 fs/common.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/common.mk b/fs/common.mk
index 453da6010a..2a5a202a89 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -63,6 +63,7 @@ ROOTFS_COMMON_TARGET_DIR = $(FS_DIR)/target
 
 ROOTFS_COMMON_DEPENDENCIES = \
 	host-fakeroot host-makedevs \
+	$(BR2_TAR_HOST_DEPENDENCY) \
 	$(if $(PACKAGES_USERS)$(ROOTFS_USERS_TABLES),host-mkpasswd)
 
 $(ROOTFS_COMMON_TAR): ROOTFS=COMMON
