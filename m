From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 31 Mar 2015 23:52:31 +0200
Subject: [Buildroot] [git commit] support/graph-depends: accepts globs to
	stop on package
Message-ID: <20150331220030.6C7D07F980@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=979267e8f7676a5eff216d35fd119db7d5432e32
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Francois Perrad <fperrad@gmail.com>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/scripts/graph-depends |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/support/scripts/graph-depends b/support/scripts/graph-depends
index 93844c7..b0202e6 100755
--- a/support/scripts/graph-depends
+++ b/support/scripts/graph-depends
@@ -24,6 +24,7 @@
 import sys
 import subprocess
 import argparse
+from fnmatch import fnmatch
 
 # Modes of operation:
 MODE_FULL = 1   # draw full dependency graph for all selected packages
@@ -43,6 +44,7 @@ parser.add_argument("--depth", '-d', metavar="DEPTH", dest="depth", type=int, de
                     help="Limit the dependency graph to DEPTH levels; 0 means no limit.")
 parser.add_argument("--stop-on", "-s", metavar="PACKAGE", dest="stop_list", action="append",
                     help="Do not graph past this package (can be given multiple times)." \
+                       + " Can be a package name or a glob, or" \
                        + " 'virtual' to stop on virtual packages.")
 parser.add_argument("--colours", "-c", metavar="COLOR_LIST", dest="colours",
                     default="lightblue,grey,gainsboro",
@@ -312,8 +314,9 @@ def print_pkg_deps(depth, pkg):
     print_attrs(pkg)
     if pkg not in dict_deps:
         return
-    if pkg in stop_list:
-        return
+    for p in stop_list:
+        if fnmatch(pkg, p):
+            return
     if dict_version.get(pkg) == "virtual" and "virtual" in stop_list:
         return
     if max_depth == 0 or depth < max_depth:
