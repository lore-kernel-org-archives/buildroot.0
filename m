From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 15 Jun 2017 22:32:01 +0200
Subject: [Buildroot] [git commit] scancpan: refactor with $mirror
Message-ID: <20170615203439.E029881E16@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c3839e048ed37227ccac07ae8aa9bd1ddf887ec3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/scripts/scancpan | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/support/scripts/scancpan b/support/scripts/scancpan
index 82c77a8..62df225 100755
--- a/support/scripts/scancpan
+++ b/support/scripts/scancpan
@@ -521,6 +521,7 @@ my %deps_runtime;       # name -> list of target dependencies
 my %deps_optional;      # name -> list of optional target dependencies
 my %license_files;      # name -> list of license files
 my %checksum;           # author -> list of checksum
+my $mirror = 'http://cpan.metacpan.org';        # a CPAN mirror
 my $mcpan = MetaCPAN::API::Tiny->new(base_url => 'http://fastapi.metacpan.org/v1');
 my $ua = HTTP::Tiny->new();
 
@@ -529,7 +530,8 @@ sub get_checksum {
     my($path) = $url =~ m|^[^:/?#]+://[^/?#]*([^?#]*)|;
     my($basename, $dirname) = fileparse( $path );
     unless ($checksum{$dirname}) {
-        my $response = $ua->get(qq{http://cpan.metacpan.org${dirname}CHECKSUMS});
+        my $url = $mirror . $dirname . q{CHECKSUMS};
+        my $response = $ua->get($url);
         $checksum{$dirname} = $response->{content};
     }
     my $chksum = Safe->new->reval($checksum{$dirname});
@@ -720,7 +722,7 @@ while (my ($distname, $dist) = each %dist) {
         my $sha256 = $checksum->{sha256};
         say qq{write ${hashname}} unless $quiet;
         open my $fh, q{>}, $hashname;
-        say {$fh} qq{# retrieved by scancpan from http://cpan.metacpan.org/};
+        say {$fh} qq{# retrieved by scancpan from ${mirror}/};
         say {$fh} qq{md5    ${md5} ${filename}};
         say {$fh} qq{sha256 ${sha256} ${filename}};
         close $fh;
