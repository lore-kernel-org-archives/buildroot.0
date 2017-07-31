From: Dave Bender <codehero@gmail.com>
Date: Sun, 30 Jul 2017 22:59:24 -0400
Subject: [Buildroot] squashfs-fuse: new package
Message-ID: <CAETHaKp82wP9fk=hFVp2--GBauJBoefW5VD=zVpp-7nJojJZGA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added FUSE squashfs utilities

Signed-off-by: David Bender <codehero@gmail.com>
---
 package/Config.in                      |  1 +
 package/squashfs-fuse/Config.in        | 14 ++++++++++++++
 package/squashfs-fuse/squashfs-fuse.mk | 14 ++++++++++++++
 3 files changed, 29 insertions(+)
 create mode 100644 package/squashfs-fuse/Config.in
 create mode 100644 package/squashfs-fuse/squashfs-fuse.mk

diff --git a/package/Config.in b/package/Config.in
index 9e90d98..2691a47 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -191,6 +191,7 @@ menu "Filesystem and flash utilities"
  source "package/sunxi-tools/Config.in"
  source "package/unionfs/Config.in"
  source "package/xfsprogs/Config.in"
+ source "package/squashfs-fuse/Config.in"
 endmenu

 menu "Fonts, cursors, icons, sounds and themes"
diff --git a/package/squashfs-fuse/Config.in b/package/squashfs-fuse/Config.in
new file mode 100644
index 0000000..b5f3537
--- /dev/null
+++ b/package/squashfs-fuse/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_SQUASHFS_FUSE
+ bool "squashfs (FUSE)"
+ select BR2_PACKAGE_LIBFUSE
+ depends on BR2_TOOLCHAIN_HAS_THREADS # libfuse
+ depends on BR2_USE_MMU # libfuse
+ depends on !BR2_STATIC_LIBS # libfuse
+ help
+  A userspace squashfs implementation.
+
+ https://github.com/vasi/squashfuse
+
+comment "squashfs needs a toolchain w/ threads, dynamic library"
+ depends on BR2_USE_MMU
+ depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/squashfs-fuse/squashfs-fuse.mk
b/package/squashfs-fuse/squashfs-fuse.mk
new file mode 100644
index 0000000..812a197
--- /dev/null
+++ b/package/squashfs-fuse/squashfs-fuse.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# Squashfs-fuse
+#
+################################################################################
+
+SQUASHFS_FUSE_VERSION = 1f980303b89c779eabfd0a0fdd36d6a7a311bf92
+SQUASHFS_FUSE_SITE = $(call github,vasi,squashfuse,$(SQUASHFS_FUSE_VERSION))
+SQUASHFS_FUSE_DEPENDENCIES = libfuse host-pkgconf
+SQUASHFS_FUSE_LICENSE = BSD-2c
+SQUASHFS_FUSE_LICENSE_FILES = LICENSE
+SQUASHFS_FUSE_AUTORECONF = YES
+
+$(eval $(autotools-package))
-- 
2.10.2
