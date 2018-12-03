From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 3 Dec 2018 20:49:24 +0100
Subject: [Buildroot] [git commit] utils/scancpan: add generation of test
Message-ID: <20181203194907.3D3747FF69@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=65a42f26c8c0e571fcbe05838a68eb1f729f8d53
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit extends the scancpan script to automatically generate a
test for the Perl module, either if the Perl module uses native
library, or if it has more than one dependency.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 utils/scancpan | 67 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/utils/scancpan b/utils/scancpan
index aa0b63a19d..080e4b3562 100755
--- a/utils/scancpan
+++ b/utils/scancpan
@@ -575,6 +575,32 @@ sub find_license_files {
     return @license_files;
 }
 
+sub want_test {
+    my ($distname) = @_;
+    return 1 if $need_dlopen{$distname} && scalar @{$deps_runtime{$distname}} > 1;
+}
+
+sub get_dependencies {
+    my ($distname) = @_;
+    my %dep = map { $_ => 1 } @{$deps_runtime{$distname}};
+    for my $direct (@{$deps_runtime{$distname}}) {
+        for (get_dependencies( $direct )) {
+            $dep{$_} = 1;
+        }
+    }
+    return keys %dep;
+}
+
+sub get_indirect_dependencies {
+    my ($distname) = @_;
+    my %indirect;
+    my %direct = map { $_ => 1 } @{$deps_runtime{$distname}};
+    for my $dep (get_dependencies( $distname )) {
+        $indirect{$dep} = 1 unless exists $direct{$dep};
+    }
+    return keys %indirect;
+}
+
 sub fetch {
     my ($name, $need_target, $need_host, $top) = @_;
     $need_target{$name} = $need_target if $need_target;
@@ -688,6 +714,7 @@ while (my ($distname, $dist) = each %dist) {
     my $mkname = $dirname . q{/} . $fsname . q{.mk};
     my $hashname = $dirname . q{/} . $fsname . q{.hash};
     my $brname = brname( $fsname );
+    my $testname = q{support/testing/tests/package/test_} . lc $brname . q{.py};
     unless (-d $dirname) {
         mkdir $dirname;
         $new_pkgs = 1;
@@ -779,6 +806,46 @@ while (my ($distname, $dist) = each %dist) {
         }
         close $fh;
     }
+    if (want_test( $distname ) && ($force || !-f $testname)) {
+        my $classname = $distname;
+        $classname =~ s|-||g;
+        my $modname = $distname;
+        $modname =~ s|-|::|g;
+        my @indirect = (get_indirect_dependencies( $distname ));
+        say qq{write ${testname}} unless $quiet;
+        open my $fh, q{>}, $testname;
+        say {$fh} qq{from tests.package.test_perl import TestPerlBase};
+        say {$fh} qq{};
+        say {$fh} qq{};
+        say {$fh} qq{class TestPerl${classname}(TestPerlBase):};
+        say {$fh} qq{    """};
+        say {$fh} qq{    package:};
+        say {$fh} qq{        ${distname}};
+        say {$fh} qq{    direct dependencies:};
+        foreach my $dep (sort @{$deps_runtime{$distname}}) {
+            my $mark = want_test( $dep ) ? q{ *} : q{};
+            say {$fh} qq{        ${dep}${mark}};
+        }
+        if (scalar @indirect > 0) {
+            say {$fh} qq{    indirect dependencies:};
+            foreach my $dep (sort @indirect) {
+                my $mark = want_test( $dep ) ? q{ *} : q{};
+                say {$fh} qq{        ${dep}${mark}};
+            }
+        }
+        say {$fh} qq{    """};
+        say {$fh} qq{};
+        say {$fh} qq{    config = TestPerlBase.config + \\};
+        say {$fh} qq{        """};
+        say {$fh} qq{        BR2_PACKAGE_PERL=y};
+        say {$fh} qq{        BR2_PACKAGE_${brname}=y};
+        say {$fh} qq{        """};
+        say {$fh} qq{};
+        say {$fh} qq{    def test_run(self):};
+        say {$fh} qq{        self.login()};
+        say {$fh} qq{        self.module_test("${modname}")};
+        close $fh;
+    }
 }
 
 if ($new_pkgs) {
