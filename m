From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 9 Jun 2019 23:37:04 +0200
Subject: [Buildroot] [git commit] utils/scancpan: fix test file creation on
 br-external
Message-ID: <20190609213827.7A2218E03E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=280149ce60774aab6a75e3f257185b0d6d2b144e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

first, add the creation of the needed subdirectories

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 utils/scancpan | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/utils/scancpan b/utils/scancpan
index 0e7585e312..1fccc980af 100755
--- a/utils/scancpan
+++ b/utils/scancpan
@@ -479,6 +479,7 @@ use Fatal qw(open close);
 use Getopt::Long;
 use Pod::Usage;
 use File::Basename;
+use File::Path qw(make_path);
 use Module::CoreList;
 use HTTP::Tiny;
 use Safe;
@@ -715,9 +716,10 @@ while (my ($distname, $dist) = each %dist) {
     my $mkname = $dirname . q{/} . $fsname . q{.mk};
     my $hashname = $dirname . q{/} . $fsname . q{.hash};
     my $brname = brname( $fsname );
-    my $testname = q{support/testing/tests/package/test_} . lc $brname . q{.py};
+    my $testdir = q{support/testing/tests/package};
+    my $testname = $testdir . q{/test_} . lc $brname . q{.py};
     unless (-d $dirname) {
-        mkdir $dirname;
+        make_path $dirname;
         $new_pkgs = 1;
     }
     if ($need_target{$distname} && ($force || !-f $cfgname)) {
@@ -815,6 +817,7 @@ while (my ($distname, $dist) = each %dist) {
         my $mark = $is_xs{$distname} ? q{   XS} : q{};
         my @indirect = (get_indirect_dependencies( $distname ));
         say qq{write ${testname}} unless $quiet;
+        make_path $testdir unless -d $testdir;
         open my $fh, q{>}, $testname;
         say {$fh} qq{from tests.package.test_perl import TestPerlBase};
         say {$fh} qq{};
