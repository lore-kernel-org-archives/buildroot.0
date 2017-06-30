From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 30 Jun 2017 23:50:07 +0200
Subject: [Buildroot] [PATCH 3/8 v3] tools: move get-developers out of
	support/scripts/
In-Reply-To: <cover.1498859395.git.yann.morin.1998@free.fr>
References: <cover.1498859395.git.yann.morin.1998@free.fr>
Message-ID: <c4b411e196cee9c906ade5991e24367a7b506224.1498859395.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Move it to the top-level tools/ directory, so that it is easier to
find for users.

Add a legacy symlink for those users who already used them, so as
not to break their habits.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
 docs/manual/contribute.txt                    |  2 +-
 support/scripts/get-developers                | 84 +--------------------------
 tools/get-developers                          | 83 ++++++++++++++++++++++++++
 {support/scripts => tools}/getdeveloperlib.py |  0
 tools/readme.txt                              |  5 ++
 5 files changed, 90 insertions(+), 84 deletions(-)
 mode change 100755 => 120000 support/scripts/get-developers
 create mode 100755 tools/get-developers
 rename {support/scripts => tools}/getdeveloperlib.py (100%)

diff --git a/docs/manual/contribute.txt b/docs/manual/contribute.txt
index 719032bcc4..c10587726c 100644
--- a/docs/manual/contribute.txt
+++ b/docs/manual/contribute.txt
@@ -295,7 +295,7 @@ information). This tool reads your patches and outputs the appropriate
 +git send-email+ command to use:
 
 ---------------------
-$ ./support/scripts/get-developers outgoing/*
+$ ./tools/get-developers outgoing/*
 ---------------------
 
 Use the output of +get-developers+ to send your patches:
diff --git a/support/scripts/get-developers b/support/scripts/get-developers
deleted file mode 100755
index 40ed08ffe1..0000000000
--- a/support/scripts/get-developers
+++ /dev/null
@@ -1,83 +0,0 @@
-#!/usr/bin/env python
-
-import argparse
-import getdeveloperlib
-
-def parse_args():
-    parser = argparse.ArgumentParser()
-    parser.add_argument('patches', metavar='P', type=argparse.FileType('r'), nargs='*',
-                        help='list of patches (use - to read patches from stdin)')
-    parser.add_argument('-a', dest='architecture', action='store',
-                        help='find developers in charge of this architecture')
-    parser.add_argument('-p', dest='package', action='store',
-                        help='find developers in charge of this package')
-    parser.add_argument('-c', dest='check', action='store_const',
-                        const=True, help='list files not handled by any developer')
-    return parser.parse_args()
-
-def __main__():
-    devs = getdeveloperlib.parse_developers()
-    if devs is None:
-        sys.exit(1)
-    args = parse_args()
-
-    # Check that only one action is given
-    action = 0
-    if args.architecture is not None:
-        action += 1
-    if args.package is not None:
-        action += 1
-    if args.check:
-        action += 1
-    if len(args.patches) != 0:
-        action += 1
-    if action > 1:
-        print("Cannot do more than one action")
-        return
-    if action == 0:
-        print("No action specified")
-        return
-
-    # Handle the check action
-    if args.check:
-        files = getdeveloperlib.check_developers(devs)
-        for f in files:
-            print(f)
-
-    # Handle the architecture action
-    if args.architecture is not None:
-        for dev in devs:
-            if args.architecture in dev.architectures:
-                print(dev.name)
-        return
-
-    # Handle the package action
-    if args.package is not None:
-        for dev in devs:
-            if args.package in dev.packages:
-                print(dev.name)
-        return
-
-    # Handle the patches action
-    if len(args.patches) != 0:
-        (files, infras) = getdeveloperlib.analyze_patches(args.patches)
-        matching_devs = set()
-        for dev in devs:
-            # See if we have developers matching by package name
-            for f in files:
-                if dev.hasfile(f):
-                    matching_devs.add(dev.name)
-            # See if we have developers matching by package infra
-            for i in infras:
-                if i in dev.infras:
-                    matching_devs.add(dev.name)
-
-        result = "--to buildroot at buildroot.org"
-        for dev in matching_devs:
-            result += " --cc \"%s\"" % dev
-
-        if result != "":
-            print("git send-email %s" % result)
-
-__main__()
-
diff --git a/support/scripts/get-developers b/support/scripts/get-developers
new file mode 120000
index 0000000000..7209567e15
--- /dev/null
+++ b/support/scripts/get-developers
@@ -0,0 +1 @@
+../../tools/get-developers
\ No newline at end of file
diff --git a/tools/get-developers b/tools/get-developers
new file mode 100755
index 0000000000..40ed08ffe1
--- /dev/null
+++ b/tools/get-developers
@@ -0,0 +1,83 @@
+#!/usr/bin/env python
+
+import argparse
+import getdeveloperlib
+
+def parse_args():
+    parser = argparse.ArgumentParser()
+    parser.add_argument('patches', metavar='P', type=argparse.FileType('r'), nargs='*',
+                        help='list of patches (use - to read patches from stdin)')
+    parser.add_argument('-a', dest='architecture', action='store',
+                        help='find developers in charge of this architecture')
+    parser.add_argument('-p', dest='package', action='store',
+                        help='find developers in charge of this package')
+    parser.add_argument('-c', dest='check', action='store_const',
+                        const=True, help='list files not handled by any developer')
+    return parser.parse_args()
+
+def __main__():
+    devs = getdeveloperlib.parse_developers()
+    if devs is None:
+        sys.exit(1)
+    args = parse_args()
+
+    # Check that only one action is given
+    action = 0
+    if args.architecture is not None:
+        action += 1
+    if args.package is not None:
+        action += 1
+    if args.check:
+        action += 1
+    if len(args.patches) != 0:
+        action += 1
+    if action > 1:
+        print("Cannot do more than one action")
+        return
+    if action == 0:
+        print("No action specified")
+        return
+
+    # Handle the check action
+    if args.check:
+        files = getdeveloperlib.check_developers(devs)
+        for f in files:
+            print(f)
+
+    # Handle the architecture action
+    if args.architecture is not None:
+        for dev in devs:
+            if args.architecture in dev.architectures:
+                print(dev.name)
+        return
+
+    # Handle the package action
+    if args.package is not None:
+        for dev in devs:
+            if args.package in dev.packages:
+                print(dev.name)
+        return
+
+    # Handle the patches action
+    if len(args.patches) != 0:
+        (files, infras) = getdeveloperlib.analyze_patches(args.patches)
+        matching_devs = set()
+        for dev in devs:
+            # See if we have developers matching by package name
+            for f in files:
+                if dev.hasfile(f):
+                    matching_devs.add(dev.name)
+            # See if we have developers matching by package infra
+            for i in infras:
+                if i in dev.infras:
+                    matching_devs.add(dev.name)
+
+        result = "--to buildroot at buildroot.org"
+        for dev in matching_devs:
+            result += " --cc \"%s\"" % dev
+
+        if result != "":
+            print("git send-email %s" % result)
+
+__main__()
+
diff --git a/support/scripts/getdeveloperlib.py b/tools/getdeveloperlib.py
similarity index 100%
rename from support/scripts/getdeveloperlib.py
rename to tools/getdeveloperlib.py
diff --git a/tools/readme.txt b/tools/readme.txt
index 3a5ca9fb33..151e1f1c8e 100644
--- a/tools/readme.txt
+++ b/tools/readme.txt
@@ -8,6 +8,11 @@ brmake
     ("'br.log' in the current directory), and just outputs the Buildroot
     messages (those lines starting with >>>) on stdout.
 
+get-developpers
+    a script to return the list of people interested in a specific part
+    of Buildroot, so they can be Cc:ed on a mail. Accepts a patch as
+    input, a package name or and architecture name.
+
 test-pkg
     a script that tests a specific package against a set of various
     toolchains, with the goal to detect toolchain-related dependencies
-- 
2.11.0
