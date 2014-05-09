From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri,  9 May 2014 16:58:25 +0200
Subject: [Buildroot] [PATCH 5/7] graph-depends: rename the mode constants
In-Reply-To: <cover.1399647182.git.yann.morin.1998@free.fr>
References: <cover.1399647182.git.yann.morin.1998@free.fr>
Message-ID: <0d0c04b84d1b891eab25b0a9df223679a00fd95f.1399647182.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

This is ugly, since Python does not have enum constructs, so by moving
the 'type' of the constant ('MODE' here) to the beginning, we get an
artificial 'namespace' for the constants.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 support/scripts/graph-depends | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/support/scripts/graph-depends b/support/scripts/graph-depends
index 3bffec0..328f284 100755
--- a/support/scripts/graph-depends
+++ b/support/scripts/graph-depends
@@ -25,13 +25,9 @@ import sys
 import subprocess
 import argparse
 
-# In FULL_MODE, we draw the full dependency graph for all selected
-# packages
-FULL_MODE = 1
-
-# In PKG_MODE, we only draw the dependency graph for a given package
-PKG_MODE  = 2
-
+# Modes of operation:
+MODE_FULL = 1   # draw full dependency graph for all selected packages
+MODE_PKG  = 2   # draw dependency graph for a given package
 mode = 0
 
 # Limit drawing the dependency graph to this depth. 0 means 'no limit'.
@@ -53,9 +49,9 @@ parser.set_defaults(transitive=True)
 args = parser.parse_args()
 
 if args.package is None:
-    mode = FULL_MODE
+    mode = MODE_FULL
 else:
-    mode = PKG_MODE
+    mode = MODE_PKG
     rootpkg = args.package
 
 max_depth = int(args.depth)
@@ -167,7 +163,7 @@ TARGET_EXCEPTIONS = [
 
 # In full mode, start with the result of get_targets() to get the main
 # targets and then use get_all_depends() for all targets
-if mode == FULL_MODE:
+if mode == MODE_FULL:
     targets = get_targets()
     dependencies = []
     allpkgs.append('all')
@@ -185,7 +181,7 @@ if mode == FULL_MODE:
 
 # In pkg mode, start directly with get_all_depends() on the requested
 # package
-elif mode == PKG_MODE:
+elif mode == MODE_PKG:
     dependencies = get_all_depends([rootpkg])
 
 # Make the dependencies a dictionnary { 'pkg':[dep1, dep2, ...] }
@@ -253,7 +249,7 @@ def print_attrs(pkg):
         print "all [color=lightblue,style=filled]"
         return
     print "%s [label = \"%s\"]" % (pkg_node_name(pkg), pkg)
-    if mode == PKG_MODE and pkg == rootpkg:
+    if mode == MODE_PKG and pkg == rootpkg:
         print "%s [color=lightblue,style=filled]" % pkg_node_name(rootpkg)
     else:
         print "%s [color=grey,style=filled]" % pkg_node_name(pkg)
-- 
1.8.3.2
