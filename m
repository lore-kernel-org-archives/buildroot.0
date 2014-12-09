From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Dec 2014 21:15:09 +0100
Subject: [Buildroot] [git commit] support/script/scancpan: remove duplicated
	dependency
Message-ID: <20141209201831.E725D80153@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=315d29e15994d086a500c72180608b3e65ebcdbf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Dependencies from metacpan comes as a list of modules which is
transformed in a list of distribution for BR.  Different modules could
be included in the same distribution, so duplication is possible.

This can for example be seen with the HTTP-Daemon module, which would
get two times the dependencies on HTTP-Message without this commit.

[Thomas: slightly extend commit log.]

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/scripts/scancpan |   18 +++++++++---------
 1 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/support/scripts/scancpan b/support/scripts/scancpan
index 0eac132..590c215 100755
--- a/support/scripts/scancpan
+++ b/support/scripts/scancpan
@@ -558,8 +558,8 @@ sub fetch {
         my $manifest = get_manifest( $result->{author}, $name, $result->{version} );
         $need_dlopen{$name} = is_xs( $manifest );
         $license_files{$name} = find_license_files( $manifest );
-        my @deps_build = ();
-        my @deps_runtime = ();
+        my %build = ();
+        my %runtime = ();
         my $mb;
         foreach my $dep (@{$result->{dependency}}) {
             my $modname = ${$dep}{module};
@@ -578,19 +578,19 @@ sub fetch {
             next if !$recommend && ${$dep}{relationship} ne q{requires};
             my $distname = $mcpan->module( $modname )->{distribution};
             if (${$dep}{phase} eq q{runtime}) {
-                push @deps_runtime, $distname;
+                $runtime{$distname} = 1;
             }
             else { # configure, build
-                push @deps_build, $distname;
+                $build{$distname} = 1;
             }
         }
-        unshift @deps_build, q{Module-Build} if $mb;
-        $deps_build{$name} = \@deps_build;
-        $deps_runtime{$name} = \@deps_runtime;
-        foreach my $distname (@deps_build) {
+        $build{q{Module-Build}} = 1 if $mb;
+        $deps_build{$name} = [keys %build];
+        $deps_runtime{$name} = [keys %runtime];
+        foreach my $distname (@{$deps_build{$name}}) {
             fetch( $distname, 0, 1 );
         }
-        foreach my $distname (@deps_runtime) {
+        foreach my $distname (@{$deps_runtime{$name}}) {
             fetch( $distname, $need_target, $need_host );
             $need_dlopen{$name} ||= $need_dlopen{$distname};
         }
