From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Oct 2018 09:06:04 +0200
Subject: [Buildroot] [git commit] scancpan: split multiple dependencies on
 multiple lines
Message-ID: <20181010070555.C7CF381E44@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=37e85660b525a63018fec1442b0a5cc263809e4c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 utils/scancpan | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/utils/scancpan b/utils/scancpan
index 64599f4305..632e7aa95c 100755
--- a/utils/scancpan
+++ b/utils/scancpan
@@ -717,10 +717,14 @@ while (my ($distname, $dist) = each %dist) {
         # the auth part is not used, because we use $(BR2_CPAN_MIRROR)
         my ($filename, $directories, $suffix) = fileparse( $path, q{tar.gz}, q{tgz} );
         $directories =~ s|/$||;
-        my $dependencies = join q{ }, map( { q{host-} . fsname( $_ ); } sort @{$deps_build{$distname}} ),
-                                      map( { fsname( $_ ); } sort @{$deps_runtime{$distname}} );
-        my $host_dependencies = join q{ }, map { q{host-} . fsname( $_ ); } sort( @{$deps_build{$distname}},
-                                                                                  @{$deps_runtime{$distname}} );
+        my @dependencies = ( map( { q{host-} . fsname( $_ ); } sort @{$deps_build{$distname}} ),
+                             map( { fsname( $_ ); } sort @{$deps_runtime{$distname}} ) );
+        my $dependencies = join qq{ \\\n\t}, @dependencies;
+        $dependencies = qq{\\\n\t} . $dependencies if scalar @dependencies > 1;
+        my @host_dependencies = map { q{host-} . fsname( $_ ); } sort( @{$deps_build{$distname}},
+                                                                       @{$deps_runtime{$distname}} );
+        my $host_dependencies = join qq{ \\\n\t}, @host_dependencies;
+        $host_dependencies = qq{\\\n\t} . $host_dependencies if scalar @host_dependencies > 1;
         my $license = brlicense( ref $dist->{license} eq 'ARRAY'
                                ? join q{ or }, @{$dist->{license}}
                                : $dist->{license} );
