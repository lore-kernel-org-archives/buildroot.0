From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Jan 2017 14:57:04 +0100
Subject: [Buildroot] [git commit] perl-gd: bump to version 2.56
Message-ID: <20170129135833.E5705817F4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=31c3ad17ed22b1d2d04ade1c0a3b942876592dfe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

perl-gd now supplies a Build.PL, but this one is not cross-compilation
friendly. So, we still use Makefile.PL like in previous version by using
the new <pkg>_PREFER_INSTALLER variable.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/perl-gd/0002-lgd.patch                              | 4 ++--
 package/perl-gd/0003-force.patch                            | 2 +-
 package/perl-gd/0004-gdlib-config-is-now-configurable.patch | 2 +-
 package/perl-gd/Config.in                                   | 2 +-
 package/perl-gd/perl-gd.hash                                | 4 ++--
 package/perl-gd/perl-gd.mk                                  | 5 +++--
 6 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/package/perl-gd/0002-lgd.patch b/package/perl-gd/0002-lgd.patch
index 4a69c2a..2827cd7 100644
--- a/package/perl-gd/0002-lgd.patch
+++ b/package/perl-gd/0002-lgd.patch
@@ -7,7 +7,7 @@ Index: b/Makefile.PL
 ===================================================================
 --- a/Makefile.PL
 +++ b/Makefile.PL
-@@ -34,9 +34,9 @@
+@@ -42,9 +42,9 @@
  END
  }
  
@@ -18,7 +18,7 @@ Index: b/Makefile.PL
  
  # support for AMD64 libraries
  if (-d '/usr/lib64') {
-@@ -291,7 +291,6 @@
+@@ -294,7 +294,6 @@
    @$LIBPATH      = map {s/^-L// && "-L$_"} split /\s+/,$ldflags;
    @$LIBS         = split /\s+/,$libs;
  
diff --git a/package/perl-gd/0003-force.patch b/package/perl-gd/0003-force.patch
index 0a121a9..611066b 100644
--- a/package/perl-gd/0003-force.patch
+++ b/package/perl-gd/0003-force.patch
@@ -7,7 +7,7 @@ Index: b/Makefile.PL
 ===================================================================
 --- a/Makefile.PL
 +++ b/Makefile.PL
-@@ -35,13 +35,15 @@
+@@ -43,13 +43,15 @@
  }
  
  push @LIBS, "-lgd";
diff --git a/package/perl-gd/0004-gdlib-config-is-now-configurable.patch b/package/perl-gd/0004-gdlib-config-is-now-configurable.patch
index dea6126..58df225 100644
--- a/package/perl-gd/0004-gdlib-config-is-now-configurable.patch
+++ b/package/perl-gd/0004-gdlib-config-is-now-configurable.patch
@@ -53,7 +53,7 @@ index dfe8ad7..0fa6ef3 100644
  #############################################################################################
  
  if ($^O eq 'VMS'){
-@@ -275,7 +286,7 @@ exit 0;
+@@ -278,7 +289,7 @@ exit 0;
  
  sub try_to_autoconfigure {
    my ($options,$lib_gd_path,$INC,$LIBPATH,$LIBS) = @_;
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
index c6822ae..0c16d3f 100644
--- a/package/perl-gd/perl-gd.hash
+++ b/package/perl-gd/perl-gd.hash
@@ -1,3 +1,3 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    d2c9b18123bcaff8672eb50f2eb37ed3 GD-2.53.tar.gz
-sha256 d05d01fe95e581adb3468cf05ab5d405db7497c0fb3ec7ecf23d023705fab7aa GD-2.53.tar.gz
+md5    c4b3afd98b2c4ce3c2e1027d101a8f1e GD-2.56.tar.gz
+sha256 1f103d1c98de8621504642ed7fb79f1b40f5f6a63c2abe9390a8ab78617248f9 GD-2.56.tar.gz
diff --git a/package/perl-gd/perl-gd.mk b/package/perl-gd/perl-gd.mk
index 99568cb..ea8fd5c 100644
--- a/package/perl-gd/perl-gd.mk
+++ b/package/perl-gd/perl-gd.mk
@@ -4,12 +4,13 @@
 #
 ################################################################################
 
-PERL_GD_VERSION = 2.53
+PERL_GD_VERSION = 2.56
 PERL_GD_SOURCE = GD-$(PERL_GD_VERSION).tar.gz
 PERL_GD_SITE = $(BR2_CPAN_MIRROR)/authors/id/L/LD/LDS
 PERL_GD_DEPENDENCIES = zlib libpng freetype gd
-PERL_GD_LICENSE = Artistic-2.0 or GPLv1+
+PERL_GD_LICENSE = Artistic or GPLv1+
 PERL_GD_LICENSE_FILES = LICENSE
+PERL_GD_PREFER_INSTALLER = EUMM
 
 PERL_GD_CONF_OPTS = \
 	-options=FT,PNG \
