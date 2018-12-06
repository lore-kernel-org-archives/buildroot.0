From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 6 Dec 2018 22:19:48 +0100
Subject: [Buildroot] [git commit] utils/scancpan: mark XS modules in
 docstring of test
Message-ID: <20181206212822.DFA9386DB9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1b9f4addbc62b34601a12f0daad51280c9321bd3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 utils/scancpan | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/utils/scancpan b/utils/scancpan
index 080e4b3562..6592afc2fd 100755
--- a/utils/scancpan
+++ b/utils/scancpan
@@ -519,6 +519,7 @@ my %dist;               # name -> metacpan data
 my %need_target;        # name -> 1 if target package is needed
 my %need_host;          # name -> 1 if host package is needed
 my %need_dlopen;        # name -> 1 if requires dynamic library
+my %is_xs;              # name -> 1 if XS module
 my %deps_build;         # name -> list of host dependencies
 my %deps_runtime;       # name -> list of target dependencies
 my %license_files;      # name -> hash of license files
@@ -614,7 +615,7 @@ sub fetch {
             my $author = $result->{author};
             my $release = $name . q{-} . $result->{version};
             my $manifest = $mcpan->source( author => $author, release => $release, path => 'MANIFEST' );
-            $need_dlopen{$name} = is_xs( $manifest );
+            $need_dlopen{$name} = $is_xs{$name} = is_xs( $manifest );
             foreach my $fname (find_license_files( $manifest )) {
                 my $license = $mcpan->source( author => $author, release => $release, path => $fname );
                 $license_files{$name}->{$fname} = sha256_hex( $license );
@@ -811,6 +812,7 @@ while (my ($distname, $dist) = each %dist) {
         $classname =~ s|-||g;
         my $modname = $distname;
         $modname =~ s|-|::|g;
+        my $mark = $is_xs{$distname} ? q{   XS} : q{};
         my @indirect = (get_indirect_dependencies( $distname ));
         say qq{write ${testname}} unless $quiet;
         open my $fh, q{>}, $testname;
@@ -820,16 +822,16 @@ while (my ($distname, $dist) = each %dist) {
         say {$fh} qq{class TestPerl${classname}(TestPerlBase):};
         say {$fh} qq{    """};
         say {$fh} qq{    package:};
-        say {$fh} qq{        ${distname}};
+        say {$fh} qq{        ${distname}${mark}};
         say {$fh} qq{    direct dependencies:};
         foreach my $dep (sort @{$deps_runtime{$distname}}) {
-            my $mark = want_test( $dep ) ? q{ *} : q{};
+            $mark = $is_xs{$dep} ? q{   XS} : q{};
             say {$fh} qq{        ${dep}${mark}};
         }
         if (scalar @indirect > 0) {
             say {$fh} qq{    indirect dependencies:};
             foreach my $dep (sort @indirect) {
-                my $mark = want_test( $dep ) ? q{ *} : q{};
+                $mark = $is_xs{$dep} ? q{   XS} : q{};
                 say {$fh} qq{        ${dep}${mark}};
             }
         }
