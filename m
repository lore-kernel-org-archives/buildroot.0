From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 2 Aug 2017 19:49:06 +0200
Subject: [Buildroot] [git commit] package/skeleton: introduce sysv,
	systemd and none specific skeletons
Message-ID: <20170802174854.5CC12821EC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c0fd0ac6558f976dcb58e92969df4925a83198b5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, we use the same skeleton for sysv-like init systems and
systemd, even though systemd has some peculiarities that makes our
default skeleton unfit.

So, we'll need to provide different skeletons (really, only part of
it) for sysv-like and systemd. In addition, in order to support the
"no init system" (BR2_INIT_NONE) use case, we introduce a "none"
skeleton.

Introduce three new skeleton packages, aptly named skeleton-sysv,
skeleton-systemd and skeleton-none. All three are providers of the
skeleton virtual package, in lieu of the skeleton-common package,
which is now a simple dependency of all three new skeletons.

Those packages are empty for now. In followup changes:
  - sysv-specific stuff will be moved out of skeleton-common and into
    skeleton-sysv;
  - systemd-specific stuff will be added to skeleton-systemd.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
[Arnout:
 - merge with the patch that enables the BR2_INIT_NONE case
 - simplify the BR2_PACKAGE_SKELETON_COMMON_ONLY select logic]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
[Thomas:
 - remove the BR2_PACKAGE_SKELETON_COMMON_ONLY logic, and instead
   introduce a separate skeleton-none package for the BR2_INIT_NONE]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                            |  3 +++
 package/skeleton-common/Config.in            |  4 ----
 package/skeleton-common/skeleton-common.mk   |  2 --
 package/skeleton-none/Config.in              |  7 +++++++
 package/skeleton-none/skeleton-none.mk       | 18 ++++++++++++++++++
 package/skeleton-systemd/Config.in           |  7 +++++++
 package/skeleton-systemd/skeleton-systemd.mk | 18 ++++++++++++++++++
 package/skeleton-sysv/Config.in              |  7 +++++++
 package/skeleton-sysv/skeleton-sysv.mk       | 18 ++++++++++++++++++
 system/Config.in                             | 11 +++++++----
 10 files changed, 85 insertions(+), 10 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 7d22b47..b5170b0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -4,6 +4,9 @@ menu "Target packages"
 	source "package/skeleton/Config.in"
 	source "package/skeleton-common/Config.in"
 	source "package/skeleton-custom/Config.in"
+	source "package/skeleton-none/Config.in"
+	source "package/skeleton-systemd/Config.in"
+	source "package/skeleton-sysv/Config.in"
 
 menu "Audio and video applications"
 	source "package/alsa-utils/Config.in"
diff --git a/package/skeleton-common/Config.in b/package/skeleton-common/Config.in
index 5675e87..9abed42 100644
--- a/package/skeleton-common/Config.in
+++ b/package/skeleton-common/Config.in
@@ -1,6 +1,2 @@
 config BR2_PACKAGE_SKELETON_COMMON
 	bool
-	select BR2_PACKAGE_HAS_SKELETON
-
-config BR2_PACKAGE_PROVIDES_SKELETON
-	default "skeleton-common" if BR2_PACKAGE_SKELETON_COMMON
diff --git a/package/skeleton-common/skeleton-common.mk b/package/skeleton-common/skeleton-common.mk
index bf75077..e9b87c3 100644
--- a/package/skeleton-common/skeleton-common.mk
+++ b/package/skeleton-common/skeleton-common.mk
@@ -11,8 +11,6 @@
 SKELETON_COMMON_ADD_TOOLCHAIN_DEPENDENCY = NO
 SKELETON_COMMON_ADD_SKELETON_DEPENDENCY = NO
 
-SKELETON_COMMON_PROVIDES = skeleton
-
 # The skeleton also handles the merged /usr case in the sysroot
 SKELETON_COMMON_INSTALL_STAGING = YES
 
diff --git a/package/skeleton-none/Config.in b/package/skeleton-none/Config.in
new file mode 100644
index 0000000..43fb3f2
--- /dev/null
+++ b/package/skeleton-none/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_SKELETON_NONE
+	bool
+	select BR2_PACKAGE_HAS_SKELETON
+	select BR2_PACKAGE_SKELETON_COMMON
+
+config BR2_PACKAGE_PROVIDES_SKELETON
+	default "skeleton-none" if BR2_PACKAGE_SKELETON_NONE
diff --git a/package/skeleton-none/skeleton-none.mk b/package/skeleton-none/skeleton-none.mk
new file mode 100644
index 0000000..9e95798
--- /dev/null
+++ b/package/skeleton-none/skeleton-none.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# skeleton-none
+#
+################################################################################
+
+# The skeleton can't depend on the toolchain, since all packages depends on the
+# skeleton and the toolchain is a target package, as is skeleton.
+# Hence, skeleton would depends on the toolchain and the toolchain would depend
+# on skeleton.
+SKELETON_NONE_ADD_TOOLCHAIN_DEPENDENCY = NO
+SKELETON_NONE_ADD_SKELETON_DEPENDENCY = NO
+
+SKELETON_NONE_DEPENDENCIES = skeleton-common
+
+SKELETON_NONE_PROVIDES = skeleton
+
+$(eval $(generic-package))
diff --git a/package/skeleton-systemd/Config.in b/package/skeleton-systemd/Config.in
new file mode 100644
index 0000000..c507264
--- /dev/null
+++ b/package/skeleton-systemd/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_SKELETON_SYSTEMD
+	bool
+	select BR2_PACKAGE_HAS_SKELETON
+	select BR2_PACKAGE_SKELETON_COMMON
+
+config BR2_PACKAGE_PROVIDES_SKELETON
+	default "skeleton-systemd" if BR2_PACKAGE_SKELETON_SYSTEMD
diff --git a/package/skeleton-systemd/skeleton-systemd.mk b/package/skeleton-systemd/skeleton-systemd.mk
new file mode 100644
index 0000000..cec6359
--- /dev/null
+++ b/package/skeleton-systemd/skeleton-systemd.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# skeleton-systemd
+#
+################################################################################
+
+# The skeleton can't depend on the toolchain, since all packages depends on the
+# skeleton and the toolchain is a target package, as is skeleton.
+# Hence, skeleton would depends on the toolchain and the toolchain would depend
+# on skeleton.
+SKELETON_SYSTEMD_ADD_TOOLCHAIN_DEPENDENCY = NO
+SKELETON_SYSTEMD_ADD_SKELETON_DEPENDENCY = NO
+
+SKELETON_SYSTEMD_DEPENDENCIES = skeleton-common
+
+SKELETON_SYSTEMD_PROVIDES = skeleton
+
+$(eval $(generic-package))
diff --git a/package/skeleton-sysv/Config.in b/package/skeleton-sysv/Config.in
new file mode 100644
index 0000000..2f6dbd9
--- /dev/null
+++ b/package/skeleton-sysv/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_SKELETON_SYSV
+	bool
+	select BR2_PACKAGE_HAS_SKELETON
+	select BR2_PACKAGE_SKELETON_COMMON
+
+config BR2_PACKAGE_PROVIDES_SKELETON
+	default "skeleton-sysv" if BR2_PACKAGE_SKELETON_SYSV
diff --git a/package/skeleton-sysv/skeleton-sysv.mk b/package/skeleton-sysv/skeleton-sysv.mk
new file mode 100644
index 0000000..b0c2b6b
--- /dev/null
+++ b/package/skeleton-sysv/skeleton-sysv.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# skeleton-sysv
+#
+################################################################################
+
+# The skeleton can't depend on the toolchain, since all packages depends on the
+# skeleton and the toolchain is a target package, as is skeleton.
+# Hence, skeleton would depends on the toolchain and the toolchain would depend
+# on skeleton.
+SKELETON_SYSV_ADD_TOOLCHAIN_DEPENDENCY = NO
+SKELETON_SYSV_ADD_SKELETON_DEPENDENCY = NO
+
+SKELETON_SYSV_DEPENDENCIES = skeleton-common
+
+SKELETON_SYSV_PROVIDES = skeleton
+
+$(eval $(generic-package))
diff --git a/system/Config.in b/system/Config.in
index 8c3f903..5716abd 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -1,15 +1,18 @@
 menu "System configuration"
 
 # Note: usually, it is not possible to select a provider of a virtual
-# package. But here we have an exception: there are only two providers
-# and they only get selected each by separate entries in this choice.
-# So this is a safe situation.
+# package. But here we have an exception: there are only four providers
+# and they only get selected by separate entries in this choice and
+# under different, exclusive conditions. So this is a safe situation.
 choice
 	prompt "Root FS skeleton"
 
 config BR2_ROOTFS_SKELETON_DEFAULT
 	bool "default target skeleton"
-	select BR2_PACKAGE_SKELETON_COMMON
+	select BR2_PACKAGE_SKELETON_SYSV if BR2_INIT_SYSV
+	select BR2_PACKAGE_SKELETON_SYSV if BR2_INIT_BUSYBOX
+	select BR2_PACKAGE_SKELETON_SYSTEMD if BR2_INIT_SYSTEMD
+	select BR2_PACKAGE_SKELETON_NONE if BR2_INIT_NONE
 	help
 	  Use default target skeleton
 
