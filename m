From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Fri,  3 Jan 2020 16:18:42 +0100
Subject: [Buildroot] [PATCH 05/11] support/scripts/pkg-stats: parse and set
 developers info
In-Reply-To: <20200103151849.10956-1-heiko.thiery@gmail.com>
References: <20200103151849.10956-1-heiko.thiery@gmail.com>
Message-ID: <20200103151849.10956-6-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch collects the developers information and stores developers to
the Pakckage instance.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 support/scripts/pkg-stats | 59 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 4021aacceb..d520da6807 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -20,6 +20,7 @@ import argparse
 import datetime
 import fnmatch
 import os
+import glob
 from collections import defaultdict
 import re
 import subprocess
@@ -42,6 +43,50 @@ RM_API_STATUS_NOT_FOUND = 4
 # because it's used by sub-processes.
 http_pool = None
 
+class Developer:
+    def __init__(self, name, files):
+        self.name = name
+        self.files = files
+
+def parse_developers(basepath=None):
+    """Parse the DEVELOPERS file and return a list of Developer objects."""
+    developers = []
+    linen = 0
+    if basepath is None:
+        basepath = os.getcwd()
+    with open(os.path.join(basepath, "DEVELOPERS"), "r") as f:
+        files = []
+        name = None
+        for line in f:
+            line = line.strip()
+            if line.startswith("#"):
+                continue
+            elif line.startswith("N:"):
+                if name is not None or len(files) != 0:
+                    print("Syntax error in DEVELOPERS file, line %d" % linen)
+                name = line[2:].strip()
+            elif line.startswith("F:"):
+                fname = line[2:].strip()
+                #dev_files = glob.glob(os.path.join(basepath, fname))
+                dev_files = glob.glob(fname)
+                if len(dev_files) == 0:
+                    print("WARNING: '%s' doesn't match any file" % fname)
+                files += dev_files
+            elif line == "":
+                if not name:
+                    continue
+                developers.append(Developer(name, files))
+                files = []
+                name = None
+            else:
+                print("Syntax error in DEVELOPERS file, line %d: '%s'" % (linen, line))
+
+                return None
+            linen += 1
+    # handle last developer
+    if name is not None:
+        developers.append(Developer(name, files))
+    return developers
 
 class Package:
     all_licenses = list()
@@ -56,6 +101,7 @@ class Package:
         self.has_license = False
         self.has_license_files = False
         self.has_hash = False
+        self.developers = None
         self.patches = {'count':0, 'files': None}
         self.warnings = 0
         self.current_version = None
@@ -151,6 +197,16 @@ class Package:
                 self.warnings = int(m.group(1))
                 return
 
+    def set_developers(self, developers):
+        """
+        Fills in the .developers field
+        """
+        self.developers = list()
+        for dev in developers:
+            for f in dev.files:
+                if self.pkg_path[2:] == f[:-1]:
+                    self.developers.append((dev.name))
+
     def __eq__(self, other):
         return self.path == other.path
 
@@ -729,6 +785,8 @@ def __main__():
     date = datetime.datetime.utcnow()
     commit = subprocess.check_output(['git', 'rev-parse',
                                       'HEAD']).splitlines()[0]
+    print("Getting developers...")
+    developers = parse_developers()
     print("Build package list ...")
     packages = get_pkglist(args.npackages, package_list)
     print("Getting developers...")
@@ -744,6 +802,7 @@ def __main__():
         pkg.set_check_package_warnings()
         pkg.set_current_version()
         pkg.set_url()
+        pkg.set_developers(developers)
     print("Checking URL status")
     check_package_urls(packages)
     print("Getting latest versions ...")
-- 
2.20.1
