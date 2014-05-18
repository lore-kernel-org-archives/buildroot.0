From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 18 May 2014 23:54:09 +0200
Subject: [Buildroot] [git commit branch/next] scancpan: sort dependencies
Message-ID: <20140520120656.0231A9CCC9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9c2be26ed8221f4053e203692711841884defdb4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

in order to avoid spurious diff when updating packages

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/scripts/scancpan |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/support/scripts/scancpan b/support/scripts/scancpan
index dc62b47..d8723f3 100755
--- a/support/scripts/scancpan
+++ b/support/scripts/scancpan
@@ -581,7 +581,7 @@ while (my ($distname, $dist) = each %dist) {
         open my $fh, q{>}, $cfgname;
         say {$fh} qq{config BR2_PACKAGE_${brname}};
         say {$fh} qq{\tbool "${fsname}"};
-        foreach my $dep (@{$deps_runtime{$distname}}) {
+        foreach my $dep (sort @{$deps_runtime{$distname}}) {
             my $brdep = brname( fsname( $dep ) );
             say {$fh} qq{\tselect BR2_PACKAGE_${brdep}};
         }
@@ -596,10 +596,10 @@ while (my ($distname, $dist) = each %dist) {
         # the scheme is not used, because the job is done by the BR download infrastructure
         # the auth part is not used, because we use $(BR2_CPAN_MIRROR)
         my($filename, $directories, $suffix) = fileparse( $path, q{tar.gz}, q{tgz} );
-        my $dependencies = join q{ }, map( { q{host-} . fsname( $_ ); } @{$deps_build{$distname}} ),
-                                      map( { fsname( $_ ); } @{$deps_runtime{$distname}} );
-        my $host_dependencies = join q{ }, map { q{host-} . fsname( $_ ); } @{$deps_build{$distname}},
-                                                                            @{$deps_runtime{$distname}};
+        my $dependencies = join q{ }, map( { q{host-} . fsname( $_ ); } sort @{$deps_build{$distname}} ),
+                                      map( { fsname( $_ ); } sort @{$deps_runtime{$distname}} );
+        my $host_dependencies = join q{ }, map { q{host-} . fsname( $_ ); } sort( @{$deps_build{$distname}},
+                                                                                  @{$deps_runtime{$distname}} );
         my $license = ref $dist->{license} eq 'ARRAY'
                     ? join q{ or }, @{$dist->{license}}
                     : $dist->{license};
