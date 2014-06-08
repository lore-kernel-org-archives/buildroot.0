From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Jun 2014 16:42:58 +0200
Subject: [Buildroot] [git commit] graph-depends: refactor with more colors
Message-ID: <20140608145131.6BC009CF1C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b689264d38053c1fdcce69607debefb56632a769
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Do not use the same colors for toolchain, host and target packages.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
[yann.morin.1998 at free.fr rephrase commit log]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/scripts/graph-depends |   21 ++++++++++++++-------
 1 files changed, 14 insertions(+), 7 deletions(-)

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
