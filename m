From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu,  4 Apr 2019 08:58:12 +0200
Subject: [Buildroot] [PATCH] utils/getdeveloperlib.py: print warnings/errors
 to stderr
Message-ID: <20190404065812.22601-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Instead of stdout where it gets mixed with the normal output, confusing
software parsing the output (E.G. get-developers -e as git sendemail.ccCmd).

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 utils/getdeveloperlib.py | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/utils/getdeveloperlib.py b/utils/getdeveloperlib.py
index 2c8d477583..35c618f791 100644
--- a/utils/getdeveloperlib.py
+++ b/utils/getdeveloperlib.py
@@ -1,7 +1,9 @@
+from __future__ import print_function
 import os
 import re
 import glob
 import subprocess
+import sys
 
 #
 # Patch parsing functions
@@ -167,13 +169,15 @@ def parse_developers(basepath=None):
                 continue
             elif line.startswith("N:"):
                 if name is not None or len(files) != 0:
-                    print("Syntax error in DEVELOPERS file, line %d" % linen)
+                    print("Syntax error in DEVELOPERS file, line %d" % linen,
+                          file=sys.stderr)
                 name = line[2:].strip()
             elif line.startswith("F:"):
                 fname = line[2:].strip()
                 dev_files = glob.glob(os.path.join(basepath, fname))
                 if len(dev_files) == 0:
-                    print("WARNING: '%s' doesn't match any file" % fname)
+                    print("WARNING: '%s' doesn't match any file" % fname,
+                          file=sys.stderr)
                 files += dev_files
             elif line == "":
                 if not name:
@@ -182,7 +186,8 @@ def parse_developers(basepath=None):
                 files = []
                 name = None
             else:
-                print("Syntax error in DEVELOPERS file, line %d: '%s'" % (linen, line))
+                print("Syntax error in DEVELOPERS file, line %d: '%s'" % (linen, line),
+                      file=sys.stderr)
                 return None
             linen += 1
     # handle last developer
-- 
2.11.0
