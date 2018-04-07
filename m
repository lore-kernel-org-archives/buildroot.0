From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  7 Apr 2018 14:08:44 +0200
Subject: [Buildroot] [PATCH v2,1/1] libglib2: bump to version 2.56.1
Message-ID: <20180407120844.8253-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove patch (applied upstream)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Thomas Petazzoni):
 - rebase on top of latest master
 - Remove DEVELOPERS entry (separate patch)

 ...solver-Fix-compilation-with-res_nclose-bu.patch | 42 ----------------------
 package/libglib2/libglib2.hash                     |  4 +--
 package/libglib2/libglib2.mk                       |  2 +-
 3 files changed, 3 insertions(+), 45 deletions(-)
 delete mode 100644 package/libglib2/0003-gthreadedresolver-Fix-compilation-with-res_nclose-bu.patch

diff --git a/package/libglib2/0003-gthreadedresolver-Fix-compilation-with-res_nclose-bu.patch b/package/libglib2/0003-gthreadedresolver-Fix-compilation-with-res_nclose-bu.patch
deleted file mode 100644
index a195b8fda1..0000000000
--- a/package/libglib2/0003-gthreadedresolver-Fix-compilation-with-res_nclose-bu.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From fe939d2b704c0b7ea3f0c429528d29441f780fb8 Mon Sep 17 00:00:00 2001
-From: Sebastian <sebastian_ml@gmx.net>
-Date: Thu, 22 Mar 2018 19:41:00 +0000
-Subject: [PATCH] gthreadedresolver: Fix compilation with res_nclose() but no
- res_nquery()
-
-Some very odd systems have the functions to initialise and destroy a
-struct __res_state, but apparently not to do a DNS query using it. Fix
-the compilation on those systems.
-
-https://bugzilla.gnome.org/show_bug.cgi?id=794606
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- gio/gthreadedresolver.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/gio/gthreadedresolver.c b/gio/gthreadedresolver.c
-index fc5c1bb77..e89dc156c 100644
---- a/gio/gthreadedresolver.c
-+++ b/gio/gthreadedresolver.c
-@@ -869,6 +869,8 @@ do_lookup_records (GTask         *task,
-   records = g_resolver_records_from_res_query (lrd->rrname, rrtype, answer->data, len, herr, &error);
-   g_byte_array_free (answer, TRUE);
- 
-+#ifdef HAVE_RES_NQUERY
-+
- #if defined(HAVE_RES_NDESTROY)
-   res_ndestroy (&res);
- #elif defined(HAVE_RES_NCLOSE)
-@@ -877,6 +879,8 @@ do_lookup_records (GTask         *task,
- #error "Your platform has res_ninit() but not res_nclose() or res_ndestroy(). Please file a bug at https://bugzilla.gnome.org/enter_bug.cgi?product=glib"
- #endif
- 
-+#endif  /* HAVE_RES_NQUERY */
-+
- #else
- 
-   DNS_STATUS status;
--- 
-2.14.3
-
diff --git a/package/libglib2/libglib2.hash b/package/libglib2/libglib2.hash
index b957bf4b10..7ce031aa89 100644
--- a/package/libglib2/libglib2.hash
+++ b/package/libglib2/libglib2.hash
@@ -1,4 +1,4 @@
-# https://download.gnome.org/sources/glib/2.56/glib-2.56.0.sha256sum
-sha256  ecef6e17e97b8d9150d0e8a4b3edee1ac37331213b8a2a87a083deea408a0fc7  glib-2.56.0.tar.xz
+# https://download.gnome.org/sources/glib/2.56/glib-2.56.1.sha256sum
+sha256  40ef3f44f2c651c7a31aedee44259809b6f03d3d20be44545cd7d177221c0b8d  glib-2.56.1.tar.xz
 # License files, locally calculated
 sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index 41ec7ee377..a32a9bab52 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBGLIB2_VERSION_MAJOR = 2.56
-LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).0
+LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).1
 LIBGLIB2_SOURCE = glib-$(LIBGLIB2_VERSION).tar.xz
 LIBGLIB2_SITE = http://ftp.gnome.org/pub/gnome/sources/glib/$(LIBGLIB2_VERSION_MAJOR)
 LIBGLIB2_LICENSE = LGPL-2.0+
-- 
2.14.1
