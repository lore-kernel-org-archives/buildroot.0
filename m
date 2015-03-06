From: Alexey Mednyy <swexru@gmail.com>
Date: Fri,  6 Mar 2015 20:09:43 +0300
Subject: [Buildroot] [PATCH] fix eudev really not depending kernel headers
	>=3.9
Message-ID: <1425661783-26577-1-git-send-email-swexru@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 ...c-don-t-die-on-missing-linux-btrfs.h-fixe.patch | 37 ++++++++++++++++++++++
 package/eudev/eudev.mk                             |  1 +
 system/Config.in                                   |  7 ++--
 3 files changed, 41 insertions(+), 4 deletions(-)
 create mode 100644 package/eudev/0001-configure.ac-don-t-die-on-missing-linux-btrfs.h-fixe.patch

diff --git a/package/eudev/0001-configure.ac-don-t-die-on-missing-linux-btrfs.h-fixe.patch b/package/eudev/0001-configure.ac-don-t-die-on-missing-linux-btrfs.h-fixe.patch
new file mode 100644
index 0000000..a749b08
--- /dev/null
+++ b/package/eudev/0001-configure.ac-don-t-die-on-missing-linux-btrfs.h-fixe.patch
@@ -0,0 +1,37 @@
+From 6740579367ddd2ce0b315863cdb92d34d1d693c7 Mon Sep 17 00:00:00 2001
+From: "Anthony G. Basile" <blueness@gentoo.org>
+Date: Sun, 16 Nov 2014 13:40:43 -0500
+Subject: [PATCH] configure.ac: don't die on missing linux/btrfs.h, fixes issue
+ #100
+
+Signed-off-by: Anthony G. Basile <blueness@gentoo.org>
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
index 2221966..eb266a1 100644
--- a/package/eudev/eudev.mk
+++ b/package/eudev/eudev.mk
@@ -10,6 +10,7 @@ EUDEV_SITE = http://dev.gentoo.org/~blueness/eudev
 EUDEV_LICENSE = GPLv2+ (programs), LGPLv2.1+ (libraries)
 EUDEV_LICENSE_FILES = COPYING
 EUDEV_INSTALL_STAGING = YES
+EUDEV_AUTORECONF = YES
 
 # mq_getattr is in librt
 EUDEV_CONF_ENV += LIBS=-lrt
diff --git a/system/Config.in b/system/Config.in
index 4d1c3d2..9e2b13f 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -128,13 +128,12 @@ config BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV
 	depends on BR2_USE_WCHAR
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_MMU # eudev
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_9
+#	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_9
 	select BR2_PACKAGE_EUDEV
 
-comment "eudev needs a toolchain w/ largefile, wchar, dynamic library, headers >= 3.9"
+comment "eudev needs a toolchain w/ largefile, wchar, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_LARGEFILE || !BR2_USE_WCHAR || BR2_STATIC_LIBS \
-		|| !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_9
+	depends on !BR2_LARGEFILE || !BR2_USE_WCHAR || BR2_STATIC_LIBS
 
 endchoice
 
-- 
1.9.1
