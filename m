From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 25 Jan 2021 22:29:32 +0100
Subject: [Buildroot] [git commit] package/perl: bump to version 5.32.1
Message-ID: <20210125210953.9884583818@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9e57d626c37acef6f3de29e03ebcba3885543517
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-fix-the-generated-subdirectory-Makefiles.patch | 32 ----------------------
 package/perl/perl.hash                             | 14 +++++-----
 package/perl/perl.mk                               |  8 +++---
 utils/scancpan                                     |  8 +++---
 4 files changed, 15 insertions(+), 47 deletions(-)

diff --git a/package/perl/0001-fix-the-generated-subdirectory-Makefiles.patch b/package/perl/0001-fix-the-generated-subdirectory-Makefiles.patch
deleted file mode 100644
index ae1ce06994..0000000000
--- a/package/perl/0001-fix-the-generated-subdirectory-Makefiles.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 30ae4c9e2ac6cd27138ebf124cbda9232c56bdf7 Mon Sep 17 00:00:00 2001
-From: Francois Perrad <francois.perrad@gadz.org>
-Date: Tue, 16 Oct 2018 21:20:12 +0200
-Subject: [PATCH] fix the generated subdirectory Makefiles
-
-all variables used by BR must be propagated
-
-similar to https://github.com/Perl-Toolchain-Gang/ExtUtils-MakeMaker/commit/98e8532fffe5afa8186329acc44fb957427f1823
-
-see https://github.com/Perl-Toolchain-Gang/ExtUtils-MakeMaker/pull/331, merged in EU-MM v7.35_08
-
-Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
----
- cpan/ExtUtils-MakeMaker/lib/ExtUtils/MakeMaker.pm | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MakeMaker.pm b/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MakeMaker.pm
-index d579256e86..48642e98fa 100644
---- a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MakeMaker.pm
-+++ b/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MakeMaker.pm
-@@ -702,7 +702,7 @@ END
-         }
-         if ($self->{PARENT}) {
-             $self->{PARENT}->{CHILDREN}->{$newclass} = $self;
--            foreach my $opt (qw(POLLUTE PERL_CORE LINKTYPE LD OPTIMIZE)) {
-+            foreach my $opt (qw(POLLUTE PERL_CORE LINKTYPE AR FULL_AR CC CCFLAGS OPTIMIZE LD LDDLFLAGS LDFLAGS PERL_ARCHLIB DESTDIR )) {
-                 if (exists $self->{PARENT}->{$opt}
-                     and not exists $self->{$opt})
-                     {
--- 
-2.17.1
-
diff --git a/package/perl/perl.hash b/package/perl/perl.hash
index ba3a39d433..42b7cc66c7 100644
--- a/package/perl/perl.hash
+++ b/package/perl/perl.hash
@@ -1,12 +1,12 @@
-# Hashes from: http://www.cpan.org/src/5.0/perl-5.30.3.tar.xz.{md5,sha1,sha256}.txt
-md5  0af2ab0f01ec13e37cc13a27de930936  perl-5.30.3.tar.xz
-sha1  1003c6aa71d8966501038178459a9fa4e9aba747  perl-5.30.3.tar.xz
-sha256  6967595f2e3f3a94544c35152f9a25e0cb8ea24ae45f4bf1882f2e33f4a400f4  perl-5.30.3.tar.xz
+# Hashes from: https://www.cpan.org/src/5.0/perl-5.32.1.tar.xz.{md5,sha1,sha256}.txt
+md5  7f104064b906ad8c7329ca5e409a32d7  perl-5.32.1.tar.xz
+sha1  1fb4f710d139da1e1a3e1fa4eaba201fcaa8e18e  perl-5.32.1.tar.xz
+sha256  57cc47c735c8300a8ce2fa0643507b44c4ae59012bfdad0121313db639e02309  perl-5.32.1.tar.xz
 
-# Hashes from: https://github.com/arsv/perl-cross/releases/download/1.3.4/perl-cross-1.3.4.hash
-sha256  755aa0ca8141a942188a269564f86c3c82349f82c346ed5c992495d7f35138ba  perl-cross-1.3.4.tar.gz
+# Hashes from: https://github.com/arsv/perl-cross/releases/download/1.3.5/perl-cross-1.3.5.hash
+sha256  91c66f6b2b99fccfd4fee14660b677380b0c98f9456359e91449798c2ad2ef25  perl-cross-1.3.5.tar.gz
 
 # Locally calculated
 sha256  dd90d4f42e4dcadf5a7c09eea0189d93c7b37ae560c91f0f6d5233ed3b9292a2  Artistic
 sha256  d77d235e41d54594865151f4751e835c5a82322b0e87ace266567c3391a4b912  Copying
-sha256  4916e95d32b84e07c045d839646f74996f577e5f497bbba8177a94b31415cee7  README
+sha256  df6ad59aefea68676c38325f25f6707f026ddde6c71291b2ca231b6247859907  README
diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index 5f6aa97674..ec1cfd4d0a 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -5,15 +5,15 @@
 ################################################################################
 
 # When updating the version here, also update utils/scancpan
-PERL_VERSION_MAJOR = 30
-PERL_VERSION = 5.$(PERL_VERSION_MAJOR).3
-PERL_SITE = http://www.cpan.org/src/5.0
+PERL_VERSION_MAJOR = 32
+PERL_VERSION = 5.$(PERL_VERSION_MAJOR).1
+PERL_SITE = https://www.cpan.org/src/5.0
 PERL_SOURCE = perl-$(PERL_VERSION).tar.xz
 PERL_LICENSE = Artistic or GPL-1.0+
 PERL_LICENSE_FILES = Artistic Copying README
 PERL_INSTALL_STAGING = YES
 
-PERL_CROSS_VERSION = 1.3.4
+PERL_CROSS_VERSION = 1.3.5
 # DO NOT refactor with the github helper (the result is not the same)
 PERL_CROSS_SITE = https://github.com/arsv/perl-cross/releases/download/$(PERL_CROSS_VERSION)
 PERL_CROSS_SOURCE = perl-cross-$(PERL_CROSS_VERSION).tar.gz
diff --git a/utils/scancpan b/utils/scancpan
index 3ce3203bd5..075f193563 100755
--- a/utils/scancpan
+++ b/utils/scancpan
@@ -488,9 +488,9 @@ use Digest::SHA qw(sha256_hex);
 use Text::Wrap;
 $Text::Wrap::columns = 62;
 
-# Below, 5.030 should be aligned with the version of perl actually
+# Below, 5.032 should be aligned with the version of perl actually
 # bundled in Buildroot:
-die <<"MSG" if $] < 5.030;
+die <<"MSG" if $] < 5.032;
 This script needs a host perl with the same major version as Buildroot target perl.
 
 Your current host perl is:
@@ -498,7 +498,7 @@ Your current host perl is:
     version $]
 
 You may install a local one by running:
-    perlbrew install perl-5.30.0
+    perlbrew install perl-5.32.0
 MSG
 
 my ($help, $man, $quiet, $force, $recommend, $test, $host);
@@ -967,7 +967,7 @@ in order to work with the right CoreList data.
 
 =head1 LICENSE
 
-Copyright (C) 2013-2019 by Francois Perrad <francois.perrad@gadz.org>
+Copyright (C) 2013-2020 by Francois Perrad <francois.perrad@gadz.org>
 
 This program is free software; you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
