From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 3 Dec 2018 08:55:53 +0100
Subject: [Buildroot] [git commit] Revert "package/libglib2: bump to version
 2.58.1"
Message-ID: <20181203075320.2FB227FC35@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2694222c3d3663d9fcc55e6cf44a45b74b43793f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit 178eb1d7ea165d87460224d297ce615bb63090f0. This
bump causes too many build failures in reverse dependencies of
libglib2, for which a proper solution needs to be found.

See also the analysis from Yann E. Morin:

  http://lists.busybox.net/pipermail/buildroot/2018-December/237663.html

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libglib2/0002-disable-tests.patch          |  8 ++--
 ...0003-gobject-fix-compilation-with-gcc-4.7.patch | 50 +++++++++++++++++++++
 ...-hardcode-python-path-into-various-tools.patch} |  0
 .../0004-grefcount-add-missing-gatomic.h.patch     | 38 ----------------
 ...-fix-compilation-without-F_-S-G-ETPIPE_SZ.patch | 52 ++++++++++++++++++++++
 package/libglib2/libglib2.hash                     |  4 +-
 package/libglib2/libglib2.mk                       | 11 +----
 7 files changed, 108 insertions(+), 55 deletions(-)

diff --git a/package/libglib2/0002-disable-tests.patch b/package/libglib2/0002-disable-tests.patch
index e03dc2fee2..523ebb35ac 100644
--- a/package/libglib2/0002-disable-tests.patch
+++ b/package/libglib2/0002-disable-tests.patch
@@ -8,8 +8,6 @@ gets mixed with distro python leading to build failures.
 
 Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
 Signed-off-by: Adam Duskett <aduskett@codeblue.com>
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Update for version 2.58.1]
 ---
  Makefile.am      | 2 +-
  gio/Makefile.am  | 2 +-
@@ -24,9 +22,9 @@ index 008ad58..007332d 100644
  
  ACLOCAL_AMFLAGS = -I m4macros ${ACLOCAL_FLAGS}
  
--SUBDIRS = . m4macros glib gmodule gthread gobject gio po docs tests subprojects
-+SUBDIRS = . m4macros glib gmodule gthread gobject gio po docs subprojects
- DIST_SUBDIRS = $(SUBDIRS) build
+-SUBDIRS = . m4macros glib gmodule gthread gobject gio po docs tests
++SUBDIRS = . m4macros glib gmodule gthread gobject gio po docs
+ DIST_SUBDIRS = $(SUBDIRS) build win32
  
  bin_SCRIPTS = glib-gettextize
 diff --git a/gio/Makefile.am b/gio/Makefile.am
diff --git a/package/libglib2/0003-gobject-fix-compilation-with-gcc-4.7.patch b/package/libglib2/0003-gobject-fix-compilation-with-gcc-4.7.patch
new file mode 100644
index 0000000000..fc672513ee
--- /dev/null
+++ b/package/libglib2/0003-gobject-fix-compilation-with-gcc-4.7.patch
@@ -0,0 +1,50 @@
+From a2b27c0d038ad76cc8016999f8788245da97e946 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 10 Apr 2018 19:18:57 +0200
+Subject: [PATCH] gobject: fix compilation with gcc <= 4.7
+
+On gcc 4.7, we got the following error:
+
+i686-nptl-linux-gnu-gcc --version
+> i686-nptl-linux-gnu-gcc (crosstool-NG 1.20.0) 4.7.4
+> $ echo '#include <glib-object.h>' | i686-nptl-linux-gnu-gcc -x c -I
+staging/usr/include/glib-2.0 -I staging/usr/lib/glib-2.0/include -Wall
+-Werror -c - -o /tmp/foo.o
+> In file included from
+staging/usr/include/glib-2.0/gobject/gbinding.h:29:0,
+>                  from staging/usr/include/glib-2.0/glib-object.h:23,
+>                  from <stdin>:1:
+> staging/usr/include/glib-2.0/gobject/gobject.h: In function
+'g_set_object':
+> staging/usr/include/glib-2.0/gobject/gobject.h:725:5: error: value
+computed is not used [-Werror=unused-value]
+> cc1: all warnings being treated as errors
+
+This error has been added by commit 3fae39a5d742afe73741f5fd7aa24e3ae8182f06
+So enable the new g_set_object definition only if gcc >= 4.8
+
+Fixes:
+ - http://autobuild.buildroot.net/results/b29a2f868438a2210873ea72f491db63175848be
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream-status: https://bugzilla.gnome.org/show_bug.cgi?id=795138
+---
+ gobject/gobject.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gobject/gobject.h b/gobject/gobject.h
+index 9830663ce..838046fe0 100644
+--- a/gobject/gobject.h
++++ b/gobject/gobject.h
+@@ -507,7 +507,7 @@ GLIB_AVAILABLE_IN_ALL
+ void        g_object_remove_weak_pointer      (GObject        *object, 
+                                                gpointer       *weak_pointer_location);
+ 
+-#if defined(__GNUC__) && !defined(__cplusplus) && GLIB_VERSION_MAX_ALLOWED >= GLIB_VERSION_2_56
++#if (__GNUC__ > 4 || (__GNUC__ == 4 && __GNUC_MINOR__ >= 8)) && !defined(__cplusplus) && GLIB_VERSION_MAX_ALLOWED >= GLIB_VERSION_2_56
+ /* Make reference APIs type safe with macros */
+ #define g_object_ref(Obj)      ((__typeof__(Obj)) (g_object_ref) (Obj))
+ #define g_object_ref_sink(Obj) ((__typeof__(Obj)) (g_object_ref_sink) (Obj))
+-- 
+2.14.1
+
diff --git a/package/libglib2/0003-Do-not-hardcode-python-path-into-various-tools.patch b/package/libglib2/0004-Do-not-hardcode-python-path-into-various-tools.patch
similarity index 100%
rename from package/libglib2/0003-Do-not-hardcode-python-path-into-various-tools.patch
rename to package/libglib2/0004-Do-not-hardcode-python-path-into-various-tools.patch
diff --git a/package/libglib2/0004-grefcount-add-missing-gatomic.h.patch b/package/libglib2/0004-grefcount-add-missing-gatomic.h.patch
deleted file mode 100644
index 165c0baf96..0000000000
--- a/package/libglib2/0004-grefcount-add-missing-gatomic.h.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 09c149453ac969dedb1cb2d15d489d1dd81412bf Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 13 Oct 2018 23:10:33 +0200
-Subject: [PATCH] grefcount: add missing gatomic.h
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Without gatomic.h, build fails on:
-In file included from garcbox.c:24:0:
-garcbox.c: In function ???g_atomic_rc_box_acquire???:
-grefcount.h:101:13: error: implicit declaration of function ???g_atomic_int_get???; did you mean ???__atomic_store???? [-Werror=implicit-function-declaration]
-     (void) (g_atomic_int_get (rc) == G_MAXINT ? 0 : g_atomic_int_inc ((rc))); \
-             ^
-garcbox.c:292:3: note: in expansion of macro ???g_atomic_ref_count_inc???
-   g_atomic_ref_count_inc (&real_box->ref_count);
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://gitlab.gnome.org/GNOME/glib/merge_requests/400]
----
- glib/grefcount.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/glib/grefcount.h b/glib/grefcount.h
-index dec9a5ffb..b6eced1b7 100644
---- a/glib/grefcount.h
-+++ b/glib/grefcount.h
-@@ -23,6 +23,7 @@
- #error "Only <glib.h> can be included directly."
- #endif
- 
-+#include <glib/gatomic.h>
- #include <glib/gtypes.h>
- 
- G_BEGIN_DECLS
--- 
-2.17.1
-
diff --git a/package/libglib2/0005-gio-fix-compilation-without-F_-S-G-ETPIPE_SZ.patch b/package/libglib2/0005-gio-fix-compilation-without-F_-S-G-ETPIPE_SZ.patch
new file mode 100644
index 0000000000..032f4851c4
--- /dev/null
+++ b/package/libglib2/0005-gio-fix-compilation-without-F_-S-G-ETPIPE_SZ.patch
@@ -0,0 +1,52 @@
+From 0beb62f564072f3585762c9c55fe894485993b62 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 10 Apr 2018 18:55:11 +0200
+Subject: [PATCH] gio: fix compilation without F_{S,G}ETPIPE_SZ
+
+Commit a5778ef7c51044147fe470ea1707dd297f44f880 broke compilation on
+architectures without F_SETPIPE_SZ and F_GETPIPE_SZ such as or1k.
+If those variables are undefined, put back previous behavior, buffer
+size set to 1024 * 64
+
+Fixes:
+ - http://autobuild.buildroot.net/results/398490e07343a931b25ca6ab5c90a75d7a073e9f
+
+(Modified by Philip Withnall <withnall@endlessm.com> to add an
+explanatory comment.)
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+
+https://bugzilla.gnome.org/show_bug.cgi?id=795133
+---
+ gio/gfile.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/gio/gfile.c b/gio/gfile.c
+index 334ad8ec3..a67aad383 100644
+--- a/gio/gfile.c
++++ b/gio/gfile.c
+@@ -3012,6 +3012,7 @@ splice_stream_with_progress (GInputStream           *in,
+   if (!g_unix_open_pipe (buffer, FD_CLOEXEC, error))
+     return FALSE;
+ 
++#if defined(F_SETPIPE_SZ) && defined(F_GETPIPE_SZ)
+   /* Try a 1MiB buffer for improved throughput. If that fails, use the default
+    * pipe size. See: https://bugzilla.gnome.org/791457 */
+   buffer_size = fcntl (buffer[1], F_SETPIPE_SZ, 1024 * 1024);
+@@ -3029,6 +3030,13 @@ splice_stream_with_progress (GInputStream           *in,
+           goto out;
+         }
+     }
++#else
++  /* If #F_GETPIPE_SZ isn???t available, assume we???re on Linux < 2.6.35,
++   * but ??? 2.6.11, meaning the pipe capacity is 64KiB. Ignore the possibility of
++   * running on Linux < 2.6.11 (where the capacity was the system page size,
++   * typically 4KiB) because it???s ancient. See pipe(7). */
++  buffer_size = 1024 * 64;
++#endif
+ 
+   g_assert (buffer_size > 0);
+ 
+-- 
+2.13.0
+
diff --git a/package/libglib2/libglib2.hash b/package/libglib2/libglib2.hash
index ff325432a0..7ce031aa89 100644
--- a/package/libglib2/libglib2.hash
+++ b/package/libglib2/libglib2.hash
@@ -1,4 +1,4 @@
-# https://download.gnome.org/sources/glib/2.58/glib-2.58.1.sha256sum
-sha256  97d6a9d926b6aa3dfaadad3077cfb43eec74432ab455dff14250c769d526d7d6  glib-2.58.1.tar.xz
+# https://download.gnome.org/sources/glib/2.56/glib-2.56.1.sha256sum
+sha256  40ef3f44f2c651c7a31aedee44259809b6f03d3d20be44545cd7d177221c0b8d  glib-2.56.1.tar.xz
 # License files, locally calculated
 sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index 8b2277bd2e..67db5ac359 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGLIB2_VERSION_MAJOR = 2.58
+LIBGLIB2_VERSION_MAJOR = 2.56
 LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).1
 LIBGLIB2_SOURCE = glib-$(LIBGLIB2_VERSION).tar.xz
 LIBGLIB2_SITE = http://ftp.gnome.org/pub/gnome/sources/glib/$(LIBGLIB2_VERSION_MAJOR)
@@ -13,15 +13,6 @@ LIBGLIB2_LICENSE_FILES = COPYING
 # 0002-disable-tests.patch
 LIBGLIB2_AUTORECONF = YES
 
-# Copy what is done in autogen.sh when gtk-doc is not available
-define LIBGLIB2_GTK_DOC_HOOK
-	echo "EXTRA_DIST=" > $(@D)/gtk-doc.make
-	echo "CLEANFILES=" >> $(@D)/gtk-doc.make
-endef
-
-LIBGLIB2_PRE_CONFIGURE_HOOKS += LIBGLIB2_GTK_DOC_HOOK
-HOST_LIBGLIB2_PRE_CONFIGURE_HOOKS += LIBGLIB2_GTK_DOC_HOOK
-
 LIBGLIB2_INSTALL_STAGING = YES
 LIBGLIB2_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) LDFLAGS=-L$(STAGING_DIR)/usr/lib install
 
