From: Francois Perrad <fperrad@gmail.com>
Date: Wed, 27 Sep 2017 10:32:50 +0200
Subject: [Buildroot] [PATCH] perl: bump to version 5.26.1
Message-ID: <20170927083250.12150-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl/perl.hash | 12 ++++++------
 package/perl/perl.mk   |  8 ++++----
 utils/scancpan         | 18 +++++++++---------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/package/perl/perl.hash b/package/perl/perl.hash
index b46189a7a..6892a643c 100644
--- a/package/perl/perl.hash
+++ b/package/perl/perl.hash
@@ -1,7 +1,7 @@
-# Hashes from: http://www.cpan.org/src/5.0/perl-5.24.2.tar.xz.{md5,sha1,sha256}.txt
-md5    b7c027975a476dbb9aa7202f760d8eca                                 perl-5.24.2.tar.xz
-sha1   61761989df70b10470bc387050974be72e33217e                         perl-5.24.2.tar.xz
-sha256 b25dd465ef32edf853078eb540b26243db0a3b5e1b1cc84393703d9564be67c0 perl-5.24.2.tar.xz
+# Hashes from: http://www.cpan.org/src/5.0/perl-5.26.1.tar.xz.{md5,sha1,sha256}.txt
+md5    70e988b4318739b0cf3ad5e120bfde88                                 perl-5.26.1.tar.xz
+sha1   403bb1804cb41416153d908eea093f2be22a77f6                         perl-5.26.1.tar.xz
+sha256 fe8208133e73e47afc3251c08d2c21c5a60160165a8ab8b669c43a420e4ec680 perl-5.26.1.tar.xz
 
-# Hashes from: http://github.com/arsv/perl-cross/releases/download/1.1.6/perl-cross-1.1.6.hash
-sha256	2b3b88f54d85beb438bd2dddd948e2d89461db5ab6253f01b3c2c9ae3ddc30b4  perl-cross-1.1.6.tar.gz
+# Hashes from: http://github.com/arsv/perl-cross/releases/download/1.1.7/perl-cross-1.1.7.hash
+sha256	b79ce9d766b5f527ad7e73cb86d541da88ecbb69a443ee5f14658dd8f9e9415f  perl-cross-1.1.7.tar.gz
diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index d7fcd75ca..02cfec807 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -4,16 +4,16 @@
 #
 ################################################################################
 
-# When updating the version here, also update support/scripts/scancpan
-PERL_VERSION_MAJOR = 24
-PERL_VERSION = 5.$(PERL_VERSION_MAJOR).2
+# When updating the version here, also update utils/scancpan
+PERL_VERSION_MAJOR = 26
+PERL_VERSION = 5.$(PERL_VERSION_MAJOR).1
 PERL_SITE = http://www.cpan.org/src/5.0
 PERL_SOURCE = perl-$(PERL_VERSION).tar.xz
 PERL_LICENSE = Artistic or GPL-1.0+
 PERL_LICENSE_FILES = Artistic Copying README
 PERL_INSTALL_STAGING = YES
 
-PERL_CROSS_VERSION = 1.1.6
+PERL_CROSS_VERSION = 1.1.7
 # DO NOT refactor with the github helper (the result is not the same)
 PERL_CROSS_SITE = https://github.com/arsv/perl-cross/releases/download/$(PERL_CROSS_VERSION)
 PERL_CROSS_SOURCE = perl-cross-$(PERL_CROSS_VERSION).tar.gz
diff --git a/utils/scancpan b/utils/scancpan
index 20bd4c693..6d1cdc57a 100755
--- a/utils/scancpan
+++ b/utils/scancpan
@@ -484,9 +484,9 @@ use HTTP::Tiny;
 use Safe;
 use MetaCPAN::API::Tiny;
 
-# Below, 5.024 should be aligned with the version of perl actually
+# Below, 5.026 should be aligned with the version of perl actually
 # bundled in Buildroot:
-die <<"MSG" if $] < 5.024;
+die <<"MSG" if $] < 5.026;
 This script needs a host perl with the same major version as Buildroot target perl.
 
 Your current host perl is:
@@ -494,7 +494,7 @@ Your current host perl is:
     version $]
 
 You may install a local one by running:
-    perlbrew install perl-5.24.0
+    perlbrew install perl-5.26.0
 MSG
 
 my ($help, $man, $quiet, $force, $recommend, $test, $host);
@@ -527,8 +527,8 @@ my $ua = HTTP::Tiny->new();
 
 sub get_checksum {
     my ($url) = @_;
-    my($path) = $url =~ m|^[^:/?#]+://[^/?#]*([^?#]*)|;
-    my($basename, $dirname) = fileparse( $path );
+    my ($path) = $url =~ m|^[^:/?#]+://[^/?#]*([^?#]*)|;
+    my ($basename, $dirname) = fileparse( $path );
     unless ($checksum{$dirname}) {
         my $url = $mirror . $dirname . q{CHECKSUMS};
         my $response = $ua->get($url);
@@ -673,11 +673,11 @@ while (my ($distname, $dist) = each %dist) {
     }
     if ($force || !-f $mkname) {
         my $version = $dist->{version};
-        my($path) = $dist->{download_url} =~ m|^[^:/?#]+://[^/?#]*([^?#]*)|;
+        my ($path) = $dist->{download_url} =~ m|^[^:/?#]+://[^/?#]*([^?#]*)|;
         # this URL contains only the scheme, auth and path parts (but no query and fragment parts)
         # the scheme is not used, because the job is done by the BR download infrastructure
         # the auth part is not used, because we use $(BR2_CPAN_MIRROR)
-        my($filename, $directories, $suffix) = fileparse( $path, q{tar.gz}, q{tgz} );
+        my ($filename, $directories, $suffix) = fileparse( $path, q{tar.gz}, q{tgz} );
         $directories =~ s|/$||;
         my $dependencies = join q{ }, map( { q{host-} . fsname( $_ ); } sort @{$deps_build{$distname}} ),
                                       map( { fsname( $_ ); } sort @{$deps_runtime{$distname}} );
@@ -723,7 +723,7 @@ while (my ($distname, $dist) = each %dist) {
         close $fh;
     }
     if ($force || !-f $hashname) {
-        my($checksum, $filename) = get_checksum($dist->{download_url});
+        my ($checksum, $filename) = get_checksum($dist->{download_url});
         my $md5 = $checksum->{md5};
         my $sha256 = $checksum->{sha256};
         say qq{write ${hashname}} unless $quiet;
@@ -831,7 +831,7 @@ in order to work with the right CoreList data.
 
 =head1 LICENSE
 
-Copyright (C) 2013-2016 by Francois Perrad <francois.perrad@gadz.org>
+Copyright (C) 2013-2017 by Francois Perrad <francois.perrad@gadz.org>
 
 This program is free software; you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
-- 
2.11.0
