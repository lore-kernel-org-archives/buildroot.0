From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 24 Apr 2017 22:25:31 +0200
Subject: [Buildroot] [git commit] perl-gd: bump to version 2.66
Message-ID: <20170424203123.AB59682765@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bea0cfc5962f60ecae90f092c1f31f106d06697b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

remove last patch

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-gdlib-config-is-now-configurable.patch    | 67 ----------------------
 package/perl-gd/Config.in                          |  2 +-
 package/perl-gd/perl-gd.hash                       |  4 +-
 package/perl-gd/perl-gd.mk                         |  6 +-
 4 files changed, 5 insertions(+), 74 deletions(-)

diff --git a/package/perl-gd/0001-gdlib-config-is-now-configurable.patch b/package/perl-gd/0001-gdlib-config-is-now-configurable.patch
deleted file mode 100644
index 294279a..0000000
--- a/package/perl-gd/0001-gdlib-config-is-now-configurable.patch
+++ /dev/null
@@ -1,67 +0,0 @@
-From f417f38929fe558d388b9a9343da9b2c0e6984aa Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@openwide.fr>
-Date: Sat, 20 Dec 2014 23:22:41 +0100
-Subject: [PATCH] Makefile.PL: gdlib-config is now configurable
-
-Signed-off-by: Romain Naour <romain.naour@openwide.fr>
----
- Makefile.PL | 15 +++++++++++++--
- 1 file changed, 13 insertions(+), 2 deletions(-)
-
-diff --git a/Makefile.PL b/Makefile.PL
-index dfe8ad7..0fa6ef3 100644
---- a/Makefile.PL
-+++ b/Makefile.PL
-@@ -21,7 +21,7 @@ END
- my (@INC, at LIBPATH, at LIBS,$LIBGD_VERSION);
- my $AUTOCONFIG = 0;      # global set by try_to_autoconfigure() below
- 
--my ($options,$lib_gd_path,$lib_ft_path,$lib_png_path,$lib_jpeg_path,$lib_xpm_path,$lib_zlib_path,$force);
-+my ($options,$lib_gd_path,$lib_ft_path,$lib_png_path,$lib_jpeg_path,$lib_xpm_path,$lib_zlib_path,$force,$gdlib_config_path);
- 
- use Getopt::Long;
- my $result = GetOptions("ignore_missing_gd" => \$force,
-@@ -32,6 +32,7 @@ my $result = GetOptions("ignore_missing_gd" => \$force,
- 			"lib_jpeg_path=s" => \$lib_jpeg_path,
- 			"lib_xpm_path=s"  => \$lib_xpm_path,
- 			"lib_zlib_path=s" => \$lib_zlib_path,
-+			"gdlib_config_path=s" => \$gdlib_config_path,
- 		       );
- 
- unless (try_to_autoconfigure(\$options,\$lib_gd_path,\@INC,\@LIBPATH,\@LIBS) || $force) {
-@@ -75,6 +76,7 @@ Configure GD module.
-      -lib_xpm_path  path            path to libxpm
-      -lib_zlib_path path            path to libpng
-      -ignore_missing_gd             Ignore missing or old libgd installations and try to compile anyway
-+     -gdlib_config_path path        path to gdlib-config
- 
- If no options are passed on the command line.  The program will
- attempt to autoconfigure itself with the gdlib-config program (present
-@@ -121,6 +123,15 @@ if( defined($lib_zlib_path) )
-     @INC     = ("-I$lib_zlib_path/include", @INC);
-     @LIBPATH = ("-L$lib_zlib_path/lib", @LIBPATH); 
- }
-+if( defined($gdlib_config_path) )
-+{
-+    print "gdlib-config used:          $gdlib_config_path\n";
-+}
-+else
-+{
-+    $gdlib_config_path = "gdlib-config";
-+    print "$gdlib_config_path used from the PATH\n";
-+}
- #############################################################################################
- 
- if ($^O eq 'VMS'){
-@@ -289,7 +300,7 @@ sub try_to_autoconfigure {
-   my ($prefix) = $$lib_gd_path ? ($$lib_gd_path =~ m|(^.*)/lib|) : "";
-   my $bindir = $prefix ? "$prefix/bin/" : "";
-   my $config = `${bindir}gdlib-config --all` if -e "${bindir}gdlib-config";
--  $config = `gdlib-config --all` if !$config;
-+  $config = `$gdlib_config_path --all` if !$config;
-   unless ($config) {
-       my %config;
-       require ExtUtils::PkgConfig;
--- 
-1.9.3
-
diff --git a/package/perl-gd/Config.in b/package/perl-gd/Config.in
index 61f7e5d..2b7a265 100644
--- a/package/perl-gd/Config.in
+++ b/package/perl-gd/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_PERL_GD
 	select BR2_PACKAGE_FREETYPE
 	select BR2_PACKAGE_GD
 	help
-	  Interface to Gd Graphics Library
+	  Perl interface to the gd2 graphics library
 
 	  https://metacpan.org/release/GD
 
diff --git a/package/perl-gd/perl-gd.hash b/package/perl-gd/perl-gd.hash
index 07f2471..3fc0628 100644
--- a/package/perl-gd/perl-gd.hash
+++ b/package/perl-gd/perl-gd.hash
@@ -1,3 +1,3 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    b77596aedf8ba92106ada82c7a58dd29 GD-2.59.tar.gz
-sha256 b5f22854be579cd9c1696f4a5175d57f5623d3bf2e75173ffa8038a1a28afad6 GD-2.59.tar.gz
+md5    5c89ea8861810ca41bc4aca98e3fdfda GD-2.66.tar.gz
+sha256 ea28343301b82ea862bc58c0c2d1953a074e23cf8d1d09df94c05c52f1c98281 GD-2.66.tar.gz
diff --git a/package/perl-gd/perl-gd.mk b/package/perl-gd/perl-gd.mk
index 28a1b87..ae3dfbc 100644
--- a/package/perl-gd/perl-gd.mk
+++ b/package/perl-gd/perl-gd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_GD_VERSION = 2.59
+PERL_GD_VERSION = 2.66
 PERL_GD_SOURCE = GD-$(PERL_GD_VERSION).tar.gz
 PERL_GD_SITE = $(BR2_CPAN_MIRROR)/authors/id/R/RU/RURBAN
 PERL_GD_DEPENDENCIES = zlib libpng freetype gd
@@ -12,12 +12,10 @@ PERL_GD_LICENSE = Artistic or GPL-1.0+
 PERL_GD_LICENSE_FILES = LICENSE
 
 PERL_GD_CONF_OPTS = \
-	-options=FT,PNG \
 	-lib_gd_path=$(STAGING_DIR)/usr \
 	-lib_ft_path=$(STAGING_DIR)/usr \
 	-lib_png_path=$(STAGING_DIR)/usr \
 	-lib_zlib_path=$(STAGING_DIR)/usr \
-	-ignore_missing_gd \
-	-gdlib=$(STAGING_DIR)/usr/bin/gdlib-config
+	-gdlib_config_path=$(STAGING_DIR)/usr/bin
 
 $(eval $(perl-package))
