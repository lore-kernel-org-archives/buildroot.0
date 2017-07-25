From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 25 Jul 2017 23:14:31 +0200
Subject: [Buildroot] [PATCH 10/14 v4] system: no-init systems may use our
	default, common skeleton
In-Reply-To: <cover.1501017251.git.yann.morin.1998@free.fr>
References: <cover.1501017251.git.yann.morin.1998@free.fr>
Message-ID: <20f52116161fe387fe6d4107abec88491503c96d.1501017251.git.yann.morin.1998@free.fr>
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
Cc: Arnout Vandecappelle <arnout@mind.be>

---
Changes v3 -> v4:
  - select BR2_PACKAGE_HAS_SKELETON from BR2_PACKAGE_SKELETON_COMMON_ONLY,
    drop now-unneeded comment  (Arnout)
---
 package/skeleton-common/Config.in | 15 +++++++++++++++
 system/Config.in                  |  5 +----
 2 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/package/skeleton-common/Config.in b/package/skeleton-common/Config.in
index 9abed4292a..fc9d818e37 100644
--- a/package/skeleton-common/Config.in
+++ b/package/skeleton-common/Config.in
@@ -1,2 +1,17 @@
 config BR2_PACKAGE_SKELETON_COMMON
 	bool
+
+if BR2_PACKAGE_SKELETON_COMMON
+
+config BR2_PACKAGE_SKELETON_COMMON_ONLY
+	bool
+	default y
+	depends on !BR2_PACKAGE_SKELETON_SYSV
+	depends on !BR2_PACKAGE_SKELETON_SYSTEMD
+	depends on !BR2_PACKAGE_SKELETON_CUSTOM
+	select BR2_PACKAGE_HAS_SKELETON
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
