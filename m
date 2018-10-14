From: Francois Perrad <fperrad@gmail.com>
Date: Sun, 14 Oct 2018 18:35:02 +0200
Subject: [Buildroot] [PATCH 1/3] scancpan: compute a variable
 <pkg>_PATCH_XS_MAKEFILES
In-Reply-To: <20181014163504.28519-1-francois.perrad@gadz.org>
References: <20181014163504.28519-1-francois.perrad@gadz.org>
Message-ID: <20181014163504.28519-2-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

this variables contains a list of Makefile which must be patched

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 utils/scancpan | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/utils/scancpan b/utils/scancpan
index 01f3abdc8..89334e589 100755
--- a/utils/scancpan
+++ b/utils/scancpan
@@ -524,6 +524,7 @@ my %deps_runtime;       # name -> list of target dependencies
 my %deps_optional;      # name -> list of optional target dependencies
 my %license_files;      # name -> hash of license files
 my %checksum;           # author -> list of checksum
+my %subdir_makefiles;   # name -> list of Makefile in subdirectories
 my $mirror = 'http://cpan.metacpan.org';        # a CPAN mirror
 my $mcpan = MetaCPAN::API::Tiny->new(base_url => 'http://fastapi.metacpan.org/v1');
 my $ua = HTTP::Tiny->new();
@@ -559,6 +560,17 @@ sub is_xs {
     return $manifest =~ m/\.(swg|xs|c|h|i)[\n\s]/;
 }
 
+sub find_subdir_makefiles {
+    my ($manifest) = @_;
+    my @makefiles = ();
+    foreach (split /\n/, $manifest) {
+        next if m|^Makefile\.PL|;
+        s|\.PL$||;
+        push @makefiles, $_ if m|Makefile$|;
+    }
+    return \@makefiles;
+}
+
 sub find_license_files {
     my ($manifest) = @_;
     my @license_files;
@@ -586,6 +598,7 @@ sub fetch {
             my $release = $name . q{-} . $result->{version};
             my $manifest = $mcpan->source( author => $author, release => $release, path => 'MANIFEST' );
             $need_dlopen{$name} = is_xs( $manifest );
+            $subdir_makefiles{$name} = find_subdir_makefiles( $manifest );
             foreach my $fname (find_license_files( $manifest )) {
                 my $license = $mcpan->source( author => $author, release => $release, path => $fname );
                 $license_files{$name}->{$fname} = sha256_hex( $license );
@@ -732,6 +745,7 @@ while (my ($distname, $dist) = each %dist) {
             push @info, qq{[$distname] undefined LICENSE, see $license_files};
             $license = q{???};
         }
+        my $subdir_makefiles = join q{ }, sort @{$subdir_makefiles{$distname}};
         say qq{write ${mkname}} unless $quiet;
         open my $fh, q{>}, $mkname;
         say {$fh} qq{################################################################################};
@@ -747,6 +761,7 @@ while (my ($distname, $dist) = each %dist) {
         say {$fh} qq{HOST_${brname}_DEPENDENCIES = ${host_dependencies}} if $need_host{$distname} && $host_dependencies;
         say {$fh} qq{${brname}_LICENSE = ${license}} if $license;
         say {$fh} qq{${brname}_LICENSE_FILES = ${license_files}} if $license_files;
+        say {$fh} qq{${brname}_PATCH_XS_MAKEFILES = ${subdir_makefiles}} if $subdir_makefiles;
         say {$fh} qq{};
         foreach (sort @{$deps_optional{$distname}}) {
             next if grep { $_ eq $distname; } @{$deps_runtime{$_}};     # avoid cyclic dependencies
-- 
2.17.1
