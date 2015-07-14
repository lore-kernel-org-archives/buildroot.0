From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Jul 2015 18:10:58 +0200
Subject: [Buildroot] [git commit] graph-depends: Strip skeleton from
	dependency
Message-ID: <20150714161744.0416E80075@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f53d69614e58661877de74131f574e7f56226b45
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

skeleton being a mandatory dependency, we don't want all our packages to
have a link back to that node, the graph would be awful.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/scripts/graph-depends |    9 +++++----
 1 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/support/scripts/graph-depends b/support/scripts/graph-depends
index c26e1e0..5f77038 100755
--- a/support/scripts/graph-depends
+++ b/support/scripts/graph-depends
@@ -271,16 +271,17 @@ def remove_transitive_deps(pkg,deps):
             new_d.append(d[i])
     return new_d
 
-# This function removes the dependency on the 'toolchain' package
-def remove_toolchain_deps(pkg,deps):
-    return [p for p in deps[pkg] if not p == 'toolchain']
+# This function removes the dependency on some 'mandatory' package, like the
+# 'toolchain' package, or the 'skeleton' package
+def remove_mandatory_deps(pkg,deps):
+    return [p for p in deps[pkg] if p not in ['toolchain', 'skeleton']]
 
 # This functions trims down the dependency list of all packages.
 # It applies in sequence all the dependency-elimination methods.
 def remove_extra_deps(deps):
     for pkg in list(deps.keys()):
         if not pkg == 'all':
-            deps[pkg] = remove_toolchain_deps(pkg,deps)
+            deps[pkg] = remove_mandatory_deps(pkg,deps)
     for pkg in list(deps.keys()):
         if not transitive or pkg == 'all':
             deps[pkg] = remove_transitive_deps(pkg,deps)
