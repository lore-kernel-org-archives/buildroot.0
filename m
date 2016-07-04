From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Jul 2016 17:41:54 +0200
Subject: [Buildroot] [git commit] scancpan: improve message when bad host
	perl version
Message-ID: <20160704154504.74857802C9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=28a001fc7b1df037b8528a55aabc92d23dc2c8ea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
[Thomas:
 - add comment in scancpan about the version dependency, suggested by
   Yann E. Morin.
 - add comment in perl.mk about the need to sync any version change with
   scancpan, also suggested by Yann E. Morin.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/perl/perl.mk     |  1 +
 support/scripts/scancpan | 19 ++++++++++++++-----
 2 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index d66e448..f96b638 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -4,6 +4,7 @@
 #
 ################################################################################
 
+# When updating the version here, also update support/scripts/scancpan
 PERL_VERSION_MAJOR = 22
 PERL_VERSION = 5.$(PERL_VERSION_MAJOR).2
 PERL_SITE = http://www.cpan.org/src/5.0
diff --git a/support/scripts/scancpan b/support/scripts/scancpan
index 6c70cfb..3ee543a 100755
--- a/support/scripts/scancpan
+++ b/support/scripts/scancpan
@@ -471,7 +471,7 @@ unshift @INC, sub {
 } # END OF FATPACK CODE
 
 
-use 5.022;      # same major version as target perl
+use 5.010;
 use strict;
 use warnings;
 use Fatal qw(open close);
@@ -484,6 +484,19 @@ use HTTP::Tiny;
 use Safe;
 use MetaCPAN::API::Tiny;
 
+# Below, 5.022 should be aligned with the version of perl actually
+# bundled in Buildroot:
+die <<"MSG" if $] < 5.022;
+This script needs a host perl with the same major version as Buildroot target perl.
+
+Your current host perl is:
+    $^X
+    version $]
+
+You may install a local one by running:
+    perlbrew install perl-5.22.2
+MSG
+
 my ($help, $man, $quiet, $force, $recommend, $test, $host);
 my $target = 1;
 GetOptions( 'help|?' => \$help,
@@ -746,10 +759,6 @@ support/scripts/scancpan Try-Tiny Moo
 
 =head1 SYNOPSIS
 
-curl -kL http://install.perlbrew.pl | bash
-
-perlbrew install perl-5.18.2
-
 supports/scripts/scancpan [options] [distname ...]
 
  Options:
