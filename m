From: James Knight <james.knight@rockwellcollins.com>
Date: Mon, 25 May 2015 12:55:25 -0400
Subject: [Buildroot] [PATCH 1/1] system: rootfs remount feature doesn't
	apply to systemd
Message-ID: <1432572925-956-1-git-send-email-james.knight@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The ability to configure a system to remount a typical read-only mounted
root as read-write is achieved by adjusting the option
BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW. The option alters the
`/etc/inittab` file.

Under systemd, inittab is not used. Adjusting REMOUNT_ROOTFS_RW will not
affect the result of a built target. There is also a risk that if a
building target removed the inittab file before the target finalization
occurs, the build process can fail (ex. removing any generated inittab
file during a post-build script will result in a build failure).

Signed-off-by: James Knight <james.knight@rockwellcollins.com>
---
 system/Config.in | 1 +
 system/system.mk | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/system/Config.in b/system/Config.in
index 84cde94..7834ee6 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -300,6 +300,7 @@ endif
 config BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW
 	bool "remount root filesystem read-write during boot"
 	default y
+	depends on !BR2_INIT_SYSTEMD
 	help
 	  The root filesystem is typically mounted read-only at boot.
 	  By default, buildroot remounts it in read-write mode early during the
diff --git a/system/system.mk b/system/system.mk
index c95e436..b4e503f 100644
--- a/system/system.mk
+++ b/system/system.mk
@@ -105,6 +105,7 @@ endif
 TARGET_FINALIZE_HOOKS += SYSTEM_GETTY
 endif
 
+ifneq ($(BR2_INIT_SYSTEMD),y)
 ifeq ($(BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW),y)
 # Find commented line, if any, and remove leading '#'s
 define SYSTEM_REMOUNT_RW
@@ -117,5 +118,6 @@ define SYSTEM_REMOUNT_RW
 endef
 endif
 TARGET_FINALIZE_HOOKS += SYSTEM_REMOUNT_RW
+endif
 
 endif # BR2_ROOTFS_SKELETON_DEFAULT
-- 
1.9.5.msysgit.1
