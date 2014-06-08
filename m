From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  8 Jun 2014 16:03:51 +0200
Subject: [Buildroot] [PATCH 7/9] graph-depends: rename the mode constants
In-Reply-To: <cover.1402236171.git.yann.morin.1998@free.fr>
References: <cover.1402236171.git.yann.morin.1998@free.fr>
Message-ID: <f7994edb742df53009feb99756b24253799cdde7.1402236171.git.yann.morin.1998@free.fr>
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
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Cc: Samuel Martin <s.martin49@gmail.com>
---
 support/scripts/graph-depends | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/support/scripts/graph-depends b/support/scripts/graph-depends
index 07b9c22..42a42a8 100755
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
@@ -58,9 +54,9 @@ parser.add_argument("--no-transitive", dest="transitive", action='store_false',
 args = parser.parse_args()
 
 if args.package is None:
-    mode = FULL_MODE
+    mode = MODE_FULL
 else:
-    mode = PKG_MODE
+    mode = MODE_PKG
     rootpkg = args.package
 
 max_depth = args.depth
@@ -183,7 +179,7 @@ TARGET_EXCEPTIONS = [
 
 # In full mode, start with the result of get_targets() to get the main
 # targets and then use get_all_depends() for all targets
-if mode == FULL_MODE:
+if mode == MODE_FULL:
     targets = get_targets()
     dependencies = []
     allpkgs.append('all')
@@ -201,7 +197,7 @@ if mode == FULL_MODE:
 
 # In pkg mode, start directly with get_all_depends() on the requested
 # package
-elif mode == PKG_MODE:
+elif mode == MODE_PKG:
     dependencies = get_all_depends([rootpkg])
 
 # Make the dependencies a dictionnary { 'pkg':[dep1, dep2, ...] }
@@ -269,7 +265,7 @@ def print_attrs(pkg):
         label = 'ALL'
     else:
         label = pkg
-    if pkg == 'all' or (mode == PKG_MODE and pkg == rootpkg):
+    if pkg == 'all' or (mode == MODE_PKG and pkg == rootpkg):
         color = root_colour
     else:
         if pkg.startswith('host') \
-- 
1.8.3.2
