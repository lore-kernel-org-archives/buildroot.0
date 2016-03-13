From: Francois Perrad <fperrad@gmail.com>
Date: Sun, 13 Mar 2016 18:37:29 +0100
Subject: [Buildroot] [V3 2/2] scancpan: use recommend & test flags only at
	first level
In-Reply-To: <1457890649-4838-1-git-send-email-francois.perrad@gadz.org>
References: <1457890649-4838-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1457890649-4838-2-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, these flags are recursively propagated. This behavior is
not expected by users, because it can cause dependencies explosively.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 support/scripts/scancpan | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/support/scripts/scancpan b/support/scripts/scancpan
index 72cca1a..6c70cfb 100755
--- a/support/scripts/scancpan
+++ b/support/scripts/scancpan
@@ -552,10 +552,10 @@ sub find_license_files {
 }
 
 sub fetch {
-    my ($name, $need_target, $need_host) = @_;
+    my ($name, $need_target, $need_host, $top) = @_;
     $need_target{$name} = $need_target if $need_target;
     $need_host{$name} = $need_host if $need_host;
-    unless ($dist{$name}) {
+    unless ($dist{$name} && !$top) {
         say qq{fetch ${name}} unless $quiet;
         my $result = $mcpan->release( distribution => $name );
         $dist{$name} = $result;
@@ -570,19 +570,19 @@ sub fetch {
             next if $modname eq q{perl};
             next if $modname =~ m|^Alien|;
             next if $modname =~ m|^Win32|;
-            next if !$test && $modname =~ m|^Test|;
+            next if !($test && $top) && $modname =~ m|^Test|;
             next if Module::CoreList::is_core( $modname, undef, $] );
             # we could use the host Module::CoreList data, because host perl and
             # target perl have the same major version
             next if ${$dep}{phase} eq q{develop};
-            next if !$test && ${$dep}{phase} eq q{test};
+            next if !($test && $top) && ${$dep}{phase} eq q{test};
             my $distname = $mcpan->module( $modname )->{distribution};
             if (${$dep}{phase} eq q{runtime}) {
                 if (${$dep}{relationship} eq q{requires}) {
                     $runtime{$distname} = 1;
                 }
                 else {
-                    $optional{$distname} = 1 if $recommend;
+                    $optional{$distname} = 1 if $recommend && $top;
                 }
             }
             else { # configure, build
@@ -608,7 +608,7 @@ sub fetch {
 
 foreach my $distname (@ARGV) {
     # Command-line's distributions
-    fetch( $distname, !!$target, !!$host );
+    fetch( $distname, !!$target, !!$host, 1 );
 }
 say scalar keys %dist, q{ packages fetched.} unless $quiet;
 
-- 
2.5.0
