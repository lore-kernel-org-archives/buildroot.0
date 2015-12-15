From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Dec 2015 22:36:33 +0100
Subject: [Buildroot] [git commit] librsvg: bump to version 2.40.12
Message-ID: <20151215213939.AEA37802A5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=50466d01045c857f1905bd4a78469b3d7923a4d5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/librsvg/Config.in    |  7 ++++---
 package/librsvg/librsvg.hash |  4 ++--
 package/librsvg/librsvg.mk   | 21 +++++++++------------
 3 files changed, 15 insertions(+), 17 deletions(-)

diff --git a/package/librsvg/Config.in b/package/librsvg/Config.in
index 94ef2ed..03e5cf3 100644
--- a/package/librsvg/Config.in
+++ b/package/librsvg/Config.in
@@ -1,11 +1,12 @@
 config BR2_PACKAGE_LIBRSVG
 	bool "librsvg"
-	select BR2_PACKAGE_LIBXML2
 	select BR2_PACKAGE_CAIRO
 	select BR2_PACKAGE_CAIRO_PNG
-	select BR2_PACKAGE_PANGO
-	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_GDK_PIXBUF
+	select BR2_PACKAGE_LIBCROCO
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_LIBXML2
+	select BR2_PACKAGE_PANGO
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
 	depends on BR2_USE_MMU # glib2
diff --git a/package/librsvg/librsvg.hash b/package/librsvg/librsvg.hash
index 7572d6c..2920487 100644
--- a/package/librsvg/librsvg.hash
+++ b/package/librsvg/librsvg.hash
@@ -1,2 +1,2 @@
-# From http://ftp.gnome.org/pub/gnome/sources/librsvg/2.26/librsvg-2.26.3.sha256sum
-sha256	3761e3d446a9c2f4ebe52431289e15976f1d447f64ed33bb7f35cb1c430eac49	librsvg-2.26.3.tar.gz
+# From http://ftp.acc.umu.se/pub/gnome/sources/librsvg/2.40/librsvg-2.40.12.sha256sum
+sha256	ffe40c4378bf3899f4d679a475726bab03a127a5bdccddec86404cc329ffb550	librsvg-2.40.12.tar.xz
diff --git a/package/librsvg/librsvg.mk b/package/librsvg/librsvg.mk
index 5c385dc..90c0a7d 100644
--- a/package/librsvg/librsvg.mk
+++ b/package/librsvg/librsvg.mk
@@ -4,21 +4,18 @@
 #
 ################################################################################
 
-LIBRSVG_VERSION_MAJOR = 2.26
-LIBRSVG_VERSION = $(LIBRSVG_VERSION_MAJOR).3
-LIBRSVG_SITE = http://ftp.gnome.org/pub/GNOME/sources/librsvg/$(LIBRSVG_VERSION_MAJOR)
+LIBRSVG_VERSION_MAJOR = 2.40
+LIBRSVG_VERSION = $(LIBRSVG_VERSION_MAJOR).12
+LIBRSVG_SITE = http://ftp.gnome.org/pub/gnome/sources/librsvg/$(LIBRSVG_VERSION_MAJOR)
+LIBRSVG_SOURCE = librsvg-$(LIBRSVG_VERSION).tar.xz
 LIBRSVG_INSTALL_STAGING = YES
-LIBRSVG_CONF_OPTS = --disable-tools
-LIBRSVG_DEPENDENCIES = libxml2 cairo pango libglib2 gdk-pixbuf
-HOST_LIBRSVG_DEPENDENCIES = host-libxml2 host-cairo host-pango host-libglib2 host-gdk-pixbuf
+LIBRSVG_CONF_OPTS = --disable-tools --enable-introspection=no
+HOST_LIBRSVG_CONF_OPTS = --enable-introspection=no
+LIBRSVG_DEPENDENCIES = cairo gdk-pixbuf libcroco libglib2 libxml2 pango \
+	$(if $(BR2_PACKAGE_LIBGTK3),libgtk3)
+HOST_LIBRSVG_DEPENDENCIES = host-cairo host-gdk-pixbuf host-libcroco host-libglib2 host-libxml2 host-pango
 LIBRSVG_LICENSE = LGPLv2+
 LIBRSVG_LICENSE_FILES = COPYING.LIB
 
-# If we have Gtk2, let's build it first to benefit from librsvg Gtk
-# support.
-ifeq ($(BR2_PACKAGE_LIBGTK2),y)
-LIBRSVG_DEPENDENCIES += libgtk2
-endif
-
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
