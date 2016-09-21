From: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Date: Thu, 22 Sep 2016 00:29:14 +0530
Subject: [Buildroot] [RFC PATCH] scripts/get-developers: correct type of
	patches argument
Message-ID: <1474484355-18864-1-git-send-email-rahul.bedarkar@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Current type for 'patches' argument is str. It supposed to only
contain names of files.

If we specify FileType as type, then we don't need to open file ourself
and it allows script to read patch from standard input as well.

e.g.
$ git show -1 | ./support/scripts/get-developers -

Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
---
 support/scripts/get-developers     |  4 ++--
 support/scripts/getdeveloperlib.py | 25 ++++++++++++-------------
 2 files changed, 14 insertions(+), 15 deletions(-)

diff --git a/support/scripts/get-developers b/support/scripts/get-developers
index f73512f..77a4ab0 100755
--- a/support/scripts/get-developers
+++ b/support/scripts/get-developers
@@ -5,8 +5,8 @@ import getdeveloperlib
 
 def parse_args():
     parser = argparse.ArgumentParser()
-    parser.add_argument('patches', metavar='P', type=str, nargs='*',
-                        help='list of patches')
+    parser.add_argument('patches', metavar='P', type=argparse.FileType('r'), nargs='*',
+                        help='list of patches (use - to read patches from stdin)')
     parser.add_argument('-a', dest='architecture', action='store',
                         help='find developers in charge of this architecture')
     parser.add_argument('-p', dest='package', action='store',
diff --git a/support/scripts/getdeveloperlib.py b/support/scripts/getdeveloperlib.py
index 7b39041..6519107 100644
--- a/support/scripts/getdeveloperlib.py
+++ b/support/scripts/getdeveloperlib.py
@@ -16,19 +16,18 @@ def analyze_patch(patch):
     removed by the patch."""
     files = set()
     infras = set()
-    with open(patch, "r") as f:
-        for line in f:
-            # If the patch is adding a package, find which infra it is
-            m = FIND_INFRA_IN_PATCH.match(line)
-            if m:
-                infras.add(m.group(2))
-            if not line.startswith("+++ "):
-                continue
-            line.strip()
-            fname = line[line.find("/") + 1 : ].strip()
-            if fname == "dev/null":
-                continue
-            files.add(fname)
+    for line in patch:
+        # If the patch is adding a package, find which infra it is
+        m = FIND_INFRA_IN_PATCH.match(line)
+        if m:
+            infras.add(m.group(2))
+        if not line.startswith("+++ "):
+            continue
+        line.strip()
+        fname = line[line.find("/") + 1 : ].strip()
+        if fname == "dev/null":
+            continue
+        files.add(fname)
     return (files, infras)
 
 FIND_INFRA_IN_MK = re.compile("^\$\(eval \$\((host-)?([^-]*)-package\)\)$")
-- 
2.6.2
