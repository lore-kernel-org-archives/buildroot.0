From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 17 Aug 2019 19:18:23 +0200
Subject: [Buildroot] [PATCH 2/9] support/graph-size: introduce main()
In-Reply-To: <cover.1566062299.git.yann.morin.1998@free.fr>
References: <cover.1566062299.git.yann.morin.1998@free.fr>
Message-ID: <ca5aa7b73b279954e7039c07b46ea124171caecb.1566062299.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It is nicer overall to have a main() function, like all our other
scripts tend to have too.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 support/scripts/size-stats | 45 +++++++++++++++++++++-----------------
 1 file changed, 25 insertions(+), 20 deletions(-)

diff --git a/support/scripts/size-stats b/support/scripts/size-stats
index 8dfa391e24..bd10fbfb68 100755
--- a/support/scripts/size-stats
+++ b/support/scripts/size-stats
@@ -216,27 +216,32 @@ def gen_packages_csv(pkgsizes, outputf):
             wr.writerow([pkg, size, "%.1f" % (float(size) / total * 100)])
 
 
-parser = argparse.ArgumentParser(description='Draw size statistics graphs')
+def main():
+    parser = argparse.ArgumentParser(description='Draw size statistics graphs')
 
-parser.add_argument("--builddir", '-i', metavar="BUILDDIR", required=True,
-                    help="Buildroot output directory")
-parser.add_argument("--graph", '-g', metavar="GRAPH",
-                    help="Graph output file (.pdf or .png extension)")
-parser.add_argument("--file-size-csv", '-f', metavar="FILE_SIZE_CSV",
-                    help="CSV output file with file size statistics")
-parser.add_argument("--package-size-csv", '-p', metavar="PKG_SIZE_CSV",
-                    help="CSV output file with package size statistics")
-args = parser.parse_args()
+    parser.add_argument("--builddir", '-i', metavar="BUILDDIR", required=True,
+                        help="Buildroot output directory")
+    parser.add_argument("--graph", '-g', metavar="GRAPH",
+                        help="Graph output file (.pdf or .png extension)")
+    parser.add_argument("--file-size-csv", '-f', metavar="FILE_SIZE_CSV",
+                        help="CSV output file with file size statistics")
+    parser.add_argument("--package-size-csv", '-p', metavar="PKG_SIZE_CSV",
+                        help="CSV output file with package size statistics")
+    args = parser.parse_args()
 
-# Find out which package installed what files
-pkgdict = build_package_dict(args.builddir)
+    # Find out which package installed what files
+    pkgdict = build_package_dict(args.builddir)
 
-# Collect the size installed by each package
-pkgsize = build_package_size(pkgdict, args.builddir)
+    # Collect the size installed by each package
+    pkgsize = build_package_size(pkgdict, args.builddir)
 
-if args.graph:
-    draw_graph(pkgsize, args.graph)
-if args.file_size_csv:
-    gen_files_csv(pkgdict, pkgsize, args.file_size_csv)
-if args.package_size_csv:
-    gen_packages_csv(pkgsize, args.package_size_csv)
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
-- 
2.20.1
