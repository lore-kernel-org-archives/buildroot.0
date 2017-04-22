From: Francois Perrad <fperrad@gmail.com>
Date: Sat, 22 Apr 2017 08:34:06 +0200
Subject: [Buildroot] [PATCH] perl-gd: bump to version 2.59
Message-ID: <20170422063406.14258-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

remove patches merged upstream

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-gd/0001-getoptions.patch              | 43 ----------------------
 package/perl-gd/0002-lgd.patch                     | 28 --------------
 package/perl-gd/0003-force.patch                   | 32 ----------------
 .../0004-gdlib-config-is-now-configurable.patch    | 34 ++++++++---------
 package/perl-gd/Config.in                          |  2 +-
 package/perl-gd/perl-gd.hash                       |  4 +-
 package/perl-gd/perl-gd.mk                         | 10 +----
 7 files changed, 22 insertions(+), 131 deletions(-)
 delete mode 100644 package/perl-gd/0001-getoptions.patch
 delete mode 100644 package/perl-gd/0002-lgd.patch
 delete mode 100644 package/perl-gd/0003-force.patch

diff --git a/package/perl-gd/0001-getoptions.patch b/package/perl-gd/0001-getoptions.patch
deleted file mode 100644
index 74f055bead..0000000000
--- a/package/perl-gd/0001-getoptions.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-fix option handling in Makefile.PL
-
-the call to GetOptions() must be unique.
-
-Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
-see https://github.com/lstein/Perl-GD/pull/6
-
-Index: b/Makefile.PL
-===================================================================
---- a/Makefile.PL
-+++ b/Makefile.PL
-@@ -24,7 +24,15 @@
- my ($options,$lib_gd_path,$lib_ft_path,$lib_png_path,$lib_jpeg_path,$lib_xpm_path,$lib_zlib_path,$force);
- 
- use Getopt::Long;
--GetOptions("ignore_missing_gd" => \$force);
-+my $result = GetOptions("options=s"         => \$options,
-+			"lib_gd_path=s"     => \$lib_gd_path,
-+			"lib_ft_path=s"     => \$lib_ft_path,
-+			"lib_png_path=s"    => \$lib_png_path,
-+			"lib_jpeg_path=s"   => \$lib_jpeg_path,
-+			"lib_xpm_path=s"    => \$lib_xpm_path,
-+			"lib_zlib_path=s"   => \$lib_zlib_path,
-+			"ignore_missing_gd" => \$force,
-+		       );
- 
- unless (try_to_autoconfigure(\$options,\$lib_gd_path,\@INC,\@LIBPATH,\@LIBS) || $force) {
-     die <<END;
-@@ -47,14 +55,6 @@
- #############################################################################################
- # Build options passed in to script to support reproducible builds via Makefiles
- #############################################################################################
--my $result = GetOptions("options=s"       => \$options,
--			"lib_gd_path=s"   => \$lib_gd_path,
--			"lib_ft_path=s"   => \$lib_ft_path,
--			"lib_png_path=s"  => \$lib_png_path,
--			"lib_jpeg_path=s" => \$lib_jpeg_path,
--			"lib_xpm_path=s"  => \$lib_xpm_path,
--			"lib_zlib_path=s" => \$lib_zlib_path,
--		       );
- unless ($result) {
-   print STDERR <<END;
- Usage: perl Makefile.PL [options]
diff --git a/package/perl-gd/0002-lgd.patch b/package/perl-gd/0002-lgd.patch
deleted file mode 100644
index 2827cd76b3..0000000000
--- a/package/perl-gd/0002-lgd.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-refactor -lgd in @LIBS
-
-Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
-see https://github.com/lstein/Perl-GD/pull/7
-
-Index: b/Makefile.PL
-===================================================================
---- a/Makefile.PL
-+++ b/Makefile.PL
-@@ -42,9 +42,9 @@
- END
- }
- 
-+push @LIBS, "-lgd";
- @INC     = qw(-I/usr/include -I/usr/include/gd) unless @INC;
- @LIBPATH = qw(-L/usr/lib/X11 -L/usr/X11R6/lib -L/usr/X11/lib -L/usr/lib) unless @LIBPATH;
-- at LIBS    = qw(-lgd) unless @LIBS;
- 
- # support for AMD64 libraries
- if (-d '/usr/lib64') {
-@@ -294,7 +294,6 @@
-   @$LIBPATH      = map {s/^-L// && "-L$_"} split /\s+/,$ldflags;
-   @$LIBS         = split /\s+/,$libs;
- 
--  push @$LIBS,"-lgd";
-   push @$LIBPATH,"-L$libdir";
-   ($$lib_gd_path = $libdir) =~ s!/[^/]+$!!;
-   $$options      = $features;
diff --git a/package/perl-gd/0003-force.patch b/package/perl-gd/0003-force.patch
deleted file mode 100644
index 611066b919..0000000000
--- a/package/perl-gd/0003-force.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-let @INC and @LIBPATH empty when ignore_missing_gd
-
-Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
-see https://github.com/lstein/Perl-GD/pull/7
-
-Index: b/Makefile.PL
-===================================================================
---- a/Makefile.PL
-+++ b/Makefile.PL
-@@ -43,13 +43,15 @@
- }
- 
- push @LIBS, "-lgd";
-- at INC     = qw(-I/usr/include -I/usr/include/gd) unless @INC;
-- at LIBPATH = qw(-L/usr/lib/X11 -L/usr/X11R6/lib -L/usr/X11/lib -L/usr/lib) unless @LIBPATH;
--
--# support for AMD64 libraries
--if (-d '/usr/lib64') {
--  my @libs64 = map {my $a = $_; $a=~ s/lib$/lib64/; $a} @LIBPATH;
--  @LIBPATH = (@LIBPATH, at libs64);
-+unless ($force) {
-+  @INC     = qw(-I/usr/include -I/usr/include/gd) unless @INC;
-+  @LIBPATH = qw(-L/usr/lib/X11 -L/usr/X11R6/lib -L/usr/X11/lib -L/usr/lib) unless @LIBPATH;
-+
-+  # support for AMD64 libraries
-+  if (-d '/usr/lib64') {
-+    my @libs64 = map {my $a = $_; $a=~ s/lib$/lib64/; $a} @LIBPATH;
-+    @LIBPATH = (@LIBPATH, at libs64);
-+  }
- }
- 
- #############################################################################################
diff --git a/package/perl-gd/0004-gdlib-config-is-now-configurable.patch b/package/perl-gd/0004-gdlib-config-is-now-configurable.patch
index 58df2255a3..294279acd3 100644
--- a/package/perl-gd/0004-gdlib-config-is-now-configurable.patch
+++ b/package/perl-gd/0004-gdlib-config-is-now-configurable.patch
@@ -13,23 +13,23 @@ index dfe8ad7..0fa6ef3 100644
 --- a/Makefile.PL
 +++ b/Makefile.PL
 @@ -21,7 +21,7 @@ END
- my (@INC, at LIBPATH, at LIBS);
+ my (@INC, at LIBPATH, at LIBS,$LIBGD_VERSION);
  my $AUTOCONFIG = 0;      # global set by try_to_autoconfigure() below
  
 -my ($options,$lib_gd_path,$lib_ft_path,$lib_png_path,$lib_jpeg_path,$lib_xpm_path,$lib_zlib_path,$force);
 +my ($options,$lib_gd_path,$lib_ft_path,$lib_png_path,$lib_jpeg_path,$lib_xpm_path,$lib_zlib_path,$force,$gdlib_config_path);
  
  use Getopt::Long;
- my $result = GetOptions("options=s"         => \$options,
-@@ -32,6 +32,7 @@ my $result = GetOptions("options=s"         => \$options,
- 			"lib_xpm_path=s"    => \$lib_xpm_path,
- 			"lib_zlib_path=s"   => \$lib_zlib_path,
- 			"ignore_missing_gd" => \$force,
+ my $result = GetOptions("ignore_missing_gd" => \$force,
+@@ -32,6 +32,7 @@ my $result = GetOptions("ignore_missing_gd" => \$force,
+ 			"lib_jpeg_path=s" => \$lib_jpeg_path,
+ 			"lib_xpm_path=s"  => \$lib_xpm_path,
+ 			"lib_zlib_path=s" => \$lib_zlib_path,
 +			"gdlib_config_path=s" => \$gdlib_config_path,
  		       );
  
  unless (try_to_autoconfigure(\$options,\$lib_gd_path,\@INC,\@LIBPATH,\@LIBS) || $force) {
-@@ -72,6 +73,7 @@ Configure GD module.
+@@ -75,6 +76,7 @@ Configure GD module.
       -lib_xpm_path  path            path to libxpm
       -lib_zlib_path path            path to libpng
       -ignore_missing_gd             Ignore missing or old libgd installations and try to compile anyway
@@ -37,7 +37,7 @@ index dfe8ad7..0fa6ef3 100644
  
  If no options are passed on the command line.  The program will
  attempt to autoconfigure itself with the gdlib-config program (present
-@@ -118,6 +120,15 @@ if( defined($lib_zlib_path) )
+@@ -121,6 +123,15 @@ if( defined($lib_zlib_path) )
      @INC     = ("-I$lib_zlib_path/include", @INC);
      @LIBPATH = ("-L$lib_zlib_path/lib", @LIBPATH); 
  }
@@ -53,15 +53,15 @@ index dfe8ad7..0fa6ef3 100644
  #############################################################################################
  
  if ($^O eq 'VMS'){
-@@ -278,7 +289,7 @@ exit 0;
- 
- sub try_to_autoconfigure {
-   my ($options,$lib_gd_path,$INC,$LIBPATH,$LIBS) = @_;
--  my $config = `gdlib-config --all`;
-+  my $config = `$gdlib_config_path --all`;
-   return unless $config;
-   $AUTOCONFIG++;
- 
+@@ -289,7 +300,7 @@ sub try_to_autoconfigure {
+   my ($prefix) = $$lib_gd_path ? ($$lib_gd_path =~ m|(^.*)/lib|) : "";
+   my $bindir = $prefix ? "$prefix/bin/" : "";
+   my $config = `${bindir}gdlib-config --all` if -e "${bindir}gdlib-config";
+-  $config = `gdlib-config --all` if !$config;
++  $config = `$gdlib_config_path --all` if !$config;
+   unless ($config) {
+       my %config;
+       require ExtUtils::PkgConfig;
 -- 
 1.9.3
 
diff --git a/package/perl-gd/Config.in b/package/perl-gd/Config.in
index 2b7a265f15..61f7e5dadc 100644
--- a/package/perl-gd/Config.in
+++ b/package/perl-gd/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_PERL_GD
 	select BR2_PACKAGE_FREETYPE
 	select BR2_PACKAGE_GD
 	help
-	  Perl interface to the gd2 graphics library
+	  Interface to Gd Graphics Library
 
 	  https://metacpan.org/release/GD
 
diff --git a/package/perl-gd/perl-gd.hash b/package/perl-gd/perl-gd.hash
index 0c16d3f521..07f24710fe 100644
--- a/package/perl-gd/perl-gd.hash
+++ b/package/perl-gd/perl-gd.hash
@@ -1,3 +1,3 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    c4b3afd98b2c4ce3c2e1027d101a8f1e GD-2.56.tar.gz
-sha256 1f103d1c98de8621504642ed7fb79f1b40f5f6a63c2abe9390a8ab78617248f9 GD-2.56.tar.gz
+md5    b77596aedf8ba92106ada82c7a58dd29 GD-2.59.tar.gz
+sha256 b5f22854be579cd9c1696f4a5175d57f5623d3bf2e75173ffa8038a1a28afad6 GD-2.59.tar.gz
diff --git a/package/perl-gd/perl-gd.mk b/package/perl-gd/perl-gd.mk
index 89a21cf3e9..28a1b876e2 100644
--- a/package/perl-gd/perl-gd.mk
+++ b/package/perl-gd/perl-gd.mk
@@ -4,18 +4,12 @@
 #
 ################################################################################
 
-PERL_GD_VERSION = 2.56
+PERL_GD_VERSION = 2.59
 PERL_GD_SOURCE = GD-$(PERL_GD_VERSION).tar.gz
-PERL_GD_SITE = $(BR2_CPAN_MIRROR)/authors/id/L/LD/LDS
+PERL_GD_SITE = $(BR2_CPAN_MIRROR)/authors/id/R/RU/RURBAN
 PERL_GD_DEPENDENCIES = zlib libpng freetype gd
 PERL_GD_LICENSE = Artistic or GPL-1.0+
 PERL_GD_LICENSE_FILES = LICENSE
-PERL_GD_PREFER_INSTALLER = EUMM
-
-define PERL_GD_MOVE_XS
-	mv $(@D)/lib/GD.xs $(@D)/GD.xs
-endef
-PERL_GD_POST_PATCH_HOOKS += PERL_GD_MOVE_XS
 
 PERL_GD_CONF_OPTS = \
 	-options=FT,PNG \
-- 
2.11.0
