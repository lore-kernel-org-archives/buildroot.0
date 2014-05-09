From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri,  9 May 2014 16:58:22 +0200
Subject: [Buildroot] [PATCH 2/7] graphs-depends: merge
	redundant-dependencies elimination
In-Reply-To: <cover.1399647182.git.yann.morin.1998@free.fr>
References: <cover.1399647182.git.yann.morin.1998@free.fr>
Message-ID: <4a15f0ed27023e57a56903bd86f155c4099b87eb.1399647182.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Merge the redundant-dependencies elimination into the newly introduced
transitive-dependencies elimination.

This makes the code cleaner and much shorter, because:

  - the ('all',pkg) redundant dependency is in fact a transitive
    dependency, and we now have code to deal with that

  - the (pkg,'toolchain') dependency is easy enough to deal with that
    having a separate function for that is overkill

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 support/scripts/graph-depends | 46 +++++++++----------------------------------
 1 file changed, 9 insertions(+), 37 deletions(-)

diff --git a/support/scripts/graph-depends b/support/scripts/graph-depends
index 157a3f9..5bfbc64 100755
--- a/support/scripts/graph-depends
+++ b/support/scripts/graph-depends
@@ -146,40 +146,6 @@ def get_all_depends(pkgs):
 def pkg_node_name(pkg):
     return pkg.replace("-","")
 
-# Helper function for remove_redundant_deps(). This function tells
-# whether package "pkg" is the dependency of another package that is
-# not the special "all" package.
-def has_redundant_deps(deps, pkg):
-    for dep in deps:
-        if dep[0] != "all" and dep[1] == pkg:
-            return True
-    return False
-
-# This function removes redundant dependencies of the special "all"
-# package. This "all" package is created to reflect the origin of the
-# selection for all packages that are not themselves selected by any
-# other package. So for example if you enable libpng, zlib is enabled
-# as a dependency. But zlib being selected by libpng, it also appears
-# as a dependency of the "all" package. This needlessly complicates
-# the generated dependency graph. So when we have the dependency list
-# (all -> zlib, all -> libpn, libpng -> zlib), we get rid of the 'all
-# -> zlib' dependency, because zlib is already a dependency of a
-# regular package.
-def remove_redundant_deps(deps):
-    newdeps = []
-    for dep in deps:
-        if dep[0] == "all" and dep[1] == "toolchain":
-            newdeps.append(dep)
-            continue
-        if dep[0] != "all" and dep[1] != "toolchain":
-            newdeps.append(dep)
-            continue
-        if not has_redundant_deps(deps, dep[1]):
-            newdeps.append(dep)
-            continue
-        sys.stderr.write("Removing redundant dep %s -> %s\n" % (dep[0],dep[1]))
-    return newdeps
-
 TARGET_EXCEPTIONS = [
     "target-generic-securetty",
     "target-generic-issue",
@@ -217,8 +183,6 @@ if mode == FULL_MODE:
 elif mode == PKG_MODE:
     dependencies = get_all_depends([rootpkg])
 
-dependencies = remove_redundant_deps(dependencies)
-
 # Make the dependencies a dictionnary { 'pkg':[dep1, dep2, ...] }
 dict_deps = {}
 for dep in dependencies:
@@ -260,10 +224,18 @@ def remove_transitive_deps(pkg,deps):
             new_d.append(d[i])
     return new_d
 
+# This function removes the dependency on the 'toolchain' package
+def remove_toolchain_deps(pkg,deps):
+    return [p for p in deps[pkg] if not p == 'toolchain']
+
 # This functions trims down the dependency list of all packages.
+# It applies in sequence all the dependency-elimination methods.
 def remove_extra_deps(deps):
     for pkg in deps.keys():
-        if not transitive:
+        if not pkg == 'all':
+            deps[pkg] = remove_toolchain_deps(pkg,deps)
+    for pkg in deps.keys():
+        if not transitive or pkg == 'all':
             deps[pkg] = remove_transitive_deps(pkg,deps)
     return deps
 
-- 
1.8.3.2
