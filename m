From: Petr Vorel <petr.vorel@gmail.com>
Date: Fri,  7 Dec 2018 18:38:36 +0100
Subject: [Buildroot] [PATCH 1/1] libglib2: Bump to version 2.56.3
Message-ID: <20181207173836.13091-1-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop 2 patches accepted by upstream.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 ...gobject-fix-compilation-with-gcc-4.7.patch | 50 ------------------
 ...compilation-without-F_-S-G-ETPIPE_SZ.patch | 52 -------------------
 package/libglib2/libglib2.hash                |  4 +-
 package/libglib2/libglib2.mk                  |  2 +-
 4 files changed, 3 insertions(+), 105 deletions(-)
 delete mode 100644 package/libglib2/0003-gobject-fix-compilation-with-gcc-4.7.patch
 delete mode 100644 package/libglib2/0005-gio-fix-compilation-without-F_-S-G-ETPIPE_SZ.patch

diff --git a/package/libglib2/0003-gobject-fix-compilation-with-gcc-4.7.patch b/package/libglib2/0003-gobject-fix-compilation-with-gcc-4.7.patch
deleted file mode 100644
index fc672513ee..0000000000
--- a/package/libglib2/0003-gobject-fix-compilation-with-gcc-4.7.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From a2b27c0d038ad76cc8016999f8788245da97e946 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Tue, 10 Apr 2018 19:18:57 +0200
-Subject: [PATCH] gobject: fix compilation with gcc <= 4.7
-
-On gcc 4.7, we got the following error:
-
-i686-nptl-linux-gnu-gcc --version
-> i686-nptl-linux-gnu-gcc (crosstool-NG 1.20.0) 4.7.4
-> $ echo '#include <glib-object.h>' | i686-nptl-linux-gnu-gcc -x c -I
-staging/usr/include/glib-2.0 -I staging/usr/lib/glib-2.0/include -Wall
--Werror -c - -o /tmp/foo.o
-> In file included from
-staging/usr/include/glib-2.0/gobject/gbinding.h:29:0,
->                  from staging/usr/include/glib-2.0/glib-object.h:23,
->                  from <stdin>:1:
-> staging/usr/include/glib-2.0/gobject/gobject.h: In function
-'g_set_object':
-> staging/usr/include/glib-2.0/gobject/gobject.h:725:5: error: value
-computed is not used [-Werror=unused-value]
-> cc1: all warnings being treated as errors
-
-This error has been added by commit 3fae39a5d742afe73741f5fd7aa24e3ae8182f06
-So enable the new g_set_object definition only if gcc >= 4.8
-
-Fixes:
- - http://autobuild.buildroot.net/results/b29a2f868438a2210873ea72f491db63175848be
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Upstream-status: https://bugzilla.gnome.org/show_bug.cgi?id=795138
----
- gobject/gobject.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/gobject/gobject.h b/gobject/gobject.h
-index 9830663ce..838046fe0 100644
---- a/gobject/gobject.h
-+++ b/gobject/gobject.h
-@@ -507,7 +507,7 @@ GLIB_AVAILABLE_IN_ALL
- void        g_object_remove_weak_pointer      (GObject        *object, 
-                                                gpointer       *weak_pointer_location);
- 
--#if defined(__GNUC__) && !defined(__cplusplus) && GLIB_VERSION_MAX_ALLOWED >= GLIB_VERSION_2_56
-+#if (__GNUC__ > 4 || (__GNUC__ == 4 && __GNUC_MINOR__ >= 8)) && !defined(__cplusplus) && GLIB_VERSION_MAX_ALLOWED >= GLIB_VERSION_2_56
- /* Make reference APIs type safe with macros */
- #define g_object_ref(Obj)      ((__typeof__(Obj)) (g_object_ref) (Obj))
- #define g_object_ref_sink(Obj) ((__typeof__(Obj)) (g_object_ref_sink) (Obj))
--- 
-2.14.1
-
diff --git a/package/libglib2/0005-gio-fix-compilation-without-F_-S-G-ETPIPE_SZ.patch b/package/libglib2/0005-gio-fix-compilation-without-F_-S-G-ETPIPE_SZ.patch
deleted file mode 100644
index 032f4851c4..0000000000
--- a/package/libglib2/0005-gio-fix-compilation-without-F_-S-G-ETPIPE_SZ.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 0beb62f564072f3585762c9c55fe894485993b62 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Tue, 10 Apr 2018 18:55:11 +0200
-Subject: [PATCH] gio: fix compilation without F_{S,G}ETPIPE_SZ
-
-Commit a5778ef7c51044147fe470ea1707dd297f44f880 broke compilation on
-architectures without F_SETPIPE_SZ and F_GETPIPE_SZ such as or1k.
-If those variables are undefined, put back previous behavior, buffer
-size set to 1024 * 64
-
-Fixes:
- - http://autobuild.buildroot.net/results/398490e07343a931b25ca6ab5c90a75d7a073e9f
-
-(Modified by Philip Withnall <withnall@endlessm.com> to add an
-explanatory comment.)
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-
-https://bugzilla.gnome.org/show_bug.cgi?id=795133
----
- gio/gfile.c | 8 ++++++++
- 1 file changed, 8 insertions(+)
-
-diff --git a/gio/gfile.c b/gio/gfile.c
-index 334ad8ec3..a67aad383 100644
---- a/gio/gfile.c
-+++ b/gio/gfile.c
-@@ -3012,6 +3012,7 @@ splice_stream_with_progress (GInputStream           *in,
-   if (!g_unix_open_pipe (buffer, FD_CLOEXEC, error))
-     return FALSE;
- 
-+#if defined(F_SETPIPE_SZ) && defined(F_GETPIPE_SZ)
-   /* Try a 1MiB buffer for improved throughput. If that fails, use the default
-    * pipe size. See: https://bugzilla.gnome.org/791457 */
-   buffer_size = fcntl (buffer[1], F_SETPIPE_SZ, 1024 * 1024);
-@@ -3029,6 +3030,13 @@ splice_stream_with_progress (GInputStream           *in,
-           goto out;
-         }
-     }
-+#else
-+  /* If #F_GETPIPE_SZ isn?t available, assume we?re on Linux < 2.6.35,
-+   * but ? 2.6.11, meaning the pipe capacity is 64KiB. Ignore the possibility of
-+   * running on Linux < 2.6.11 (where the capacity was the system page size,
-+   * typically 4KiB) because it?s ancient. See pipe(7). */
-+  buffer_size = 1024 * 64;
-+#endif
- 
-   g_assert (buffer_size > 0);
- 
--- 
-2.13.0
-
diff --git a/package/libglib2/libglib2.hash b/package/libglib2/libglib2.hash
index 7ce031aa89..57403a2154 100644
--- a/package/libglib2/libglib2.hash
+++ b/package/libglib2/libglib2.hash
@@ -1,4 +1,4 @@
-# https://download.gnome.org/sources/glib/2.56/glib-2.56.1.sha256sum
-sha256  40ef3f44f2c651c7a31aedee44259809b6f03d3d20be44545cd7d177221c0b8d  glib-2.56.1.tar.xz
+# https://download.gnome.org/sources/glib/2.56/glib-2.56.3.sha256sum
+sha256  a9a4c5b4c81b6c75bc140bdf5e32120ef3ce841b7413214ecf5f987acec74cb2  glib-2.56.3.tar.xz
 # License files, locally calculated
 sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index 67db5ac359..1029eaed65 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBGLIB2_VERSION_MAJOR = 2.56
-LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).1
+LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).3
 LIBGLIB2_SOURCE = glib-$(LIBGLIB2_VERSION).tar.xz
 LIBGLIB2_SITE = http://ftp.gnome.org/pub/gnome/sources/glib/$(LIBGLIB2_VERSION_MAJOR)
 LIBGLIB2_LICENSE = LGPL-2.1+
-- 
2.19.2
