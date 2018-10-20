From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Oct 2018 19:29:52 +0200
Subject: [Buildroot] [git commit] scancpan: remove optional dependency
Message-ID: <20181020172849.2051683C69@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0cae150f9e5996dd26e25da38f02c804c7462e6d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

there are also runtime dependency

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 utils/scancpan | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/utils/scancpan b/utils/scancpan
index 01f3abdc85..6b810fdb68 100755
--- a/utils/scancpan
+++ b/utils/scancpan
@@ -521,7 +521,6 @@ my %need_host;          # name -> 1 if host package is needed
 my %need_dlopen;        # name -> 1 if requires dynamic library
 my %deps_build;         # name -> list of host dependencies
 my %deps_runtime;       # name -> list of target dependencies
-my %deps_optional;      # name -> list of optional target dependencies
 my %license_files;      # name -> hash of license files
 my %checksum;           # author -> list of checksum
 my $mirror = 'http://cpan.metacpan.org';        # a CPAN mirror
@@ -626,7 +625,6 @@ sub fetch {
         }
         $deps_build{$name} = [keys %build];
         $deps_runtime{$name} = [keys %runtime];
-        $deps_optional{$name} = [keys %optional];
         foreach my $distname (@{$deps_build{$name}}) {
             fetch( $distname, 0, 1 );
         }
@@ -634,7 +632,7 @@ sub fetch {
             fetch( $distname, $need_target, $need_host );
             $need_dlopen{$name} ||= $need_dlopen{$distname};
         }
-        foreach my $distname (@{$deps_optional{$name}}) {
+        foreach my $distname (keys %optional) {
             fetch( $distname, $need_target, $need_host );
         }
     }
@@ -748,15 +746,6 @@ while (my ($distname, $dist) = each %dist) {
         say {$fh} qq{${brname}_LICENSE = ${license}} if $license;
         say {$fh} qq{${brname}_LICENSE_FILES = ${license_files}} if $license_files;
         say {$fh} qq{};
-        foreach (sort @{$deps_optional{$distname}}) {
-            next if grep { $_ eq $distname; } @{$deps_runtime{$_}};     # avoid cyclic dependencies
-            my $opt_brname = brname( $_ );
-            my $opt_fsname = fsname( $_ );
-            say {$fh} qq{ifeq (\$(BR2_PACKAGE_PERL_${opt_brname}),y)};
-            say {$fh} qq{${brname}_DEPENDENCIES += ${opt_fsname}};
-            say {$fh} qq{endif};
-            say {$fh} qq{};
-        }
         say {$fh} qq{\$(eval \$(perl-package))} if $need_target{$distname};
         say {$fh} qq{\$(eval \$(host-perl-package))} if $need_host{$distname};
         close $fh;
