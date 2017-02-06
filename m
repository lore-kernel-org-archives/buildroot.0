From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Feb 2017 12:28:00 +0100
Subject: [Buildroot] [git commit] graph-depends: split off get_rdepends from
	get_depends
Message-ID: <20170206113329.9B1777FF9C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=412e6c80ad56181546f29f2add405fa595116271
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The use of a 'rule' variable that can contain 'show-depends' or
'show-rdepends' is not logical if get_depends is considered as a reusable
function from various scripts. The name of these rules are too much an
implementation detail.

Therefore, split the existing get_depends into two separate functions
get_depends and get_rdepends, while keeping code duplication to a minimum.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/scripts/graph-depends |  6 +++---
 support/scripts/pkgutil.py    | 17 +++++++++++++----
 2 files changed, 16 insertions(+), 7 deletions(-)

diff --git a/support/scripts/graph-depends b/support/scripts/graph-depends
index 7aedcb5..fbd5917 100755
--- a/support/scripts/graph-depends
+++ b/support/scripts/graph-depends
@@ -102,13 +102,13 @@ else:
 transitive = args.transitive
 
 if args.direct:
-    rule = "show-depends"
+    get_depends_func = pkgutil.get_depends
     arrow_dir = "forward"
 else:
     if mode == MODE_FULL:
         sys.stderr.write("--reverse needs a package\n")
         sys.exit(1)
-    rule = "show-rdepends"
+    get_depends_func = pkgutil.get_rdepends
     arrow_dir = "back"
 
 # Get the colours: we need exactly three colours,
@@ -157,7 +157,7 @@ def get_all_depends(pkgs):
     if len(filtered_pkgs) == 0:
         return []
 
-    depends = pkgutil.get_depends(filtered_pkgs, rule)
+    depends = get_depends_func(filtered_pkgs)
 
     deps = set()
     for pkg in filtered_pkgs:
diff --git a/support/scripts/pkgutil.py b/support/scripts/pkgutil.py
index 46af4b5..a0e2352 100644
--- a/support/scripts/pkgutil.py
+++ b/support/scripts/pkgutil.py
@@ -25,10 +25,7 @@ def get_version(pkgs):
         version[pkg] = output[i]
     return version
 
-# Execute the "make <pkg>-show-depends" command to get the list of
-# dependencies of a given list of packages, and return the list of
-# dependencies formatted as a Python dictionary.
-def get_depends(pkgs, rule):
+def _get_depends(pkgs, rule):
     sys.stderr.write("Getting dependencies for %s\n" % pkgs)
     cmd = ["make", "-s", "--no-print-directory" ]
     for pkg in pkgs:
@@ -51,3 +48,15 @@ def get_depends(pkgs, rule):
         else:
             deps[pkg] = pkg_deps
     return deps
+
+# Execute the "make <pkg>-show-depends" command to get the list of
+# dependencies of a given list of packages, and return the list of
+# dependencies formatted as a Python dictionary.
+def get_depends(pkgs):
+    return _get_depends(pkgs, 'show-depends')
+
+# Execute the "make <pkg>-show-rdepends" command to get the list of
+# reverse dependencies of a given list of packages, and return the
+# list of dependencies formatted as a Python dictionary.
+def get_rdepends(pkgs):
+    return _get_depends(pkgs, 'show-rdepends')
