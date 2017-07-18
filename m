From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 18 Jul 2017 19:25:43 +0200
Subject: [Buildroot] [PATCH 17/20] sytem: no-init systems may use our
	default, common skeleton
In-Reply-To: <cover.1500398733.git.yann.morin.1998@free.fr>
References: <cover.1500398733.git.yann.morin.1998@free.fr>
Message-ID: <1df0016f5de4edda2fc57e3c5a2cc26e2838d239.1500398733.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Requiring that no-init system indeed provide their own custom skeletons
is a bit too-high a burden, especially for quick one-off tests when
testing our packages.

Allow no-init systems to use our default skeleton, but only use the
common part, for the specific sysv or systemd ones are unfit.

Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/skeleton-common/Config.in | 29 +++++++++++++++++++++++++++++
 system/Config.in                  |  5 +----
 2 files changed, 30 insertions(+), 4 deletions(-)

diff --git a/package/skeleton-common/Config.in b/package/skeleton-common/Config.in
index 9abed4292a..ba0abe9d35 100644
--- a/package/skeleton-common/Config.in
+++ b/package/skeleton-common/Config.in
@@ -1,2 +1,31 @@
+# Normally, skeleton-common is a dependency of either the sysv or
+# the systemd ones, so it should not declare itself as a provider
+# for the skeleton virtual package.
+#
+# However, when one uses a no-init system (BR2_INIT_NONE), neither
+# the sysv not the systemd skeleton are enabled, so skeleton-common
+# is the one and only skeleton available, so it must declare itself
+# as a provider.
+#
+# We can safely select _HAS_SKELETON, because either we are the only
+# provider (in which case we must select it) or we were selected by
+# another skeleton which would have selected it by itself (in which
+# case us selecting _HAS_SKELETON is harmless).
+#
 config BR2_PACKAGE_SKELETON_COMMON
 	bool
+	select BR2_PACKAGE_HAS_SKELETON
+
+if BR2_PACKAGE_SKELETON_COMMON
+
+config BR2_PACKAGE_SKELETON_COMMON_ONLY
+	bool
+	default y
+	depends on !BR2_PACKAGE_SKELETON_SYSV
+	depends on !BR2_PACKAGE_SKELETON_SYSTEMD
+	depends on !BR2_PACKAGE_SKELETON_CUSTOM
+
+config BR2_PACKAGE_PROVIDES_SKELETON
+	default "skeleton-common" if BR2_PACKAGE_SKELETON_COMMON_ONLY
+
+endif
diff --git a/system/Config.in b/system/Config.in
index 65139c0bfd..4d417a93b3 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -11,16 +11,13 @@ choice
 # is most probably unfit; so, allow only the custom skeleton in that case.
 config BR2_ROOTFS_SKELETON_DEFAULT
 	bool "default target skeleton"
-	depends on !BR2_INIT_NONE
 	select BR2_PACKAGE_SKELETON_SYSV if BR2_INIT_SYSV
 	select BR2_PACKAGE_SKELETON_SYSV if BR2_INIT_BUSYBOX
 	select BR2_PACKAGE_SKELETON_SYSTEMD if BR2_INIT_SYSTEMD
+	select BR2_PACKAGE_SKELETON_COMMON if BR2_INIT_NONE
 	help
 	  Use default target skeleton
 
-comment "default target skeleton needs an init system"
-	depends on BR2_INIT_NONE
-
 config BR2_ROOTFS_SKELETON_CUSTOM
 	bool "custom target skeleton"
 	select BR2_PACKAGE_SKELETON_CUSTOM
-- 
2.11.0
