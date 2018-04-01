From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 1 Apr 2018 22:25:57 +0200
Subject: [Buildroot] [git commit] support/scripts/graph-depends: use the
 standard python logging module
Message-ID: <20180401202618.ABEE0836E7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3543d174410567707737f0c8a219c0654428e08a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Instead of hardcoded sys.stderr.write() calls.  No functional change, but
allows us to easily implement a quiet option.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Reviewed-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/scripts/brpkgutil.py  | 13 +++++++------
 support/scripts/graph-depends | 16 ++++++++++------
 2 files changed, 17 insertions(+), 12 deletions(-)

diff --git a/support/scripts/brpkgutil.py b/support/scripts/brpkgutil.py
index 4c99ae9110..e70d525353 100644
--- a/support/scripts/brpkgutil.py
+++ b/support/scripts/brpkgutil.py
@@ -1,5 +1,6 @@
 # Copyright (C) 2010-2013 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 
+import logging
 import sys
 import subprocess
 
@@ -7,18 +8,18 @@ import subprocess
 # Execute the "make <pkg>-show-version" command to get the version of a given
 # list of packages, and return the version formatted as a Python dictionary.
 def get_version(pkgs):
-    sys.stderr.write("Getting version for %s\n" % pkgs)
+    logging.info("Getting version for %s" % pkgs)
     cmd = ["make", "-s", "--no-print-directory"]
     for pkg in pkgs:
         cmd.append("%s-show-version" % pkg)
     p = subprocess.Popen(cmd, stdout=subprocess.PIPE, universal_newlines=True)
     output = p.communicate()[0]
     if p.returncode != 0:
-        sys.stderr.write("Error getting version %s\n" % pkgs)
+        logging.error("Error getting version %s" % pkgs)
         sys.exit(1)
     output = output.split("\n")
     if len(output) != len(pkgs) + 1:
-        sys.stderr.write("Error getting version\n")
+        logging.error("Error getting version")
         sys.exit(1)
     version = {}
     for i in range(0, len(pkgs)):
@@ -28,18 +29,18 @@ def get_version(pkgs):
 
 
 def _get_depends(pkgs, rule):
-    sys.stderr.write("Getting dependencies for %s\n" % pkgs)
+    logging.info("Getting dependencies for %s" % pkgs)
     cmd = ["make", "-s", "--no-print-directory"]
     for pkg in pkgs:
         cmd.append("%s-%s" % (pkg, rule))
     p = subprocess.Popen(cmd, stdout=subprocess.PIPE, universal_newlines=True)
     output = p.communicate()[0]
     if p.returncode != 0:
-        sys.stderr.write("Error getting dependencies %s\n" % pkgs)
+        logging.error("Error getting dependencies %s\n" % pkgs)
         sys.exit(1)
     output = output.split("\n")
     if len(output) != len(pkgs) + 1:
-        sys.stderr.write("Error getting dependencies\n")
+        logging.error("Error getting dependencies")
         sys.exit(1)
     deps = {}
     for i in range(0, len(pkgs)):
diff --git a/support/scripts/graph-depends b/support/scripts/graph-depends
index dc265ae28c..17bfaa0cf5 100755
--- a/support/scripts/graph-depends
+++ b/support/scripts/graph-depends
@@ -21,6 +21,7 @@
 #
 # Copyright (C) 2010-2013 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 
+import logging
 import sys
 import subprocess
 import argparse
@@ -39,7 +40,7 @@ allpkgs = []
 # Buildroot PACKAGES and return it formatted as a Python list. This
 # list is used as the starting point for full dependency graphs
 def get_targets():
-    sys.stderr.write("Getting targets\n")
+    logging.info("Getting targets")
     cmd = ["make", "-s", "--no-print-directory", "show-targets"]
     p = subprocess.Popen(cmd, stdout=subprocess.PIPE, universal_newlines=True)
     output = p.communicate()[0].strip()
@@ -192,10 +193,10 @@ def check_circular_deps(deps):
         chain.append(pkg)
         for p in deps[pkg]:
             if p in chain:
-                sys.stderr.write("\nRecursion detected for  : %s\n" % (p))
+                logging.warning("\nRecursion detected for  : %s" % (p))
                 while True:
                     _p = chain.pop()
-                    sys.stderr.write("which is a dependency of: %s\n" % (_p))
+                    logging.warning("which is a dependency of: %s" % (_p))
                     if p == _p:
                         sys.exit(1)
             recurse(p)
@@ -319,11 +320,14 @@ def main():
 
     check_only = args.check_only
 
+    logging.basicConfig(stream=sys.stderr, format='%(message)s',
+                        level=logging.INFO)
+
     if args.outfile is None:
         outfile = sys.stdout
     else:
         if check_only:
-            sys.stderr.write("don't specify outfile and check-only at the same time\n")
+            logging.error("don't specify outfile and check-only at the same time")
             sys.exit(1)
         outfile = open(args.outfile, "w")
 
@@ -348,7 +352,7 @@ def main():
         arrow_dir = "forward"
     else:
         if mode == MODE_FULL:
-            sys.stderr.write("--reverse needs a package\n")
+            logging.error("--reverse needs a package")
             sys.exit(1)
         get_depends_func = brpkgutil.get_rdepends
         arrow_dir = "back"
@@ -358,7 +362,7 @@ def main():
     # We'll let 'dot' validate the colors...
     colors = args.colors.split(',', 4)
     if len(colors) != 3:
-        sys.stderr.write("Error: incorrect color list '%s'\n" % args.colors)
+        logging.error("Error: incorrect color list '%s'" % args.colors)
         sys.exit(1)
 
     # In full mode, start with the result of get_targets() to get the main
