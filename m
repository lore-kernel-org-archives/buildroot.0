From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 12 Jun 2016 23:55:22 +0200
Subject: [Buildroot] [PATCH 17/24] package/skeleton: make it a virtual
	package
In-Reply-To: <cover.1465766789.git.yann.morin.1998@free.fr>
References: <cover.1465766789.git.yann.morin.1998@free.fr>
Message-ID: <46f629a8a0aa0a22eba134c5870c3e517f59cfaf.1465766789.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The skeleton package now only serves as an intermediate package to
direct to the real skeleton implementaion.

This is exactly what a virtual package is. Make it so.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/skeleton-custom/Config.in          |  4 ++++
 package/skeleton-custom/skeleton-custom.mk |  2 ++
 package/skeleton-sysv/Config.in            |  4 ++++
 package/skeleton-sysv/skeleton-sysv.mk     |  2 ++
 package/skeleton/Config.in                 | 12 ++++++++++--
 package/skeleton/skeleton.mk               | 11 ++---------
 system/Config.in                           |  2 ++
 7 files changed, 26 insertions(+), 11 deletions(-)

diff --git a/package/skeleton-custom/Config.in b/package/skeleton-custom/Config.in
index 1f3c87c..601c3b2 100644
--- a/package/skeleton-custom/Config.in
+++ b/package/skeleton-custom/Config.in
@@ -1,2 +1,6 @@
 config BR2_PACKAGE_SKELETON_CUSTOM
 	bool
+	select BR2_PACKAGE_HAS_SKELETON
+
+config BR2_PACKAGE_PROVIDES_SKELETON
+	default "skeleton-custom" if BR2_PACKAGE_SKELETON_CUSTOM
diff --git a/package/skeleton-custom/skeleton-custom.mk b/package/skeleton-custom/skeleton-custom.mk
index 8690af4..e251448 100644
--- a/package/skeleton-custom/skeleton-custom.mk
+++ b/package/skeleton-custom/skeleton-custom.mk
@@ -6,6 +6,8 @@
 
 SKELETON_CUSTOM_SOURCE =
 
+SKELETON_CUSTOM_PROVIDES = skeleton
+
 SKELETON_CUSTOM_ADD_TOOLCHAIN_DEPENDENCY = NO
 SKELETON_CUSTOM_ADD_SKELETON_DEPENDENCY = NO
 
diff --git a/package/skeleton-sysv/Config.in b/package/skeleton-sysv/Config.in
index 8c2e7dd..95c796f 100644
--- a/package/skeleton-sysv/Config.in
+++ b/package/skeleton-sysv/Config.in
@@ -1,2 +1,6 @@
 config BR2_PACKAGE_SKELETON_SYSV
 	bool
+	select BR2_PACKAGE_HAS_SKELETON
+
+config BR2_PACKAGE_PROVIDES_SKELETON
+	default "skeleton-sysv" if BR2_PACKAGE_SKELETON_SYSV
diff --git a/package/skeleton-sysv/skeleton-sysv.mk b/package/skeleton-sysv/skeleton-sysv.mk
index 0a2f51b..aa0b65c 100644
--- a/package/skeleton-sysv/skeleton-sysv.mk
+++ b/package/skeleton-sysv/skeleton-sysv.mk
@@ -6,6 +6,8 @@
 
 SKELETON_SYSV_SOURCE =
 
+SKELETON_SYSV_PROVIDES = skeleton
+
 SKELETON_SYSV_ADD_TOOLCHAIN_DEPENDENCY = NO
 SKELETON_SYSV_ADD_SKELETON_DEPENDENCY = NO
 
diff --git a/package/skeleton/Config.in b/package/skeleton/Config.in
index 6db0634..7d6841e 100644
--- a/package/skeleton/Config.in
+++ b/package/skeleton/Config.in
@@ -1,7 +1,15 @@
+# Every packages depend on the 'skeleton' package, but noone selects
+# its symbol since it is an implicit dependency. So we just force
+# that symbol to always be 'y'.
 config BR2_PACKAGE_SKELETON
 	bool
 	default y
-	select BR2_PACKAGE_SKELETON_SYSV   if BR2_ROOTFS_SKELETON_DEFAULT
-	select BR2_PACKAGE_SKELETON_CUSTOM if BR2_ROOTFS_SKELETON_CUSTOM
 	help
 	  The basic skeleton for your rootfs.
+
+config BR2_PACKAGE_HAS_SKELETON
+	bool
+
+config BR2_PACKAGE_PROVIDES_SKELETON
+	string
+	depends on BR2_PACKAGE_SKELETON
diff --git a/package/skeleton/skeleton.mk b/package/skeleton/skeleton.mk
index bd787db..b791650 100644
--- a/package/skeleton/skeleton.mk
+++ b/package/skeleton/skeleton.mk
@@ -4,13 +4,6 @@
 #
 ################################################################################
 
-# source included in buildroot
-SKELETON_SOURCE =
-
-SKELETON_DEPENDENCIES = \
-	$(if $(BR2_PACKAGE_SKELETON_SYSV),skeleton-sysv) \
-	$(if $(BR2_PACKAGE_SKELETON_CUSTOM),skeleton-custom)
-
 # The skeleton can't depend on the toolchain, since all packages depends on the
 # skeleton and the toolchain is a target package, as is skeleton.
 # Hence, skeleton would depends on the toolchain and the toolchain would depend
@@ -18,6 +11,8 @@ SKELETON_DEPENDENCIES = \
 SKELETON_ADD_TOOLCHAIN_DEPENDENCY = NO
 SKELETON_ADD_SKELETON_DEPENDENCY = NO
 
+$(eval $(virtual-package))
+
 # The following definitions are to be used by the specific skeletons:
 # - SKELETON_USR_SYMLINKS_OR_DIRS
 # - SKELETON_LIB_SYMLINK
@@ -113,5 +108,3 @@ endif
 else # !BR2_TARGET_ENABLE_ROOT_LOGIN
 SKELETON_ROOT_PASSWORD = "*"
 endif
-
-$(eval $(generic-package))
diff --git a/system/Config.in b/system/Config.in
index 3a38bd4..3792be2 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -5,11 +5,13 @@ choice
 
 config BR2_ROOTFS_SKELETON_DEFAULT
 	bool "default target skeleton"
+	select BR2_PACKAGE_SKELETON_SYSV
 	help
 	  Use default target skeleton
 
 config BR2_ROOTFS_SKELETON_CUSTOM
 	bool "custom target skeleton"
+	select BR2_PACKAGE_SKELETON_CUSTOM
 	help
 	  Use custom target skeleton.
 
-- 
2.7.4
