From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 25 Jul 2017 23:14:27 +0200
Subject: [Buildroot] [PATCH 06/14 v4] package/skeleton: make it a virtual
	package
In-Reply-To: <cover.1501017251.git.yann.morin.1998@free.fr>
References: <cover.1501017251.git.yann.morin.1998@free.fr>
Message-ID: <883bc421479b8bf1b384627c61425551318b6511.1501017251.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We now have two packages that can act as a skeleton, skeleton-common,
also known as our default skeleton, and skeleton-custom.

This means that the skeleton package can be a standard virtual package
now.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

---
Changes v3 -> v4:
  - drop now-legacy paragraph from the commit log  (Arnout)
---
 package/skeleton-common/Config.in          | 5 ++++-
 package/skeleton-common/skeleton-common.mk | 2 ++
 package/skeleton-custom/Config.in          | 5 ++++-
 package/skeleton-custom/skeleton-custom.mk | 2 ++
 package/skeleton/Config.in                 | 9 +++++++--
 package/skeleton/skeleton.mk               | 8 +-------
 system/Config.in                           | 4 ++++
 7 files changed, 24 insertions(+), 11 deletions(-)

diff --git a/package/skeleton-common/Config.in b/package/skeleton-common/Config.in
index 6c094f6466..5675e873cf 100644
--- a/package/skeleton-common/Config.in
+++ b/package/skeleton-common/Config.in
@@ -1,3 +1,6 @@
 config BR2_PACKAGE_SKELETON_COMMON
 	bool
-	select BR2_PACKAGE_SKELETON
+	select BR2_PACKAGE_HAS_SKELETON
+
+config BR2_PACKAGE_PROVIDES_SKELETON
+	default "skeleton-common" if BR2_PACKAGE_SKELETON_COMMON
diff --git a/package/skeleton-common/skeleton-common.mk b/package/skeleton-common/skeleton-common.mk
index 788a17dd61..ee44eaf810 100644
--- a/package/skeleton-common/skeleton-common.mk
+++ b/package/skeleton-common/skeleton-common.mk
@@ -11,6 +11,8 @@
 SKELETON_COMMON_ADD_TOOLCHAIN_DEPENDENCY = NO
 SKELETON_COMMON_ADD_SKELETON_DEPENDENCY = NO
 
+SKELETON_COMMON_PROVIDES = skeleton
+
 # The skeleton also handles the merged /usr case in the sysroot
 SKELETON_COMMON_INSTALL_STAGING = YES
 
diff --git a/package/skeleton-custom/Config.in b/package/skeleton-custom/Config.in
index b12bd8f73c..601c3b247e 100644
--- a/package/skeleton-custom/Config.in
+++ b/package/skeleton-custom/Config.in
@@ -1,3 +1,6 @@
 config BR2_PACKAGE_SKELETON_CUSTOM
 	bool
-	select BR2_PACKAGE_SKELETON
+	select BR2_PACKAGE_HAS_SKELETON
+
+config BR2_PACKAGE_PROVIDES_SKELETON
+	default "skeleton-custom" if BR2_PACKAGE_SKELETON_CUSTOM
diff --git a/package/skeleton-custom/skeleton-custom.mk b/package/skeleton-custom/skeleton-custom.mk
index ed7b7ac7c5..3d0243de4d 100644
--- a/package/skeleton-custom/skeleton-custom.mk
+++ b/package/skeleton-custom/skeleton-custom.mk
@@ -7,6 +7,8 @@
 SKELETON_CUSTOM_ADD_TOOLCHAIN_DEPENDENCY = NO
 SKELETON_CUSTOM_ADD_SKELETON_DEPENDENCY = NO
 
+SKELETON_CUSTOM_PROVIDES = skeleton
+
 SKELETON_CUSTOM_INSTALL_STAGING = YES
 
 SKELETON_CUSTOM_PATH = $(call qstrip,$(BR2_ROOTFS_SKELETON_CUSTOM_PATH))
diff --git a/package/skeleton/Config.in b/package/skeleton/Config.in
index b22ac66b35..efaa1e135f 100644
--- a/package/skeleton/Config.in
+++ b/package/skeleton/Config.in
@@ -1,4 +1,9 @@
 config BR2_PACKAGE_SKELETON
 	bool
-	help
-	  The basic skeleton for your rootfs.
+	default y
+
+config BR2_PACKAGE_HAS_SKELETON
+	bool
+
+config BR2_PACKAGE_PROVIDES_SKELETON
+	string
diff --git a/package/skeleton/skeleton.mk b/package/skeleton/skeleton.mk
index 1d3e4fbe3c..d380f41649 100644
--- a/package/skeleton/skeleton.mk
+++ b/package/skeleton/skeleton.mk
@@ -11,10 +11,4 @@
 SKELETON_ADD_TOOLCHAIN_DEPENDENCY = NO
 SKELETON_ADD_SKELETON_DEPENDENCY = NO
 
-ifeq ($(BR2_PACKAGE_SKELETON_CUSTOM),y)
-SKELETON_DEPENDENCIES = skeleton-custom
-else
-SKELETON_DEPENDENCIES = skeleton-common
-endif
-
-$(eval $(generic-package))
+$(eval $(virtual-package))
diff --git a/system/Config.in b/system/Config.in
index c27b013784..75b6a8edac 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -1,5 +1,9 @@
 menu "System configuration"
 
+# Note: usually, it is not possible to select a provider of a virtual
+# package. But here we have an exception: there are only two providers
+# and they only get selected each by separate entries in this choice.
+# So this is a safe situation.
 choice
 	prompt "Root FS skeleton"
 
-- 
2.11.0
