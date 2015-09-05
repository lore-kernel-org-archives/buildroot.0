From: Francois Perrad <fperrad@gmail.com>
Date: Sat,  5 Sep 2015 08:36:06 +0200
Subject: [Buildroot] [PATCH 2/2] scancpan: remove hack for Module-Build
In-Reply-To: <1441434966-29518-1-git-send-email-francois.perrad@gadz.org>
References: <1441434966-29518-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1441434966-29518-2-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

with Perl 5.22, Module-Build is no longer a core module

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 support/scripts/scancpan | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/support/scripts/scancpan b/support/scripts/scancpan
index 8268c36..94983b4 100755
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
-- 
2.1.4
