From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  2 Jul 2018 23:12:24 +0200
Subject: [Buildroot] [PATCH 50/50] support/scripts: don't draw most of
 busybox' dependencies
In-Reply-To: <cover.1530565933.git.yann.morin.1998@free.fr>
References: <cover.1530565933.git.yann.morin.1998@free.fr>
Message-ID: <d5b2e0eebf27fe994337e2c966f8ecf63849f3e1.1530565933.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since most dependencies of busybox' are there to guarantee that busybox'
does not install applets that are already provided by other packages,
they are not really functional dependencies, and mostly clutter the
dependency graph.

Only the dependencies on libraries are interested, so that is all we
keep.

Even though that function is only called with pkg set to 'busybox', we
still pass it as an argument, for symetry with the other functions that
removes the dependencies of a package.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 support/scripts/graph-depends | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/support/scripts/graph-depends b/support/scripts/graph-depends
index 621e603278..909a3d4812 100755
--- a/support/scripts/graph-depends
+++ b/support/scripts/graph-depends
@@ -181,6 +181,14 @@ def remove_mandatory_deps(pkg, deps):
     return [p for p in deps[pkg] if p not in ['toolchain', 'skeleton']]
 
 
+# This function removes all dependencies of busybox, except its
+# dependencies on libraries (of which linux-pam) and host-pkgconf.
+def remove_busybox_deps(pkg, deps):
+    busybox_dep_whitelist = ['linux-pam', 'host-pkgconf']
+    return [p for p in deps[pkg]
+            if p.startswith('lib') or p in busybox_dep_whitelist]
+
+
 # This function will check that there is no loop in the dependency chain
 # As a side effect, it builds up the dependency cache.
 def check_circular_deps(deps):
@@ -211,6 +219,8 @@ def check_circular_deps(deps):
 # This functions trims down the dependency list of all packages.
 # It applies in sequence all the dependency-elimination methods.
 def remove_extra_deps(deps, transitive):
+    if 'busybox' in list(deps.keys()):
+        deps['busybox'] = remove_busybox_deps('busybox', deps)
     for pkg in list(deps.keys()):
         if not pkg == 'all':
             deps[pkg] = remove_mandatory_deps(pkg, deps)
-- 
2.14.1
