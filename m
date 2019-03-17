From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Mar 2019 14:34:02 +0100
Subject: [Buildroot] [git commit] support/graph-depends: make sure mandatory
 deps are displayed
Message-ID: <20190317144806.7CD098F173@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1e414fbe9b9193da566d2af71537a14e9fcae869
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The current graph-depends implementation filters out a number of
"mandatory" dependencies that all packages have: dependency on
"toolchain" and dependency on "skeleton".

Despite this filtering, in full graph dependencies, "toolchain" and
"skeleton" are still shown, because they are target packages, and
therefore appear in the result of "make show-targets". Thanks to this,
they will be visible as dependencies of the "ALL" node, which is the
root of the dependency tree.

However, as we are going to introduce host-skeleton as a "mandatory
dependency" to be filtered out, this is no longer going to work.

This commit adjusts the remove_extra_deps() function to ensure that
when a mandatory dependency is removed, this dependency exists between
the root of the dependency tree and the mandatory dependency.

This issue was noticed by Yann E. Morin, and this commit provides a
different implementation than what Yann proposed in
https://patchwork.ozlabs.org/patch/910453/.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[yann.morin.1998 at free.fr:
  - list mandatory deps before removing them
  - fix flake8 warnings
]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/graph-depends | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/support/scripts/graph-depends b/support/scripts/graph-depends
index d2b100f385..5a6f6930e9 100755
--- a/support/scripts/graph-depends
+++ b/support/scripts/graph-depends
@@ -181,6 +181,12 @@ def remove_mandatory_deps(pkg, deps):
     return [p for p in deps[pkg] if p not in MANDATORY_DEPS]
 
 
+# This function returns all dependencies of pkg that are part of the
+# mandatory dependencies:
+def get_mandatory_deps(pkg, deps):
+    return [p for p in deps[pkg] if p in MANDATORY_DEPS]
+
+
 # This function will check that there is no loop in the dependency chain
 # As a side effect, it builds up the dependency cache.
 def check_circular_deps(deps):
@@ -213,6 +219,9 @@ def check_circular_deps(deps):
 def remove_extra_deps(deps, rootpkg, transitive):
     for pkg in list(deps.keys()):
         if not pkg == rootpkg:
+            for d in get_mandatory_deps(pkg, deps):
+                if d not in deps[rootpkg]:
+                    deps[rootpkg].append(d)
             deps[pkg] = remove_mandatory_deps(pkg, deps)
     for pkg in list(deps.keys()):
         if not transitive or pkg == rootpkg:
