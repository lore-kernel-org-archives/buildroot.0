From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Nov 2017 11:50:42 +0100
Subject: [Buildroot] [git commit branch/next] fs/initramfs: cleanups,
 enhance comments
Message-ID: <20171201162321.76B708151C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0a49b49e0a7df15347ccf9fa03c618639e9947b9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

rootfs-initramfs is not using the generic fs infrastructure, because
there is virtually nothing to do to build the initramfs image: there is
no actual image to be built to begin with.

The only purpose of rootfs-initramfs is to ensure the rootfs.cpio image
is built and then that the Linux kernel is rebuilt with that rootfs.cpio
as initramfs source.

Using variables of the fs infra like if it were used is misleading. It
looked nice as long as there was the possibility that rootfs-initramfs
would one day use the fs infra. But there's no way that will happen any
time soon.

Furthermore, the linux' rule linux-rebuild-with-initramfs now already
depends on rootfs-cpio by itself, so we need not duplicate this
dependency in rootfs-initramfs.

Still, we want to advertise that the dependency is on rootfs-cpio, so
we get nice dependency graphs (and not expose the internal
linux-rebuild-with-initramfs rule to the users).

So, remove the variables and directly define the rules.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Romain Naour <romain.naour@openwide.fr>
Reviewed-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 fs/initramfs/initramfs.mk | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/fs/initramfs/initramfs.mk b/fs/initramfs/initramfs.mk
index db50812..b8dee18 100644
--- a/fs/initramfs/initramfs.mk
+++ b/fs/initramfs/initramfs.mk
@@ -5,17 +5,25 @@
 #
 ################################################################################
 
-ROOTFS_INITRAMFS_DEPENDENCIES += rootfs-cpio
-
-ROOTFS_INITRAMFS_POST_TARGETS += linux-rebuild-with-initramfs
-
-
 # The generic fs infrastructure isn't very useful here.
+#
+# The initramfs image does not actually build an image; its only purpose is:
+# 1- to ensure rootfs.cpio is generated,
+# 2- to then rebuild the kernel with rootfs.cpio as initramfs
+#
+# Note: ordering of the dependencies is not guaranteed here, but in
+# linux/linux.mk, via the linux-rebuild-with-initramfs rule, which depends
+# on the rootfs-cpio filesystem rule.
+#
+# Note: the trick here is that we directly depend on rebuilding the Linux
+# kernel image (which itself depends on the rootfs-cpio rule), while we
+# advertise that our dependency is on the rootfs-cpio rule, which is
+# cleaner in the dependency graph.
 
-rootfs-initramfs: $(ROOTFS_INITRAMFS_DEPENDENCIES) $(ROOTFS_INITRAMFS_POST_TARGETS)
+rootfs-initramfs: linux-rebuild-with-initramfs
 
 rootfs-initramfs-show-depends:
-	@echo $(ROOTFS_INITRAMFS_DEPENDENCIES)
+	@echo rootfs-cpio
 
 .PHONY: rootfs-initramfs rootfs-initramfs-show-depends
 
