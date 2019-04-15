From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 15 Apr 2019 21:47:33 +0200
Subject: [Buildroot] [PATCH 11/12 v3] support/scripts: use show-info to
 extract dependency graph
In-Reply-To: <cover.1555357644.git.yann.morin.1998@free.fr>
References: <cover.1555357644.git.yann.morin.1998@free.fr>
Message-ID: <cd1c2cccd0a2d39ba4ab7277d09ae0364ffa17f8.1555357645.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, we extract the dependency graph from the aptly named but
ad-hoc show-dependency-graph rule.

We now have a better solution to report package information, with
show-info.

Since show-dependency-graph never went into a release so far, and
show-info does provide the same (and more), swith to using show-info.

Thanks to Adam for suggesting the coding style to have a readable code
that is not ugly but still pleases flake8. Thanks to Arnout for
suggesting the use of dict.get() to further simplify the code.

Note: we do not use th reverse_dependencies field because it only
contains those packages that have a kconfig option, so we'd miss most
host packages.

Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Cc: Adam Duskett <aduskett@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
 support/scripts/brpkgutil.py | 30 ++++++++++++++----------------
 1 file changed, 14 insertions(+), 16 deletions(-)

diff --git a/support/scripts/brpkgutil.py b/support/scripts/brpkgutil.py
index f65068d348..780cdef49c 100644
--- a/support/scripts/brpkgutil.py
+++ b/support/scripts/brpkgutil.py
@@ -1,12 +1,12 @@
 # Copyright (C) 2010-2013 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 # Copyright (C) 2019 Yann E. MORIN <yann.morin.1998@free.fr>
 
+import json
 import logging
 import os
 import subprocess
 from collections import defaultdict
 
-
 # This function returns a tuple of four dictionaries, all using package
 # names as keys:
 # - a dictionary which values are the lists of packages that are the
@@ -19,7 +19,7 @@ from collections import defaultdict
 def get_dependency_tree():
     logging.info("Getting dependency tree...")
 
-    deps = defaultdict(list)
+    deps = {}
     rdeps = defaultdict(list)
     types = {}
     versions = {}
@@ -29,23 +29,21 @@ def get_dependency_tree():
     types['all'] = 'target'
     versions['all'] = ''
 
-    cmd = ["make", "-s", "--no-print-directory", "show-dependency-tree"]
+    cmd = ["make", "-s", "--no-print-directory", "show-info"]
     with open(os.devnull, 'wb') as devnull:
         p = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=devnull,
                              universal_newlines=True)
-        output = p.communicate()[0]
+        pkg_list = json.loads(p.communicate()[0])
 
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
-- 
2.14.1
