From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  2 Jan 2013 18:08:50 +0100
Subject: [Buildroot] [PATCH 3/6] graph-depends: optimize execution speed
In-Reply-To: <cover.1357146432.git.thomas.petazzoni@free-electrons.com>
References: <cover.1357146432.git.thomas.petazzoni@free-electrons.com>
Message-ID: <8cf3d66e7ad1cc78e2de8ddeef2c5527762c8cdd.1357146432.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Until now, graph-depends was calling "make <pkg>-show-depends"
individually for eack package, which was very slow. Now, it calls
"make <pkg1>-show-depends <pkg2>-show-depends ... <pkgN>-show-depends"
for all packages it knows, and then does that recursively. It reduces
the number of make invocations to the deepest dependency chain in the
current configuration, instead of having a number of make invocations
equal to the number of enabled packages.

For a configuration with xvkbd enabled (which brings a significant
number of X.org dependencies) and a tar root filesystem, the time to
execute graph-depends was:

real	5m14.944s
user	4m53.590s
sys	0m14.069s

After our optimizations, it is now:

real	0m33.096s
user	0m30.878s
sys	0m1.472s

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
Note that the script becomes a bit tricky. It would be nice to have
some careful testing (beware: output of the script before and after
the optimization cannot be directly compared, as dependencies are not
examined in the same order) or even better careful review.
---
 support/scripts/graph-depends |  116 +++++++++++++++++++++++++----------------
 1 file changed, 71 insertions(+), 45 deletions(-)

diff --git a/support/scripts/graph-depends b/support/scripts/graph-depends
index d5ef6e0..c168fc4 100755
--- a/support/scripts/graph-depends
+++ b/support/scripts/graph-depends
@@ -63,52 +63,76 @@ def get_targets():
     return output.split(' ')
 
 # Execute the "make <pkg>-show-depends" command to get the list of
-# dependencies of a given package, and return the list of dependencies
-# formatted as a Python list.
-def get_depends(pkg):
-    sys.stderr.write("Getting dependencies for %s\n" % pkg)
-    cmd = ["make", "-s", "%s-show-depends" % pkg]
+# dependencies of a given list of packages, and return the list of
+# dependencies formatted as a Python dictionary.
+def get_depends(pkgs):
+    sys.stderr.write("Getting dependencies for %s\n" % pkgs)
+    cmd = ["make", "-s" ]
+    for pkg in pkgs:
+        cmd.append("%s-show-depends" % pkg)
     p = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
-    output = p.communicate()[0].strip()
+    output = p.communicate()[0]
     if p.returncode != 0:
-        return None
-    if output == '':
-        return []
-    return output.split(' ')
+        sys.stderr.write("Error getting dependencies %s\n" % pkgs)
+        sys.exit(1)
+    output = output.split("\n")
+    if len(output) != len(pkgs) + 1:
+        sys.stderr.write("Error getting dependencies\n")
+        sys.exit(1)
+    deps = {}
+    for i in range(0, len(pkgs)):
+        pkg = pkgs[i]
+        pkg_deps = output[i].split(" ")
+        if pkg_deps == ['']:
+            deps[pkg] = []
+        else:
+            deps[pkg] = pkg_deps
+    return deps
 
 # Recursive function that builds the tree of dependencies for a given
-# package. The dependencies are built in a list called 'dependencies',
-# which contains tuples of the form (pkg1 ->
-# pkg2_on_which_pkg1_depends) and the function finally returns this
-# list.
-def get_all_depends(pkg):
+# list of packages. The dependencies are built in a list called
+# 'dependencies', which contains tuples of the form (pkg1 ->
+# pkg2_on_which_pkg1_depends, pkg3 -> pkg4_on_which_pkg3_depends) and
+# the function finally returns this list.
+def get_all_depends(pkgs):
     dependencies = []
 
-    # We already have the dependencies for this package
-    if pkg in allpkgs:
-        return
-    allpkgs.append(pkg)
-    depends = get_depends(pkg)
-
-    # We couldn't get the dependencies of this package, because it
-    # doesn't use the generic or autotools infrastructure. Add it to
-    # unknownpkgs so that it is later rendered in red color to warn
-    # the user.
-    if depends == None:
-        unknownpkgs.append(pkg)
-        return
-
-    # This package has no dependency.
-    if depends == []:
-        return
-
-    # Add dependencies to the list of dependencies
-    for dep in depends:
-        dependencies.append((pkg, dep))
-
-    # Recurse into the dependencies
-    for dep in depends:
-        newdeps = get_all_depends(dep)
+    # Filter the packages for which we already have the dependencies
+    filtered_pkgs = []
+    for pkg in pkgs:
+        if pkg in allpkgs:
+            continue
+        filtered_pkgs.append(pkg)
+        allpkgs.append(pkg)
+
+    if len(filtered_pkgs) == 0:
+        return []
+
+    depends = get_depends(filtered_pkgs)
+
+    deps = set()
+    for pkg in filtered_pkgs:
+        pkg_deps = depends[pkg]
+
+        # We couldn't get the dependencies of this package, because it
+        # doesn't use the generic or autotools infrastructure. Add it to
+        # unknownpkgs so that it is later rendered in red color to warn
+        # the user.
+        if pkg_deps == None:
+            unknownpkgs.append(pkg)
+            continue
+
+        # This package has no dependency.
+        if pkg_deps == []:
+            continue
+
+        # Add dependencies to the list of dependencies
+        for dep in pkg_deps:
+            dependencies.append((pkg, dep))
+            deps.add(dep)
+
+    if len(deps) != 0:
+        newdeps = get_all_depends(deps)
         if newdeps != None:
             dependencies += newdeps
 
@@ -160,24 +184,26 @@ TARGET_EXCEPTIONS = [
 ]
 
 # In full mode, start with the result of get_targets() to get the main
-# targets and then use get_all_depends() for each individual target.
+# targets and then use get_all_depends() for all targets
 if mode == FULL_MODE:
     targets = get_targets()
     dependencies = []
     allpkgs.append('all')
+    filtered_targets = []
     for tg in targets:
         # Skip uninteresting targets
         if tg in TARGET_EXCEPTIONS:
             continue
         dependencies.append(('all', tg))
-        deps = get_all_depends(tg)
-        if deps != None:
-            dependencies += deps
+        filtered_targets.append(tg)
+    deps = get_all_depends(filtered_targets)
+    if deps != None:
+        dependencies += deps
 
 # In pkg mode, start directly with get_all_depends() on the requested
 # package
 elif mode == PKG_MODE:
-    dependencies = get_all_depends(rootpkg)
+    dependencies = get_all_depends([rootpkg])
 
 dependencies = remove_redundant_deps(dependencies)
 
-- 
1.7.9.5
