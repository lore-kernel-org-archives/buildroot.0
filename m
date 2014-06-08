From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  8 Jun 2014 16:03:45 +0200
Subject: [Buildroot] [PATCH 1/9] graph-depends: refactor with more colors
In-Reply-To: <cover.1402236171.git.yann.morin.1998@free.fr>
References: <cover.1402236171.git.yann.morin.1998@free.fr>
Message-ID: <399111322cd88f42509ef9569f3b0de7fe51e711.1402236171.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Francois Perrad <fperrad@gmail.com>

Do not use the same colors for toolchain, host and target packages.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
[yann.morin.1998 at free.fr rephrase commit log]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/scripts/graph-depends | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/support/scripts/graph-depends b/support/scripts/graph-depends
index e2a5e1e..443ac7d 100755
--- a/support/scripts/graph-depends
+++ b/support/scripts/graph-depends
@@ -222,15 +222,22 @@ for dep in dependencies:
 
 # Print the attributes of a node: label and fill-color
 def print_attrs(pkg):
+    name = pkg_node_name(pkg)
     if pkg == 'all':
-        print "all [label = \"ALL\"]"
-        print "all [color=lightblue,style=filled]"
-        return
-    print "%s [label = \"%s\"]" % (pkg_node_name(pkg), pkg)
-    if mode == PKG_MODE and pkg == rootpkg:
-        print "%s [color=lightblue,style=filled]" % pkg_node_name(rootpkg)
+        label = 'ALL'
+    else:
+        label = pkg
+    if pkg == 'all' or (mode == PKG_MODE and pkg == rootpkg):
+        color = 'lightblue'
     else:
-        print "%s [color=grey,style=filled]" % pkg_node_name(pkg)
+        if pkg.startswith('host') \
+        or pkg.startswith('toolchain') \
+        or pkg.startswith('rootfs'):
+            color = 'gainsboro'
+        else:
+            color = 'grey'
+    print "%s [label = \"%s\"]" % (name, label)
+    print "%s [color=%s,style=filled]" % (name, color)
 
 # Print the dependency graph of a package
 def print_pkg_deps(depth, pkg):
-- 
1.8.3.2
