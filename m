From: Francois Perrad <fperrad@gmail.com>
Date: Sun,  2 Dec 2018 17:53:09 +0100
Subject: [Buildroot] [PATCH] perl: bump to version 5.28.1
Message-ID: <20181202165309.2806-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 ...isting-files-before-overwriting-them.patch | 46 -------------------
 ...the-generated-subdirectory-Makefiles.patch |  2 +-
 package/perl/perl.hash                        | 12 ++---
 package/perl/perl.mk                          |  6 +--
 utils/scancpan                                | 12 ++---
 5 files changed, 16 insertions(+), 62 deletions(-)
 delete mode 100644 package/perl/0001-PATCH-Remove-existing-files-before-overwriting-them.patch

diff --git a/package/perl/0001-PATCH-Remove-existing-files-before-overwriting-them.patch b/package/perl/0001-PATCH-Remove-existing-files-before-overwriting-them.patch
deleted file mode 100644
index 5223b78c0..000000000
--- a/package/perl/0001-PATCH-Remove-existing-files-before-overwriting-them.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From ae65651eab053fc6dc4590dbb863a268215c1fc5 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Petr=20P=C3=ADsa=C5=99?= <ppisar@redhat.com>
-Date: Fri, 8 Jun 2018 11:45:40 +0100
-Subject: [PATCH] [PATCH] Remove existing files before overwriting them
-
-Archive should extract only the latest same-named entry.
-Extracted regular file should not be writtent into existing block
-device (or any other one).
-
-https://rt.cpan.org/Ticket/Display.html?id=125523
-
-[Peter: rewrite path to match perl tarball with sed 's|\(lib/Archive\)|cpan/Archive-Tar/\1|g']
-Signed-off-by: Chris 'BinGOs' Williams <chris@bingosnet.co.uk>
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- cpan/Archive-Tar/lib/Archive/Tar.pm | 14 ++++++++++++++
- 1 file changed, 14 insertions(+)
-
-diff --git a/cpan/Archive-Tar/lib/Archive/Tar.pm b/cpan/Archive-Tar/lib/Archive/Tar.pm
-index 6244369..a83975f 100644
---- a/cpan/Archive-Tar/lib/Archive/Tar.pm
-+++ b/cpan/Archive-Tar/lib/Archive/Tar.pm
-@@ -845,6 +845,20 @@ sub _extract_file {
-         return;
-     }
- 
-+    ### If a file system already contains a block device with the same name as
-+    ### the being extracted regular file, we would write the file's content
-+    ### to the block device. So remove the existing file (block device) now.
-+    ### If an archive contains multiple same-named entries, the last one
-+    ### should replace the previous ones. So remove the old file now.
-+    ### If the old entry is a symlink to a file outside of the CWD, the new
-+    ### entry would create a file there. This is CVE-2018-12015
-+    ### <https://rt.cpan.org/Ticket/Display.html?id=125523>.
-+    if (-l $full || -e _) {
-+	if (!unlink $full) {
-+	    $self->_error( qq[Could not remove old file '$full': $!] );
-+	    return;
-+	}
-+    }
-     if( length $entry->type && $entry->is_file ) {
-         my $fh = IO::File->new;
-         $fh->open( $full, '>' ) or (
--- 
-2.11.0
-
diff --git a/package/perl/0001-fix-the-generated-subdirectory-Makefiles.patch b/package/perl/0001-fix-the-generated-subdirectory-Makefiles.patch
index 71560c5e0..178c7baa5 100644
--- a/package/perl/0001-fix-the-generated-subdirectory-Makefiles.patch
+++ b/package/perl/0001-fix-the-generated-subdirectory-Makefiles.patch
@@ -16,7 +16,7 @@ diff --git a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MakeMaker.pm b/cpan/ExtUtils-M
 index d579256e86..48642e98fa 100644
 --- a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MakeMaker.pm
 +++ b/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MakeMaker.pm
-@@ -703,7 +703,7 @@ END
+@@ -702,7 +702,7 @@ END
          }
          if ($self->{PARENT}) {
              $self->{PARENT}->{CHILDREN}->{$newclass} = $self;
diff --git a/package/perl/perl.hash b/package/perl/perl.hash
index 6936b22e0..571690082 100644
--- a/package/perl/perl.hash
+++ b/package/perl/perl.hash
@@ -1,7 +1,7 @@
-# Hashes from: http://www.cpan.org/src/5.0/perl-5.26.2.tar.xz.{md5,sha1,sha256}.txt
-md5    1fa1b53eeff76aa37b17bfc9b2771671                                 perl-5.26.2.tar.xz
-sha1   bfa5c7921ed7bf5e035dbf2f7ff81367b81e372c                         perl-5.26.2.tar.xz
-sha256 0f8c0fb1b0db4681adb75c3ba0dd77a0472b1b359b9e80efd79fc27b4352132c perl-5.26.2.tar.xz
+# Hashes from: http://www.cpan.org/src/5.0/perl-5.28.1.tar.xz.{md5,sha1,sha256}.txt
+md5    fbb590c305f2f88578f448581b8cf9c4                                 perl-5.28.1.tar.xz
+sha1   5fc239bebb8c484c3f5c58e663274ce668981651                         perl-5.28.1.tar.xz
+sha256 fea7162d4cca940a387f0587b93f6737d884bf74d8a9d7cfd978bc12cd0b202d perl-5.28.1.tar.xz
 
-# Hashes from: https://github.com/arsv/perl-cross/releases/download/1.2/perl-cross-1.2.hash
-sha256	599077beb86af5e6097da8922a84474a5484f61475d2899eae0f8634e9619109  perl-cross-1.2.tar.gz
+# Hashes from: https://github.com/arsv/perl-cross/releases/download/1.2.1/perl-cross-1.2.1.hash
+sha256	8b706bc688ddf71b62d649bde72f648669f18b37fe0c54ec6201142ca3943498  perl-cross-1.2.1.tar.gz
diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index b0eea3eff..9205ef64f 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -5,15 +5,15 @@
 ################################################################################
 
 # When updating the version here, also update utils/scancpan
-PERL_VERSION_MAJOR = 26
-PERL_VERSION = 5.$(PERL_VERSION_MAJOR).2
+PERL_VERSION_MAJOR = 28
+PERL_VERSION = 5.$(PERL_VERSION_MAJOR).1
 PERL_SITE = http://www.cpan.org/src/5.0
 PERL_SOURCE = perl-$(PERL_VERSION).tar.xz
 PERL_LICENSE = Artistic or GPL-1.0+
 PERL_LICENSE_FILES = Artistic Copying README
 PERL_INSTALL_STAGING = YES
 
-PERL_CROSS_VERSION = 1.2
+PERL_CROSS_VERSION = 1.2.1
 # DO NOT refactor with the github helper (the result is not the same)
 PERL_CROSS_SITE = https://github.com/arsv/perl-cross/releases/download/$(PERL_CROSS_VERSION)
 PERL_CROSS_SOURCE = perl-cross-$(PERL_CROSS_VERSION).tar.gz
diff --git a/utils/scancpan b/utils/scancpan
index 78ea08c6e..aa0b63a19 100755
--- a/utils/scancpan
+++ b/utils/scancpan
@@ -487,9 +487,9 @@ use Digest::SHA qw(sha256_hex);
 use Text::Wrap;
 $Text::Wrap::columns = 62;
 
-# Below, 5.026 should be aligned with the version of perl actually
+# Below, 5.028 should be aligned with the version of perl actually
 # bundled in Buildroot:
-die <<"MSG" if $] < 5.026;
+die <<"MSG" if $] < 5.028;
 This script needs a host perl with the same major version as Buildroot target perl.
 
 Your current host perl is:
@@ -497,7 +497,7 @@ Your current host perl is:
     version $]
 
 You may install a local one by running:
-    perlbrew install perl-5.26.0
+    perlbrew install perl-5.28.0
 MSG
 
 my ($help, $man, $quiet, $force, $recommend, $test, $host);
@@ -812,7 +812,7 @@ utils/scancpan Try-Tiny Moo
 
 =head1 SYNOPSIS
 
-supports/scripts/scancpan [options] [distname ...]
+utils/scancpan [options] [distname ...]
 
  Options:
    -help
@@ -901,9 +901,9 @@ This script is a part of Buildroot.
 This script requires the module C<MetaCPAN::API::Tiny> (version 1.131730)
 which was included at the beginning of this file by the tool C<fatpack>.
 
-See L<http://search.cpan.org/~nperez/MetaCPAN-API-Tiny-1.131730/>.
+See L<https://metacpan.org/release/NPEREZ/MetaCPAN-API-Tiny-1.131730>.
 
-See L<http://search.cpan.org/search?query=App-FatPacker&mode=dist>.
+See L<https://metacpan.org/release/App-FatPacker>.
 
 These both libraries are free software and may be distributed under the same
 terms as perl itself.
-- 
2.17.1
