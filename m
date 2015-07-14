From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Tue, 14 Jul 2015 13:36:26 +0200
Subject: [Buildroot] [PATCH v5 2/2] graph-depends: Strip skeleton from
	dependency
In-Reply-To: <1436873786-9005-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1436873786-9005-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1436873786-9005-2-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

skeleton being a mandatory dependency, we don't want all our packages to
have a link back to that node, the graph would be awful.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 support/scripts/graph-depends | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

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
-- 
2.1.4
