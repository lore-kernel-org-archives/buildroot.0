From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 11 Mar 2016 19:41:33 +0100
Subject: [Buildroot] [PATCH 4/9 v2] fs/initramfs: cleanup and enhance
	comments
In-Reply-To: <cover.1457721607.git.yann.morin.1998@free.fr>
References: <cover.1457721607.git.yann.morin.1998@free.fr>
Message-ID: <6ac9c7aa0849c05d2caf0edba9920e7f425ee20e.1457721607.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
---
 fs/initramfs/initramfs.mk | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/fs/initramfs/initramfs.mk b/fs/initramfs/initramfs.mk
index db50812..9aca9c8 100644
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
+# linux/linux.mk, via the .stamp_initramfs_rebuilt stamp file, which depends
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
 
-- 
1.9.1
