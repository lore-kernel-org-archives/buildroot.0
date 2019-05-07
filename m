From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 7 May 2019 23:03:41 +0200
Subject: [Buildroot] [git commit] support/scripts: use show-info to extract
 dependency graph
Message-ID: <20190507210158.48021815D1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d901aa32d5c75b16e3ba08b20b12dc9858a68512
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, we extract the dependency graph from the aptly named but
ad-hoc show-dependency-graph rule.

We now have a better solution to report package information, with
show-info.

Since show-dependency-graph never went into a release so far, and
show-info does provide the same (and more), switch to using show-info.

Thanks to Adam for suggesting the coding style to have a readable code
that is not ugly but still pleases flake8. Thanks to Arnout for
suggesting the use of dict.get() to further simplify the code.

Note: we do not use the reverse_dependencies field because it only
contains those packages that have a kconfig option, so we'd miss most
host packages.

Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Cc: Adam Duskett <aduskett@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/scripts/brpkgutil.py | 31 +++++++++++++++----------------
 1 file changed, 15 insertions(+), 16 deletions(-)

diff --git a/support/scripts/brpkgutil.py b/support/scripts/brpkgutil.py
index f65068d348..73d8fbe931 100644
--- a/support/scripts/brpkgutil.py
+++ b/support/scripts/brpkgutil.py
@@ -1,6 +1,7 @@
 # Copyright (C) 2010-2013 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 # Copyright (C) 2019 Yann E. MORIN <yann.morin.1998@free.fr>
 
+import json
 import logging
 import os
 import subprocess
@@ -19,7 +20,7 @@ from collections import defaultdict
 def get_dependency_tree():
     logging.info("Getting dependency tree...")
 
-    deps = defaultdict(list)
+    deps = {}
     rdeps = defaultdict(list)
     types = {}
     versions = {}
@@ -29,23 +30,21 @@ def get_dependency_tree():
     types['all'] = 'target'
     versions['all'] = ''
 
-    cmd = ["make", "-s", "--no-print-directory", "show-dependency-tree"]
+    cmd = ["make", "-s", "--no-print-directory", "show-info"]
     with open(os.devnull, 'wb') as devnull:
         p = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=devnull,
                              universal_newlines=True)
-        output = p.communicate()[0]
-
-    for l in output.splitlines():
-        if " -> " in l:
-            pkg = l.split(" -> ")[0]
-            deps[pkg] += l.split(" -> ")[1].split()
-            for p in l.split(" -> ")[1].split():
-                rdeps[p].append(pkg)
-        else:
-            pkg, type_version = l.split(": ", 1)
-            t, v = "{} -".format(type_version).split(None, 2)[:2]
-            deps['all'].append(pkg)
-            types[pkg] = t
-            versions[pkg] = v
+        pkg_list = json.loads(p.communicate()[0])
+
+    for pkg in pkg_list:
+        deps['all'].append(pkg)
+        types[pkg] = pkg_list[pkg]["type"]
+        deps[pkg] = pkg_list[pkg].get("dependencies", [])
+        for p in deps[pkg]:
+            rdeps[p].append(pkg)
+        versions[pkg] = \
+            None if pkg_list[pkg]["type"] == "rootfs" \
+            else "virtual" if pkg_list[pkg]["virtual"] \
+            else pkg_list[pkg]["version"]
 
     return (deps, rdeps, types, versions)
