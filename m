From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 9 Mar 2015 14:04:52 +0100
Subject: [Buildroot] [git commit] eudev: fix dependency on kernel headers
	version
Message-ID: <20150309130507.F1B7F80157@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2676d7f80d2e5eb8bb8c605b215bfe4e9bfaf097
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas:
  - indicate upstream commit id, as suggested by Baruch.
  - add SoB of Alexey inside the patch itself.
  - adjust sequence number to 0003.]

Signed-off-by: Alexey Mednyy <swexru@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...c-don-t-die-on-missing-linux-btrfs.h-fixe.patch |   41 ++++++++++++++++++++
 package/eudev/eudev.mk                             |    2 +
 system/Config.in                                   |    6 +--
 3 files changed, 45 insertions(+), 4 deletions(-)

diff --git a/package/eudev/0003-configure.ac-don-t-die-on-missing-linux-btrfs.h-fixe.patch b/package/eudev/0003-configure.ac-don-t-die-on-missing-linux-btrfs.h-fixe.patch
new file mode 100644
index 0000000..305ec43
--- /dev/null
+++ b/package/eudev/0003-configure.ac-don-t-die-on-missing-linux-btrfs.h-fixe.patch
@@ -0,0 +1,41 @@
+From 6740579367ddd2ce0b315863cdb92d34d1d693c7 Mon Sep 17 00:00:00 2001
+From: "Anthony G. Basile" <blueness@gentoo.org>
+Date: Sun, 16 Nov 2014 13:40:43 -0500
+Subject: [PATCH] configure.ac: don't die on missing linux/btrfs.h, fixes issue
+ #100
+
+Signed-off-by: Anthony G. Basile <blueness@gentoo.org>
+
+Taken from upstream commit 6740579367d.
+
+Signed-off-by: Alexey Mednyy <swexru@gmail.com>
+---
+ configure.ac | 8 +++++++-
+ 1 file changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index a3747f9..dbca833 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -49,11 +49,17 @@ AC_CHECK_HEADERS(
+ )
+ 
+ AC_CHECK_HEADERS(
+-	[linux/btrfs.h mtd/mtd-user.h],
++	[mtd/mtd-user.h],
+ 	[],
+ 	[AC_MSG_ERROR([*** KERNEL header not found])]
+ )
+ 
++AC_CHECK_HEADERS(
++	[linux/btrfs.h],
++	[],
++	[AC_MSG_WARN([*** KERNEL header not found])]
++)
++
+ # Checks for typedefs, structures, and compiler characteristics.
+ AC_TYPE_UID_T
+ AC_C_INLINE
+-- 
+1.9.1
+
diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
index 2221966..f5159a2 100644
--- a/package/eudev/eudev.mk
+++ b/package/eudev/eudev.mk
@@ -10,6 +10,8 @@ EUDEV_SITE = http://dev.gentoo.org/~blueness/eudev
 EUDEV_LICENSE = GPLv2+ (programs), LGPLv2.1+ (libraries)
 EUDEV_LICENSE_FILES = COPYING
 EUDEV_INSTALL_STAGING = YES
+# We're patching configure.ac
+EUDEV_AUTORECONF = YES
 
 # mq_getattr is in librt
 EUDEV_CONF_ENV += LIBS=-lrt
diff --git a/system/Config.in b/system/Config.in
index 4d1c3d2..9973cc2 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -128,13 +128,11 @@ config BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV
 	depends on BR2_USE_WCHAR
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_MMU # eudev
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_9
 	select BR2_PACKAGE_EUDEV
 
-comment "eudev needs a toolchain w/ largefile, wchar, dynamic library, headers >= 3.9"
+comment "eudev needs a toolchain w/ largefile, wchar, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_LARGEFILE || !BR2_USE_WCHAR || BR2_STATIC_LIBS \
-		|| !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_9
+	depends on !BR2_LARGEFILE || !BR2_USE_WCHAR || BR2_STATIC_LIBS
 
 endchoice
 
