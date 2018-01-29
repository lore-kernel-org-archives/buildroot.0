From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Jan 2018 23:14:24 +0100
Subject: [Buildroot] [git commit] graph-depends: fix code style
Message-ID: <20180129221636.E75C388056@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9ff44852c4fa3df081ec19b14ec5ee9db8d366c0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix these warnings:
E122 continuation line missing indentation or outdented
E127 continuation line over-indented for visual indent
E128 continuation line under-indented for visual indent
E202 whitespace before ']'
E221 multiple spaces before operator
E225 missing whitespace around operator
E231 missing whitespace after ','
E302 expected 2 blank lines, found 1
E305 expected 2 blank lines after class or function definition, found 1
E502 the backslash is redundant between brackets
E713 test for membership should be 'not in'

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/scripts/brpkgutil.py  |  8 +++--
 support/scripts/graph-depends | 68 ++++++++++++++++++++++++++-----------------
 2 files changed, 48 insertions(+), 28 deletions(-)

diff --git a/support/scripts/brpkgutil.py b/support/scripts/brpkgutil.py
index a0e2352bad..4c99ae9110 100644
--- a/support/scripts/brpkgutil.py
+++ b/support/scripts/brpkgutil.py
@@ -3,11 +3,12 @@
 import sys
 import subprocess
 
+
 # Execute the "make <pkg>-show-version" command to get the version of a given
 # list of packages, and return the version formatted as a Python dictionary.
 def get_version(pkgs):
     sys.stderr.write("Getting version for %s\n" % pkgs)
-    cmd = ["make", "-s", "--no-print-directory" ]
+    cmd = ["make", "-s", "--no-print-directory"]
     for pkg in pkgs:
         cmd.append("%s-show-version" % pkg)
     p = subprocess.Popen(cmd, stdout=subprocess.PIPE, universal_newlines=True)
@@ -25,9 +26,10 @@ def get_version(pkgs):
         version[pkg] = output[i]
     return version
 
+
 def _get_depends(pkgs, rule):
     sys.stderr.write("Getting dependencies for %s\n" % pkgs)
-    cmd = ["make", "-s", "--no-print-directory" ]
+    cmd = ["make", "-s", "--no-print-directory"]
     for pkg in pkgs:
         cmd.append("%s-%s" % (pkg, rule))
     p = subprocess.Popen(cmd, stdout=subprocess.PIPE, universal_newlines=True)
@@ -49,12 +51,14 @@ def _get_depends(pkgs, rule):
             deps[pkg] = pkg_deps
     return deps
 
+
 # Execute the "make <pkg>-show-depends" command to get the list of
 # dependencies of a given list of packages, and return the list of
 # dependencies formatted as a Python dictionary.
 def get_depends(pkgs):
     return _get_depends(pkgs, 'show-depends')
 
+
 # Execute the "make <pkg>-show-rdepends" command to get the list of
 # reverse dependencies of a given list of packages, and return the
 # list of dependencies formatted as a Python dictionary.
diff --git a/support/scripts/graph-depends b/support/scripts/graph-depends
index db3041b32e..85c9bf0a4f 100755
--- a/support/scripts/graph-depends
+++ b/support/scripts/graph-depends
@@ -30,7 +30,7 @@ import brpkgutil
 
 # Modes of operation:
 MODE_FULL = 1   # draw full dependency graph for all selected packages
-MODE_PKG  = 2   # draw dependency graph for a given package
+MODE_PKG = 2    # draw dependency graph for a given package
 mode = 0
 
 # Limit drawing the dependency graph to this depth. 0 means 'no limit'.
@@ -49,18 +49,18 @@ parser.add_argument("--package", '-p', metavar="PACKAGE",
 parser.add_argument("--depth", '-d', metavar="DEPTH", dest="depth", type=int, default=0,
                     help="Limit the dependency graph to DEPTH levels; 0 means no limit.")
 parser.add_argument("--stop-on", "-s", metavar="PACKAGE", dest="stop_list", action="append",
-                    help="Do not graph past this package (can be given multiple times)." \
-                       + " Can be a package name or a glob, " \
-                       + " 'virtual' to stop on virtual packages, or " \
-                       + "'host' to stop on host packages.")
+                    help="Do not graph past this package (can be given multiple times)." +
+                         " Can be a package name or a glob, " +
+                         " 'virtual' to stop on virtual packages, or " +
+                         "'host' to stop on host packages.")
 parser.add_argument("--exclude", "-x", metavar="PACKAGE", dest="exclude_list", action="append",
                     help="Like --stop-on, but do not add PACKAGE to the graph.")
 parser.add_argument("--colours", "-c", metavar="COLOR_LIST", dest="colours",
                     default="lightblue,grey,gainsboro",
-                    help="Comma-separated list of the three colours to use" \
-                       + " to draw the top-level package, the target" \
-                       + " packages, and the host packages, in this order." \
-                       + " Defaults to: 'lightblue,grey,gainsboro'")
+                    help="Comma-separated list of the three colours to use" +
+                         " to draw the top-level package, the target" +
+                         " packages, and the host packages, in this order." +
+                         " Defaults to: 'lightblue,grey,gainsboro'")
 parser.add_argument("--transitive", dest="transitive", action='store_true',
                     default=False)
 parser.add_argument("--no-transitive", dest="transitive", action='store_false',
@@ -114,7 +114,7 @@ else:
 # Get the colours: we need exactly three colours,
 # so no need not split more than 4
 # We'll let 'dot' validate the colours...
-colours = args.colours.split(',',4)
+colours = args.colours.split(',', 4)
 if len(colours) != 3:
     sys.stderr.write("Error: incorrect colour list '%s'\n" % args.colours)
     sys.exit(1)
@@ -124,6 +124,7 @@ host_colour = colours[2]
 
 allpkgs = []
 
+
 # Execute the "make show-targets" command to get the list of the main
 # Buildroot PACKAGES and return it formatted as a Python list. This
 # list is used as the starting point for full dependency graphs
@@ -138,6 +139,7 @@ def get_targets():
         return []
     return output.split(' ')
 
+
 # Recursive function that builds the tree of dependencies for a given
 # list of packages. The dependencies are built in a list called
 # 'dependencies', which contains tuples of the form (pkg1 ->
@@ -179,10 +181,12 @@ def get_all_depends(pkgs):
 
     return dependencies
 
+
 # The Graphviz "dot" utility doesn't like dashes in node names. So for
 # node names, we strip all dashes.
 def pkg_node_name(pkg):
-    return pkg.replace("-","")
+    return pkg.replace("-", "")
+
 
 TARGET_EXCEPTIONS = [
     "target-finalize",
@@ -225,35 +229,39 @@ for dep in dependencies:
 # sub-dicts is "pkg2".
 is_dep_cache = {}
 
+
 def is_dep_cache_insert(pkg, pkg2, val):
     try:
         is_dep_cache[pkg].update({pkg2: val})
     except KeyError:
         is_dep_cache[pkg] = {pkg2: val}
 
+
 # Retrieves from the cache whether pkg2 is a transitive dependency
 # of pkg.
 # Note: raises a KeyError exception if the dependency is not known.
 def is_dep_cache_lookup(pkg, pkg2):
     return is_dep_cache[pkg][pkg2]
 
+
 # This function return True if pkg is a dependency (direct or
 # transitive) of pkg2, dependencies being listed in the deps
 # dictionary. Returns False otherwise.
 # This is the un-cached version.
-def is_dep_uncached(pkg,pkg2,deps):
+def is_dep_uncached(pkg, pkg2, deps):
     try:
         for p in deps[pkg2]:
             if pkg == p:
                 return True
-            if is_dep(pkg,p,deps):
+            if is_dep(pkg, p, deps):
                 return True
     except KeyError:
         pass
     return False
 
+
 # See is_dep_uncached() above; this is the cached version.
-def is_dep(pkg,pkg2,deps):
+def is_dep(pkg, pkg2, deps):
     try:
         return is_dep_cache_lookup(pkg, pkg2)
     except KeyError:
@@ -261,6 +269,7 @@ def is_dep(pkg,pkg2,deps):
         is_dep_cache_insert(pkg, pkg2, val)
         return val
 
+
 # This function eliminates transitive dependencies; for example, given
 # these dependency chain: A->{B,C} and B->{C}, the A->{C} dependency is
 # already covered by B->{C}, so C is a transitive dependency of A, via B.
@@ -269,30 +278,32 @@ def is_dep(pkg,pkg2,deps):
 #     - if d[i] is a dependency of any of the other dependencies d[j]
 #       - do not keep d[i]
 #     - otherwise keep d[i]
-def remove_transitive_deps(pkg,deps):
+def remove_transitive_deps(pkg, deps):
     d = deps[pkg]
     new_d = []
     for i in range(len(d)):
         keep_me = True
         for j in range(len(d)):
-            if j==i:
+            if j == i:
                 continue
-            if is_dep(d[i],d[j],deps):
+            if is_dep(d[i], d[j], deps):
                 keep_me = False
         if keep_me:
             new_d.append(d[i])
     return new_d
 
+
 # This function removes the dependency on some 'mandatory' package, like the
 # 'toolchain' package, or the 'skeleton' package
-def remove_mandatory_deps(pkg,deps):
+def remove_mandatory_deps(pkg, deps):
     return [p for p in deps[pkg] if p not in ['toolchain', 'skeleton']]
 
+
 # This function will check that there is no loop in the dependency chain
 # As a side effect, it builds up the dependency cache.
 def check_circular_deps(deps):
     def recurse(pkg):
-        if not pkg in list(deps.keys()):
+        if pkg not in list(deps.keys()):
             return
         if pkg in not_loop:
             return
@@ -314,24 +325,27 @@ def check_circular_deps(deps):
     for pkg in list(deps.keys()):
         recurse(pkg)
 
+
 # This functions trims down the dependency list of all packages.
 # It applies in sequence all the dependency-elimination methods.
 def remove_extra_deps(deps):
     for pkg in list(deps.keys()):
         if not pkg == 'all':
-            deps[pkg] = remove_mandatory_deps(pkg,deps)
+            deps[pkg] = remove_mandatory_deps(pkg, deps)
     for pkg in list(deps.keys()):
         if not transitive or pkg == 'all':
-            deps[pkg] = remove_transitive_deps(pkg,deps)
+            deps[pkg] = remove_transitive_deps(pkg, deps)
     return deps
 
+
 check_circular_deps(dict_deps)
 if check_only:
     sys.exit(0)
 
 dict_deps = remove_extra_deps(dict_deps)
 dict_version = brpkgutil.get_version([pkg for pkg in allpkgs
-                                if pkg != "all" and not pkg.startswith("root")])
+                                      if pkg != "all" and not pkg.startswith("root")])
+
 
 # Print the attributes of a node: label and fill-color
 def print_attrs(pkg):
@@ -344,8 +358,8 @@ def print_attrs(pkg):
         color = root_colour
     else:
         if pkg.startswith('host') \
-        or pkg.startswith('toolchain') \
-        or pkg.startswith('rootfs'):
+                or pkg.startswith('toolchain') \
+                or pkg.startswith('rootfs'):
             color = host_colour
         else:
             color = target_colour
@@ -356,6 +370,7 @@ def print_attrs(pkg):
         outfile.write("%s [label = \"%s\"]\n" % (name, label))
     outfile.write("%s [color=%s,style=filled]\n" % (name, color))
 
+
 # Print the dependency graph of a package
 def print_pkg_deps(depth, pkg):
     if pkg in done_deps:
@@ -381,12 +396,13 @@ def print_pkg_deps(depth, pkg):
                 continue
             add = True
             for p in exclude_list:
-                if fnmatch(d,p):
+                if fnmatch(d, p):
                     add = False
                     break
             if add:
                 outfile.write("%s -> %s [dir=%s]\n" % (pkg_node_name(pkg), pkg_node_name(d), arrow_dir))
-                print_pkg_deps(depth+1, d)
+                print_pkg_deps(depth + 1, d)
+
 
 # Start printing the graph data
 outfile.write("digraph G {\n")
