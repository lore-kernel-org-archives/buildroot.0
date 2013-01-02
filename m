From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  2 Jan 2013 18:08:53 +0100
Subject: [Buildroot] [PATCH 6/6] graph-depends: remove support for "unknown"
	packages
In-Reply-To: <cover.1357146432.git.thomas.petazzoni@free-electrons.com>
References: <cover.1357146432.git.thomas.petazzoni@free-electrons.com>
Message-ID: <99c288aaaa42b38f2c841abbf2db0fff1e228656.1357146432.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The "unknown" packages mechanism was used to render packages that did
not implement the make <pkg>-show-depends target, i.e the packages
that were not yet converted to one of the package infrastructures.

Since now all packages have been converted, we can remove this
"unknown" packages feature.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/scripts/graph-depends |   13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/support/scripts/graph-depends b/support/scripts/graph-depends
index 0658b77..556f11d 100755
--- a/support/scripts/graph-depends
+++ b/support/scripts/graph-depends
@@ -41,7 +41,6 @@ else:
     sys.exit(1)
 
 allpkgs = []
-unknownpkgs = []
 
 # Execute the "make show-targets" command to get the list of the main
 # Buildroot TARGETS and return it formatted as a Python list. This
@@ -109,14 +108,6 @@ def get_all_depends(pkgs):
     for pkg in filtered_pkgs:
         pkg_deps = depends[pkg]
 
-        # We couldn't get the dependencies of this package, because it
-        # doesn't use the generic or autotools infrastructure. Add it to
-        # unknownpkgs so that it is later rendered in red color to warn
-        # the user.
-        if pkg_deps == None:
-            unknownpkgs.append(pkg)
-            continue
-
         # This package has no dependency.
         if pkg_deps == []:
             continue
@@ -219,9 +210,7 @@ for pkg in allpkgs:
 
     print "%s [label = \"%s\"]" % (pkg_node_name(pkg), pkg)
 
-    if pkg in unknownpkgs:
-        print "%s [color=red,style=filled]" % pkg_node_name(pkg)
-    elif mode == PKG_MODE and pkg == rootpkg:
+    if mode == PKG_MODE and pkg == rootpkg:
         print "%s [color=lightblue,style=filled]" % pkg_node_name(rootpkg)
     else:
         print "%s [color=grey,style=filled]" % pkg_node_name(pkg)
-- 
1.7.9.5
