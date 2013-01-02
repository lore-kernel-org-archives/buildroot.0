From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 2 Jan 2013 18:57:45 +0100
Subject: [Buildroot] [git commit] graph-depends: remove redundant
	dependencies
Message-ID: <20130102200334.17AD09A5B6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2404c0db7f32b5194d5a77c7a8040ad1dbf81a45
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When doing a full graph of the dependencies, graph-depends starts by
doing a "make show-targets", which lists all the packages registered
in the $(TARGETS) variable. This variable contains all packages that
are enabled according to the .config file. Then, for each of those
packages, we used to create a "all" -> "package" dependency, even if
in fact most of some packages are already dependencies of other
packages. This creates a needlessly complex dependency graph.

This patch modifies graph-depends so that it filters out the unneeded
"all" -> "package" dependencies when "package" is already the
dependency of another package.

For example, if you have a configuration with libpng (which selects
zlib), "make show-targets" displays "libpng zlib", so graph-depends
used to create the following dependencies: (all -> libpng, all ->
zlib, libpng -> zlib). However, the (all -> zlib) dependency is not
really needed, as zlib is already the dependency of libpng. Those
dependencies are now filtered out.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 support/scripts/graph-depends |   33 +++++++++++++++++++++++++++++++++
 1 files changed, 33 insertions(+), 0 deletions(-)

diff --git a/support/scripts/graph-depends b/support/scripts/graph-depends
index 409c123..c80a65a 100755
--- a/support/scripts/graph-depends
+++ b/support/scripts/graph-depends
@@ -119,6 +119,37 @@ def get_all_depends(pkg):
 def pkg_node_name(pkg):
     return pkg.replace("-","")
 
+# Helper function for remove_redundant_deps(). This function tells
+# whether package "pkg" is the dependency of another package that is
+# not the special "all" package.
+def has_redundant_deps(deps, pkg):
+    for dep in deps:
+        if dep[0] != "all" and dep[1] == pkg:
+            return True
+    return False
+
+# This function removes redundant dependencies of the special "all"
+# package. This "all" package is created to reflect the origin of the
+# selection for all packages that are not themselves selected by any
+# other package. So for example if you enable libpng, zlib is enabled
+# as a dependency. But zlib being selected by libpng, it also appears
+# as a dependency of the "all" package. This needlessly complicates
+# the generated dependency graph. So when we have the dependency list
+# (all -> zlib, all -> libpn, libpng -> zlib), we get rid of the 'all
+# -> zlib' dependency, because zlib is already a dependency of a
+# regular package.
+def remove_redundant_deps(deps):
+    newdeps = []
+    for dep in deps:
+        if dep[0] != "all":
+            newdeps.append(dep)
+            continue
+        if not has_redundant_deps(deps, dep[1]):
+            newdeps.append(dep)
+            continue
+        sys.stderr.write("Removing redundant dep all -> %s\n" % dep[1])
+    return newdeps
+
 # In full mode, start with the result of get_targets() to get the main
 # targets and then use get_all_depends() for each individual target.
 if mode == FULL_MODE:
@@ -144,6 +175,8 @@ if mode == FULL_MODE:
 elif mode == PKG_MODE:
     dependencies = get_all_depends(rootpkg)
 
+dependencies = remove_redundant_deps(dependencies)
+
 # Start printing the graph data
 print "digraph G {"
 
