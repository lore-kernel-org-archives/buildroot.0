From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 2 Aug 2017 00:52:20 +0200
Subject: [Buildroot] [PATCH v5 10/14] package/skeleton: introduce sysv- and
	systemd-specific skeletons
In-Reply-To: <20170801225224.16899-1-arnout@mind.be>
References: <20170801225224.16899-1-arnout@mind.be>
Message-ID: <20170801225224.16899-11-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

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

skeleton-common remains the provider for the BR2_INIT_NONE case, so
add BR2_PACKAGE_SKELETON_COMMON_ONLY to cover this case.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
[Arnout:
 - merge with the patch that enables the BR2_INIT_NONE case
 - simplify the BR2_PACKAGE_SKELETON_COMMON_ONLY select logic]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
Changes v4 -> v5: (Arnout)
 - merge with the patch that enables the BR2_INIT_NONE case
 - simplify the BR2_PACKAGE_SKELETON_COMMON_ONLY select logic

Changes v3 -> v4:
  - select BR2_PACKAGE_HAS_SKELETON from BR2_PACKAGE_SKELETON_COMMON_ONLY,
    drop now-unneeded comment  (Arnout)
---
 package/Config.in                            |  2 ++
 package/skeleton-common/Config.in            | 13 ++++++++++++-
 package/skeleton-common/skeleton-common.mk   |  2 --
 package/skeleton-systemd/Config.in           |  7 +++++++
 package/skeleton-systemd/skeleton-systemd.mk | 18 ++++++++++++++++++
 package/skeleton-sysv/Config.in              |  7 +++++++
 package/skeleton-sysv/skeleton-sysv.mk       | 18 ++++++++++++++++++
 system/Config.in                             | 11 +++++++----
 8 files changed, 71 insertions(+), 7 deletions(-)
 create mode 100644 package/skeleton-systemd/Config.in
 create mode 100644 package/skeleton-systemd/skeleton-systemd.mk
 create mode 100644 package/skeleton-sysv/Config.in
 create mode 100644 package/skeleton-sysv/skeleton-sysv.mk

diff --git a/package/Config.in b/package/Config.in
index 7d22b47f5c..8e0717cd90 100644
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
index 5675e873cf..e18d6d0ff0 100644
--- a/package/skeleton-common/Config.in
+++ b/package/skeleton-common/Config.in
@@ -1,6 +1,17 @@
 config BR2_PACKAGE_SKELETON_COMMON
 	bool
+
+# skeleton-common is normally a dependency of another skeleton.
+# BR2_PACKAGE_SKELETON_COMMON_ONLY can be selected if skeleton-common
+# is the only provider of the skeleton.
+config BR2_PACKAGE_SKELETON_COMMON_ONLY
+	bool
+	select BR2_PACKAGE_SKELETON_COMMON
 	select BR2_PACKAGE_HAS_SKELETON
 
+if BR2_PACKAGE_SKELETON_COMMON_ONLY
+
 config BR2_PACKAGE_PROVIDES_SKELETON
-	default "skeleton-common" if BR2_PACKAGE_SKELETON_COMMON
+	default "skeleton-common"
+
+endif
diff --git a/package/skeleton-common/skeleton-common.mk b/package/skeleton-common/skeleton-common.mk
index bf75077a85..e9b87c3fd3 100644
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
index 8c3f903bdc..6d2d10269e 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -1,15 +1,18 @@
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
 
 config BR2_ROOTFS_SKELETON_DEFAULT
 	bool "default target skeleton"
-	select BR2_PACKAGE_SKELETON_COMMON
+	select BR2_PACKAGE_SKELETON_SYSV if BR2_INIT_SYSV
+	select BR2_PACKAGE_SKELETON_SYSV if BR2_INIT_BUSYBOX
+	select BR2_PACKAGE_SKELETON_SYSTEMD if BR2_INIT_SYSTEMD
+	select BR2_PACKAGE_SKELETON_COMMON_ONLY if BR2_INIT_NONE
 	help
 	  Use default target skeleton
 
-- 
2.13.3
