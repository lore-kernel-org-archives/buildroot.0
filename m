From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 25 Mar 2019 19:31:02 +0100
Subject: [Buildroot] [git commit] support/graph-depends: use the new
 make-based dependency tree
Message-ID: <20190325183004.1A33183CDB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9c32b9286dcb25f6508ded4096b55bf4ee387a83
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that we can get the whole dependency tree from make, use it to
speed up things considerably.

So far, we had three functions to get the dependencies information:
get_depends(), get_rdepends(), and, somehow unrelated, get_version().

Because of the way %-show-{,r}depends works, getting the dependency tree
was expensive, the three functions all took a set of packages for which
to get the dependencies, in an attempt to limit the time it took to get
that tree, but we still had to call these functions iteratively, until
they returned no new dependency. This was pretty costly.

Now, getting the tree is much, much less costly, and we can get the
whole tree as cheaply as we previously got only the first-level
dependencies.

Furthermore, we can now also get the version information at the same
time, and that also brings in whether the package is virtual or not,
target or host.

So, we drop all three helper functions, and replace them with a single
one that returns all that information in one go: full dependency trees
(direct and reverse), per-package type, and per-package version.

Note: since commit 2d29fd96a (pkg-virtual: remove VERSION/SOURCE),
virtual packages are no longer reported as having a 'virtual' version,
so have since been displayed as regular packages in the graphs. Although
noone complained, this patch incidentally restores the initial
behaviour, and virtual packages are now correctly displayed as such
again.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/brpkgutil.py  | 105 ++++++++++++++++---------------------
 support/scripts/graph-depends | 118 ++++++------------------------------------
 2 files changed, 59 insertions(+), 164 deletions(-)

diff --git a/support/scripts/brpkgutil.py b/support/scripts/brpkgutil.py
index e70d525353..9ceda71b7f 100644
--- a/support/scripts/brpkgutil.py
+++ b/support/scripts/brpkgutil.py
@@ -1,67 +1,50 @@
 # Copyright (C) 2010-2013 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+# Copyright (C) 2019 Yann E. MORIN <yann.morin.1998@free.fr>
 
 import logging
-import sys
+import os
 import subprocess
-
-
-# Execute the "make <pkg>-show-version" command to get the version of a given
-# list of packages, and return the version formatted as a Python dictionary.
-def get_version(pkgs):
-    logging.info("Getting version for %s" % pkgs)
-    cmd = ["make", "-s", "--no-print-directory"]
-    for pkg in pkgs:
-        cmd.append("%s-show-version" % pkg)
-    p = subprocess.Popen(cmd, stdout=subprocess.PIPE, universal_newlines=True)
-    output = p.communicate()[0]
-    if p.returncode != 0:
-        logging.error("Error getting version %s" % pkgs)
-        sys.exit(1)
-    output = output.split("\n")
-    if len(output) != len(pkgs) + 1:
-        logging.error("Error getting version")
-        sys.exit(1)
-    version = {}
-    for i in range(0, len(pkgs)):
-        pkg = pkgs[i]
-        version[pkg] = output[i]
-    return version
-
-
-def _get_depends(pkgs, rule):
-    logging.info("Getting dependencies for %s" % pkgs)
-    cmd = ["make", "-s", "--no-print-directory"]
-    for pkg in pkgs:
-        cmd.append("%s-%s" % (pkg, rule))
-    p = subprocess.Popen(cmd, stdout=subprocess.PIPE, universal_newlines=True)
-    output = p.communicate()[0]
-    if p.returncode != 0:
-        logging.error("Error getting dependencies %s\n" % pkgs)
-        sys.exit(1)
-    output = output.split("\n")
-    if len(output) != len(pkgs) + 1:
-        logging.error("Error getting dependencies")
-        sys.exit(1)
-    deps = {}
-    for i in range(0, len(pkgs)):
-        pkg = pkgs[i]
-        pkg_deps = output[i].split(" ")
-        if pkg_deps == ['']:
-            deps[pkg] = []
+from collections import defaultdict
+
+
+# This function returns a tuple of four dictionaries, all using package
+# names as keys:
+# - a dictionary which values are the lists of packages that are the
+#   dependencies of the package used as key;
+# - a dictionary which values are the lists of packages that are the
+#   reverse dependencies of the package used as key;
+# - a dictionary which values are the type of the package used as key;
+# - a dictionary which values are the version of the package used as key,
+#   'virtual' for a virtual package, or the empty string for a rootfs.
+def get_dependency_tree():
+    logging.info("Getting dependency tree...")
+
+    deps = defaultdict(list)
+    rdeps = defaultdict(list)
+    types = {}
+    versions = {}
+
+    # Special case for the 'all' top-level fake package
+    deps['all'] = []
+    types['all'] = 'target'
+    versions['all'] = ''
+
+    cmd = ["make", "-s", "--no-print-directory", "show-dependency-tree"]
+    with open(os.devnull, 'wb') as devnull:
+        p = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=devnull, universal_newlines=True)
+        output = p.communicate()[0]
+
+    for l in output.splitlines():
+        if " -> " in l:
+            pkg = l.split(" -> ")[0]
+            deps[pkg] += l.split(" -> ")[1].split()
+            for p in l.split(" -> ")[1].split():
+                rdeps[p].append(pkg)
         else:
-            deps[pkg] = pkg_deps
-    return deps
-
-
-# Execute the "make <pkg>-show-depends" command to get the list of
-# dependencies of a given list of packages, and return the list of
-# dependencies formatted as a Python dictionary.
-def get_depends(pkgs):
-    return _get_depends(pkgs, 'show-depends')
-
+            pkg, type_version = l.split(": ", 1)
+            t, v = "{} -".format(type_version).split(None, 2)[:2]
+            deps['all'].append(pkg)
+            types[pkg] = t
+            versions[pkg] = v
 
-# Execute the "make <pkg>-show-rdepends" command to get the list of
-# reverse dependencies of a given list of packages, and return the
-# list of dependencies formatted as a Python dictionary.
-def get_rdepends(pkgs):
-    return _get_depends(pkgs, 'show-rdepends')
+    return (deps, rdeps, types, versions)
diff --git a/support/scripts/graph-depends b/support/scripts/graph-depends
index 7ed28440bb..3de09b1209 100755
--- a/support/scripts/graph-depends
+++ b/support/scripts/graph-depends
@@ -20,10 +20,10 @@
 #    configuration.
 #
 # Copyright (C) 2010-2013 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+# Copyright (C) 2019 Yann E. MORIN <yann.morin.1998@free.fr>
 
 import logging
 import sys
-import subprocess
 import argparse
 from fnmatch import fnmatch
 
@@ -36,63 +36,6 @@ MODE_PKG = 2    # draw dependency graph for a given package
 allpkgs = []
 
 
-# Execute the "make show-targets" command to get the list of the main
-# Buildroot PACKAGES and return it formatted as a Python list. This
-# list is used as the starting point for full dependency graphs
-def get_targets():
-    logging.info("Getting targets")
-    cmd = ["make", "-s", "--no-print-directory", "show-targets"]
-    p = subprocess.Popen(cmd, stdout=subprocess.PIPE, universal_newlines=True)
-    output = p.communicate()[0].strip()
-    if p.returncode != 0:
-        return None
-    if output == '':
-        return []
-    return output.split(' ')
-
-
-# Recursive function that builds the tree of dependencies for a given
-# list of packages. The dependencies are built in a list called
-# 'dependencies', which contains tuples of the form (pkg1 ->
-# pkg2_on_which_pkg1_depends, pkg3 -> pkg4_on_which_pkg3_depends) and
-# the function finally returns this list.
-def get_all_depends(pkgs, get_depends_func):
-    dependencies = []
-
-    # Filter the packages for which we already have the dependencies
-    filtered_pkgs = []
-    for pkg in pkgs:
-        if pkg in allpkgs:
-            continue
-        filtered_pkgs.append(pkg)
-        allpkgs.append(pkg)
-
-    if len(filtered_pkgs) == 0:
-        return []
-
-    depends = get_depends_func(filtered_pkgs)
-
-    deps = set()
-    for pkg in filtered_pkgs:
-        pkg_deps = depends[pkg]
-
-        # This package has no dependency.
-        if pkg_deps == []:
-            continue
-
-        # Add dependencies to the list of dependencies
-        for dep in pkg_deps:
-            dependencies.append((pkg, dep))
-            deps.add(dep)
-
-    if len(deps) != 0:
-        newdeps = get_all_depends(deps, get_depends_func)
-        if newdeps is not None:
-            dependencies += newdeps
-
-    return dependencies
-
-
 # The Graphviz "dot" utility doesn't like dashes in node names. So for
 # node names, we strip all dashes. Also, nodes can't start with a number,
 # so we prepend an underscore.
@@ -234,7 +177,7 @@ def remove_extra_deps(deps, rootpkg, transitive, arrow_dir):
 
 
 # Print the attributes of a node: label and fill-color
-def print_attrs(outfile, pkg, version, depth, colors):
+def print_attrs(outfile, pkg, pkg_type, pkg_version, depth, colors):
     name = pkg_node_name(pkg)
     if pkg == 'all':
         label = 'ALL'
@@ -243,13 +186,11 @@ def print_attrs(outfile, pkg, version, depth, colors):
     if depth == 0:
         color = colors[0]
     else:
-        if pkg.startswith('host') \
-                or pkg.startswith('toolchain') \
-                or pkg.startswith('rootfs'):
+        if pkg_type == "host":
             color = colors[2]
         else:
             color = colors[1]
-    if version == "virtual":
+    if pkg_version == "virtual":
         outfile.write("%s [label = <<I>%s</I>>]\n" % (name, label))
     else:
         outfile.write("%s [label = \"%s\"]\n" % (name, label))
@@ -260,13 +201,13 @@ done_deps = []
 
 
 # Print the dependency graph of a package
-def print_pkg_deps(outfile, dict_deps, dict_version, stop_list, exclude_list,
+def print_pkg_deps(outfile, dict_deps, dict_types, dict_versions, stop_list, exclude_list,
                    arrow_dir, draw_graph, depth, max_depth, pkg, colors):
     if pkg in done_deps:
         return
     done_deps.append(pkg)
     if draw_graph:
-        print_attrs(outfile, pkg, dict_version.get(pkg), depth, colors)
+        print_attrs(outfile, pkg, dict_types[pkg], dict_versions[pkg], depth, colors)
     elif depth != 0:
         outfile.write("%s " % pkg)
     if pkg not in dict_deps:
@@ -274,17 +215,15 @@ def print_pkg_deps(outfile, dict_deps, dict_version, stop_list, exclude_list,
     for p in stop_list:
         if fnmatch(pkg, p):
             return
-    if dict_version.get(pkg) == "virtual" and "virtual" in stop_list:
+    if dict_versions[pkg] == "virtual" and "virtual" in stop_list:
         return
-    if pkg.startswith("host-") and "host" in stop_list:
+    if dict_types[pkg] == "host" and "host" in stop_list:
         return
     if max_depth == 0 or depth < max_depth:
         for d in dict_deps[pkg]:
-            if dict_version.get(d) == "virtual" \
-               and "virtual" in exclude_list:
+            if dict_versions[d] == "virtual" and "virtual" in exclude_list:
                 continue
-            if d.startswith("host-") \
-               and "host" in exclude_list:
+            if dict_types[d] == "host" and "host" in exclude_list:
                 continue
             add = True
             for p in exclude_list:
@@ -294,7 +233,7 @@ def print_pkg_deps(outfile, dict_deps, dict_version, stop_list, exclude_list,
             if add:
                 if draw_graph:
                     outfile.write("%s -> %s [dir=%s]\n" % (pkg_node_name(pkg), pkg_node_name(d), arrow_dir))
-                print_pkg_deps(outfile, dict_deps, dict_version, stop_list, exclude_list,
+                print_pkg_deps(outfile, dict_deps, dict_types, dict_versions, stop_list, exclude_list,
                                arrow_dir, draw_graph, depth + 1, max_depth, d, colors)
 
 
@@ -356,6 +295,7 @@ def main():
 
     if args.package is None:
         mode = MODE_FULL
+        rootpkg = 'all'
     else:
         mode = MODE_PKG
         rootpkg = args.package
@@ -374,13 +314,11 @@ def main():
         exclude_list += MANDATORY_DEPS
 
     if args.direct:
-        get_depends_func = brpkgutil.get_depends
         arrow_dir = "forward"
     else:
         if mode == MODE_FULL:
             logging.error("--reverse needs a package")
             sys.exit(1)
-        get_depends_func = brpkgutil.get_rdepends
         arrow_dir = "back"
 
     draw_graph = not args.flat_list
@@ -393,46 +331,20 @@ def main():
         logging.error("Error: incorrect color list '%s'" % args.colors)
         sys.exit(1)
 
-    # In full mode, start with the result of get_targets() to get the main
-    # targets and then use get_all_depends() for all targets
-    if mode == MODE_FULL:
-        targets = get_targets()
-        dependencies = []
-        allpkgs.append('all')
-        filtered_targets = []
-        for tg in targets:
-            dependencies.append(('all', tg))
-            filtered_targets.append(tg)
-        deps = get_all_depends(filtered_targets, get_depends_func)
-        if deps is not None:
-            dependencies += deps
-        rootpkg = 'all'
-
-    # In pkg mode, start directly with get_all_depends() on the requested
-    # package
-    elif mode == MODE_PKG:
-        dependencies = get_all_depends([rootpkg], get_depends_func)
-
-    # Make the dependencies a dictionnary { 'pkg':[dep1, dep2, ...] }
-    dict_deps = {}
-    for dep in dependencies:
-        if dep[0] not in dict_deps:
-            dict_deps[dep[0]] = []
-        dict_deps[dep[0]].append(dep[1])
+    deps, rdeps, dict_types, dict_versions = brpkgutil.get_dependency_tree()
+    dict_deps = deps if args.direct else rdeps
 
     check_circular_deps(dict_deps)
     if check_only:
         sys.exit(0)
 
     dict_deps = remove_extra_deps(dict_deps, rootpkg, args.transitive, arrow_dir)
-    dict_version = brpkgutil.get_version([pkg for pkg in allpkgs
-                                          if pkg != "all" and not pkg.startswith("root")])
 
     # Start printing the graph data
     if draw_graph:
         outfile.write("digraph G {\n")
 
-    print_pkg_deps(outfile, dict_deps, dict_version, stop_list, exclude_list,
+    print_pkg_deps(outfile, dict_deps, dict_types, dict_versions, stop_list, exclude_list,
                    arrow_dir, draw_graph, 0, args.depth, rootpkg, colors)
 
     if draw_graph:
