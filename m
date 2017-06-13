From: Francois Perrad <fperrad@gmail.com>
Date: Tue, 13 Jun 2017 17:35:00 +0200
Subject: [Buildroot] [PATCH] scancpan: update with MetaCPAN API v1
Message-ID: <20170613153500.15078-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The API v0 is shutdown.
see https://bugs.busybox.net/show_bug.cgi?id=9951

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 support/scripts/scancpan | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/support/scripts/scancpan b/support/scripts/scancpan
index 8d44ed90..82c4329b 100755
--- a/support/scripts/scancpan
+++ b/support/scripts/scancpan
@@ -521,7 +521,7 @@ my %deps_runtime;       # name -> list of target dependencies
 my %deps_optional;      # name -> list of optional target dependencies
 my %license_files;      # name -> list of license files
 my %checksum;           # author -> list of checksum
-my $mcpan = MetaCPAN::API::Tiny->new();
+my $mcpan = MetaCPAN::API::Tiny->new(base_url => 'http://fastapi.metacpan.org/v1');
 my $ua = HTTP::Tiny->new();
 
 sub get_checksum {
@@ -529,7 +529,8 @@ sub get_checksum {
     my($path) = $url =~ m|^[^:/?#]+://[^/?#]*([^?#]*)|;
     my($basename, $dirname) = fileparse( $path );
     unless ($checksum{$dirname}) {
-        my $response = $ua->get(qq{http://cpan.metacpan.org${dirname}CHECKSUMS});
+        my $url = qq{http://cpan.metacpan.org${dirname}CHECKSUMS};  # a CPAN mirror
+        my $response = $ua->get($url);
         $checksum{$dirname} = $response->{content};
     }
     my $chksum = Safe->new->reval($checksum{$dirname});
@@ -538,7 +539,7 @@ sub get_checksum {
 
 sub get_manifest {
     my ($author, $distname, $version) = @_;
-    my $url = qq{http://api.metacpan.org/source/${author}/${distname}-${version}/MANIFEST};
+    my $url = qq{http://fastapi.metacpan.org/source/${author}/${distname}-${version}/MANIFEST};
     my $response = $ua->get($url);
     return $response->{content};
 }
@@ -725,7 +726,7 @@ while (my ($distname, $dist) = each %dist) {
         my $sha256 = $checksum->{sha256};
         say qq{write ${hashname}} unless $quiet;
         open my $fh, q{>}, $hashname;
-        say {$fh} qq{# retrieved by scancpan from http://cpan.metacpan.org/};
+        say {$fh} qq{# retrieved by scancpan from http://metacpan.org/};
         say {$fh} qq{md5    ${md5} ${filename}};
         say {$fh} qq{sha256 ${sha256} ${filename}};
         close $fh;
-- 
2.11.0
