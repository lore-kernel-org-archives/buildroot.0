From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Jul 2015 10:13:18 +0200
Subject: [Buildroot] [git commit] system: fix BR2_INIT_NONE /
	BR2_INIT_SYSTEMD build
Message-ID: <20150714081749.9DC1A80E2A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ddc63be5294af5418207564ffb5ab1ecc3f9b055
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Following the introduction of the initscripts package in commit
89d39fc7a392530be043bac541ade0bef746edb6 ("initscripts: new package"),
the /etc/inittab file is no longer part of the skeleton, and therefore
is not always installed.

However, system/system.mk tweaks the inittab for getty and filesystem
remount as rw, without taking the precautions of whether the init
system is Busybox or SysV. This commit fixes that by adding the
necessary conditions around the code adjusting the inittab file.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 system/system.mk |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/system/system.mk b/system/system.mk
index fd94e03..e44f64c 100644
--- a/system/system.mk
+++ b/system/system.mk
@@ -89,14 +89,14 @@ endif
 TARGET_FINALIZE_HOOKS += SYSTEM_BIN_SH
 
 ifeq ($(BR2_TARGET_GENERIC_GETTY),y)
-ifeq ($(BR2_PACKAGE_SYSVINIT),y)
+ifeq ($(BR2_INIT_SYSV),y)
 # In sysvinit inittab, the "id" must not be longer than 4 bytes, so we
 # skip the "tty" part and keep only the remaining.
 define SYSTEM_GETTY
 	$(SED) '/# GENERIC_SERIAL$$/s~^.*#~$(shell echo $(TARGET_GENERIC_GETTY_PORT) | tail -c+4)::respawn:/sbin/getty -L $(TARGET_GENERIC_GETTY_OPTIONS) $(TARGET_GENERIC_GETTY_PORT) $(TARGET_GENERIC_GETTY_BAUDRATE) $(TARGET_GENERIC_GETTY_TERM) #~' \
 		$(TARGET_DIR)/etc/inittab
 endef
-else
+else ifeq ($(BR2_INIT_BUSYBOX),y)
 # Add getty to busybox inittab
 define SYSTEM_GETTY
 	$(SED) '/# GENERIC_SERIAL$$/s~^.*#~$(TARGET_GENERIC_GETTY_PORT)::respawn:/sbin/getty -L $(TARGET_GENERIC_GETTY_OPTIONS) $(TARGET_GENERIC_GETTY_PORT) $(TARGET_GENERIC_GETTY_BAUDRATE) $(TARGET_GENERIC_GETTY_TERM) #~' \
@@ -106,6 +106,7 @@ endif
 TARGET_FINALIZE_HOOKS += SYSTEM_GETTY
 endif
 
+ifeq ($(BR2_INIT_BUSYBOX)$(BR2_INIT_SYSV),y)
 ifeq ($(BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW),y)
 # Find commented line, if any, and remove leading '#'s
 define SYSTEM_REMOUNT_RW
@@ -118,5 +119,6 @@ define SYSTEM_REMOUNT_RW
 endef
 endif
 TARGET_FINALIZE_HOOKS += SYSTEM_REMOUNT_RW
+endif
 
 endif # BR2_ROOTFS_SKELETON_DEFAULT
