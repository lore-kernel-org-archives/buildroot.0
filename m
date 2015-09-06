From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 6 Sep 2015 22:48:49 +0200
Subject: [Buildroot] [git commit] scancpan: remove hack for Module-Build
Message-ID: <20150906204918.6D90781DA9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8498474ce3a8d623cfafd35b6bb119950890d2b0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

with Perl 5.22, Module-Build is no longer a core module

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/scripts/scancpan |    5 -----
 1 files changed, 0 insertions(+), 5 deletions(-)

diff --git a/support/scripts/scancpan b/support/scripts/scancpan
index e7bd2bb..1121212 100755
--- a/support/scripts/scancpan
+++ b/support/scripts/scancpan
@@ -560,12 +560,8 @@ sub fetch {
         $license_files{$name} = find_license_files( $manifest );
         my %build = ();
         my %runtime = ();
-        my $mb;
         foreach my $dep (@{$result->{dependency}}) {
             my $modname = ${$dep}{module};
-            $mb = 1 if $modname eq q{Module::Build};
-            # Module::Build has a special treatment, because it is a core module,
-            # but some module require a very recent version of it
             next if $modname eq q{perl};
             next if $modname =~ m|^Alien|;
             next if $modname =~ m|^Win32|;
@@ -584,7 +580,6 @@ sub fetch {
                 $build{$distname} = 1;
             }
         }
-        $build{q{Module-Build}} = 1 if $mb;
         $deps_build{$name} = [keys %build];
         $deps_runtime{$name} = [keys %runtime];
         foreach my $distname (@{$deps_build{$name}}) {
