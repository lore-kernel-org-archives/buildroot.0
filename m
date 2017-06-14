From: Francois Perrad <fperrad@gmail.com>
Date: Wed, 14 Jun 2017 16:15:30 +0200
Subject: [Buildroot] [v2 2/3] scancpan: refactor with MetaCPAN::API source()
In-Reply-To: <20170614141531.18497-1-francois.perrad@gadz.org>
References: <20170614141531.18497-1-francois.perrad@gadz.org>
Message-ID: <20170614141531.18497-2-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

instead of get_manifest()

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 support/scripts/scancpan | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/support/scripts/scancpan b/support/scripts/scancpan
index f87cdce7..82c77a85 100755
--- a/support/scripts/scancpan
+++ b/support/scripts/scancpan
@@ -536,13 +536,6 @@ sub get_checksum {
     return $chksum->{$basename}, $basename;
 }
 
-sub get_manifest {
-    my ($author, $distname, $version) = @_;
-    my $url = qq{http://fastapi.metacpan.org/source/${author}/${distname}-${version}/MANIFEST};
-    my $response = $ua->get($url);
-    return $response->{content};
-}
-
 sub is_xs {
     my ($manifest) = @_;
     # This heuristic determines if a module is a native extension, by searching
@@ -572,7 +565,9 @@ sub fetch {
         say qq{fetch ${name}} unless $quiet;
         my $result = $mcpan->release( distribution => $name );
         $dist{$name} = $result;
-        my $manifest = get_manifest( $result->{author}, $name, $result->{version} );
+        my $manifest = $mcpan->source( author => $result->{author},
+                                       release => $name . q{-} . $result->{version},
+                                       path => 'MANIFEST' );
         $need_dlopen{$name} = is_xs( $manifest );
         $license_files{$name} = find_license_files( $manifest );
         my %build = ();
-- 
2.11.0
