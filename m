From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 31 Mar 2019 14:01:36 +0200
Subject: [Buildroot] [git commit] utils/scancpan: add a check of XS
 dependencies in generated test
Message-ID: <20190331115901.00C9A8A539@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f4a30ae5bd06357b1c1cab96a8d3708896451dea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The XS modules have a high propability to fail (compared to Pure Perl modules),
so it is valuable to check XS dependencies before the check of the main module.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 utils/scancpan | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/utils/scancpan b/utils/scancpan
index 8073ad1978..0e7585e312 100755
--- a/utils/scancpan
+++ b/utils/scancpan
@@ -845,6 +845,14 @@ while (my ($distname, $dist) = each %dist) {
         say {$fh} qq{};
         say {$fh} qq{    def test_run(self):};
         say {$fh} qq{        self.login()};
+        foreach my $dep (sort grep { $is_xs{$_} } @indirect) {
+            $dep =~ s|-|::|g;
+            say {$fh} qq{        self.module_test("${dep}")};
+        }
+        foreach my $dep (sort grep { $is_xs{$_} } @{$deps_runtime{$distname}}) {
+            $dep =~ s|-|::|g;
+            say {$fh} qq{        self.module_test("${dep}")};
+        }
         say {$fh} qq{        self.module_test("${modname}")};
         close $fh;
     }
