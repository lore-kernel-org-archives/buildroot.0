From: Francois Perrad <fperrad@gmail.com>
Date: Wed, 14 Jun 2017 16:15:31 +0200
Subject: [Buildroot] [v2 3/3] scancpan: refactor with $mirror
In-Reply-To: <20170614141531.18497-1-francois.perrad@gadz.org>
References: <20170614141531.18497-1-francois.perrad@gadz.org>
Message-ID: <20170614141531.18497-3-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 support/scripts/scancpan | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/support/scripts/scancpan b/support/scripts/scancpan
index 82c77a85..62df2253 100755
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
-- 
2.11.0
