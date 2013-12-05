From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 5 Dec 2013 11:17:29 +0100
Subject: [Buildroot] [git commit] udev: disable on avr32
Message-ID: <20131205101805.68A4F9BF2A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3fe55b1a2bde0015345778d319d49abce6c37eb5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

udev requires the epoll_create1 system call, which is not available on avr32.

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/network-manager/Config.in |    2 ++
 package/udev/Config.in            |    2 ++
 package/udisks/Config.in          |    2 ++
 system/Config.in                  |    3 +++
 4 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/package/network-manager/Config.in b/package/network-manager/Config.in
index 1e2a876..5513c01 100644
--- a/package/network-manager/Config.in
+++ b/package/network-manager/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_NETWORK_MANAGER
 	bool "NetworkManager"
+	depends on !BR2_avr32 # udev
 	depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
 	select BR2_PACKAGE_DBUS
 	depends on BR2_INET_IPV6
@@ -28,6 +29,7 @@ config BR2_PACKAGE_NETWORK_MANAGER
 	  http://projects.gnome.org/NetworkManager/
 
 comment "NetworkManager needs a toolchain w/ IPv6, largefile, wchar, threads"
+	depends on !BR2_avr32
 	depends on BR2_USE_MMU
 	depends on !BR2_INET_IPV6 || !BR2_LARGEFILE || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/udev/Config.in b/package/udev/Config.in
index c8aedd0..374a7bf 100644
--- a/package/udev/Config.in
+++ b/package/udev/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_UDEV
 	bool "udev"
+	depends on !BR2_avr32 # no epoll_create1
 	depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
 	depends on BR2_LARGEFILE # util-linux
 	depends on BR2_USE_WCHAR # util-linux
@@ -40,4 +41,5 @@ comment "enabling all extras needs a toolchain w/ wchar, threads"
 endif
 
 comment "udev requires /dev mgmnt set to udev under System configuration"
+	depends on !BR2_avr32
 	depends on !BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
diff --git a/package/udisks/Config.in b/package/udisks/Config.in
index 09070b4..e9539a3 100644
--- a/package/udisks/Config.in
+++ b/package/udisks/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_UDISKS
 	bool "udisks"
+	depends on !BR2_avr32 # udev
 	depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus-glib -> glib2
 	depends on BR2_USE_MMU # lvm2
@@ -36,6 +37,7 @@ config BR2_PACKAGE_UDISKS_LVM2
 endif
 
 comment "udisks needs udev /dev management and a toolchain w/ wchar, threads"
+	depends on !BR2_avr32
 	depends on BR2_USE_MMU
 	depends on !BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV || \
 		!BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/system/Config.in b/system/Config.in
index c8f2758..54c196c 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -116,15 +116,18 @@ config BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV
 
 config BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
 	bool "Dynamic using udev"
+	depends on !BR2_avr32 # udev
 	depends on BR2_LARGEFILE # udev
 	depends on BR2_USE_WCHAR # udev
 	depends on !BR2_PREFER_STATIC_LIB # udev -> kmod
 	select BR2_PACKAGE_UDEV
 
 comment "udev needs a toolchain w/ largefile, wchar"
+	depends on !BR2_avr32 # udev
 	depends on !(BR2_LARGEFILE && BR2_USE_WCHAR)
 
 comment "udev doesn't work with 'prefer static libraries'"
+	depends on !BR2_avr32 # udev
 	depends on BR2_PREFER_STATIC_LIB
 
 endchoice
