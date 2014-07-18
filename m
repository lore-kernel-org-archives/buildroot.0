From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 18 Jul 2014 19:48:05 +0200
Subject: [Buildroot] [git commit] perl-gd: new package
Message-ID: <20140718175006.E0DA59D27A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=39d1f0645ea21a36eeeabd6406429ccbdc7d48b7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                           |    1 +
 package/perl-gd/Config.in                   |   14 +++++++++
 package/perl-gd/perl-gd-01-getoptions.patch |   40 +++++++++++++++++++++++++++
 package/perl-gd/perl-gd-02-lgd.patch        |   25 +++++++++++++++++
 package/perl-gd/perl-gd-03-force.patch      |   29 +++++++++++++++++++
 package/perl-gd/perl-gd.mk                  |   22 +++++++++++++++
 6 files changed, 131 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 22ddea8..09f5cdb 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -430,6 +430,7 @@ endif
 	source "package/perl/Config.in"
 if BR2_PACKAGE_PERL
 menu "Perl libraries/modules"
+	source "package/perl-gd/Config.in"
 	source "package/perl-io-socket-ssl/Config.in"
 	source "package/perl-mojolicious/Config.in"
 	source "package/perl-net-ssleay/Config.in"
diff --git a/package/perl-gd/Config.in b/package/perl-gd/Config.in
new file mode 100644
index 0000000..7c85cfc
--- /dev/null
+++ b/package/perl-gd/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_PERL_GD
+	bool "perl-gd"
+	depends on !BR2_PREFER_STATIC_LIB
+	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_LIBPNG
+	select BR2_PACKAGE_FREETYPE
+	select BR2_PACKAGE_GD
+	help
+	  Interface to Gd Graphics Library
+
+	  https://metacpan.org/release/GD
+
+comment "perl-gd needs a toolchain w/ dynamic library"
+	depends on BR2_PREFER_STATIC_LIB
diff --git a/package/perl-gd/perl-gd-01-getoptions.patch b/package/perl-gd/perl-gd-01-getoptions.patch
new file mode 100644
index 0000000..7bd7f4f
--- /dev/null
+++ b/package/perl-gd/perl-gd-01-getoptions.patch
@@ -0,0 +1,40 @@
+fix option handling in Makefile.PL
+
+the call to GetOptions() must be unique.
+
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+see https://github.com/lstein/Perl-GD/pull/6
+
+Index: b/Makefile.PL
+===================================================================
+--- a/Makefile.PL
++++ b/Makefile.PL
+@@ -24,7 +24,15 @@
+ my ($options,$lib_gd_path,$lib_ft_path,$lib_png_path,$lib_jpeg_path,$lib_xpm_path,$lib_zlib_path,$force);
+ 
+ use Getopt::Long;
+-GetOptions("ignore_missing_gd" => \$force);
++my $result = GetOptions("options=s"         => \$options,
++			"lib_gd_path=s"     => \$lib_gd_path,
++			"lib_ft_path=s"     => \$lib_ft_path,
++			"lib_png_path=s"    => \$lib_png_path,
++			"lib_jpeg_path=s"   => \$lib_jpeg_path,
++			"lib_xpm_path=s"    => \$lib_xpm_path,
++			"lib_zlib_path=s"   => \$lib_zlib_path,
++			"ignore_missing_gd" => \$force,
++		       );
+ 
+ unless (try_to_autoconfigure(\$options,\$lib_gd_path,\@INC,\@LIBPATH,\@LIBS) || $force) {
+     die <<END;
+@@ -47,14 +55,6 @@
+ #############################################################################################
+ # Build options passed in to script to support reproducible builds via Makefiles
+ #############################################################################################
+-my $result = GetOptions("options=s"       => \$options,
+-			"lib_gd_path=s"   => \$lib_gd_path,
+-			"lib_ft_path=s"   => \$lib_ft_path,
+-			"lib_png_path=s"  => \$lib_png_path,
+-			"lib_jpeg_path=s" => \$lib_jpeg_path,
+-			"lib_xpm_path=s"  => \$lib_xpm_path,
+-			"lib_zlib_path=s" => \$lib_zlib_path,
+-		       );
diff --git a/package/perl-gd/perl-gd-02-lgd.patch b/package/perl-gd/perl-gd-02-lgd.patch
new file mode 100644
index 0000000..bc6cdfc
--- /dev/null
+++ b/package/perl-gd/perl-gd-02-lgd.patch
@@ -0,0 +1,25 @@
+refactor -lgd in @LIBS
+
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+see https://github.com/lstein/Perl-GD/pull/7
+
+Index: b/Makefile.PL
+===================================================================
+--- a/Makefile.PL
++++ b/Makefile.PL
+@@ -34,9 +34,9 @@
+ END
+ }
+ 
++push @LIBS, "-lgd";
+ @INC     = qw(-I/usr/include -I/usr/include/gd) unless @INC;
+ @LIBPATH = qw(-L/usr/lib/X11 -L/usr/X11R6/lib -L/usr/X11/lib -L/usr/lib) unless @LIBPATH;
+- at LIBS    = qw(-lgd) unless @LIBS;
+ 
+ # support for AMD64 libraries
+ if (-d '/usr/lib64') {
+@@ -291,7 +291,6 @@
+   @$LIBPATH      = map {s/^-L// && "-L$_"} split /\s+/,$ldflags;
+   @$LIBS         = split /\s+/,$libs;
+ 
+-  push @$LIBS,"-lgd";
diff --git a/package/perl-gd/perl-gd-03-force.patch b/package/perl-gd/perl-gd-03-force.patch
new file mode 100644
index 0000000..3524865
--- /dev/null
+++ b/package/perl-gd/perl-gd-03-force.patch
@@ -0,0 +1,29 @@
+let @INC and @LIBPATH empty when ignore_missing_gd
+
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+see https://github.com/lstein/Perl-GD/pull/7
+
+Index: b/Makefile.PL
+===================================================================
+--- a/Makefile.PL
++++ b/Makefile.PL
+@@ -35,13 +35,15 @@
+ }
+ 
+ push @LIBS, "-lgd";
+- at INC     = qw(-I/usr/include -I/usr/include/gd) unless @INC;
+- at LIBPATH = qw(-L/usr/lib/X11 -L/usr/X11R6/lib -L/usr/X11/lib -L/usr/lib) unless @LIBPATH;
+-
+-# support for AMD64 libraries
+-if (-d '/usr/lib64') {
+-  my @libs64 = map {my $a = $_; $a=~ s/lib$/lib64/; $a} @LIBPATH;
+-  @LIBPATH = (@LIBPATH, at libs64);
++unless ($force) {
++  @INC     = qw(-I/usr/include -I/usr/include/gd) unless @INC;
++  @LIBPATH = qw(-L/usr/lib/X11 -L/usr/X11R6/lib -L/usr/X11/lib -L/usr/lib) unless @LIBPATH;
++
++  # support for AMD64 libraries
++  if (-d '/usr/lib64') {
++    my @libs64 = map {my $a = $_; $a=~ s/lib$/lib64/; $a} @LIBPATH;
++    @LIBPATH = (@LIBPATH, at libs64);
++  }
diff --git a/package/perl-gd/perl-gd.mk b/package/perl-gd/perl-gd.mk
new file mode 100644
index 0000000..8bb6778
--- /dev/null
+++ b/package/perl-gd/perl-gd.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# perl-gd
+#
+################################################################################
+
+PERL_GD_VERSION = 2.53
+PERL_GD_SOURCE = GD-$(PERL_GD_VERSION).tar.gz
+PERL_GD_SITE = $(BR2_CPAN_MIRROR)/authors/id/L/LD/LDS/
+PERL_GD_DEPENDENCIES = perl zlib libpng freetype gd
+PERL_GD_LICENSE = Artistic-2.0 or GPLv1+
+PERL_GD_LICENSE_FILES = LICENSE
+
+PERL_GD_CONF_OPT = \
+	-options=FT,PNG \
+	-lib_gd_path=$(STAGING_DIR)/usr \
+	-lib_ft_path=$(STAGING_DIR)/usr \
+	-lib_png_path=$(STAGING_DIR)/usr \
+	-lib_zlib_path=$(STAGING_DIR)/usr \
+	-ignore_missing_gd
+
+$(eval $(perl-package))
