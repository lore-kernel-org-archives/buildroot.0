From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 5 Oct 2010 09:15:06 +0200
Subject: [Buildroot] [git commit master 1/1] package: add librsvg package
Message-ID: <20101005071708.723E88B854@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=31699a57d643cdc473123ff5701bcc33cd0ee4e6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

librsvg is a svg renderer.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                    |    2 +-
 package/Config.in          |    1 +
 package/librsvg/Config.in  |   14 ++++++++++++++
 package/librsvg/librsvg.mk |   18 ++++++++++++++++++
 4 files changed, 34 insertions(+), 1 deletions(-)
 create mode 100644 package/librsvg/Config.in
 create mode 100644 package/librsvg/librsvg.mk

diff --git a/CHANGES b/CHANGES
index c3f8a9e..4a382a2 100644
--- a/CHANGES
+++ b/CHANGES
@@ -21,7 +21,7 @@
 
 	Alpha, Cris, IA64 and Sparc64 architecture support removed.
 
-	New packages: xz
+	New packages: librsvg, xz
 
 	Updated/fixed packages: acpid, alsa-lib, argus, at, autoconf,
 	automake, avahi, axel, beecrypt, berkeleydb, bind, bmon, boa,
diff --git a/package/Config.in b/package/Config.in
index ce6057b..5e08d59 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -263,6 +263,7 @@ source "package/libgail/Config.in"
 source "package/libglade/Config.in"
 source "package/libgtk2/Config.in"
 source "package/libpng/Config.in"
+source "package/librsvg/Config.in"
 source "package/libsvgtiny/Config.in"
 source "package/libungif/Config.in"
 source "package/pango/Config.in"
diff --git a/package/librsvg/Config.in b/package/librsvg/Config.in
new file mode 100644
index 0000000..fdb7d31
--- /dev/null
+++ b/package/librsvg/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_LIBRSVG
+	bool "librsvg"
+	select BR2_PACKAGE_LIBXML2
+	select BR2_PACKAGE_CAIRO
+	select BR2_PACKAGE_CAIRO_PNG
+	select BR2_PACKAGE_PANGO
+	select BR2_PACKAGE_LIBGLIB2
+	depends on BR2_PACKAGE_LIBGTK2
+	depends on BR2_USE_WCHAR # glib2
+	help
+	  The rsvg library is an efficient renderer for Scalable
+	  Vector Graphics (SVG) pictures.
+
+	  http://librsvg.sourceforge.net/
diff --git a/package/librsvg/librsvg.mk b/package/librsvg/librsvg.mk
new file mode 100644
index 0000000..98bb25c
--- /dev/null
+++ b/package/librsvg/librsvg.mk
@@ -0,0 +1,18 @@
+#############################################################
+#
+# librsvg
+#
+#############################################################
+
+LIBRSVG_VERSION_MAJOR:=2.26
+LIBRSVG_VERSION_MINOR:=3
+LIBRSVG_VERSION:=$(LIBRSVG_VERSION_MAJOR).$(LIBRSVG_VERSION_MINOR)
+LIBRSVG_SOURCE:=librsvg-$(LIBRSVG_VERSION).tar.gz
+LIBRSVG_SITE:=http://ftp.gnome.org/pub/GNOME/sources/librsvg/$(LIBRSVG_VERSION_MAJOR)/
+LIBRSVG_INSTALL_STAGING = YES
+LIBRSVG_INSTALL_TARGET = YES
+LIBRSVG_LIBTOOL_PATCH = NO
+LIBRSVG_CONF_OPT = --disable-tools
+LIBRSVG_DEPENDENCIES = libxml2 cairo pango libglib2 libgtk2
+
+$(eval $(call AUTOTARGETS,package,librsvg))
-- 
1.7.1
