From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 21 Jan 2018 22:44:38 -0200
Subject: [Buildroot] [PATCH 10/14] get-developers: fix code style
In-Reply-To: <1516581882-30582-1-git-send-email-ricardo.martincoski@gmail.com>
References: <1516581882-30582-1-git-send-email-ricardo.martincoski@gmail.com>
Message-ID: <1516581882-30582-11-git-send-email-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix these warnings:
E202 whitespace before ']'
E203 whitespace before ':'
E302 expected 2 blank lines, found 1
E305 expected 2 blank lines after class or function definition, found 1
E711 comparison to None should be 'if cond is None:'
E741 ambiguous variable name 'l'
F401 'sys' imported but unused
W391 blank line at end of file

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 utils/get-developers     |  4 +++-
 utils/getdeveloperlib.py | 52 +++++++++++++++++++++++++++++-------------------
 2 files changed, 34 insertions(+), 22 deletions(-)

diff --git a/utils/get-developers b/utils/get-developers
index 6a028b4..f525ff2 100755
--- a/utils/get-developers
+++ b/utils/get-developers
@@ -5,6 +5,7 @@ import getdeveloperlib
 import sys
 import os
 
+
 def parse_args():
     parser = argparse.ArgumentParser()
     parser.add_argument('patches', metavar='P', type=argparse.FileType('r'), nargs='*',
@@ -19,6 +20,7 @@ def parse_args():
                         const=True, help='list files not handled by any developer')
     return parser.parse_args()
 
+
 def __main__():
     devs = getdeveloperlib.parse_developers()
     if devs is None:
@@ -95,5 +97,5 @@ def __main__():
         if result != "":
             print("git send-email %s" % result)
 
-__main__()
 
+__main__()
diff --git a/utils/getdeveloperlib.py b/utils/getdeveloperlib.py
index 6519107..2c8d477 100644
--- a/utils/getdeveloperlib.py
+++ b/utils/getdeveloperlib.py
@@ -1,7 +1,5 @@
-import sys
 import os
 import re
-import argparse
 import glob
 import subprocess
 
@@ -11,6 +9,7 @@ import subprocess
 
 FIND_INFRA_IN_PATCH = re.compile("^\+\$\(eval \$\((host-)?([^-]*)-package\)\)$")
 
+
 def analyze_patch(patch):
     """Parse one patch and return the list of files modified, added or
     removed by the patch."""
@@ -24,14 +23,16 @@ def analyze_patch(patch):
         if not line.startswith("+++ "):
             continue
         line.strip()
-        fname = line[line.find("/") + 1 : ].strip()
+        fname = line[line.find("/") + 1:].strip()
         if fname == "dev/null":
             continue
         files.add(fname)
     return (files, infras)
 
+
 FIND_INFRA_IN_MK = re.compile("^\$\(eval \$\((host-)?([^-]*)-package\)\)$")
 
+
 def fname_get_package_infra(fname):
     """Checks whether the file name passed as argument is a Buildroot .mk
     file describing a package, and find the infrastructure it's using."""
@@ -42,13 +43,14 @@ def fname_get_package_infra(fname):
         return None
 
     with open(fname, "r") as f:
-        for l in f:
-            l = l.strip()
-            m = FIND_INFRA_IN_MK.match(l)
+        for line in f:
+            line = line.strip()
+            m = FIND_INFRA_IN_MK.match(line)
             if m:
                 return m.group(2)
     return None
 
+
 def get_infras(files):
     """Search in the list of files for .mk files, and collect the package
     infrastructures used by those .mk files."""
@@ -59,6 +61,7 @@ def get_infras(files):
             infras.add(infra)
     return infras
 
+
 def analyze_patches(patches):
     """Parse a list of patches and returns the list of files modified,
     added or removed by the patches, as well as the list of package
@@ -72,6 +75,7 @@ def analyze_patches(patches):
     allinfras = allinfras | get_infras(allfiles)
     return (allfiles, allinfras)
 
+
 #
 # DEVELOPERS file parsing functions
 #
@@ -91,6 +95,7 @@ class Developer:
                 return True
         return False
 
+
 def parse_developer_packages(fnames):
     """Given a list of file patterns, travel through the Buildroot source
     tree to find which packages are implemented by those file
@@ -105,25 +110,27 @@ def parse_developer_packages(fnames):
                     packages.add(pkg)
     return packages
 
+
 def parse_arches_from_config_in(fname):
     """Given a path to an arch/Config.in.* file, parse it to get the list
     of BR2_ARCH values for this architecture."""
     arches = set()
     with open(fname, "r") as f:
         parsing_arches = False
-        for l in f:
-            l = l.strip()
-            if l == "config BR2_ARCH":
+        for line in f:
+            line = line.strip()
+            if line == "config BR2_ARCH":
                 parsing_arches = True
                 continue
             if parsing_arches:
-                m = re.match("^\s*default \"([^\"]*)\".*", l)
+                m = re.match("^\s*default \"([^\"]*)\".*", line)
                 if m:
                     arches.add(m.group(1))
                 else:
                     parsing_arches = False
     return arches
 
+
 def parse_developer_architectures(fnames):
     """Given a list of file names, find the ones starting by
     'arch/Config.in.', and use that to determine the architecture a
@@ -135,6 +142,7 @@ def parse_developer_architectures(fnames):
         arches = arches | parse_arches_from_config_in(fname)
     return arches
 
+
 def parse_developer_infras(fnames):
     infras = set()
     for fname in fnames:
@@ -143,37 +151,38 @@ def parse_developer_infras(fnames):
             infras.add(m.group(1))
     return infras
 
+
 def parse_developers(basepath=None):
     """Parse the DEVELOPERS file and return a list of Developer objects."""
     developers = []
     linen = 0
-    if basepath == None:
+    if basepath is None:
         basepath = os.getcwd()
     with open(os.path.join(basepath, "DEVELOPERS"), "r") as f:
         files = []
         name = None
-        for l in f:
-            l = l.strip()
-            if l.startswith("#"):
+        for line in f:
+            line = line.strip()
+            if line.startswith("#"):
                 continue
-            elif l.startswith("N:"):
+            elif line.startswith("N:"):
                 if name is not None or len(files) != 0:
                     print("Syntax error in DEVELOPERS file, line %d" % linen)
-                name = l[2:].strip()
-            elif l.startswith("F:"):
-                fname = l[2:].strip()
+                name = line[2:].strip()
+            elif line.startswith("F:"):
+                fname = line[2:].strip()
                 dev_files = glob.glob(os.path.join(basepath, fname))
                 if len(dev_files) == 0:
                     print("WARNING: '%s' doesn't match any file" % fname)
                 files += dev_files
-            elif l == "":
+            elif line == "":
                 if not name:
                     continue
                 developers.append(Developer(name, files))
                 files = []
                 name = None
             else:
-                print("Syntax error in DEVELOPERS file, line %d: '%s'" % (linen, l))
+                print("Syntax error in DEVELOPERS file, line %d: '%s'" % (linen, line))
                 return None
             linen += 1
     # handle last developer
@@ -181,10 +190,11 @@ def parse_developers(basepath=None):
         developers.append(Developer(name, files))
     return developers
 
+
 def check_developers(developers, basepath=None):
     """Look at the list of files versioned in Buildroot, and returns the
     list of files that are not handled by any developer"""
-    if basepath == None:
+    if basepath is None:
         basepath = os.getcwd()
     cmd = ["git", "--git-dir", os.path.join(basepath, ".git"), "ls-files"]
     files = subprocess.check_output(cmd).strip().split("\n")
-- 
2.7.4
