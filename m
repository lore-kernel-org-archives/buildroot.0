From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 16 Sep 2017 22:38:20 +0200
Subject: [Buildroot] [PATCH 1/2] support/run-tests: move packages tests to
	packages directories
In-Reply-To: <cover.1505594291.git.yann.morin.1998@free.fr>
References: <cover.1505594291.git.yann.morin.1998@free.fr>
Message-ID: <bead9472ebddf2faaa023fd64dfe511e48827b0f.1505594291.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Move the existing few packages' tests to the correspnding package
directories.

If we were to add the package/ directory to nose2's search path, we
would have to add __init__.py files about everywhere, at each level of
the directory hierarchy, because nose2 only includes tests that are in a
python pacakge (a directory with a __init__.py file is a python package).
This is far from ideal, especially since we have absolutely nothing to
put in those __init__.py files.

An alternative is to just scan the package/ directory ourselves, and
create symlinks in a sub-directory of support/tessting/tests/ so that
nose2 does find them. We have no two packages with the same name, we
don't risk having two symlinks with the same name.

That second solution is what we choose to do, at the cost of a slight
increase in complexity in the run-test script.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Samuel Martin <s.martin49@gmail.com>
---
 .gitignore                                         |  1 +
 .../dropbear/dropbear.py                           |  0
 .../python-ipython/python-ipython.py               |  0
 .../test_python.py => package/python/python.py     |  0
 support/testing/run-tests                          | 22 ++++++++++++++++++++++
 support/testing/tests/package/__init__.py          |  0
 6 files changed, 23 insertions(+)
 rename support/testing/tests/package/test_dropbear.py => package/dropbear/dropbear.py (100%)
 rename support/testing/tests/package/test_ipython.py => package/python-ipython/python-ipython.py (100%)
 rename support/testing/tests/package/test_python.py => package/python/python.py (100%)
 delete mode 100644 support/testing/tests/package/__init__.py

diff --git a/.gitignore b/.gitignore
index bb02d9f572..e85c07f99a 100644
--- a/.gitignore
+++ b/.gitignore
@@ -9,6 +9,7 @@
 *.o
 /*.patch
 /*.diff
+/support/testing/tests/package/
 *.orig
 *.rej
 *~
diff --git a/support/testing/tests/package/test_dropbear.py b/package/dropbear/dropbear.py
similarity index 100%
rename from support/testing/tests/package/test_dropbear.py
rename to package/dropbear/dropbear.py
diff --git a/support/testing/tests/package/test_ipython.py b/package/python-ipython/python-ipython.py
similarity index 100%
rename from support/testing/tests/package/test_ipython.py
rename to package/python-ipython/python-ipython.py
diff --git a/support/testing/tests/package/test_python.py b/package/python/python.py
similarity index 100%
rename from support/testing/tests/package/test_python.py
rename to package/python/python.py
diff --git a/support/testing/run-tests b/support/testing/run-tests
index ae0bd336b5..67736331ae 100755
--- a/support/testing/run-tests
+++ b/support/testing/run-tests
@@ -2,6 +2,9 @@
 import argparse
 import sys
 import os
+import errno
+import shutil
+import re
 import nose2
 import multiprocessing
 
@@ -36,6 +39,9 @@ def main():
     script_path = os.path.realpath(__file__)
     test_dir = os.path.dirname(script_path)
 
+    gatheradditionaltests(os.path.abspath("."),
+                          os.path.join(test_dir,"tests","package"))
+
     if args.stdout:
         BRTest.logtofile = False
 
@@ -116,5 +122,21 @@ def main():
 
     nose2.discover(argv=nose2_args)
 
+def gatheradditionaltests(search_dir, symlink_dir):
+    try:
+        shutil.rmtree(symlink_dir)
+    except OSError as err:
+        if not err.errno == errno.ENOENT:
+            raise err
+        pass
+    os.mkdir(symlink_dir)
+    open(os.path.join(symlink_dir,"__init__.py"), "w").close()
+    for dir, _, files in os.walk(os.path.abspath(search_dir)):
+        package = os.path.basename(dir)
+        for file in files:
+            if re.match("^{}.py$".format(package),file):
+                os.symlink(os.path.join(dir,file),
+                           os.path.join(symlink_dir,"test_{}.py".format(package)))
+
 if __name__ == "__main__":
     sys.exit(main())
diff --git a/support/testing/tests/package/__init__.py b/support/testing/tests/package/__init__.py
deleted file mode 100644
index e69de29bb2..0000000000
-- 
2.11.0
