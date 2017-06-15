From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 15 Jun 2017 22:31:50 +0200
Subject: [Buildroot] [git commit] scancpan: refactor with MetaCPAN::API
	source()
Message-ID: <20170615203439.CC85881735@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e27c0b5acbac221df4ad6a1476aa1bcd1509f274
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

instead of get_manifest()

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/scripts/scancpan | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/support/scripts/scancpan b/support/scripts/scancpan
index f87cdce..82c77a8 100755
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
