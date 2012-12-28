From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 28 Dec 2012 20:42:10 +0100
Subject: [Buildroot] [PATCH 17/20] librsvg: relax dependency on Gtk,
	add gdk-pixbuf dependency
In-Reply-To: <cover.1356723702.git.thomas.petazzoni@free-electrons.com>
References: <cover.1356723702.git.thomas.petazzoni@free-electrons.com>
Message-ID: <6d737cde125047e0aca0b94cb49512276f8506fe.1356723702.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

librsvg doesn't *require* Gtk, it can optionally build a Gtk theme
engine, but it is not mandatory. Therefore, we make the Gtk dependency
an optional dependency rather than a hard dependency. This will be
useful as librsvg will become a dependency of libevas-generic-loaders,
used in an EFL context in which building libgtk is not really what we
want.

However, gdk-pixbuf is a mandatory dependency to build librsvg, so we
add this one.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/librsvg/Config.in  |    2 +-
 package/librsvg/librsvg.mk |    8 +++++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/librsvg/Config.in b/package/librsvg/Config.in
index fdb7d31..855b3d6 100644
--- a/package/librsvg/Config.in
+++ b/package/librsvg/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_LIBRSVG
 	select BR2_PACKAGE_CAIRO_PNG
 	select BR2_PACKAGE_PANGO
 	select BR2_PACKAGE_LIBGLIB2
-	depends on BR2_PACKAGE_LIBGTK2
+	select BR2_PACKAGE_GDK_PIXBUF
 	depends on BR2_USE_WCHAR # glib2
 	help
 	  The rsvg library is an efficient renderer for Scalable
diff --git a/package/librsvg/librsvg.mk b/package/librsvg/librsvg.mk
index e54c06c..745fcfa 100644
--- a/package/librsvg/librsvg.mk
+++ b/package/librsvg/librsvg.mk
@@ -11,6 +11,12 @@ LIBRSVG_SOURCE:=librsvg-$(LIBRSVG_VERSION).tar.gz
 LIBRSVG_SITE:=http://ftp.gnome.org/pub/GNOME/sources/librsvg/$(LIBRSVG_VERSION_MAJOR)/
 LIBRSVG_INSTALL_STAGING = YES
 LIBRSVG_CONF_OPT = --disable-tools
-LIBRSVG_DEPENDENCIES = libxml2 cairo pango libglib2 libgtk2
+LIBRSVG_DEPENDENCIES = libxml2 cairo pango libglib2 gdk-pixbuf
+
+# If we have Gtk2, let's build it first to benefit from librsvg Gtk
+# support.
+ifeq ($(BR2_PACKAGE_LIBGTK2),y)
+LIBRSVG_DEPENDENCIES += libgtk2
+endif
 
 $(eval $(autotools-package))
-- 
1.7.9.5
