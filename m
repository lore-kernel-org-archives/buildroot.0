From: Francois Perrad <fperrad@gmail.com>
Date: Fri, 29 Mar 2019 19:05:24 +0100
Subject: [Buildroot] [PATCH 1/2] utils/scancpan: add a check of XS
 dependencies in generated test
Message-ID: <20190329180525.17320-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The XS modules have a high propability to fail (compared to Pure Perl modules),
so it is valuable to check XS dependencies before the check of the main module.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 utils/scancpan | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/utils/scancpan b/utils/scancpan
index 8073ad197..0e7585e31 100755
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
-- 
2.17.1
