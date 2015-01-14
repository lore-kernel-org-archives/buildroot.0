From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Jan 2015 22:01:42 +0100
Subject: [Buildroot] [git commit] dvdauthor : new package
Message-ID: <20150114210154.C36DE80D95@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=072ba39cee77bb2487a84627056900ad6be52c9b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

DVDAuthor is a set of tools to help you author the file and directory
structure of a DVD-Video disc, including programmatic commands for
implementing interactive behaviour. It is driven by command lines and
XML control files, though there are other programs that provide
GUI-based front ends if you prefer

[Thomas:
 - Make the libdvdread dependency optional: it is only needed for the
   dvdunauthor program, which can be disabled using a configure
   option. So a separate Config.in option was added for dvdunauthor.
 - Adjust license to GPLv2+, as can be seen in the source code itself.
 - Add optional dependency on fontconfig and imagemagick. Make sure we
   don't pick up a host installed GraphicsMagick (which is different
   from ImageMagick!)
 - Add a hash file.]

Signed-off-by Stephen M. Kenton <skenton@ou.edu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                |    1 +
 package/dvdauthor/Config.in      |   30 +++++++++++++++++++++++++++++
 package/dvdauthor/dvdauthor.hash |    2 +
 package/dvdauthor/dvdauthor.mk   |   39 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 72 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 7bd31e8..77f0823 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -6,6 +6,7 @@ menu "Audio and video applications"
 	source "package/alsa-utils/Config.in"
 	source "package/aumix/Config.in"
 	source "package/bellagio/Config.in"
+	source "package/dvdauthor/Config.in"
 	source "package/espeak/Config.in"
 	source "package/faad2/Config.in"
 	source "package/ffmpeg/Config.in"
diff --git a/package/dvdauthor/Config.in b/package/dvdauthor/Config.in
new file mode 100644
index 0000000..d241af0
--- /dev/null
+++ b/package/dvdauthor/Config.in
@@ -0,0 +1,30 @@
+config BR2_PACKAGE_DVDAUTHOR
+	bool "dvdauthor"
+	select BR2_PACKAGE_LIBXML2
+	select BR2_PACKAGE_FREETYPE
+	select BR2_PACKAGE_LIBPNG
+	help
+	  DVDAuthor is a set of tools to help you author the file and directory
+	  structure of a DVD-Video disc, including programmatic commands for
+	  implementing interactive behaviour. It is driven by command lines and
+	  XML control files, though there are other programs that provide
+	  GUI-based front ends if you prefer
+
+	  http://dvdauthor.sourceforge.net
+
+if BR2_PACKAGE_DVDAUTHOR
+
+config BR2_PACKAGE_DVDAUTHOR_DVDUNAUTHOR
+	bool "dvdunauthor"
+	select BR2_PACKAGE_LIBDVDREAD
+	depends on BR2_LARGEFILE # libdvdread
+	depends on !BR2_STATIC_LIBS # libdvdread
+	help
+	  This option enables the dvdunauthor program, which requires
+	  libdvdread.
+
+comment "dvdunauthor needs a toolchain w/ dynamic library, largefile"
+	depends on !BR2_LARGEFILE || BR2_STATIC_LIBS
+
+endif
+
diff --git a/package/dvdauthor/dvdauthor.hash b/package/dvdauthor/dvdauthor.hash
new file mode 100644
index 0000000..fe92b29
--- /dev/null
+++ b/package/dvdauthor/dvdauthor.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 501fb11b09c6eb9c5a229dcb400bd81e408cc78d34eab6749970685023c51fe9 dvdauthor-0.7.1.tar.gz
diff --git a/package/dvdauthor/dvdauthor.mk b/package/dvdauthor/dvdauthor.mk
new file mode 100644
index 0000000..7985599
--- /dev/null
+++ b/package/dvdauthor/dvdauthor.mk
@@ -0,0 +1,39 @@
+###############################################################################
+#
+# dvdauthor
+#
+###############################################################################
+
+DVDAUTHOR_VERSION = 0.7.1
+DVDAUTHOR_SITE = http://sourceforge.net/projects/dvdauthor/files/dvdauthor/$(DVDAUTHOR_VERSION)
+DVDAUTHOR_DEPENDENCIES = host-pkgconf libxml2 freetype libpng
+DVDAUTHOR_LICENSE = GPLv2+
+DVDAUTHOR_LICENSE_FILES = COPYING
+DVDAUTHOR_CONF_ENV = \
+	ac_cv_prog_FREETYPECONFIG=$(STAGING_DIR)/usr/bin/freetype-config \
+	ac_cv_path_XML2_CONFIG=$(STAGING_DIR)/usr/bin/xml2-config \
+	ac_cv_prog_GMAGICKCONFIG=
+
+ifeq ($(BR2_PACKAGE_IMAGEMAGICK),y)
+DVDAUTHOR_DEPENDENCIES += imagemagick
+DVDAUTHOR_CONF_ENV += \
+	ac_cv_prog_MAGICKCONFIG=$(STAGING_DIR)/usr/bin/Magick-config
+else
+DVDAUTHOR_CONF_ENV += \
+	ac_cv_prog_MAGICKCONFIG=
+endif
+
+# Automatically detected by dvdauthor configure script, no way to
+# disable.
+ifeq ($(BR2_PACKAGE_FONTCONFIG),y)
+DVDAUTHOR_DEPENDENCIES += fontconfig
+endif
+
+ifeq ($(BR2_PACKAGE_DVDAUTHOR_DVDUNAUTHOR),y)
+DVDAUTHOR_DEPENDENCIES += libdvdread
+DVDAUTHOR_CONF_OPTS += --enable-dvdunauthor
+else
+DVDAUTHOR_CONF_OPTS += --disable-dvdunauthor
+endif
+
+$(eval $(autotools-package))
