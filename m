From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Feb 2017 12:26:55 +0100
Subject: [Buildroot] [git commit] graph-depends: split off
	get_version/get_depends into pkgutil.py
Message-ID: <20170206113329.8CBF581D9F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=12683184b1969f65680cb7db55b547a620a9860f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Functions to obtain the version and dependencies of a package from Python
can be useful for several scripts. Extract this logic out of graph-depends
into pkgutil.py.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
[Thomas: remove shebang from pkgutil.py, noticed by Yann E. Morin.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/scripts/graph-depends | 55 ++++---------------------------------------
 support/scripts/pkgutil.py    | 53 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 57 insertions(+), 51 deletions(-)

diff --git a/support/scripts/graph-depends b/support/scripts/graph-depends
index 095619a..7aedcb5 100755
--- a/support/scripts/graph-depends
+++ b/support/scripts/graph-depends
@@ -26,6 +26,8 @@ import subprocess
 import argparse
 from fnmatch import fnmatch
 
+import pkgutil
+
 # Modes of operation:
 MODE_FULL = 1   # draw full dependency graph for all selected packages
 MODE_PKG  = 2   # draw dependency graph for a given package
@@ -122,28 +124,6 @@ host_colour = colours[2]
 
 allpkgs = []
 
-# Execute the "make <pkg>-show-version" command to get the version of a given
-# list of packages, and return the version formatted as a Python dictionary.
-def get_version(pkgs):
-    sys.stderr.write("Getting version for %s\n" % pkgs)
-    cmd = ["make", "-s", "--no-print-directory" ]
-    for pkg in pkgs:
-        cmd.append("%s-show-version" % pkg)
-    p = subprocess.Popen(cmd, stdout=subprocess.PIPE, universal_newlines=True)
-    output = p.communicate()[0]
-    if p.returncode != 0:
-        sys.stderr.write("Error getting version %s\n" % pkgs)
-        sys.exit(1)
-    output = output.split("\n")
-    if len(output) != len(pkgs) + 1:
-        sys.stderr.write("Error getting version\n")
-        sys.exit(1)
-    version = {}
-    for i in range(0, len(pkgs)):
-        pkg = pkgs[i]
-        version[pkg] = output[i]
-    return version
-
 # Execute the "make show-targets" command to get the list of the main
 # Buildroot PACKAGES and return it formatted as a Python list. This
 # list is used as the starting point for full dependency graphs
@@ -158,33 +138,6 @@ def get_targets():
         return []
     return output.split(' ')
 
-# Execute the "make <pkg>-show-depends" command to get the list of
-# dependencies of a given list of packages, and return the list of
-# dependencies formatted as a Python dictionary.
-def get_depends(pkgs, rule):
-    sys.stderr.write("Getting dependencies for %s\n" % pkgs)
-    cmd = ["make", "-s", "--no-print-directory" ]
-    for pkg in pkgs:
-        cmd.append("%s-%s" % (pkg, rule))
-    p = subprocess.Popen(cmd, stdout=subprocess.PIPE, universal_newlines=True)
-    output = p.communicate()[0]
-    if p.returncode != 0:
-        sys.stderr.write("Error getting dependencies %s\n" % pkgs)
-        sys.exit(1)
-    output = output.split("\n")
-    if len(output) != len(pkgs) + 1:
-        sys.stderr.write("Error getting dependencies\n")
-        sys.exit(1)
-    deps = {}
-    for i in range(0, len(pkgs)):
-        pkg = pkgs[i]
-        pkg_deps = output[i].split(" ")
-        if pkg_deps == ['']:
-            deps[pkg] = []
-        else:
-            deps[pkg] = pkg_deps
-    return deps
-
 # Recursive function that builds the tree of dependencies for a given
 # list of packages. The dependencies are built in a list called
 # 'dependencies', which contains tuples of the form (pkg1 ->
@@ -204,7 +157,7 @@ def get_all_depends(pkgs):
     if len(filtered_pkgs) == 0:
         return []
 
-    depends = get_depends(filtered_pkgs, rule)
+    depends = pkgutil.get_depends(filtered_pkgs, rule)
 
     deps = set()
     for pkg in filtered_pkgs:
@@ -377,7 +330,7 @@ if check_only:
     sys.exit(0)
 
 dict_deps = remove_extra_deps(dict_deps)
-dict_version = get_version([pkg for pkg in allpkgs
+dict_version = pkgutil.get_version([pkg for pkg in allpkgs
                                 if pkg != "all" and not pkg.startswith("root")])
 
 # Print the attributes of a node: label and fill-color
diff --git a/support/scripts/pkgutil.py b/support/scripts/pkgutil.py
new file mode 100644
index 0000000..46af4b5
--- /dev/null
+++ b/support/scripts/pkgutil.py
@@ -0,0 +1,53 @@
+# Copyright (C) 2010-2013 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+import sys
+import subprocess
+
+# Execute the "make <pkg>-show-version" command to get the version of a given
+# list of packages, and return the version formatted as a Python dictionary.
+def get_version(pkgs):
+    sys.stderr.write("Getting version for %s\n" % pkgs)
+    cmd = ["make", "-s", "--no-print-directory" ]
+    for pkg in pkgs:
+        cmd.append("%s-show-version" % pkg)
+    p = subprocess.Popen(cmd, stdout=subprocess.PIPE, universal_newlines=True)
+    output = p.communicate()[0]
+    if p.returncode != 0:
+        sys.stderr.write("Error getting version %s\n" % pkgs)
+        sys.exit(1)
+    output = output.split("\n")
+    if len(output) != len(pkgs) + 1:
+        sys.stderr.write("Error getting version\n")
+        sys.exit(1)
+    version = {}
+    for i in range(0, len(pkgs)):
+        pkg = pkgs[i]
+        version[pkg] = output[i]
+    return version
+
+# Execute the "make <pkg>-show-depends" command to get the list of
+# dependencies of a given list of packages, and return the list of
+# dependencies formatted as a Python dictionary.
+def get_depends(pkgs, rule):
+    sys.stderr.write("Getting dependencies for %s\n" % pkgs)
+    cmd = ["make", "-s", "--no-print-directory" ]
+    for pkg in pkgs:
+        cmd.append("%s-%s" % (pkg, rule))
+    p = subprocess.Popen(cmd, stdout=subprocess.PIPE, universal_newlines=True)
+    output = p.communicate()[0]
+    if p.returncode != 0:
+        sys.stderr.write("Error getting dependencies %s\n" % pkgs)
+        sys.exit(1)
+    output = output.split("\n")
+    if len(output) != len(pkgs) + 1:
+        sys.stderr.write("Error getting dependencies\n")
+        sys.exit(1)
+    deps = {}
+    for i in range(0, len(pkgs)):
+        pkg = pkgs[i]
+        pkg_deps = output[i].split(" ")
+        if pkg_deps == ['']:
+            deps[pkg] = []
+        else:
+            deps[pkg] = pkg_deps
+    return deps
