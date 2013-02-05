From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 5 Feb 2013 09:00:22 +0100
Subject: [Buildroot] [git commit] lvm2: uses fork()
Message-ID: <20130205080355.6B22F9A969@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e47219ea320dc9641e5674714352b4943095919e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.org/results/cbc74e2fb5eaefac1fe17ada1dc46a5c906cc1c9

Also propagate BR2_USE_MMU to lvm2's reverse dependencies.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/dmraid/Config.in |    1 +
 package/lvm2/Config.in   |    1 +
 package/parted/Config.in |    1 +
 package/udisks/Config.in |    1 +
 4 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/dmraid/Config.in b/package/dmraid/Config.in
index 7b37244..641b17f 100644
--- a/package/dmraid/Config.in
+++ b/package/dmraid/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_DMRAID
 	bool "dmraid"
 	depends on BR2_LARGEFILE
+	depends on BR2_USE_MMU # lvm2
 	select BR2_PACKAGE_LVM2
 	help
 	  dmraid discovers, activates, deactivates and displays properties
diff --git a/package/lvm2/Config.in b/package/lvm2/Config.in
index 374de94..df9f455 100644
--- a/package/lvm2/Config.in
+++ b/package/lvm2/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LVM2
 	bool "lvm2 & device mapper"
 	depends on BR2_LARGEFILE
+	depends on BR2_USE_MMU # needs fork()
 	help
 	  This is LVM2, the rewrite of The Linux Logical Volume Manager.
 	  LVM supports enterprise level volume management of disk and disk
diff --git a/package/parted/Config.in b/package/parted/Config.in
index 7349763..6c6840d 100644
--- a/package/parted/Config.in
+++ b/package/parted/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_PARTED
 	bool "parted"
 	depends on BR2_LARGEFILE
 	depends on BR2_USE_WCHAR
+	depends on BR2_USE_MMU # lvm2
 	select BR2_PACKAGE_LVM2
 	select BR2_PACKAGE_READLINE
 	select BR2_PACKAGE_UTIL_LINUX
diff --git a/package/udisks/Config.in b/package/udisks/Config.in
index 77cbcb8..a50b3ea 100644
--- a/package/udisks/Config.in
+++ b/package/udisks/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_UDISKS
 	bool "udisks"
 	depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU # lvm2
 	select BR2_PACKAGE_UDEV
 	select BR2_PACKAGE_UDEV_ALL_EXTRAS
 	select BR2_PACKAGE_DBUS
