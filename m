From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 24 Dec 2014 12:12:09 +0100
Subject: [Buildroot] [git commit] package/perl-gd: Add a new option to set
	the path to gdlib-config
Message-ID: <20141224111213.CFC3780481@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a4a1dc7b8b5acb21236cf3f3d2e33f5d380f1336
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The build of perl-gd use the gdlib-config from the host that in result
incorect features enabled, incorrect header and library paths.

Should fixes:
http://autobuild.buildroot.net/results/15c/15ce69b916167305aba2820a157c880e487ee8c7/
http://autobuild.buildroot.net/results/504/504d64d992eb504e02c127feb4734a917ad95d0a/
http://autobuild.buildroot.net/results/551/5512213c8861e51b390c1c223d53add0ec1ed758/

And many more.

Note:
In the generated Makefile, LDFLAGS still contains "-L/usr/local/lib"

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Tested-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0004-gdlib-config-is-now-configurable.patch    |   67 ++++++++++++++++++++
 package/perl-gd/perl-gd.mk                         |    3 +-
 2 files changed, 69 insertions(+), 1 deletions(-)

diff --git a/package/perl-gd/0004-gdlib-config-is-now-configurable.patch b/package/perl-gd/0004-gdlib-config-is-now-configurable.patch
new file mode 100644
index 0000000..dea6126
--- /dev/null
+++ b/package/perl-gd/0004-gdlib-config-is-now-configurable.patch
@@ -0,0 +1,67 @@
+From f417f38929fe558d388b9a9343da9b2c0e6984aa Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@openwide.fr>
+Date: Sat, 20 Dec 2014 23:22:41 +0100
+Subject: [PATCH] Makefile.PL: gdlib-config is now configurable
+
+Signed-off-by: Romain Naour <romain.naour@openwide.fr>
+---
+ Makefile.PL | 15 +++++++++++++--
+ 1 file changed, 13 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile.PL b/Makefile.PL
+index dfe8ad7..0fa6ef3 100644
+--- a/Makefile.PL
++++ b/Makefile.PL
+@@ -21,7 +21,7 @@ END
+ my (@INC, at LIBPATH, at LIBS);
+ my $AUTOCONFIG = 0;      # global set by try_to_autoconfigure() below
+ 
+-my ($options,$lib_gd_path,$lib_ft_path,$lib_png_path,$lib_jpeg_path,$lib_xpm_path,$lib_zlib_path,$force);
++my ($options,$lib_gd_path,$lib_ft_path,$lib_png_path,$lib_jpeg_path,$lib_xpm_path,$lib_zlib_path,$force,$gdlib_config_path);
+ 
+ use Getopt::Long;
+ my $result = GetOptions("options=s"         => \$options,
+@@ -32,6 +32,7 @@ my $result = GetOptions("options=s"         => \$options,
+ 			"lib_xpm_path=s"    => \$lib_xpm_path,
+ 			"lib_zlib_path=s"   => \$lib_zlib_path,
+ 			"ignore_missing_gd" => \$force,
++			"gdlib_config_path=s" => \$gdlib_config_path,
+ 		       );
+ 
+ unless (try_to_autoconfigure(\$options,\$lib_gd_path,\@INC,\@LIBPATH,\@LIBS) || $force) {
+@@ -72,6 +73,7 @@ Configure GD module.
+      -lib_xpm_path  path            path to libxpm
+      -lib_zlib_path path            path to libpng
+      -ignore_missing_gd             Ignore missing or old libgd installations and try to compile anyway
++     -gdlib_config_path path        path to gdlib-config
+ 
+ If no options are passed on the command line.  The program will
+ attempt to autoconfigure itself with the gdlib-config program (present
+@@ -118,6 +120,15 @@ if( defined($lib_zlib_path) )
+     @INC     = ("-I$lib_zlib_path/include", @INC);
+     @LIBPATH = ("-L$lib_zlib_path/lib", @LIBPATH); 
+ }
++if( defined($gdlib_config_path) )
++{
++    print "gdlib-config used:          $gdlib_config_path\n";
++}
++else
++{
++    $gdlib_config_path = "gdlib-config";
++    print "$gdlib_config_path used from the PATH\n";
++}
+ #############################################################################################
+ 
+ if ($^O eq 'VMS'){
+@@ -275,7 +286,7 @@ exit 0;
+ 
+ sub try_to_autoconfigure {
+   my ($options,$lib_gd_path,$INC,$LIBPATH,$LIBS) = @_;
+-  my $config = `gdlib-config --all`;
++  my $config = `$gdlib_config_path --all`;
+   return unless $config;
+   $AUTOCONFIG++;
+ 
+-- 
+1.9.3
+
diff --git a/package/perl-gd/perl-gd.mk b/package/perl-gd/perl-gd.mk
index 6df0e10..843687b 100644
--- a/package/perl-gd/perl-gd.mk
+++ b/package/perl-gd/perl-gd.mk
@@ -17,6 +17,7 @@ PERL_GD_CONF_OPTS = \
 	-lib_ft_path=$(STAGING_DIR)/usr \
 	-lib_png_path=$(STAGING_DIR)/usr \
 	-lib_zlib_path=$(STAGING_DIR)/usr \
-	-ignore_missing_gd
+	-ignore_missing_gd \
+	-gdlib=$(STAGING_DIR)/usr/bin/gdlib-config
 
 $(eval $(perl-package))
