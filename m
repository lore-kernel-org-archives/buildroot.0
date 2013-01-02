From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 2 Jan 2013 19:00:04 +0100
Subject: [Buildroot] [git commit] graph-depends: remove support for
	"unknown" packages
Message-ID: <20130102200335.398509A5C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1063539c536662f95a0bb14b70b2db7396602564
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The "unknown" packages mechanism was used to render packages that did
not implement the make <pkg>-show-depends target, i.e the packages
that were not yet converted to one of the package infrastructures.

Since now all packages have been converted, we can remove this
"unknown" packages feature.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 support/scripts/graph-depends |   13 +------------
 1 files changed, 1 insertions(+), 12 deletions(-)

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
