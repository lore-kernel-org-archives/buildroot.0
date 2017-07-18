From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 18 Jul 2017 19:25:41 +0200
Subject: [Buildroot] [PATCH 15/20] package/skeleton: introduce sysv- and
	systemd-specific skeletons
In-Reply-To: <cover.1500398733.git.yann.morin.1998@free.fr>
References: <cover.1500398733.git.yann.morin.1998@free.fr>
Message-ID: <4cba79eb00daaaea1bd8bdb5a49a2aefd39b390d.1500398733.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, we use the same skeleton for sysv-like init systems and
systemd, even though systemd has some peculiarities that makes out
default skeleton unfit.

So, we'll need to provide different skeletons (really, only part of it)
for sysv-like and systemd.

Introduce two new skeleton packages, aptly named skeleton-sysv and
skeleton-systemd, one for each, that are both providers of the skeleton
package, in lieue of the skeleton-common, which is now a simple
dependency of both the two new skeletons.

Those packages are empty for now. In followup changes:
  - sysv-specific stuff will be moved out of skeleton-common and into
    skeleton-sysv;
  - systemd-specific stuff will be added to skeleton-systemd.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/Config.in                            |  2 ++
 package/skeleton-common/Config.in            |  4 ----
 package/skeleton-common/skeleton-common.mk   |  2 --
 package/skeleton-systemd/Config.in           |  7 +++++++
 package/skeleton-systemd/skeleton-systemd.mk | 18 ++++++++++++++++++
 package/skeleton-sysv/Config.in              |  7 +++++++
 package/skeleton-sysv/skeleton-sysv.mk       | 18 ++++++++++++++++++
 system/Config.in                             | 10 ++++++----
 8 files changed, 58 insertions(+), 10 deletions(-)
 create mode 100644 package/skeleton-systemd/Config.in
 create mode 100644 package/skeleton-systemd/skeleton-systemd.mk
 create mode 100644 package/skeleton-sysv/Config.in
 create mode 100644 package/skeleton-sysv/skeleton-sysv.mk

diff --git a/package/Config.in b/package/Config.in
index bb068b7de8..d830cf743f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -4,6 +4,8 @@ menu "Target packages"
 	source "package/skeleton/Config.in"
 	source "package/skeleton-common/Config.in"
 	source "package/skeleton-custom/Config.in"
+	source "package/skeleton-systemd/Config.in"
+	source "package/skeleton-sysv/Config.in"
 
 menu "Audio and video applications"
 	source "package/alsa-utils/Config.in"
diff --git a/package/skeleton-common/Config.in b/package/skeleton-common/Config.in
index 5675e873cf..9abed4292a 100644
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
index 475c07e32d..57cee48931 100644
--- a/package/skeleton-common/skeleton-common.mk
+++ b/package/skeleton-common/skeleton-common.mk
@@ -11,8 +11,6 @@
 SKELETON_COMMON_ADD_TOOLCHAIN_DEPENDENCY = NO
 SKELETON_COMMON_ADD_SKELETON_DEPENDENCY = NO
 
-SKELETON_COMMON_PROVIDES = skeleton
-
 # The skeleton also handles the merged /usr case in the sysroot
 SKELETON_COMMON_INSTALL_STAGING = YES
 
diff --git a/package/skeleton-systemd/Config.in b/package/skeleton-systemd/Config.in
new file mode 100644
index 0000000000..c507264598
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
index 0000000000..cec6359007
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
index 0000000000..2f6dbd9673
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
index 0000000000..b0c2b6bac1
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
index 75b6a8edac..65139c0bfd 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -1,9 +1,9 @@
 menu "System configuration"
 
 # Note: usually, it is not possible to select a provider of a virtual
-# package. But here we have an exception: there are only two providers
-# and they only get selected each by separate entries in this choice.
-# So this is a safe situation.
+# package. But here we have an exception: there are only three providers
+# and they only get selected by separate entries in this choice and
+# under different, exclusive conditions. So this is a safe situation.
 choice
 	prompt "Root FS skeleton"
 
@@ -12,7 +12,9 @@ choice
 config BR2_ROOTFS_SKELETON_DEFAULT
 	bool "default target skeleton"
 	depends on !BR2_INIT_NONE
-	select BR2_PACKAGE_SKELETON_COMMON
+	select BR2_PACKAGE_SKELETON_SYSV if BR2_INIT_SYSV
+	select BR2_PACKAGE_SKELETON_SYSV if BR2_INIT_BUSYBOX
+	select BR2_PACKAGE_SKELETON_SYSTEMD if BR2_INIT_SYSTEMD
 	help
 	  Use default target skeleton
 
-- 
2.11.0
