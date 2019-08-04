From: Victor Huesca <victor.huesca@bootlin.com>
Date: Sun,  4 Aug 2019 16:21:42 +0200
Subject: [Buildroot] [PATCH 2/3] utils/getdeveloperlib.py: add runtime test
In-Reply-To: <20190804142143.10923-1-victor.huesca@bootlin.com>
References: <20190804142143.10923-1-victor.huesca@bootlin.com>
Message-ID: <20190804142143.10923-3-victor.huesca@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch provides support to track python runtime tests.

The implementation rely on the unit-test module to list all test cases
and does some manual parsing of these test-case objects to get the
actual list of test-cases per test-suite

Directories are supported as file name are returns all test-cases
recursively.

A global variable is used to compute the list of unittest only once.

Signed-off-by: Victor Huesca <victor.huesca@bootlin.com>
---
 utils/getdeveloperlib.py | 56 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/utils/getdeveloperlib.py b/utils/getdeveloperlib.py
index 81eae7ee9b..8c8343a137 100644
--- a/utils/getdeveloperlib.py
+++ b/utils/getdeveloperlib.py
@@ -4,6 +4,7 @@ import re
 import glob
 import subprocess
 import sys
+import unittest
 
 #
 # Patch parsing functions
@@ -78,6 +79,35 @@ def analyze_patches(patches):
     return (allfiles, allinfras)
 
 
+# 
+# Unit-test parsing functions
+# 
+
+def get_all_test_cases(suite):
+    """Generate all test-cases from a given test-suite.
+    :return: (test.module, test.name)"""
+    if issubclass(type(suite), unittest.TestSuite):
+        for test in suite:
+            for res in get_all_test_cases(test):
+                yield res
+    else:
+        yield (suite.__module__, suite.__class__.__name__)
+
+
+def list_unittests(path):
+    """Use the unittest module to retreive all test cases from a given
+    directory"""
+    loader = unittest.TestLoader()
+    suite = loader.discover(path)
+    tests = {}
+    for module, test in get_all_test_cases(suite):
+        module_path = os.path.join(path, *module.split('.'))
+        tests.setdefault(module_path, []).append('%s.%s' % (module, test))
+    return tests
+
+
+unittests = {}
+
 #
 # DEVELOPERS file parsing functions
 #
@@ -89,6 +119,7 @@ class Developer:
         self.packages = parse_developer_packages(files)
         self.architectures = parse_developer_architectures(files)
         self.infras = parse_developer_infras(files)
+        self.runtime_tests = parse_developer_runtime_tests(files)
 
     def hasfile(self, f):
         f = os.path.abspath(f)
@@ -108,6 +139,8 @@ class Developer:
             things.append('{} archs'.format(len(self.architectures)))
         if len(self.infras):
             things.append('{} infras'.format(len(self.infras)))
+        if len(self.runtime_tests):
+            things.append('{} runtime'.format(len(self.runtime_tests)))
         if things:
             return 'Developer <{} ({})>'.format(name, ', '.join(things))
         else:
@@ -170,12 +203,35 @@ def parse_developer_infras(fnames):
     return infras
 
 
+def parse_developer_runtime_tests(fnames):
+    """Given a list of file names, returns the runtime tests
+    corresponding to the file."""
+    all_files = []
+    # List all files recursively
+    for fname in fnames:
+        if os.path.isdir(fname):
+            for root, _dirs, files in os.walk(fname):
+                all_files += [os.path.join(root, f) for f in files]
+        else:
+            all_files.append(fname)
+
+    # Get all runtime tests
+    runtimes = set()
+    for f in all_files:
+        name = os.path.splitext(f)[0]
+        if name in unittests:
+            runtimes |= set(unittests[name])
+    return runtimes
+
+
 def parse_developers(basepath=None):
     """Parse the DEVELOPERS file and return a list of Developer objects."""
     developers = []
     linen = 0
     if basepath is None:
         basepath = os.getcwd()
+    global unittests
+    unittests = list_unittests(os.path.join(basepath, 'support/testing'))
     with open(os.path.join(basepath, "DEVELOPERS"), "r") as f:
         files = []
         name = None
-- 
2.21.0
