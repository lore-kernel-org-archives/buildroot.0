From: Francois Perrad <fperrad@gmail.com>
Date: Tue, 19 Jan 2016 20:10:51 +0100
Subject: [Buildroot] [PATCH 1/2] scancpan: use test & recommend flags only
	at first level
Message-ID: <1453230652-17279-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 support/scripts/scancpan | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/support/scripts/scancpan b/support/scripts/scancpan
index 0436d2a..e90d495 100755
--- a/support/scripts/scancpan
+++ b/support/scripts/scancpan
@@ -551,7 +551,7 @@ sub find_license_files {
 }
 
 sub fetch {
-    my ($name, $need_target, $need_host) = @_;
+    my ($name, $need_target, $need_host, $want_recommend, $want_test) = @_;
     $need_target{$name} = $need_target if $need_target;
     $need_host{$name} = $need_host if $need_host;
     unless ($dist{$name}) {
@@ -568,13 +568,13 @@ sub fetch {
             next if $modname eq q{perl};
             next if $modname =~ m|^Alien|;
             next if $modname =~ m|^Win32|;
-            next if !$test && $modname =~ m|^Test|;
+            next if !$want_test && $modname =~ m|^Test|;
             next if Module::CoreList::is_core( $modname, undef, $] );
             # we could use the host Module::CoreList data, because host perl and
             # target perl have the same major version
             next if ${$dep}{phase} eq q{develop};
-            next if !$test && ${$dep}{phase} eq q{test};
-            next if !$recommend && ${$dep}{relationship} ne q{requires};
+            next if !$want_test && ${$dep}{phase} eq q{test};
+            next if !$want_recommend && ${$dep}{relationship} ne q{requires};
             my $distname = $mcpan->module( $modname )->{distribution};
             if (${$dep}{phase} eq q{runtime}) {
                 $runtime{$distname} = 1;
@@ -586,10 +586,10 @@ sub fetch {
         $deps_build{$name} = [keys %build];
         $deps_runtime{$name} = [keys %runtime];
         foreach my $distname (@{$deps_build{$name}}) {
-            fetch( $distname, 0, 1 );
+            fetch( $distname, 0, 1, 0, 0 );
         }
         foreach my $distname (@{$deps_runtime{$name}}) {
-            fetch( $distname, $need_target, $need_host );
+            fetch( $distname, $need_target, $need_host, 0, 0 );
             $need_dlopen{$name} ||= $need_dlopen{$distname};
         }
     }
@@ -598,7 +598,7 @@ sub fetch {
 
 foreach my $distname (@ARGV) {
     # Command-line's distributions
-    fetch( $distname, !!$target, !!$host );
+    fetch( $distname, !!$target, !!$host, !!$recommend, !!$test );
 }
 say scalar keys %dist, q{ packages fetched.} unless $quiet;
 
@@ -800,7 +800,7 @@ in order to work with the right CoreList data.
 
 =head1 LICENSE
 
-Copyright (C) 2013-2014 by Francois Perrad <francois.perrad@gadz.org>
+Copyright (C) 2013-2016 by Francois Perrad <francois.perrad@gadz.org>
 
 This program is free software; you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
-- 
2.5.0
