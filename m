From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 21 Apr 2018 11:10:51 +0200
Subject: [Buildroot] [PATCH 2/7] support/graph-depends: also cut on
 host-skeleton
In-Reply-To: <cover.1524301847.git.yann.morin.1998@free.fr>
References: <cover.1524301847.git.yann.morin.1998@free.fr>
Message-ID: <46720e6336b7efe82d9b733222f942a8cfaac3c6.1524301847.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

host-skeleton is a dependency of almost all packages, except a very few.
As such, it clutters the dependency graph uselessly.

Do with it as we do for the skeleton: cut the dependency chains.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/graph-depends | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/support/scripts/graph-depends b/support/scripts/graph-depends
index 6ce90d872c..40a8eee5e9 100755
--- a/support/scripts/graph-depends
+++ b/support/scripts/graph-depends
@@ -175,10 +175,17 @@ def remove_transitive_deps(pkg, deps):
     return new_d
 
 
+CUT_ON_PACKAGES = [
+    'toolchain',
+    'skeleton',
+    'host-skeleton',
+]
+
+
 # This function removes the dependency on some 'mandatory' package, like the
 # 'toolchain' package, or the 'skeleton' package
 def remove_mandatory_deps(pkg, deps):
-    return [p for p in deps[pkg] if p not in ['toolchain', 'skeleton']]
+    return [p for p in deps[pkg] if p not in CUT_ON_PACKAGES]
 
 
 # This function will check that there is no loop in the dependency chain
-- 
2.14.1
