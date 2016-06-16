From: Francois Perrad <fperrad@gmail.com>
Date: Thu, 16 Jun 2016 18:26:24 +0200
Subject: [Buildroot] [V3] scancpan: improve message when bad host perl
	version
Message-ID: <1466094384-24610-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 support/scripts/scancpan | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/support/scripts/scancpan b/support/scripts/scancpan
index 6c70cfb..617ee71 100755
--- a/support/scripts/scancpan
+++ b/support/scripts/scancpan
@@ -471,7 +471,7 @@ unshift @INC, sub {
 } # END OF FATPACK CODE
 
 
-use 5.022;      # same major version as target perl
+use 5.010;
 use strict;
 use warnings;
 use Fatal qw(open close);
@@ -484,6 +484,17 @@ use HTTP::Tiny;
 use Safe;
 use MetaCPAN::API::Tiny;
 
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
@@ -746,10 +757,6 @@ support/scripts/scancpan Try-Tiny Moo
 
 =head1 SYNOPSIS
 
-curl -kL http://install.perlbrew.pl | bash
-
-perlbrew install perl-5.18.2
-
 supports/scripts/scancpan [options] [distname ...]
 
  Options:
-- 
1.9.1
