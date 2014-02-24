From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 24 Feb 2014 09:01:05 +0100
Subject: [Buildroot] [git commit] util-linux: libblkid needs fork(),
	disable on !MMU
Message-ID: <20140224083833.8227999B79@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a8da3cd61aafd3e2fd44b87725fcc14b60b93be8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The libblkid library in util-linux uses fork. While it seems
potentially possible to disable the parts of the library that use fork
(the only parts using fork are parts related to LVM and Device Mapper,
which are said to be legacy as they are replaced by sysfs based
scanning, instead of having to fork to run a separate process).

However, since libblkid is used by:

 - e2fsprogs, which uses lots of fork all over the place
 - udev, which most likely will also need fork

There is not much point in making libblkid fork-less. As a
consequence, this commit makes util-linux/libblkid unavailable on
non-MMU architectures, and propagates the relevant dependency to the
reverse dependencies of libblkid.

This fixes the e2fsprogs build failure seen on Blackfin. The failure
was due to a configure test of e2fsprogs which was trying to link a
small test program against libblkid, which failed because there was an
undefined reference to fork() in the libblkid code.

Fixes:

  http://autobuild.buildroot.net/results/ee2c1568d16ac040011dd4d6d8b543ff9e9e2622/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cryptsetup/Config.in |    2 +-
 package/e2fsprogs/Config.in  |    1 +
 package/udev/Config.in       |    1 +
 package/util-linux/Config.in |    2 ++
 system/Config.in             |    1 +
 5 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/package/cryptsetup/Config.in b/package/cryptsetup/Config.in
index 9fbe74c..8405963 100644
--- a/package/cryptsetup/Config.in
+++ b/package/cryptsetup/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_CRYPTSETUP
 	select BR2_PACKAGE_E2FSPROGS
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	depends on BR2_LARGEFILE # lvm2, util-linux
-	depends on BR2_USE_MMU # lvm2
+	depends on BR2_USE_MMU # lvm2, e2fsprogs
 	depends on !BR2_PREFER_STATIC_LIB # lvm2
 	depends on BR2_USE_WCHAR # util-linux
 	help
diff --git a/package/e2fsprogs/Config.in b/package/e2fsprogs/Config.in
index 7775e94..ae4da95 100644
--- a/package/e2fsprogs/Config.in
+++ b/package/e2fsprogs/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_E2FSPROGS
 	bool "e2fsprogs"
 	depends on BR2_LARGEFILE
 	depends on BR2_USE_WCHAR # util-linux
+	depends on BR2_USE_MMU # util-linux/libblkid
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
diff --git a/package/udev/Config.in b/package/udev/Config.in
index 7aa79c4..c59abbe 100644
--- a/package/udev/Config.in
+++ b/package/udev/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_UDEV
 	depends on BR2_LARGEFILE # util-linux
 	depends on BR2_USE_WCHAR # util-linux
 	depends on !BR2_PREFER_STATIC_LIB # kmod
+	depends on BR2_USE_MMU # util-linux/libblkid
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
 	select BR2_PACKAGE_KMOD
diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index 8c8fd7a..b1db99a 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -14,6 +14,7 @@ if BR2_PACKAGE_UTIL_LINUX
 
 config BR2_PACKAGE_UTIL_LINUX_LIBBLKID
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	depends on BR2_USE_MMU # fork
 	bool "libblkid"
 	help
 	  Install libblkid.
@@ -22,6 +23,7 @@ config BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
 	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
 	# libc lacks UTIME_NOW & UTIME_COMMIT
 	depends on !(BR2_microblazeel || BR2_microblazebe)
+	depends on BR2_USE_MMU # util-linux/libblkid
 	bool "libmount"
 	help
 	  Install libmount.
diff --git a/system/Config.in b/system/Config.in
index 181a0ac..f9623b9 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -127,6 +127,7 @@ config BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
 	depends on BR2_LARGEFILE # udev
 	depends on BR2_USE_WCHAR # udev
 	depends on !BR2_PREFER_STATIC_LIB # udev -> kmod
+	depends on BR2_USE_MMU # udev -> util-linux/libblkid
 	select BR2_PACKAGE_UDEV
 
 comment "udev needs a toolchain w/ largefile, wchar"
