From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 6 Dec 2018 22:16:37 +0100
Subject: [Buildroot] [git commit] support/scripts/graph-depends: use proper
 rootpkg in remove_extra_deps()
Message-ID: <20181206211301.151458B3BD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=659d45adc4cdc12cd1ac8dd31fb1e24508841828
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The remove_extra_deps() function removes dependencies that we are not
interested in seeing in the dependency graph. It does this for all
packages, except the 'all' package, which on full dependency graphs is
the root of the tree.

However, this doesn't take into account package-specific dependency
graphs (i.e make <pkg>-graph-depends) where the root is not 'all', but
'<pkg>'. Due to this, dependencies on "mandatory deps" were not
visible at all, i.e the toolchain package (and its dependencies) and
the skeleton package (and its dependencies) were not displayed in
package-specific dependency graphs.

To fix this, we use the existing rootpkg variable instead of
hardcoding 'all'.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/graph-depends | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/support/scripts/graph-depends b/support/scripts/graph-depends
index 3526a51662..f1b6b142fb 100755
--- a/support/scripts/graph-depends
+++ b/support/scripts/graph-depends
@@ -205,12 +205,12 @@ def check_circular_deps(deps):
 
 # This functions trims down the dependency list of all packages.
 # It applies in sequence all the dependency-elimination methods.
-def remove_extra_deps(deps, transitive):
+def remove_extra_deps(deps, rootpkg, transitive):
     for pkg in list(deps.keys()):
-        if not pkg == 'all':
+        if not pkg == rootpkg:
             deps[pkg] = remove_mandatory_deps(pkg, deps)
     for pkg in list(deps.keys()):
-        if not transitive or pkg == 'all':
+        if not transitive or pkg == rootpkg:
             deps[pkg] = remove_transitive_deps(pkg, deps)
     return deps
 
@@ -401,7 +401,7 @@ def main():
     if check_only:
         sys.exit(0)
 
-    dict_deps = remove_extra_deps(dict_deps, args.transitive)
+    dict_deps = remove_extra_deps(dict_deps, rootpkg, args.transitive)
     dict_version = brpkgutil.get_version([pkg for pkg in allpkgs
                                           if pkg != "all" and not pkg.startswith("root")])
 
