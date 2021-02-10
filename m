From: Daniel Crowe <daniel.crowe@resolution.systems>
Date: Wed, 10 Feb 2021 21:35:18 +1030
Subject: [Buildroot] [PATCH 1/1] support/scripts/size-stats: increase number
 of files that can be linked to a source
Message-ID: <20210210110518.24817-1-daniel.crowe@resolution.systems>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Daniel Crowe <daniel.crowe@resolution.systems>
---
 Makefile                   |  1 +
 support/scripts/size-stats | 76 +++++++++++++++++++++++++++-----------
 2 files changed, 56 insertions(+), 21 deletions(-)

diff --git a/Makefile b/Makefile
index 14e10223ed..495b5df1ac 100644
--- a/Makefile
+++ b/Makefile
@@ -912,6 +912,7 @@ graph-depends: graph-depends-requirements
 graph-size:
 	$(Q)mkdir -p $(GRAPHS_DIR)
 	$(Q)$(TOPDIR)/support/scripts/size-stats --builddir $(BASE_DIR) \
+		--overlay $(BR2_ROOTFS_OVERLAY) \
 		--graph $(GRAPHS_DIR)/graph-size.$(BR_GRAPH_OUT) \
 		--file-size-csv $(GRAPHS_DIR)/file-size-stats.csv \
 		--package-size-csv $(GRAPHS_DIR)/package-size-stats.csv \
diff --git a/support/scripts/size-stats b/support/scripts/size-stats
index dea3a6007c..e502069208 100755
--- a/support/scripts/size-stats
+++ b/support/scripts/size-stats
@@ -70,8 +70,12 @@ def add_file(filesdict, relpath, abspath, pkg):
 #
 # builddir: path to the Buildroot output directory
 #
-def build_package_dict(builddir):
+# overlays: list of paths to the rootfs overlays
+#
+def build_package_dict(builddir, overlays):
     filesdict = {}
+
+    # populate from packages-file-list.txt
     with open(os.path.join(builddir, "build", "packages-file-list.txt")) as f:
         for l in f.readlines():
             pkg, fpath = l.split(",", 1)
@@ -79,26 +83,36 @@ def build_package_dict(builddir):
             fpath = fpath.strip()[2:]
             fullpath = os.path.join(builddir, "target", fpath)
             add_file(filesdict, fpath, fullpath, pkg)
+
+            # account for python file compilation
+            if fpath.endswith('.py'):
+                add_file(filesdict, fpath + 'c', fullpath + 'c', pkg)
+
+    # populate files from overlays
+    for overlay in overlays:
+        build_package_dict_from_dir(filesdict, overlay, os.path.join(builddir, "..", overlay))
+
+    # populate any files left over
+    build_package_dict_from_dir(filesdict, "unknown", os.path.join(builddir, "target"))
+
     return filesdict
 
 
 #
-# This function builds a dictionary that contains the name of a
-# package as key, and the size of the files installed by this package
-# as the value.
+# This function walks 'dir' and adds each file found to 'filesdict'.
 #
-# filesdict: dictionary with the name of the files as key, and as
-# value a tuple containing the name of the package to which the files
-# belongs, and the size of the file. As returned by
-# build_package_dict.
+# filesdict: a dict where each key is the path of a file in
+# the root filesystem, and the value is a tuple containing two
+# elements: the name of the package to which this file belongs and the
+# size of the file.
 #
-# builddir: path to the Buildroot output directory
+# pkg: name of the pkg for each file found
 #
-def build_package_size(filesdict, builddir):
-    pkgsize = collections.defaultdict(int)
-
+# dir: path to the directory to walk
+#
+def build_package_dict_from_dir(filesdict, pkg, dir):
     seeninodes = set()
-    for root, _, files in os.walk(os.path.join(builddir, "target")):
+    for root, _, files in os.walk(dir):
         for f in files:
             fpath = os.path.join(root, f)
             if os.path.islink(fpath):
@@ -111,14 +125,31 @@ def build_package_size(filesdict, builddir):
             else:
                 seeninodes.add(st.st_ino)
 
-            frelpath = os.path.relpath(fpath, os.path.join(builddir, "target"))
-            if frelpath not in filesdict:
+            frelpath = os.path.relpath(fpath, dir)
+            if frelpath in filesdict:
+                continue
+
+            if pkg == "unknown":
                 print("WARNING: %s is not part of any package" % frelpath)
-                pkg = "unknown"
-            else:
-                pkg = filesdict[frelpath][0]
 
-            pkgsize[pkg] += st.st_size
+            add_file(filesdict, frelpath, fpath, pkg)
+
+
+#
+# This function builds a dictionary that contains the name of a
+# package as key, and the size of the files installed by this package
+# as the value.
+#
+# filesdict: dictionary with the name of the files as key, and as
+# value a tuple containing the name of the package to which the files
+# belongs, and the size of the file. As returned by
+# build_package_dict.
+#
+def build_package_size(filesdict):
+    pkgsize = collections.defaultdict(int)
+
+    for pkg, size in filesdict.values():
+        pkgsize[pkg] += size
 
     return pkgsize
 
@@ -265,6 +296,8 @@ def main():
 
     parser.add_argument("--builddir", '-i', metavar="BUILDDIR", required=True,
                         help="Buildroot output directory")
+    parser.add_argument("--overlay", '-o', metavar="OVERLAYS", nargs="*",
+                        help="rootfs overlay directories")
     parser.add_argument("--graph", '-g', metavar="GRAPH",
                         help="Graph output file (.pdf or .png extension)")
     parser.add_argument("--file-size-csv", '-f', metavar="FILE_SIZE_CSV",
@@ -291,10 +324,11 @@ def main():
         Config.size_limit = args.size_limit
 
     # Find out which package installed what files
-    pkgdict = build_package_dict(args.builddir)
+    overlays = [path for paths in args.overlay for path in paths.split(" ")]
+    pkgdict = build_package_dict(args.builddir, overlays)
 
     # Collect the size installed by each package
-    pkgsize = build_package_size(pkgdict, args.builddir)
+    pkgsize = build_package_size(pkgdict)
 
     if args.graph:
         draw_graph(pkgsize, args.graph)
-- 
2.17.1
