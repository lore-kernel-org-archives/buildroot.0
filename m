From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 25 Mar 2019 19:29:11 +0100
Subject: [Buildroot] [git commit] support/graph-depends: don't eliminate
 mandatory deps for reverse graphs
Message-ID: <20190325183004.1321683CDB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=893dde0102af0718fec3f02d81ef205ba2fbe23f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We we simplify the dependency graph, we try to remove so-called
mandatory dependencies from each package, and for each mandatory that
was thus removed, reattach it to the root-package of the graph.

This was made so that mandatory dependencies (which are dependencies of
all packages, or at least of a lot of packages) do not clutter the
dependency graph, but that they are still shown in the graph, as
dependencies of the root package.

However, these mandatory dependencies are only _direct_ dependencies.
As such, it does not make sense to reattach a mandatory dependency when
doing a reverse graph. Worse, it can actually be incorrect.

For example, 'skeleton' is a mandatory dependency, and as such is
removed from all packages. But when doing a reverse graph, skeleton is
now in the dependency chain of, e.g. skeleton-init-none; it should then
not be removed.

In short: the notion of mandatory dependencies does not make sense in
the case of a reverse graph.

Consequently, skip over the mandatory dependency removal when doing a
reverse graph.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/graph-depends | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/support/scripts/graph-depends b/support/scripts/graph-depends
index 29134c8237..7ed28440bb 100755
--- a/support/scripts/graph-depends
+++ b/support/scripts/graph-depends
@@ -216,13 +216,17 @@ def check_circular_deps(deps):
 
 # This functions trims down the dependency list of all packages.
 # It applies in sequence all the dependency-elimination methods.
-def remove_extra_deps(deps, rootpkg, transitive):
-    for pkg in list(deps.keys()):
-        if not pkg == rootpkg:
-            for d in get_mandatory_deps(pkg, deps):
-                if d not in deps[rootpkg]:
-                    deps[rootpkg].append(d)
-            deps[pkg] = remove_mandatory_deps(pkg, deps)
+def remove_extra_deps(deps, rootpkg, transitive, arrow_dir):
+    # For the direct dependencies, find and eliminate mandatory
+    # deps, and add them to the root package. Don't do it for a
+    # reverse graph, because mandatory deps are only direct deps.
+    if arrow_dir == "forward":
+        for pkg in list(deps.keys()):
+            if not pkg == rootpkg:
+                for d in get_mandatory_deps(pkg, deps):
+                    if d not in deps[rootpkg]:
+                        deps[rootpkg].append(d)
+                deps[pkg] = remove_mandatory_deps(pkg, deps)
     for pkg in list(deps.keys()):
         if not transitive or pkg == rootpkg:
             deps[pkg] = remove_transitive_deps(pkg, deps)
@@ -420,7 +424,7 @@ def main():
     if check_only:
         sys.exit(0)
 
-    dict_deps = remove_extra_deps(dict_deps, rootpkg, args.transitive)
+    dict_deps = remove_extra_deps(dict_deps, rootpkg, args.transitive, arrow_dir)
     dict_version = brpkgutil.get_version([pkg for pkg in allpkgs
                                           if pkg != "all" and not pkg.startswith("root")])
 
