From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Jul 2017 12:53:27 +0200
Subject: [Buildroot] [git commit] parted: bump to version 3.2
Message-ID: <20170701105118.74A5A81829@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=83164a2b12e78a2c401d16cb02fa3bd176d50961
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove upstreamed readline related patch.

Add a patch, that enables parted to be compiled without lvm2.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...rch-linux.c-Compile-without-ENABLE_DEVICE.patch | 79 ++++++++++++++++++++++
 package/parted/0001-readline-deprecated.patch      | 19 ------
 package/parted/parted.hash                         |  2 +-
 package/parted/parted.mk                           |  2 +-
 4 files changed, 81 insertions(+), 21 deletions(-)

diff --git a/package/parted/0001-libparted-arch-linux.c-Compile-without-ENABLE_DEVICE.patch b/package/parted/0001-libparted-arch-linux.c-Compile-without-ENABLE_DEVICE.patch
new file mode 100644
index 0000000..5adc9be
--- /dev/null
+++ b/package/parted/0001-libparted-arch-linux.c-Compile-without-ENABLE_DEVICE.patch
@@ -0,0 +1,79 @@
+From 7e87ca3c531228d35e13e802d2622006138b104c Mon Sep 17 00:00:00 2001
+From: Felix Janda <felix.janda@posteo.de>
+Date: Sun, 3 May 2015 10:33:15 +0200
+Subject: [PATCH] libparted/arch/linux.c: Compile without ENABLE_DEVICE_MAPPER
+
+Signed-off-by: Brian C. Lane <bcl@redhat.com>
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+---
+ libparted/arch/linux.c | 21 +++++++++++++++++----
+ 1 file changed, 17 insertions(+), 4 deletions(-)
+
+diff --git a/libparted/arch/linux.c b/libparted/arch/linux.c
+index 90ab21d..f6141e4 100644
+--- a/libparted/arch/linux.c
++++ b/libparted/arch/linux.c
+@@ -2304,6 +2304,7 @@ zasprintf (const char *format, ...)
+   return r < 0 ? NULL : resultp;
+ }
+ 
++#ifdef ENABLE_DEVICE_MAPPER
+ static char *
+ dm_canonical_path (PedDevice const *dev)
+ {
+@@ -2326,14 +2327,21 @@ dm_canonical_path (PedDevice const *dev)
+ err:
+         return NULL;
+ }
++#endif
+ 
+ static char*
+ _device_get_part_path (PedDevice const *dev, int num)
+ {
+-        char *devpath = (dev->type == PED_DEVICE_DM
+-                         ? dm_canonical_path (dev) : dev->path);
+-        size_t path_len = strlen (devpath);
++        char *devpath;
++        size_t path_len;
+         char *result;
++#ifdef ENABLE_DEVICE_MAPPER
++        devpath = (dev->type == PED_DEVICE_DM
++                         ? dm_canonical_path (dev) : dev->path);
++#else
++        devpath = dev->path;
++#endif
++        path_len = strlen (devpath);
+         /* Check for devfs-style /disc => /partN transformation
+            unconditionally; the system might be using udev with devfs rules,
+            and if not the test is harmless. */
+@@ -2349,8 +2357,10 @@ _device_get_part_path (PedDevice const *dev, int num)
+                                  ? "p" : "");
+                 result = zasprintf ("%s%s%d", devpath, p, num);
+         }
++#ifdef ENABLE_DEVICE_MAPPER
+         if (dev->type == PED_DEVICE_DM)
+                 free (devpath);
++#endif
+         return result;
+ }
+ 
+@@ -2958,12 +2968,15 @@ _disk_sync_part_table (PedDisk* disk)
+                                                unsigned long long *length);
+ 
+ 
++#ifdef ENABLE_DEVICE_MAPPER
+         if (disk->dev->type == PED_DEVICE_DM) {
+                 add_partition = _dm_add_partition;
+                 remove_partition = _dm_remove_partition;
+                 resize_partition = _dm_resize_partition;
+                 get_partition_start_and_length = _dm_get_partition_start_and_length;
+-        } else {
++        } else
++#endif
++        {
+                 add_partition = _blkpg_add_partition;
+                 remove_partition = _blkpg_remove_partition;
+ #ifdef BLKPG_RESIZE_PARTITION
+-- 
+2.1.4
+
diff --git a/package/parted/0001-readline-deprecated.patch b/package/parted/0001-readline-deprecated.patch
deleted file mode 100644
index a3f40c8..0000000
--- a/package/parted/0001-readline-deprecated.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-The CPPFunction typedef (among others) have been deprecated in favour of
-specific prototyped typedefs since readline 4.2.
-It's been working since because compatibility typedefs have been
-in place until they were removed in readline 6.3.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-diff -Nura parted-3.1.orig/parted/ui.c parted-3.1/parted/ui.c
---- parted-3.1.orig/parted/ui.c	2014-03-01 16:11:41.970827134 -0300
-+++ parted-3.1/parted/ui.c	2014-03-01 16:11:55.540259786 -0300
-@@ -1474,7 +1474,7 @@
- #ifdef HAVE_LIBREADLINE
-   if (!opt_script_mode) {
-     rl_initialize ();
--    rl_attempted_completion_function = (CPPFunction*) complete_function;
-+    rl_attempted_completion_function = (rl_completion_func_t *) complete_function;
-     readline_state.in_readline = 0;
-   }
- #endif
diff --git a/package/parted/parted.hash b/package/parted/parted.hash
index 297b5d7..e31ae3c 100644
--- a/package/parted/parted.hash
+++ b/package/parted/parted.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	5e9cc1f91eaf016e5033d85b9b893fd6d3ffaca532a48de1082df9b94225ca15	parted-3.1.tar.xz
+sha256	858b589c22297cacdf437f3baff6f04b333087521ab274f7ab677cb8c6bb78e4  parted-3.2.tar.xz
diff --git a/package/parted/parted.mk b/package/parted/parted.mk
index fb4987f..35d152b 100644
--- a/package/parted/parted.mk
+++ b/package/parted/parted.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PARTED_VERSION = 3.1
+PARTED_VERSION = 3.2
 PARTED_SOURCE = parted-$(PARTED_VERSION).tar.xz
 PARTED_SITE = $(BR2_GNU_MIRROR)/parted
 PARTED_DEPENDENCIES = host-pkgconf util-linux
