From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Oct 2017 15:30:09 +0200
Subject: [Buildroot] [git commit] parted: properly link with libiconv
Message-ID: <20171008132301.1F222810D1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2a56de2dec3afdca15a58ec13cb5fc244682cab6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

parted uses libiconv but doesn't link with it. All the checks are there
in configure, but the Makefile.am doesn't add it to the link. Add a
patch to fix this.

Also add an optional dependency on libiconv, so it is reproducible.

While we're at it, regenerate the existing patches on top of v3.2, and
make patch 0003 a properly git formatted one.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: srg.venema at gmail.com
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...rch-linux.c-Compile-without-ENABLE_DEVICE.patch |  8 ++---
 .../0002-configure.ac-uclinux-is-also-linux.patch  |  4 +--
 ...-Include-fcntl.h-to-get-loff_t-definition.patch | 27 +++++++++++++++++
 package/parted/0003-fix-includes-for-musl.patch    | 18 ------------
 ...arted-labels-link-with-libiconv-if-needed.patch | 34 ++++++++++++++++++++++
 package/parted/parted.mk                           |  7 ++++-
 6 files changed, 73 insertions(+), 25 deletions(-)

diff --git a/package/parted/0001-libparted-arch-linux.c-Compile-without-ENABLE_DEVICE.patch b/package/parted/0001-libparted-arch-linux.c-Compile-without-ENABLE_DEVICE.patch
index 5adc9be..1cf699b 100644
--- a/package/parted/0001-libparted-arch-linux.c-Compile-without-ENABLE_DEVICE.patch
+++ b/package/parted/0001-libparted-arch-linux.c-Compile-without-ENABLE_DEVICE.patch
@@ -1,4 +1,4 @@
-From 7e87ca3c531228d35e13e802d2622006138b104c Mon Sep 17 00:00:00 2001
+From 141c4309d7164dcd4e09d137fc075c1726fd8dbb Mon Sep 17 00:00:00 2001
 From: Felix Janda <felix.janda@posteo.de>
 Date: Sun, 3 May 2015 10:33:15 +0200
 Subject: [PATCH] libparted/arch/linux.c: Compile without ENABLE_DEVICE_MAPPER
@@ -10,7 +10,7 @@ Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
  1 file changed, 17 insertions(+), 4 deletions(-)
 
 diff --git a/libparted/arch/linux.c b/libparted/arch/linux.c
-index 90ab21d..f6141e4 100644
+index 0f18904..cf38c6f 100644
 --- a/libparted/arch/linux.c
 +++ b/libparted/arch/linux.c
 @@ -2304,6 +2304,7 @@ zasprintf (const char *format, ...)
@@ -57,7 +57,7 @@ index 90ab21d..f6141e4 100644
          return result;
  }
  
-@@ -2958,12 +2968,15 @@ _disk_sync_part_table (PedDisk* disk)
+@@ -2945,12 +2955,15 @@ _disk_sync_part_table (PedDisk* disk)
                                                 unsigned long long *length);
  
  
@@ -75,5 +75,5 @@ index 90ab21d..f6141e4 100644
                  remove_partition = _blkpg_remove_partition;
  #ifdef BLKPG_RESIZE_PARTITION
 -- 
-2.1.4
+2.14.2
 
diff --git a/package/parted/0002-configure.ac-uclinux-is-also-linux.patch b/package/parted/0002-configure.ac-uclinux-is-also-linux.patch
index b2119bc..5a264ce 100644
--- a/package/parted/0002-configure.ac-uclinux-is-also-linux.patch
+++ b/package/parted/0002-configure.ac-uclinux-is-also-linux.patch
@@ -1,4 +1,4 @@
-From b3958317c5ee2940e7024bec2e7f288b5a6a26c3 Mon Sep 17 00:00:00 2001
+From 7697d9c54e489b32b82c01f17db04f8b51857e51 Mon Sep 17 00:00:00 2001
 From: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Date: Mon, 30 Jun 2014 10:09:04 -0300
 Subject: [PATCH] configure.ac: uclinux is also linux
@@ -29,5 +29,5 @@ index 436d0e2..50ad478 100644
  AC_SUBST([OS])
  
 -- 
-1.8.5.5
+2.14.2
 
diff --git a/package/parted/0003-Include-fcntl.h-to-get-loff_t-definition.patch b/package/parted/0003-Include-fcntl.h-to-get-loff_t-definition.patch
new file mode 100644
index 0000000..ca82174
--- /dev/null
+++ b/package/parted/0003-Include-fcntl.h-to-get-loff_t-definition.patch
@@ -0,0 +1,27 @@
+From 2078c07d38ee7841b89ac8d81afc5e8bfcd4f703 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Sun, 8 Oct 2017 00:58:58 +0200
+Subject: [PATCH] Include <fcntl.h> to get loff_t definition
+
+Patch borrowed from Alpine Linux at
+http://git.alpinelinux.org/cgit/aports/plain/main/parted/fix-includes.patch. Solves
+build with musl.
+---
+ libparted/fs/xfs/platform_defs.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/libparted/fs/xfs/platform_defs.h b/libparted/fs/xfs/platform_defs.h
+index 2b55752..17023dc 100644
+--- a/libparted/fs/xfs/platform_defs.h
++++ b/libparted/fs/xfs/platform_defs.h
+@@ -35,6 +35,7 @@
+ #define __XFS_PLATFORM_DEFS_H__
+ 
+ #include <stdio.h>
++#include <fcntl.h>
+ #include <stdarg.h>
+ #include <assert.h>
+ #include <endian.h>
+-- 
+2.14.2
+
diff --git a/package/parted/0003-fix-includes-for-musl.patch b/package/parted/0003-fix-includes-for-musl.patch
deleted file mode 100644
index 28c94ac..0000000
--- a/package/parted/0003-fix-includes-for-musl.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-Include <fcntl.h> to get loff_t definition
-
-Patch borrowed from Alpine Linux at
-http://git.alpinelinux.org/cgit/aports/plain/main/parted/fix-includes.patch. Solves
-build with musl.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
---- parted-3.1.orig/libparted/fs/xfs/platform_defs.h
-+++ parted-3.1/libparted/fs/xfs/platform_defs.h
-@@ -35,6 +35,7 @@
- #define __XFS_PLATFORM_DEFS_H__
- 
- #include <stdio.h>
-+#include <fcntl.h>
- #include <stdarg.h>
- #include <assert.h>
- #include <endian.h>
diff --git a/package/parted/0004-libparted-labels-link-with-libiconv-if-needed.patch b/package/parted/0004-libparted-labels-link-with-libiconv-if-needed.patch
new file mode 100644
index 0000000..9cabdee
--- /dev/null
+++ b/package/parted/0004-libparted-labels-link-with-libiconv-if-needed.patch
@@ -0,0 +1,34 @@
+From 1084b0255c42fc86adb0a2c7614e341ac530db65 Mon Sep 17 00:00:00 2001
+From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
+Date: Sun, 8 Oct 2017 00:53:31 +0200
+Subject: [PATCH] libparted/labels: link with libiconv if needed
+
+gpt.c uses iconv so it should link with it. Otherwise, on platforms
+where libiconv is a separate library, we get a link failure of parted:
+
+    CCLD     parted
+  ../libparted/.libs/libparted.so: undefined reference to `libiconv'
+  ../libparted/.libs/libparted.so: undefined reference to `libiconv_open'
+  ../libparted/.libs/libparted.so: undefined reference to `libiconv_close'
+
+Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
+---
+ libparted/labels/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libparted/labels/Makefile.am b/libparted/labels/Makefile.am
+index c996f81..b204379 100644
+--- a/libparted/labels/Makefile.am
++++ b/libparted/labels/Makefile.am
+@@ -35,7 +35,7 @@ liblabels_la_SOURCES = \
+   rdb.c		\
+   sun.c
+ 
+-liblabels_la_LIBADD = $(OS_LIBS) $(INTLLIBS)
++liblabels_la_LIBADD = $(OS_LIBS) $(INTLLIBS) $(LIBICONV)
+ 
+ AM_CPPFLAGS = $(partedincludedir) $(INTLINCS)
+ 
+-- 
+2.14.2
+
diff --git a/package/parted/parted.mk b/package/parted/parted.mk
index 35d152b..1f0428a 100644
--- a/package/parted/parted.mk
+++ b/package/parted/parted.mk
@@ -9,7 +9,8 @@ PARTED_SOURCE = parted-$(PARTED_VERSION).tar.xz
 PARTED_SITE = $(BR2_GNU_MIRROR)/parted
 PARTED_DEPENDENCIES = host-pkgconf util-linux
 PARTED_INSTALL_STAGING = YES
-# For uclinux patch
+# 0002-configure.ac-uclinux-is-also-linux.patch
+# 0004-libparted-labels-link-with-libiconv-if-needed.patch
 PARTED_AUTORECONF = YES
 PARTED_GETTEXTIZE = YES
 PARTED_LICENSE = GPL-3.0+
@@ -29,6 +30,10 @@ else
 PARTED_CONF_OPTS += --disable-device-mapper
 endif
 
+ifeq ($(BR2_PACKAGE_LIBICONV),y)
+PARTED_DEPENDENCIES += libiconv
+endif
+
 ifeq ($(BR2_STATIC_LIBS),y)
 PARTED_CONF_OPTS += --disable-dynamic-loading
 endif
