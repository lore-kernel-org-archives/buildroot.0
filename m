From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 26 Aug 2019 22:50:05 +0200
Subject: [Buildroot] [git commit branch/next] support/graph-size: add option
 to sort packages in reverse size order
Message-ID: <20190826204924.7FD81846E5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=33c1ef88f8f851da0e2b68363adde6673cfb3d96
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Currently, the packages are sorted smallest first, and biggest last
(with unknown and others second-to-last and last, resp.).

Add an option to invert the ordering (but keeping unknown and others at
their current positions).

This has the nice side effect that we can now control the colours
assigned to the biggest package(s), as the colours are cycled from the
first to the last. Currently, the biggest packages gets a redish colour,
which is appropriate, but the second gets a greenish one, which is not
as appropriate (but changing that can come later).

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 docs/manual/common-usage.txt | 3 +++
 support/scripts/size-stats   | 8 +++++++-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/docs/manual/common-usage.txt b/docs/manual/common-usage.txt
index 7af8d54a64..d9f086234c 100644
--- a/docs/manual/common-usage.txt
+++ b/docs/manual/common-usage.txt
@@ -329,6 +329,9 @@ to further control the generated graph. Accepted options are:
 * `--iec`, `--binary`, `--si`, `--decimal`, to use IEC (binary, powers
   of 1024) or SI (decimal, powers of 1000; the default) prefixes.
 
+* `--biggest-first`, to sort packages in decreasing size order, rather
+  than in increasing size order.
+
 .Note
 The collected filesystem size data is only meaningful after a complete
 clean rebuild. Be sure to run +make clean all+ before using +make
diff --git a/support/scripts/size-stats b/support/scripts/size-stats
index 040f4017f8..996c0d660e 100755
--- a/support/scripts/size-stats
+++ b/support/scripts/size-stats
@@ -35,6 +35,7 @@ except ImportError:
 
 
 class Config:
+    biggest_first = False
     iec = False
     size_limit = 0.01
     colors = ['#e60004', '#009836', '#2e1d86', '#ffed00',
@@ -152,7 +153,8 @@ def draw_graph(pkgsize, outputf):
     values = []
     other_value = 0
     unknown_value = 0
-    for (p, sz) in sorted(pkgsize.items(), key=lambda x: x[1]):
+    for (p, sz) in sorted(pkgsize.items(), key=lambda x: x[1],
+                          reverse=Config.biggest_first):
         if sz < (total * Config.size_limit):
             other_value += sz
         elif p == "unknown":
@@ -269,6 +271,9 @@ def main():
                         help="CSV output file with file size statistics")
     parser.add_argument("--package-size-csv", '-p', metavar="PKG_SIZE_CSV",
                         help="CSV output file with package size statistics")
+    parser.add_argument("--biggest-first", action='store_true',
+                        help="Sort packages in decreasing size order, " +
+                             "rather than in increasing size order")
     parser.add_argument("--iec", "--binary", "--si", "--decimal",
                         action=PrefixAction,
                         help="Use IEC (binary, powers of 1024) or SI (decimal, "
@@ -278,6 +283,7 @@ def main():
                              'the generic "Other" package. Default: 0.01 (1%%)')
     args = parser.parse_args()
 
+    Config.biggest_first = args.biggest_first
     Config.iec = args.iec
     if args.size_limit is not None:
         if args.size_limit < 0.0 or args.size_limit > 1.0:
