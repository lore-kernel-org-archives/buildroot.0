From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 31 Mar 2017 00:43:18 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] graph-depends: rename
	pkgutil.py to brpkgutil.py
Message-ID: <20170331071606.588E78226E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ac75d32ae79aed38e003361503a601edad384d23
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

pkgutil.py is also part of Python itself. Placing pkgutil.py as is
in a folder with other scripts that require original pkgutil will
break them. This is the case with scanpypi. So rename pkgutil.py
to brpkgutil.py to avoid naming collision.

Fixes: https://bugs.busybox.net/show_bug.cgi?id=9766

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 3b627c89dc8adf8c60efd773935bf66004e8433d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/scripts/{pkgutil.py => brpkgutil.py} | 0
 support/scripts/graph-depends                | 8 ++++----
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/support/scripts/pkgutil.py b/support/scripts/brpkgutil.py
similarity index 100%
rename from support/scripts/pkgutil.py
rename to support/scripts/brpkgutil.py
diff --git a/support/scripts/graph-depends b/support/scripts/graph-depends
index fbd5917..b258c56 100755
--- a/support/scripts/graph-depends
+++ b/support/scripts/graph-depends
@@ -26,7 +26,7 @@ import subprocess
 import argparse
 from fnmatch import fnmatch
 
-import pkgutil
+import brpkgutil
 
 # Modes of operation:
 MODE_FULL = 1   # draw full dependency graph for all selected packages
@@ -102,13 +102,13 @@ else:
 transitive = args.transitive
 
 if args.direct:
-    get_depends_func = pkgutil.get_depends
+    get_depends_func = brpkgutil.get_depends
     arrow_dir = "forward"
 else:
     if mode == MODE_FULL:
         sys.stderr.write("--reverse needs a package\n")
         sys.exit(1)
-    get_depends_func = pkgutil.get_rdepends
+    get_depends_func = brpkgutil.get_rdepends
     arrow_dir = "back"
 
 # Get the colours: we need exactly three colours,
@@ -330,7 +330,7 @@ if check_only:
     sys.exit(0)
 
 dict_deps = remove_extra_deps(dict_deps)
-dict_version = pkgutil.get_version([pkg for pkg in allpkgs
+dict_version = brpkgutil.get_version([pkg for pkg in allpkgs
                                 if pkg != "all" and not pkg.startswith("root")])
 
 # Print the attributes of a node: label and fill-color
