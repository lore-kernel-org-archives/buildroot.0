From: Francois Perrad <fperrad@gmail.com>
Date: Wed, 10 Oct 2018 08:46:13 +0200
Subject: [Buildroot] [PATCH 05/13] scancpan: split multiple dependencies on
 multiple lines
In-Reply-To: <20181010064621.19253-1-francois.perrad@gadz.org>
References: <20181010064621.19253-1-francois.perrad@gadz.org>
Message-ID: <20181010064621.19253-6-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 utils/scancpan | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/utils/scancpan b/utils/scancpan
index 64599f430..632e7aa95 100755
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
-- 
2.17.1
