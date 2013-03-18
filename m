From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 18 Mar 2013 21:40:50 +0100
Subject: [Buildroot] [git commit] Added lcms2 package
Message-ID: <20130318204025.D0B5F9B168@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=901282aa6e330c5e61ab25a83ba68e443cb3aec2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Little CMS intends to be an OPEN SOURCE small-footprint color management
engine, with special focus on accuracy and performance.

[Peter: tweak help text, fix white space]
Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in       |    1 +
 package/lcms2/Config.in |   10 ++++++++++
 package/lcms2/lcms2.mk  |   35 +++++++++++++++++++++++++++++++++++
 3 files changed, 46 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 9853b06..10ce824 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -422,6 +422,7 @@ source "package/gtk2-engines/Config.in"
 source "package/gtk2-themes/Config.in"
 source "package/imlib2/Config.in"
 source "package/jpeg/Config.in"
+source "package/lcms2/Config.in"
 source "package/libart/Config.in"
 source "package/libdmtx/Config.in"
 source "package/libdrm/Config.in"
diff --git a/package/lcms2/Config.in b/package/lcms2/Config.in
new file mode 100644
index 0000000..d94c075
--- /dev/null
+++ b/package/lcms2/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_LCMS2
+	bool "lcms2"
+	help
+	  Little Color Management Software (CMS) intends to be an OPEN
+	  SOURCE small-footprint color management engine, with special
+	  focus on accuracy and performance.
+	  It uses the International Color Consortium standard (ICC), which is
+	  the modern standard when regarding to color management.
+
+	  http://www.littlecms.com/
diff --git a/package/lcms2/lcms2.mk b/package/lcms2/lcms2.mk
new file mode 100644
index 0000000..0d222c0
--- /dev/null
+++ b/package/lcms2/lcms2.mk
@@ -0,0 +1,35 @@
+#############################################################
+#
+# lcms2
+#
+#############################################################
+
+LCMS2_VERSION = 2.4
+LCMS2_SITE = http://downloads.sourceforge.net/lcms/lcms
+LCMS2_LICENSE = MIT
+LCMS2_LICENSE_FILES = COPYING
+
+LCMS2_CONF_OPT = \
+
+ifeq ($(BR2_PACKAGE_JPEG),y)
+	LCMS2_CONF_OPT += --with-jpeg
+	LCMS2_DEPENDENCIES += jpeg
+else
+	LCMS2_CONF_OPT += --without-jpeg
+endif
+
+ifeq ($(BR2_PACKAGE_TIFF),y)
+	LCMS2_CONF_OPT += --with-tiff
+	LCMS2_DEPENDENCIES += tiff
+else
+	LCMS2_CONF_OPT += --without-tiff
+endif
+
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+	LCMS2_CONF_OPT += --with-zlib
+	LCMS2_DEPENDENCIES += zlib
+else
+	LCMS2_CONF_OPT += --without-zlib
+endif
+
+$(eval $(autotools-package))
