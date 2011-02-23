From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 23 Feb 2011 23:37:36 +0100
Subject: [Buildroot] [git commit master 1/1] metacity: fix build,
	bump version
Message-ID: <20110223224019.9CF748F626@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=c25d7e49a94b997144f808c44495d38de507b1e6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Metacity no longer built after libgtk2 was updated, so fix it by bumping
the version. We unfortunately cannot move to the latest version, as
these have extra dependencies we don't have in BR yet
(libcanberra-gtk + gnome-doc-utils).

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/metacity/metacity-gconf.patch |   44 +++++++++++++++++++++------------
 package/metacity/metacity-nopo.patch  |   30 ----------------------
 package/metacity/metacity.mk          |    9 +++---
 3 files changed, 33 insertions(+), 50 deletions(-)
 delete mode 100644 package/metacity/metacity-nopo.patch

diff --git a/package/metacity/metacity-gconf.patch b/package/metacity/metacity-gconf.patch
index b513b06..939ef7e 100644
--- a/package/metacity/metacity-gconf.patch
+++ b/package/metacity/metacity-gconf.patch
@@ -1,18 +1,30 @@
---- metacity-2.17.3/src/prefs.c.orig	2007-01-12 21:42:53.000000000 -0700
-+++ metacity-2.17.3/src/prefs.c	2007-01-12 21:45:21.000000000 -0700
-@@ -2277,6 +2277,7 @@
-       key = g_strconcat (KEY_SCREEN_BINDINGS_PREFIX, "/",
-                          binding->name, NULL);
-       
-+#ifdef HAVE_GCONF
-       gconf_client_set_string (gconf_client_get_default (),
-                                key, old_setting, &err);
+[PATCH] fix build with --disable-gconf
+
+src/core/prefs.c still contain a call to gconf_client_set_bool() when
+built with --disable-gconf, breaking the build.
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ src/core/prefs.c |    2 ++
+ 1 file changed, 2 insertions(+)
+
+Index: metacity-2.25.1/src/core/prefs.c
+===================================================================
+--- metacity-2.25.1.orig/src/core/prefs.c
++++ metacity-2.25.1/src/core/prefs.c
+@@ -2949,6 +2949,7 @@
+ void
+ meta_prefs_set_compositing_manager (gboolean whether)
+ {
++#if HAVE_GCONF
+   GError *err = NULL;
  
-@@ -2287,6 +2288,7 @@
-           g_error_free (err);
-           err = NULL;
-         }
+   gconf_client_set_bool (default_client,
+@@ -2962,6 +2963,7 @@
+                     err->message);
+       g_error_free (err);
+     }
 +#endif
-       
-       g_free (old_setting);
-       g_free (key);
+ }
+ 
+ #ifndef HAVE_GCONF
diff --git a/package/metacity/metacity-nopo.patch b/package/metacity/metacity-nopo.patch
deleted file mode 100644
index 563a17b..0000000
--- a/package/metacity/metacity-nopo.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-metacity: don't descent into po / docs subdirs
----
- Makefile.am |    2 +-
- Makefile.in |    2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-Index: metacity-2.16.8/Makefile.am
-===================================================================
---- metacity-2.16.8.orig/Makefile.am
-+++ metacity-2.16.8/Makefile.am
-@@ -1,5 +1,5 @@
- 
--SUBDIRS=src po doc
-+SUBDIRS=src
- 
- EXTRA_DIST=HACKING rationales.txt \
- 	intltool-extract.in intltool-merge.in intltool-update.in
-Index: metacity-2.16.8/Makefile.in
-===================================================================
---- metacity-2.16.8.orig/Makefile.in
-+++ metacity-2.16.8/Makefile.in
-@@ -244,7 +244,7 @@ sysconfdir = @sysconfdir@
- target_alias = @target_alias@
- top_builddir = @top_builddir@
- top_srcdir = @top_srcdir@
--SUBDIRS = src po doc
-+SUBDIRS = src
- EXTRA_DIST = HACKING rationales.txt \
- 	intltool-extract.in intltool-merge.in intltool-update.in
- 
diff --git a/package/metacity/metacity.mk b/package/metacity/metacity.mk
index 9d91efe..04cfa10 100644
--- a/package/metacity/metacity.mk
+++ b/package/metacity/metacity.mk
@@ -4,11 +4,12 @@
 #
 #############################################################
 
-METACITY_VERSION = 2.16.8
+# newer versions need libcanberra-gtk and gnome-doc-utils
+METACITY_VERSION_MAJOR = 2.25
+METACITY_VERSION_MINOR = 1
+METACITY_VERSION = $(METACITY_VERSION_MAJOR).$(METACITY_VERSION_MINOR)
 METACITY_SOURCE = metacity-$(METACITY_VERSION).tar.bz2
-METACITY_SITE = http://ftp.gnome.org/pub/gnome/sources/metacity/2.16
-METACITY_INSTALL_STAGING =NO
-METACITY_INSTALL_TARGET =YES
+METACITY_SITE = http://ftp.gnome.org/pub/gnome/sources/metacity/$(METACITY_VERSION_MAJOR)
 
 METACITY_CONF_OPT = --x-includes=$(STAGING_DIR)/usr/include/X11 \
 		--x-libraries=$(STAGING_DIR)/usr/lib \
-- 
1.7.3.4
