From: Francois Perrad <fperrad@gmail.com>
Date: Sat, 12 May 2018 09:03:00 +0200
Subject: [Buildroot] [PATCH] utils/scancpan: generates hashes of license
 files
Message-ID: <20180512070300.128153-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 utils/scancpan | 30 ++++++++++++++++++++----------
 1 file changed, 20 insertions(+), 10 deletions(-)

diff --git a/utils/scancpan b/utils/scancpan
index 6d1cdc57a..da8e7b91a 100755
--- a/utils/scancpan
+++ b/utils/scancpan
@@ -483,6 +483,7 @@ use Module::CoreList;
 use HTTP::Tiny;
 use Safe;
 use MetaCPAN::API::Tiny;
+use Digest::SHA qw(sha256_hex);
 
 # Below, 5.026 should be aligned with the version of perl actually
 # bundled in Buildroot:
@@ -519,7 +520,7 @@ my %need_dlopen;        # name -> 1 if requires dynamic library
 my %deps_build;         # name -> list of host dependencies
 my %deps_runtime;       # name -> list of target dependencies
 my %deps_optional;      # name -> list of optional target dependencies
-my %license_files;      # name -> list of license files
+my %license_files;      # name -> hash of license files
 my %checksum;           # author -> list of checksum
 my $mirror = 'http://cpan.metacpan.org';        # a CPAN mirror
 my $mcpan = MetaCPAN::API::Tiny->new(base_url => 'http://fastapi.metacpan.org/v1');
@@ -556,7 +557,7 @@ sub find_license_files {
     if (scalar @license_files == 0 && $manifest =~ m/(README)[\n\s]/i) {
         @license_files = ($1);
     }
-    return \@license_files;
+    return @license_files;
 }
 
 sub fetch {
@@ -567,16 +568,19 @@ sub fetch {
         say qq{fetch ${name}} unless $quiet;
         my $result = $mcpan->release( distribution => $name );
         $dist{$name} = $result;
+        $license_files{$name} = {};
         eval {
-            my $manifest = $mcpan->source( author => $result->{author},
-                                           release => $name . q{-} . $result->{version},
-                                           path => 'MANIFEST' );
+            my $author = $result->{author};
+            my $release = $name . q{-} . $result->{version};
+            my $manifest = $mcpan->source( author => $author, release => $release, path => 'MANIFEST' );
             $need_dlopen{$name} = is_xs( $manifest );
-            $license_files{$name} = find_license_files( $manifest );
+            foreach my $fname (find_license_files( $manifest )) {
+                my $license = $mcpan->source( author => $author, release => $release, path => $fname );
+                $license_files{$name}->{$fname} = sha256_hex( $license );
+            }
         };
         if ($@) {
             warn $@;
-            $license_files{$name} = [];
         }
         my %build = ();
         my %runtime = ();
@@ -692,7 +696,7 @@ while (my ($distname, $dist) = each %dist) {
         $license =~ s|mit|MIT|;
         $license =~ s|openssl|OpenSSL|;
         $license =~ s|perl_5|Artistic or GPL-1.0+|;
-        my $license_files = join q{ }, @{$license_files{$distname}};
+        my $license_files = join q{ }, keys %{$license_files{$distname}};
         say qq{write ${mkname}} unless $quiet;
         open my $fh, q{>}, $mkname;
         say {$fh} qq{################################################################################};
@@ -731,6 +735,13 @@ while (my ($distname, $dist) = each %dist) {
         say {$fh} qq{# retrieved by scancpan from ${mirror}/};
         say {$fh} qq{md5    ${md5} ${filename}};
         say {$fh} qq{sha256 ${sha256} ${filename}};
+        if (scalar keys %{$license_files{$distname}}) {
+            say {$fh} q{};
+            say {$fh} qq{# computed by scancpan};
+            while (my ($license, $digest) = each %{$license_files{$distname}}) {
+                say {$fh} qq{sha256 ${digest} ${license}};
+            }
+        }
         close $fh;
     }
 }
@@ -819,7 +830,6 @@ Perl/CPAN distributions required by the specified distnames. The
 dependencies and metadata are fetched from https://metacpan.org/.
 
 After running this script, it is necessary to check the generated files.
-You have to manually add the license files (PERL_FOO_LICENSE_FILES variable).
 For distributions that link against a target library, you have to add the
 buildroot package name for that library to the DEPENDENCIES variable.
 
@@ -831,7 +841,7 @@ in order to work with the right CoreList data.
 
 =head1 LICENSE
 
-Copyright (C) 2013-2017 by Francois Perrad <francois.perrad@gadz.org>
+Copyright (C) 2013-2018 by Francois Perrad <francois.perrad@gadz.org>
 
 This program is free software; you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
-- 
2.17.0
