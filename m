From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 16 Feb 2021 21:46:28 +0100
Subject: [Buildroot] [git commit] package/perl-gd: provide gd options
Message-ID: <20210216202628.0D378810CA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d9813df50a724869a1b4d6cbf90af053b91eda5a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that gdlib-config is gone, provide the GD options otherwise perl-gd
will assume that everything is available:

$features = 'GD_GIF GD_GIFANIM GD_OPENPOLYGON GD_ZLIB GD_PNG GD_FREETYPE GD_FONTCONFIG GD_JPEG GD_XPM GD_TIFF GD_WEBP';

Also, while at it, also make some of the dependencies as optional as
suggested by Fran??ois Perrad

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Tested-by: Francois Perrad <francois.perrad@gadz.org> (with
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/perl-gd/Config.in  |  2 --
 package/perl-gd/perl-gd.mk | 39 ++++++++++++++++++++++++++++++++++-----
 2 files changed, 34 insertions(+), 7 deletions(-)

diff --git a/package/perl-gd/Config.in b/package/perl-gd/Config.in
index ef28f7b971..044e601021 100644
--- a/package/perl-gd/Config.in
+++ b/package/perl-gd/Config.in
@@ -2,8 +2,6 @@ config BR2_PACKAGE_PERL_GD
 	bool "perl-gd"
 	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_ZLIB
-	select BR2_PACKAGE_LIBPNG
-	select BR2_PACKAGE_FREETYPE
 	select BR2_PACKAGE_GD
 	help
 	  Perl interface to the gd2 graphics library.
diff --git a/package/perl-gd/perl-gd.mk b/package/perl-gd/perl-gd.mk
index 2932b686bb..b402dfff49 100644
--- a/package/perl-gd/perl-gd.mk
+++ b/package/perl-gd/perl-gd.mk
@@ -7,7 +7,7 @@
 PERL_GD_VERSION = 2.73
 PERL_GD_SOURCE = GD-$(PERL_GD_VERSION).tar.gz
 PERL_GD_SITE = $(BR2_CPAN_MIRROR)/authors/id/R/RU/RURBAN
-PERL_GD_DEPENDENCIES = host-perl-extutils-pkgconfig zlib libpng freetype gd
+PERL_GD_DEPENDENCIES = host-perl-extutils-pkgconfig zlib gd
 PERL_GD_LICENSE = Artistic or GPL-1.0+
 PERL_GD_LICENSE_FILES = LICENSE
 PERL_GD_DISTNAME = GD
@@ -16,10 +16,39 @@ PERL_GD_CONF_ENV = \
 	PATH=$(BR_PATH) \
 	PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig"
 
-PERL_GD_CONF_OPTS = \
+ifeq ($(BR2_PACKAGE_FONTCONFIG),y)
+PERL_GD_DEPENDENCIES += fontconfig
+PERL_GD_OPTIONS += FONTCONFIG
+PERL_GD_CONF_OPTS += -lib_fontconfig_path=$(STAGING_DIR)/usr
+endif
+
+ifeq ($(BR2_PACKAGE_FREETYPE),y)
+PERL_GD_DEPENDENCIES += freetype
+PERL_GD_OPTIONS += FT
+PERL_GD_CONF_OPTS += -lib_ft_path=$(STAGING_DIR)/usr
+endif
+
+ifeq ($(BR2_PACKAGE_JPEG),y)
+PERL_GD_DEPENDENCIES += jpeg
+PERL_GD_OPTIONS += JPEG
+PERL_GD_CONF_OPTS += -lib_jpeg_path=$(STAGING_DIR)/usr
+endif
+
+ifeq ($(BR2_PACKAGE_LIBPNG),y)
+PERL_GD_DEPENDENCIES += libpng
+PERL_GD_OPTIONS += PNG
+PERL_GD_CONF_OPTS += -lib_png_path=$(STAGING_DIR)/usr
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBXPM),y)
+PERL_GD_DEPENDENCIES += xlib_libXpm
+PERL_GD_OPTIONS += XPM
+PERL_GD_CONF_OPTS += -lib_xpm_path=$(STAGING_DIR)/usr
+endif
+
+PERL_GD_CONF_OPTS += \
 	-lib_gd_path=$(STAGING_DIR)/usr \
-	-lib_ft_path=$(STAGING_DIR)/usr \
-	-lib_png_path=$(STAGING_DIR)/usr \
-	-lib_zlib_path=$(STAGING_DIR)/usr
+	-lib_zlib_path=$(STAGING_DIR)/usr \
+	-options=$(subst $(space),$(comma),$(PERL_GD_OPTIONS))
 
 $(eval $(perl-package))
