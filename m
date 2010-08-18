From: Daniel Hobi <daniel.hobi@schmid-telecom.ch>
Date: Wed, 18 Aug 2010 10:09:56 +0200
Subject: [Buildroot] [PATCH] graph-depends: fix return value of
	get_all_depends
Message-ID: <1282118996-27502-1-git-send-email-daniel.hobi@schmid-telecom.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This simplifies handling of that return value and allows to graph
packages without dependencies in PKG_MODE which was failing with:

Traceback (most recent call last):
  File "scripts/graph-depends", line 150, in <module>
    for dep in set(dependencies):
TypeError: 'NoneType' object is not iterable

Signed-off-by: Daniel Hobi <daniel.hobi@schmid-telecom.ch>
---
 scripts/graph-depends |   14 +++++---------
 1 files changed, 5 insertions(+), 9 deletions(-)

diff --git a/scripts/graph-depends b/scripts/graph-depends
index 4d82282..06d8afa 100755
--- a/scripts/graph-depends
+++ b/scripts/graph-depends
@@ -86,7 +86,7 @@ def get_all_depends(pkg):
 
     # We already have the dependencies for this package
     if pkg in allpkgs:
-        return
+        return dependencies
     allpkgs.append(pkg)
     depends = get_depends(pkg)
 
@@ -96,11 +96,11 @@ def get_all_depends(pkg):
     # the user.
     if depends == None:
         unknownpkgs.append(pkg)
-        return
+        return dependencies
 
     # This package has no dependency.
     if depends == []:
-        return
+        return dependencies
 
     # Add dependencies to the list of dependencies
     for dep in depends:
@@ -108,9 +108,7 @@ def get_all_depends(pkg):
 
     # Recurse into the dependencies
     for dep in depends:
-        newdeps = get_all_depends(dep)
-        if newdeps != None:
-            dependencies += newdeps
+        dependencies += get_all_depends(dep)
 
     return dependencies
 
@@ -133,9 +131,7 @@ if mode == FULL_MODE:
                 tg == 'target-generic-hostname':
             continue
         dependencies.append(('all', tg))
-        deps = get_all_depends(tg)
-        if deps != None:
-            dependencies += deps
+        dependencies += get_all_depends(tg)
 
 # In pkg mode, start directly with get_all_depends() on the requested
 # package
-- 
1.7.2.1
