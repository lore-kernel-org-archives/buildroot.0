From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 14 Oct 2019 21:41:59 +0200
Subject: [Buildroot] [git commit] package/pango: bump to version 1.44.6
Message-ID: <20191014193801.132AB8DEC2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5cce413eb11ac75f5c48ed351896c5d1c33961d5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switch build system from autotools to meson.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-build-disable-tests-from-building.patch   | 41 ----------------------
 ...-assertion-with-invalid-Unicode-sequences.patch | 38 --------------------
 package/pango/0002-no-gtk-doc.patch                | 25 -------------
 package/pango/pango.hash                           |  4 +--
 package/pango/pango.mk                             | 17 ++++-----
 5 files changed, 8 insertions(+), 117 deletions(-)

diff --git a/package/pango/0001-build-disable-tests-from-building.patch b/package/pango/0001-build-disable-tests-from-building.patch
deleted file mode 100644
index 1156c24f07..0000000000
--- a/package/pango/0001-build-disable-tests-from-building.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 1c503a8b2f127c12e58a6e8ba01743c04061df50 Mon Sep 17 00:00:00 2001
-From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Tue, 5 Sep 2017 07:25:17 -0400
-Subject: [PATCH] build: disable tests from building
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-[Adam: refresh for pango 1.40.12]
-Signed-off-by: Adam Duskett <aduskett@gmail.com>
----
- Makefile.am | 2 +-
- Makefile.in | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index 70bf8b0..c69daf0 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -1,6 +1,6 @@
- ## Process this file with automake to create Makefile.in.
- 
--SUBDIRS= pango pango-view examples docs tools tests win32
-+SUBDIRS= pango pango-view examples docs tools win32
- 
- meson_dist_files = \
- 	pango/pango-features.h.meson \
-diff --git a/Makefile.in b/Makefile.in
-index 8489ca1..51f6ada 100644
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -412,7 +412,7 @@ target_alias = @target_alias@
- top_build_prefix = @top_build_prefix@
- top_builddir = @top_builddir@
- top_srcdir = @top_srcdir@
--SUBDIRS = pango pango-view examples docs tools tests win32
-+SUBDIRS = pango pango-view examples docs tools win32
- meson_dist_files = \
- 	pango/pango-features.h.meson \
- 	pango-view/meson.build \
--- 
-2.13.5
-
diff --git a/package/pango/0002-Prevent-an-assertion-with-invalid-Unicode-sequences.patch b/package/pango/0002-Prevent-an-assertion-with-invalid-Unicode-sequences.patch
deleted file mode 100644
index 010981e8b4..0000000000
--- a/package/pango/0002-Prevent-an-assertion-with-invalid-Unicode-sequences.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 71aaeaf020340412b8d012fe23a556c0420eda5f Mon Sep 17 00:00:00 2001
-From: Matthias Clasen <mclasen@redhat.com>
-Date: Fri, 17 Aug 2018 22:29:36 -0400
-Subject: [PATCH] Prevent an assertion with invalid Unicode sequences
-
-Invalid Unicode sequences, such as 0x2665 0xfe0e 0xfe0f,
-can trick the Emoji iter code into returning an empty
-segment, which then triggers an assertion in the itemizer.
-
-Prevent this by ensuring that we make progress.
-
-This issue was reported by Jeffrey M.
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- pango/pango-emoji.c | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/pango/pango-emoji.c b/pango/pango-emoji.c
-index 0e332dff..29472452 100644
---- a/pango/pango-emoji.c
-+++ b/pango/pango-emoji.c
-@@ -253,6 +253,12 @@ _pango_emoji_iter_next (PangoEmojiIter *iter)
-     if (iter->is_emoji == PANGO_EMOJI_TYPE_IS_EMOJI (current_emoji_type))
-     {
-       iter->is_emoji = !PANGO_EMOJI_TYPE_IS_EMOJI (current_emoji_type);
-+
-+      /* Make sure we make progress.  Weird sequences, like a VC15 followed
-+       * by VC16, can trick us into stalling otherwise. */
-+      if (iter->start == iter->end)
-+        iter->end = g_utf8_next_char (iter->end);
-+
-       return TRUE;
-     }
-   }
--- 
-2.11.0
-
diff --git a/package/pango/0002-no-gtk-doc.patch b/package/pango/0002-no-gtk-doc.patch
deleted file mode 100644
index 926a263f1b..0000000000
--- a/package/pango/0002-no-gtk-doc.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-Same patch as for systemd in commit
-7144f2f04b705538a893e538a6b851f536f433b6:
-
-Fix deactivation of gtk-doc
-
-The tarball contains the Makefile for building documentation with gtk-doc,
-Unfortunately the AM_CONDITIONAL variable is not the correct one, which
-results in an error when running autoreconf.
-
-This patch fixes this issue.
-
-Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
-Signed-off-by: Hadrien Boutteville <hadrien.boutteville@gmail.com>
-
---- a/gtk-doc.make
-+++ b/gtk-doc.make
-@@ -267,7 +267,7 @@
- #
- # Require gtk-doc when making dist
- #
--if HAVE_GTK_DOC
-+if ENABLE_GTK_DOC
- dist-check-gtkdoc: docs
- else
- dist-check-gtkdoc:
diff --git a/package/pango/pango.hash b/package/pango/pango.hash
index 6df08e9cfc..1cd19d3cf9 100644
--- a/package/pango/pango.hash
+++ b/package/pango/pango.hash
@@ -1,3 +1,3 @@
-# From http://ftp.gnome.org/pub/GNOME/sources/pango/1.40/pango-1.40.14.sha256sum
-sha256	90af1beaa7bf9e4c52db29ec251ec4fd0a8f2cc185d521ad1f88d01b3a6a17e3	pango-1.40.14.tar.xz
+# From http://ftp.gnome.org/pub/GNOME/sources/pango/1.44/pango-1.44.6.sha256sum
+sha256	3e1e41ba838737e200611ff001e3b304c2ca4cdbba63d200a20db0b0ddc0f86c	pango-1.44.6.tar.xz
 sha256	d245807f90032872d1438d741ed21e2490e1175dc8aa3afa5ddb6c8e529b58e5	COPYING
diff --git a/package/pango/pango.mk b/package/pango/pango.mk
index 805d35e12f..33e7825896 100644
--- a/package/pango/pango.mk
+++ b/package/pango/pango.mk
@@ -4,17 +4,16 @@
 #
 ################################################################################
 
-PANGO_VERSION_MAJOR = 1.40
-PANGO_VERSION = $(PANGO_VERSION_MAJOR).14
+PANGO_VERSION_MAJOR = 1.44
+PANGO_VERSION = $(PANGO_VERSION_MAJOR).6
 PANGO_SOURCE = pango-$(PANGO_VERSION).tar.xz
 PANGO_SITE = http://ftp.gnome.org/pub/GNOME/sources/pango/$(PANGO_VERSION_MAJOR)
-PANGO_AUTORECONF = YES
 PANGO_INSTALL_STAGING = YES
 PANGO_LICENSE = LGPL-2.0+
 PANGO_LICENSE_FILES = COPYING
 
-PANGO_CONF_OPTS = --enable-explicit-deps=no
-HOST_PANGO_CONF_OPTS = --enable-explicit-deps=no
+PANGO_CONF_OPTS = -Duse_fontconfig=true -Dintrospection=false
+HOST_PANGO_CONF_OPTS = -Duse_fontconfig=true -Dintrospection=false
 
 PANGO_DEPENDENCIES = \
 	$(TARGET_NLS_DEPENDENCIES) \
@@ -33,16 +32,12 @@ HOST_PANGO_DEPENDENCIES = \
 	host-freetype
 
 ifeq ($(BR2_PACKAGE_XORG7),y)
-PANGO_CONF_OPTS += \
-	--x-includes=$(STAGING_DIR)/usr/include/X11 \
-	--x-libraries=$(STAGING_DIR)/usr/lib
 PANGO_DEPENDENCIES += xlib_libX11
 endif
 
 ifeq ($(BR2_PACKAGE_XLIB_LIBXFT)$(BR2_PACKAGE_XLIB_LIBXRENDER),yy)
 PANGO_DEPENDENCIES += xlib_libXft xlib_libXrender
-PANGO_CONF_OPTS += --with-xft
 endif
 
-$(eval $(autotools-package))
-$(eval $(host-autotools-package))
+$(eval $(meson-package))
+$(eval $(host-meson-package))
