From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri,  3 Feb 2017 21:57:43 +0100
Subject: [Buildroot] [PATCH 1/1] support/scripts: split off
	get_version/get_depends into pkgutil.py
In-Reply-To: <20170203205745.14488-1-patrickdepinguin@gmail.com>
References: <20170203205745.14488-1-patrickdepinguin@gmail.com>
Message-ID: <20170203205745.14488-3-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Functions to obtain the version and dependencies of a package from Python
can be useful for several scripts. Extract this logic out of graph-depends
into pkgutil.py.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 support/scripts/graph-depends | 55 ++++---------------------------------------
 support/scripts/pkgutil.py    | 55 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 59 insertions(+), 51 deletions(-)
 create mode 100644 support/scripts/pkgutil.py

diff --git a/support/scripts/graph-depends b/support/scripts/graph-depends
index c3c97cb..c1f5c8f 100755
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
-def get_depends(pkgs):
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
 
-    depends = get_depends(filtered_pkgs)
+    depends = pkgutil.get_depends(filtered_pkgs)
 
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
index 0000000..191134a
--- /dev/null
+++ b/support/scripts/pkgutil.py
@@ -0,0 +1,55 @@
+#!/usr/bin/env python
+
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
+def get_depends(pkgs):
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
-- 
2.10.2
