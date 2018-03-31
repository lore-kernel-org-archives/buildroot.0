From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 31 Mar 2018 18:35:39 +0200
Subject: [Buildroot] [PATCH v2 1/5] support/scripts/graph-depends: remove
 global code and most global variables
In-Reply-To: <20180331163543.6278-1-thomas.petazzoni@bootlin.com>
References: <20180331163543.6278-1-thomas.petazzoni@bootlin.com>
Message-ID: <20180331163543.6278-2-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The graph-depends script had no main() function, and the main code was
actually spread between the function definitions, which was a real
mess.

This commit moves the global code into a main() function, which allows
to more easily follow the flow of the script. The argument parsing
code is moved into a parse_args() function.

Most of the global variables are removed, and are instead passed as
argument when appropriate. This has the side-effect that the
print_pkg_deps() function takes a lot of argument, but this is
considered better than tons of global variables.

The global variables that are removed are: max_depth, transitive,
mode, root_colour, target_colour, host_colour, outfile, dict_deps,
dict_version, stop_list, exclude_list, arrow_dir.

The root_colour/target_colour/host_colour variables are entirely
removed, and instead a single colours array is passed, and it's the
function using the colors that actually uses the different entries in
the array.

The way the print_attrs() function determines if we're display the
root node is not is changed. Instead of relying on the package name
and the mode (which requires passing the root package name, and the
mode), it relies on the depth: when the depth is 0, we're at the root
node.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/graph-depends | 289 +++++++++++++++++++++---------------------
 1 file changed, 144 insertions(+), 145 deletions(-)

diff --git a/support/scripts/graph-depends b/support/scripts/graph-depends
index 85c9bf0a4f..d86d506f6f 100755
--- a/support/scripts/graph-depends
+++ b/support/scripts/graph-depends
@@ -31,96 +31,6 @@ import brpkgutil
 # Modes of operation:
 MODE_FULL = 1   # draw full dependency graph for all selected packages
 MODE_PKG = 2    # draw dependency graph for a given package
-mode = 0
-
-# Limit drawing the dependency graph to this depth. 0 means 'no limit'.
-max_depth = 0
-
-# Whether to draw the transitive dependencies
-transitive = True
-
-parser = argparse.ArgumentParser(description="Graph packages dependencies")
-parser.add_argument("--check-only", "-C", dest="check_only", action="store_true", default=False,
-                    help="Only do the dependency checks (circular deps...)")
-parser.add_argument("--outfile", "-o", metavar="OUT_FILE", dest="outfile",
-                    help="File in which to generate the dot representation")
-parser.add_argument("--package", '-p', metavar="PACKAGE",
-                    help="Graph the dependencies of PACKAGE")
-parser.add_argument("--depth", '-d', metavar="DEPTH", dest="depth", type=int, default=0,
-                    help="Limit the dependency graph to DEPTH levels; 0 means no limit.")
-parser.add_argument("--stop-on", "-s", metavar="PACKAGE", dest="stop_list", action="append",
-                    help="Do not graph past this package (can be given multiple times)." +
-                         " Can be a package name or a glob, " +
-                         " 'virtual' to stop on virtual packages, or " +
-                         "'host' to stop on host packages.")
-parser.add_argument("--exclude", "-x", metavar="PACKAGE", dest="exclude_list", action="append",
-                    help="Like --stop-on, but do not add PACKAGE to the graph.")
-parser.add_argument("--colours", "-c", metavar="COLOR_LIST", dest="colours",
-                    default="lightblue,grey,gainsboro",
-                    help="Comma-separated list of the three colours to use" +
-                         " to draw the top-level package, the target" +
-                         " packages, and the host packages, in this order." +
-                         " Defaults to: 'lightblue,grey,gainsboro'")
-parser.add_argument("--transitive", dest="transitive", action='store_true',
-                    default=False)
-parser.add_argument("--no-transitive", dest="transitive", action='store_false',
-                    help="Draw (do not draw) transitive dependencies")
-parser.add_argument("--direct", dest="direct", action='store_true', default=True,
-                    help="Draw direct dependencies (the default)")
-parser.add_argument("--reverse", dest="direct", action='store_false',
-                    help="Draw reverse dependencies")
-args = parser.parse_args()
-
-check_only = args.check_only
-
-if args.outfile is None:
-    outfile = sys.stdout
-else:
-    if check_only:
-        sys.stderr.write("don't specify outfile and check-only at the same time\n")
-        sys.exit(1)
-    outfile = open(args.outfile, "w")
-
-if args.package is None:
-    mode = MODE_FULL
-else:
-    mode = MODE_PKG
-    rootpkg = args.package
-
-max_depth = args.depth
-
-if args.stop_list is None:
-    stop_list = []
-else:
-    stop_list = args.stop_list
-
-if args.exclude_list is None:
-    exclude_list = []
-else:
-    exclude_list = args.exclude_list
-
-transitive = args.transitive
-
-if args.direct:
-    get_depends_func = brpkgutil.get_depends
-    arrow_dir = "forward"
-else:
-    if mode == MODE_FULL:
-        sys.stderr.write("--reverse needs a package\n")
-        sys.exit(1)
-    get_depends_func = brpkgutil.get_rdepends
-    arrow_dir = "back"
-
-# Get the colours: we need exactly three colours,
-# so no need not split more than 4
-# We'll let 'dot' validate the colours...
-colours = args.colours.split(',', 4)
-if len(colours) != 3:
-    sys.stderr.write("Error: incorrect colour list '%s'\n" % args.colours)
-    sys.exit(1)
-root_colour = colours[0]
-target_colour = colours[1]
-host_colour = colours[2]
 
 allpkgs = []
 
@@ -145,7 +55,7 @@ def get_targets():
 # 'dependencies', which contains tuples of the form (pkg1 ->
 # pkg2_on_which_pkg1_depends, pkg3 -> pkg4_on_which_pkg3_depends) and
 # the function finally returns this list.
-def get_all_depends(pkgs):
+def get_all_depends(pkgs, get_depends_func):
     dependencies = []
 
     # Filter the packages for which we already have the dependencies
@@ -175,7 +85,7 @@ def get_all_depends(pkgs):
             deps.add(dep)
 
     if len(deps) != 0:
-        newdeps = get_all_depends(deps)
+        newdeps = get_all_depends(deps, get_depends_func)
         if newdeps is not None:
             dependencies += newdeps
 
@@ -193,35 +103,6 @@ TARGET_EXCEPTIONS = [
     "target-post-image",
 ]
 
-# In full mode, start with the result of get_targets() to get the main
-# targets and then use get_all_depends() for all targets
-if mode == MODE_FULL:
-    targets = get_targets()
-    dependencies = []
-    allpkgs.append('all')
-    filtered_targets = []
-    for tg in targets:
-        # Skip uninteresting targets
-        if tg in TARGET_EXCEPTIONS:
-            continue
-        dependencies.append(('all', tg))
-        filtered_targets.append(tg)
-    deps = get_all_depends(filtered_targets)
-    if deps is not None:
-        dependencies += deps
-    rootpkg = 'all'
-
-# In pkg mode, start directly with get_all_depends() on the requested
-# package
-elif mode == MODE_PKG:
-    dependencies = get_all_depends([rootpkg])
-
-# Make the dependencies a dictionnary { 'pkg':[dep1, dep2, ...] }
-dict_deps = {}
-for dep in dependencies:
-    if dep[0] not in dict_deps:
-        dict_deps[dep[0]] = []
-    dict_deps[dep[0]].append(dep[1])
 
 # Basic cache for the results of the is_dep() function, in order to
 # optimize the execution time. The cache is a dict of dict of boolean
@@ -328,7 +209,7 @@ def check_circular_deps(deps):
 
 # This functions trims down the dependency list of all packages.
 # It applies in sequence all the dependency-elimination methods.
-def remove_extra_deps(deps):
+def remove_extra_deps(deps, transitive):
     for pkg in list(deps.keys()):
         if not pkg == 'all':
             deps[pkg] = remove_mandatory_deps(pkg, deps)
@@ -338,32 +219,22 @@ def remove_extra_deps(deps):
     return deps
 
 
-check_circular_deps(dict_deps)
-if check_only:
-    sys.exit(0)
-
-dict_deps = remove_extra_deps(dict_deps)
-dict_version = brpkgutil.get_version([pkg for pkg in allpkgs
-                                      if pkg != "all" and not pkg.startswith("root")])
-
-
 # Print the attributes of a node: label and fill-color
-def print_attrs(pkg):
+def print_attrs(outfile, pkg, version, depth, colors):
     name = pkg_node_name(pkg)
     if pkg == 'all':
         label = 'ALL'
     else:
         label = pkg
-    if pkg == 'all' or (mode == MODE_PKG and pkg == rootpkg):
-        color = root_colour
+    if depth == 0:
+        color = colors[0]
     else:
         if pkg.startswith('host') \
                 or pkg.startswith('toolchain') \
                 or pkg.startswith('rootfs'):
-            color = host_colour
+            color = colors[2]
         else:
-            color = target_colour
-    version = dict_version.get(pkg)
+            color = colors[1]
     if version == "virtual":
         outfile.write("%s [label = <<I>%s</I>>]\n" % (name, label))
     else:
@@ -371,12 +242,16 @@ def print_attrs(pkg):
     outfile.write("%s [color=%s,style=filled]\n" % (name, color))
 
 
+done_deps = []
+
+
 # Print the dependency graph of a package
-def print_pkg_deps(depth, pkg):
+def print_pkg_deps(outfile, dict_deps, dict_version, stop_list, exclude_list,
+                   arrow_dir, depth, max_depth, pkg, colors):
     if pkg in done_deps:
         return
     done_deps.append(pkg)
-    print_attrs(pkg)
+    print_attrs(outfile, pkg, dict_version.get(pkg), depth, colors)
     if pkg not in dict_deps:
         return
     for p in stop_list:
@@ -401,13 +276,137 @@ def print_pkg_deps(depth, pkg):
                     break
             if add:
                 outfile.write("%s -> %s [dir=%s]\n" % (pkg_node_name(pkg), pkg_node_name(d), arrow_dir))
-                print_pkg_deps(depth + 1, d)
+                print_pkg_deps(outfile, dict_deps, dict_version, stop_list, exclude_list,
+                               arrow_dir, depth + 1, max_depth, d, colors)
+
+
+def parse_args():
+    parser = argparse.ArgumentParser(description="Graph packages dependencies")
+    parser.add_argument("--check-only", "-C", dest="check_only", action="store_true", default=False,
+                        help="Only do the dependency checks (circular deps...)")
+    parser.add_argument("--outfile", "-o", metavar="OUT_FILE", dest="outfile",
+                        help="File in which to generate the dot representation")
+    parser.add_argument("--package", '-p', metavar="PACKAGE",
+                        help="Graph the dependencies of PACKAGE")
+    parser.add_argument("--depth", '-d', metavar="DEPTH", dest="depth", type=int, default=0,
+                        help="Limit the dependency graph to DEPTH levels; 0 means no limit.")
+    parser.add_argument("--stop-on", "-s", metavar="PACKAGE", dest="stop_list", action="append",
+                        help="Do not graph past this package (can be given multiple times)." +
+                        " Can be a package name or a glob, " +
+                        " 'virtual' to stop on virtual packages, or " +
+                        "'host' to stop on host packages.")
+    parser.add_argument("--exclude", "-x", metavar="PACKAGE", dest="exclude_list", action="append",
+                        help="Like --stop-on, but do not add PACKAGE to the graph.")
+    parser.add_argument("--colours", "-c", metavar="COLOR_LIST", dest="colours",
+                        default="lightblue,grey,gainsboro",
+                        help="Comma-separated list of the three colours to use" +
+                        " to draw the top-level package, the target" +
+                        " packages, and the host packages, in this order." +
+                        " Defaults to: 'lightblue,grey,gainsboro'")
+    parser.add_argument("--transitive", dest="transitive", action='store_true',
+                        default=False)
+    parser.add_argument("--no-transitive", dest="transitive", action='store_false',
+                        help="Draw (do not draw) transitive dependencies")
+    parser.add_argument("--direct", dest="direct", action='store_true', default=True,
+                        help="Draw direct dependencies (the default)")
+    parser.add_argument("--reverse", dest="direct", action='store_false',
+                        help="Draw reverse dependencies")
+    return parser.parse_args()
+
+
+def main():
+    args = parse_args()
+
+    check_only = args.check_only
+
+    if args.outfile is None:
+        outfile = sys.stdout
+    else:
+        if check_only:
+            sys.stderr.write("don't specify outfile and check-only at the same time\n")
+            sys.exit(1)
+        outfile = open(args.outfile, "w")
 
+    if args.package is None:
+        mode = MODE_FULL
+    else:
+        mode = MODE_PKG
+        rootpkg = args.package
 
-# Start printing the graph data
-outfile.write("digraph G {\n")
+    if args.stop_list is None:
+        stop_list = []
+    else:
+        stop_list = args.stop_list
+
+    if args.exclude_list is None:
+        exclude_list = []
+    else:
+        exclude_list = args.exclude_list
+
+    if args.direct:
+        get_depends_func = brpkgutil.get_depends
+        arrow_dir = "forward"
+    else:
+        if mode == MODE_FULL:
+            sys.stderr.write("--reverse needs a package\n")
+            sys.exit(1)
+        get_depends_func = brpkgutil.get_rdepends
+        arrow_dir = "back"
+
+    # Get the colours: we need exactly three colours,
+    # so no need not split more than 4
+    # We'll let 'dot' validate the colours...
+    colours = args.colours.split(',', 4)
+    if len(colours) != 3:
+        sys.stderr.write("Error: incorrect colour list '%s'\n" % args.colours)
+        sys.exit(1)
+
+    # In full mode, start with the result of get_targets() to get the main
+    # targets and then use get_all_depends() for all targets
+    if mode == MODE_FULL:
+        targets = get_targets()
+        dependencies = []
+        allpkgs.append('all')
+        filtered_targets = []
+        for tg in targets:
+            # Skip uninteresting targets
+            if tg in TARGET_EXCEPTIONS:
+                continue
+            dependencies.append(('all', tg))
+            filtered_targets.append(tg)
+        deps = get_all_depends(filtered_targets, get_depends_func)
+        if deps is not None:
+            dependencies += deps
+        rootpkg = 'all'
+
+    # In pkg mode, start directly with get_all_depends() on the requested
+    # package
+    elif mode == MODE_PKG:
+        dependencies = get_all_depends([rootpkg], get_depends_func)
+
+    # Make the dependencies a dictionnary { 'pkg':[dep1, dep2, ...] }
+    dict_deps = {}
+    for dep in dependencies:
+        if dep[0] not in dict_deps:
+            dict_deps[dep[0]] = []
+        dict_deps[dep[0]].append(dep[1])
+
+    check_circular_deps(dict_deps)
+    if check_only:
+        sys.exit(0)
+
+    dict_deps = remove_extra_deps(dict_deps, args.transitive)
+    dict_version = brpkgutil.get_version([pkg for pkg in allpkgs
+                                          if pkg != "all" and not pkg.startswith("root")])
+
+    # Start printing the graph data
+    outfile.write("digraph G {\n")
+
+    print_pkg_deps(outfile, dict_deps, dict_version, stop_list, exclude_list,
+                   arrow_dir, 0, args.depth, rootpkg, colours)
+
+    outfile.write("}\n")
 
-done_deps = []
-print_pkg_deps(0, rootpkg)
 
-outfile.write("}\n")
+if __name__ == "__main__":
+    sys.exit(main())
-- 
2.14.3
