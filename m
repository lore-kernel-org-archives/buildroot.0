From: Francois Perrad <fperrad@gmail.com>
Date: Sun, 13 Mar 2016 18:37:28 +0100
Subject: [Buildroot] [V3 1/2] scancpan: handle recommended dependencies as
	optional packages
Message-ID: <1457890649-4838-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, without the flag -recommend, scancpan takes as dependency
only one which has the relationship "requires"; this mode works fine.
And, with the flag -recommend, scancpan takes all ones (ie. with
relationship "requires" or "recommends") in the same way; this mode
never works fine, because it is too simplistic.

With this commit, the "not required" dependencies are handled as
optional BR package or skipped if a cyclic dependency is detected.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 support/scripts/scancpan | 25 ++++++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/support/scripts/scancpan b/support/scripts/scancpan
index 0436d2a..72cca1a 100755
--- a/support/scripts/scancpan
+++ b/support/scripts/scancpan
@@ -505,6 +505,7 @@ my %need_host;          # name -> 1 if host package is needed
 my %need_dlopen;        # name -> 1 if requires dynamic library
 my %deps_build;         # name -> list of host dependencies
 my %deps_runtime;       # name -> list of target dependencies
+my %deps_optional;      # name -> list of optional target dependencies
 my %license_files;      # name -> list of license files
 my %checksum;           # author -> list of checksum
 my $mcpan = MetaCPAN::API::Tiny->new();
@@ -563,6 +564,7 @@ sub fetch {
         $license_files{$name} = find_license_files( $manifest );
         my %build = ();
         my %runtime = ();
+        my %optional = ();
         foreach my $dep (@{$result->{dependency}}) {
             my $modname = ${$dep}{module};
             next if $modname eq q{perl};
@@ -574,10 +576,14 @@ sub fetch {
             # target perl have the same major version
             next if ${$dep}{phase} eq q{develop};
             next if !$test && ${$dep}{phase} eq q{test};
-            next if !$recommend && ${$dep}{relationship} ne q{requires};
             my $distname = $mcpan->module( $modname )->{distribution};
             if (${$dep}{phase} eq q{runtime}) {
-                $runtime{$distname} = 1;
+                if (${$dep}{relationship} eq q{requires}) {
+                    $runtime{$distname} = 1;
+                }
+                else {
+                    $optional{$distname} = 1 if $recommend;
+                }
             }
             else { # configure, build
                 $build{$distname} = 1;
@@ -585,6 +591,7 @@ sub fetch {
         }
         $deps_build{$name} = [keys %build];
         $deps_runtime{$name} = [keys %runtime];
+        $deps_optional{$name} = [keys %optional];
         foreach my $distname (@{$deps_build{$name}}) {
             fetch( $distname, 0, 1 );
         }
@@ -592,6 +599,9 @@ sub fetch {
             fetch( $distname, $need_target, $need_host );
             $need_dlopen{$name} ||= $need_dlopen{$distname};
         }
+        foreach my $distname (@{$deps_optional{$name}}) {
+            fetch( $distname, $need_target, $need_host );
+        }
     }
     return;
 }
@@ -683,6 +693,15 @@ while (my ($distname, $dist) = each %dist) {
         say {$fh} qq{${brname}_LICENSE = ${license}} if $license && $license ne q{unknown};
         say {$fh} qq{${brname}_LICENSE_FILES = ${license_files}} if $license_files;
         say {$fh} qq{};
+        foreach (sort @{$deps_optional{$distname}}) {
+            next if grep { $_ eq $distname; } @{$deps_runtime{$_}};     # avoid cyclic dependencies
+            my $opt_brname = brname( $_ );
+            my $opt_fsname = fsname( $_ );
+            say {$fh} qq{ifeq (\$(BR2_PACKAGE_PERL_${opt_brname}),y)};
+            say {$fh} qq{${brname}_DEPENDENCIES += ${opt_fsname}};
+            say {$fh} qq{endif};
+            say {$fh} qq{};
+        }
         say {$fh} qq{\$(eval \$(perl-package))} if $need_target{$distname};
         say {$fh} qq{\$(eval \$(host-perl-package))} if $need_host{$distname};
         close $fh;
@@ -800,7 +819,7 @@ in order to work with the right CoreList data.
 
 =head1 LICENSE
 
-Copyright (C) 2013-2014 by Francois Perrad <francois.perrad@gadz.org>
+Copyright (C) 2013-2016 by Francois Perrad <francois.perrad@gadz.org>
 
 This program is free software; you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
-- 
2.5.0
