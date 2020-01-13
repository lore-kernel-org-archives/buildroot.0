From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 13 Jan 2020 21:18:04 +0100
Subject: [Buildroot] [git commit] package/parted: bump to version 3.3
Message-ID: <20200113201115.4577481751@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b5f0c6efb24826641719c493382211e5d768417b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Remove all patches (already in version) as well as autoreconf
- Remove --disable-dynamic-loading (dropped since
  http://git.savannah.gnu.org/cgit/parted.git/commit/?id=b49388018931cab220b9dd50f3a2bd51401e48af)
- Add a dependency on locale as locale_t is unconditionnaly used since
  http://git.savannah.gnu.org/cgit/parted.git/commit/?id=9c266205416ec956d6205c828211480de3767d02

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...rch-linux.c-Compile-without-ENABLE_DEVICE.patch | 79 ----------------------
 .../0002-configure.ac-uclinux-is-also-linux.patch  | 33 ---------
 ...-Include-fcntl.h-to-get-loff_t-definition.patch | 29 --------
 ...arted-labels-link-with-libiconv-if-needed.patch | 54 ---------------
 ...x-Include-sys-sysmacros.h-for-major-macro.patch | 27 --------
 package/parted/Config.in                           |  5 +-
 package/parted/parted.hash                         |  2 +-
 package/parted/parted.mk                           | 10 +--
 8 files changed, 5 insertions(+), 234 deletions(-)

diff --git a/package/parted/0001-libparted-arch-linux.c-Compile-without-ENABLE_DEVICE.patch b/package/parted/0001-libparted-arch-linux.c-Compile-without-ENABLE_DEVICE.patch
deleted file mode 100644
index 1cf699bb12..0000000000
--- a/package/parted/0001-libparted-arch-linux.c-Compile-without-ENABLE_DEVICE.patch
+++ /dev/null
@@ -1,79 +0,0 @@
-From 141c4309d7164dcd4e09d137fc075c1726fd8dbb Mon Sep 17 00:00:00 2001
-From: Felix Janda <felix.janda@posteo.de>
-Date: Sun, 3 May 2015 10:33:15 +0200
-Subject: [PATCH] libparted/arch/linux.c: Compile without ENABLE_DEVICE_MAPPER
-
-Signed-off-by: Brian C. Lane <bcl@redhat.com>
-Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
----
- libparted/arch/linux.c | 21 +++++++++++++++++----
- 1 file changed, 17 insertions(+), 4 deletions(-)
-
-diff --git a/libparted/arch/linux.c b/libparted/arch/linux.c
-index 0f18904..cf38c6f 100644
---- a/libparted/arch/linux.c
-+++ b/libparted/arch/linux.c
-@@ -2304,6 +2304,7 @@ zasprintf (const char *format, ...)
-   return r < 0 ? NULL : resultp;
- }
- 
-+#ifdef ENABLE_DEVICE_MAPPER
- static char *
- dm_canonical_path (PedDevice const *dev)
- {
-@@ -2326,14 +2327,21 @@ dm_canonical_path (PedDevice const *dev)
- err:
-         return NULL;
- }
-+#endif
- 
- static char*
- _device_get_part_path (PedDevice const *dev, int num)
- {
--        char *devpath = (dev->type == PED_DEVICE_DM
--                         ? dm_canonical_path (dev) : dev->path);
--        size_t path_len = strlen (devpath);
-+        char *devpath;
-+        size_t path_len;
-         char *result;
-+#ifdef ENABLE_DEVICE_MAPPER
-+        devpath = (dev->type == PED_DEVICE_DM
-+                         ? dm_canonical_path (dev) : dev->path);
-+#else
-+        devpath = dev->path;
-+#endif
-+        path_len = strlen (devpath);
-         /* Check for devfs-style /disc => /partN transformation
-            unconditionally; the system might be using udev with devfs rules,
-            and if not the test is harmless. */
-@@ -2349,8 +2357,10 @@ _device_get_part_path (PedDevice const *dev, int num)
-                                  ? "p" : "");
-                 result = zasprintf ("%s%s%d", devpath, p, num);
-         }
-+#ifdef ENABLE_DEVICE_MAPPER
-         if (dev->type == PED_DEVICE_DM)
-                 free (devpath);
-+#endif
-         return result;
- }
- 
-@@ -2945,12 +2955,15 @@ _disk_sync_part_table (PedDisk* disk)
-                                                unsigned long long *length);
- 
- 
-+#ifdef ENABLE_DEVICE_MAPPER
-         if (disk->dev->type == PED_DEVICE_DM) {
-                 add_partition = _dm_add_partition;
-                 remove_partition = _dm_remove_partition;
-                 resize_partition = _dm_resize_partition;
-                 get_partition_start_and_length = _dm_get_partition_start_and_length;
--        } else {
-+        } else
-+#endif
-+        {
-                 add_partition = _blkpg_add_partition;
-                 remove_partition = _blkpg_remove_partition;
- #ifdef BLKPG_RESIZE_PARTITION
--- 
-2.14.2
-
diff --git a/package/parted/0002-configure.ac-uclinux-is-also-linux.patch b/package/parted/0002-configure.ac-uclinux-is-also-linux.patch
deleted file mode 100644
index 5a264ced80..0000000000
--- a/package/parted/0002-configure.ac-uclinux-is-also-linux.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 7697d9c54e489b32b82c01f17db04f8b51857e51 Mon Sep 17 00:00:00 2001
-From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Mon, 30 Jun 2014 10:09:04 -0300
-Subject: [PATCH] configure.ac: uclinux is also linux
-
-uclinux is used in the tuple for some noMMU linux builds like Blackfin
-FLAT output, so accept it as linux too.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
- configure.ac | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 436d0e2..50ad478 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -58,10 +58,10 @@ AM_SILENT_RULES([yes]) # make --enable-silent-rules the default.
- 
- AC_CANONICAL_HOST
- case "$host_os" in
--	linux*) OS=linux ;;
-+	linux*|uclinux*) OS=linux ;;
- 	gnu*)	OS=gnu ;;
- 	beos*)	OS=beos ;;
--	*)	AC_MSG_ERROR([Unknown or unsupported OS "$host_os".  Only "linux", "gnu" and "beos" are supported in this version of GNU Parted.]) ;;
-+	*)	AC_MSG_ERROR([Unknown or unsupported OS "$host_os".  Only "linux", "uclinux", "gnu" and "beos" are supported in this version of GNU Parted.]) ;;
- esac
- AC_SUBST([OS])
- 
--- 
-2.14.2
-
diff --git a/package/parted/0003-Include-fcntl.h-to-get-loff_t-definition.patch b/package/parted/0003-Include-fcntl.h-to-get-loff_t-definition.patch
deleted file mode 100644
index 752938ab7f..0000000000
--- a/package/parted/0003-Include-fcntl.h-to-get-loff_t-definition.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 2078c07d38ee7841b89ac8d81afc5e8bfcd4f703 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Sun, 8 Oct 2017 00:58:58 +0200
-Subject: [PATCH] Include <fcntl.h> to get loff_t definition
-
-Patch borrowed from Alpine Linux at
-http://git.alpinelinux.org/cgit/aports/plain/main/parted/fix-includes.patch. Solves
-build with musl.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- libparted/fs/xfs/platform_defs.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/libparted/fs/xfs/platform_defs.h b/libparted/fs/xfs/platform_defs.h
-index 2b55752..17023dc 100644
---- a/libparted/fs/xfs/platform_defs.h
-+++ b/libparted/fs/xfs/platform_defs.h
-@@ -35,6 +35,7 @@
- #define __XFS_PLATFORM_DEFS_H__
- 
- #include <stdio.h>
-+#include <fcntl.h>
- #include <stdarg.h>
- #include <assert.h>
- #include <endian.h>
--- 
-2.14.2
-
diff --git a/package/parted/0004-libparted-labels-link-with-libiconv-if-needed.patch b/package/parted/0004-libparted-labels-link-with-libiconv-if-needed.patch
deleted file mode 100644
index a4a1b00331..0000000000
--- a/package/parted/0004-libparted-labels-link-with-libiconv-if-needed.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From dd17f55b2ac189ccd3b8025e4f6509537d00f9d3 Mon Sep 17 00:00:00 2001
-From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
-Date: Sun, 8 Oct 2017 00:53:31 +0200
-Subject: [PATCH] libparted/labels: link with libiconv if needed
-
-gpt.c uses iconv so it should link with it. Otherwise, on platforms
-where libiconv is a separate library, we get a link failure of parted:
-
-    CCLD     parted
-  ../libparted/.libs/libparted.so: undefined reference to `libiconv'
-  ../libparted/.libs/libparted.so: undefined reference to `libiconv_open'
-  ../libparted/.libs/libparted.so: undefined reference to `libiconv_close'
-
-Since iconv functionality is needed unconditionally (not only when
-gettext is enabled), AM_ICONV needs to be added to configure.ac.
-
-Upstream status: sent to mailing list
-http://lists.alioth.debian.org/pipermail/parted-devel/2017-November/005131.html
-
-Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
----
- configure.ac                 | 2 ++
- libparted/labels/Makefile.am | 2 +-
- 2 files changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 50ad478..62f1b4d 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -288,6 +288,8 @@ fi
- AC_PROG_LIBTOOL
- LT_INIT
- 
-+AM_ICONV
-+
- AM_GNU_GETTEXT_VERSION([0.18])
- AM_GNU_GETTEXT([external])
- if test "$USE_INCLUDED_LIBINTL" = "yes"; then
-diff --git a/libparted/labels/Makefile.am b/libparted/labels/Makefile.am
-index c996f81..b204379 100644
---- a/libparted/labels/Makefile.am
-+++ b/libparted/labels/Makefile.am
-@@ -35,7 +35,7 @@ liblabels_la_SOURCES = \
-   rdb.c		\
-   sun.c
- 
--liblabels_la_LIBADD = $(OS_LIBS) $(INTLLIBS)
-+liblabels_la_LIBADD = $(OS_LIBS) $(INTLLIBS) $(LIBICONV)
- 
- AM_CPPFLAGS = $(partedincludedir) $(INTLINCS)
- 
--- 
-2.14.2
-
diff --git a/package/parted/0005-linux-Include-sys-sysmacros.h-for-major-macro.patch b/package/parted/0005-linux-Include-sys-sysmacros.h-for-major-macro.patch
deleted file mode 100644
index e0b4c2acba..0000000000
--- a/package/parted/0005-linux-Include-sys-sysmacros.h-for-major-macro.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From ba5e0451b51c983e40afd123b6e0d3eddb55e610 Mon Sep 17 00:00:00 2001
-From: "Richard W.M. Jones" <rjones@redhat.com>
-Date: Sat, 24 Mar 2018 17:37:02 +0000
-Subject: [PATCH] linux: Include <sys/sysmacros.h> for major() macro.
-
-Since glibc 2.27 this header is required.
-
-Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
----
- libparted/arch/linux.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/libparted/arch/linux.c b/libparted/arch/linux.c
-index 31b98ab..7e86b51 100644
---- a/libparted/arch/linux.c
-+++ b/libparted/arch/linux.c
-@@ -41,6 +41,7 @@
- #include <sys/utsname.h>        /* for uname() */
- #include <scsi/scsi.h>
- #include <assert.h>
-+#include <sys/sysmacros.h>
- #ifdef ENABLE_DEVICE_MAPPER
- #include <libdevmapper.h>
- #endif
--- 
-2.17.1
-
diff --git a/package/parted/Config.in b/package/parted/Config.in
index 9d78f0f1f9..f48b365a2d 100644
--- a/package/parted/Config.in
+++ b/package/parted/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PARTED
 	bool "parted"
+	depends on BR2_ENABLE_LOCALE
 	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
@@ -8,5 +9,5 @@ config BR2_PACKAGE_PARTED
 
 	  http://www.gnu.org/software/parted/
 
-comment "parted needs a toolchain w/ wchar"
-	depends on !BR2_USE_WCHAR
+comment "parted needs a toolchain w/ locale, wchar"
+	depends on !BR2_ENABLE_LOCALE || !BR2_USE_WCHAR
diff --git a/package/parted/parted.hash b/package/parted/parted.hash
index 7b04128bea..2c466eb8d2 100644
--- a/package/parted/parted.hash
+++ b/package/parted/parted.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256	858b589c22297cacdf437f3baff6f04b333087521ab274f7ab677cb8c6bb78e4  parted-3.2.tar.xz
+sha256	57e2b4bd87018625c515421d4524f6e3b55175b472302056391c5f7eccb83d44  parted-3.3.tar.xz
 
 # Locally calculated
 sha256	0abbff814cd00e2b0b6d08395af2b419c1a92026c4b4adacbb65ccda45fa58cf  COPYING
diff --git a/package/parted/parted.mk b/package/parted/parted.mk
index 1f0428a55b..c3ab3ceb4b 100644
--- a/package/parted/parted.mk
+++ b/package/parted/parted.mk
@@ -4,15 +4,11 @@
 #
 ################################################################################
 
-PARTED_VERSION = 3.2
+PARTED_VERSION = 3.3
 PARTED_SOURCE = parted-$(PARTED_VERSION).tar.xz
 PARTED_SITE = $(BR2_GNU_MIRROR)/parted
 PARTED_DEPENDENCIES = host-pkgconf util-linux
 PARTED_INSTALL_STAGING = YES
-# 0002-configure.ac-uclinux-is-also-linux.patch
-# 0004-libparted-labels-link-with-libiconv-if-needed.patch
-PARTED_AUTORECONF = YES
-PARTED_GETTEXTIZE = YES
 PARTED_LICENSE = GPL-3.0+
 PARTED_LICENSE_FILES = COPYING
 
@@ -34,10 +30,6 @@ ifeq ($(BR2_PACKAGE_LIBICONV),y)
 PARTED_DEPENDENCIES += libiconv
 endif
 
-ifeq ($(BR2_STATIC_LIBS),y)
-PARTED_CONF_OPTS += --disable-dynamic-loading
-endif
-
 HOST_PARTED_DEPENDENCIES = host-pkgconf host-util-linux
 HOST_PARTED_CONF_OPTS += \
 	--without-readline \
