From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 26 Aug 2019 22:08:01 +0200
Subject: [Buildroot] [git commit] support/graph-size: introduce main()
Message-ID: <20190903133621.B274A8A5E7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a2d20ca6132556af87837e25f7c3d58a1c2f091e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It is nicer overall to have a main() function, like all our other
scripts tend to have too.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 support/scripts/size-stats | 53 +++++++++++++++++++++++++---------------------
 1 file changed, 29 insertions(+), 24 deletions(-)

diff --git a/support/scripts/size-stats b/support/scripts/size-stats
index 8dfa391e24..bd10fbfb68 100755
--- a/support/scripts/size-stats
+++ b/support/scripts/size-stats
@@ -216,27 +216,32 @@ def gen_packages_csv(pkgsizes, outputf):
             wr.writerow([pkg, size, "%.1f" % (float(size) / total * 100)])
 
 
-parser = argparse.ArgumentParser(description='Draw size statistics graphs')
-
-parser.add_argument("--builddir", '-i', metavar="BUILDDIR", required=True,
-                    help="Buildroot output directory")
-parser.add_argument("--graph", '-g', metavar="GRAPH",
-                    help="Graph output file (.pdf or .png extension)")
-parser.add_argument("--file-size-csv", '-f', metavar="FILE_SIZE_CSV",
-                    help="CSV output file with file size statistics")
-parser.add_argument("--package-size-csv", '-p', metavar="PKG_SIZE_CSV",
-                    help="CSV output file with package size statistics")
-args = parser.parse_args()
-
-# Find out which package installed what files
-pkgdict = build_package_dict(args.builddir)
-
-# Collect the size installed by each package
-pkgsize = build_package_size(pkgdict, args.builddir)
-
-if args.graph:
-    draw_graph(pkgsize, args.graph)
-if args.file_size_csv:
-    gen_files_csv(pkgdict, pkgsize, args.file_size_csv)
-if args.package_size_csv:
-    gen_packages_csv(pkgsize, args.package_size_csv)
+def main():
+    parser = argparse.ArgumentParser(description='Draw size statistics graphs')
+
+    parser.add_argument("--builddir", '-i', metavar="BUILDDIR", required=True,
+                        help="Buildroot output directory")
+    parser.add_argument("--graph", '-g', metavar="GRAPH",
+                        help="Graph output file (.pdf or .png extension)")
+    parser.add_argument("--file-size-csv", '-f', metavar="FILE_SIZE_CSV",
+                        help="CSV output file with file size statistics")
+    parser.add_argument("--package-size-csv", '-p', metavar="PKG_SIZE_CSV",
+                        help="CSV output file with package size statistics")
+    args = parser.parse_args()
+
+    # Find out which package installed what files
+    pkgdict = build_package_dict(args.builddir)
+
+    # Collect the size installed by each package
+    pkgsize = build_package_size(pkgdict, args.builddir)
+
+    if args.graph:
+        draw_graph(pkgsize, args.graph)
+    if args.file_size_csv:
+        gen_files_csv(pkgdict, pkgsize, args.file_size_csv)
+    if args.package_size_csv:
+        gen_packages_csv(pkgsize, args.package_size_csv)
+
+
+if __name__ == "__main__":
+    main()
