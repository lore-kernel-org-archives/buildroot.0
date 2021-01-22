From: Francois Perrad <fperrad@gmail.com>
Date: Fri, 22 Jan 2021 19:30:46 +0100
Subject: [Buildroot] [PATCH] perl: bump to version 5.32.0
Message-ID: <20210122183046.874944-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 ...the-generated-subdirectory-Makefiles.patch | 32 -------------------
 package/perl/perl.hash                        |  8 ++---
 package/perl/perl.mk                          |  6 ++--
 utils/scancpan                                |  8 ++---
 4 files changed, 11 insertions(+), 43 deletions(-)
 delete mode 100644 package/perl/0001-fix-the-generated-subdirectory-Makefiles.patch

diff --git a/package/perl/0001-fix-the-generated-subdirectory-Makefiles.patch b/package/perl/0001-fix-the-generated-subdirectory-Makefiles.patch
deleted file mode 100644
index ae1ce0699..000000000
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
index ba3a39d43..28bfb4fa9 100644
--- a/package/perl/perl.hash
+++ b/package/perl/perl.hash
@@ -1,7 +1,7 @@
-# Hashes from: http://www.cpan.org/src/5.0/perl-5.30.3.tar.xz.{md5,sha1,sha256}.txt
-md5  0af2ab0f01ec13e37cc13a27de930936  perl-5.30.3.tar.xz
-sha1  1003c6aa71d8966501038178459a9fa4e9aba747  perl-5.30.3.tar.xz
-sha256  6967595f2e3f3a94544c35152f9a25e0cb8ea24ae45f4bf1882f2e33f4a400f4  perl-5.30.3.tar.xz
+# Hashes from: https://www.cpan.org/src/5.0/perl-5.32.0.tar.xz.{md5,sha1,sha256}.txt
+md5  3812cd9a096a72cb27767c7e2e40441c  perl-5.32.0.tar.xz
+sha1  0426c89d8ad5542def3e0065c299d449230aeb6c  perl-5.32.0.tar.xz
+sha256  6f436b447cf56d22464f980fac1916e707a040e96d52172984c5d184c09b859b  perl-5.32.0.tar.xz
 
 # Hashes from: https://github.com/arsv/perl-cross/releases/download/1.3.4/perl-cross-1.3.4.hash
 sha256  755aa0ca8141a942188a269564f86c3c82349f82c346ed5c992495d7f35138ba  perl-cross-1.3.4.tar.gz
diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index 5f6aa9767..9b024e849 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 # When updating the version here, also update utils/scancpan
-PERL_VERSION_MAJOR = 30
-PERL_VERSION = 5.$(PERL_VERSION_MAJOR).3
-PERL_SITE = http://www.cpan.org/src/5.0
+PERL_VERSION_MAJOR = 32
+PERL_VERSION = 5.$(PERL_VERSION_MAJOR).0
+PERL_SITE = https://www.cpan.org/src/5.0
 PERL_SOURCE = perl-$(PERL_VERSION).tar.xz
 PERL_LICENSE = Artistic or GPL-1.0+
 PERL_LICENSE_FILES = Artistic Copying README
diff --git a/utils/scancpan b/utils/scancpan
index 3ce3203bd..075f19356 100755
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
-- 
2.27.0
