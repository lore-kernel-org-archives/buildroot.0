From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 24 Nov 2018 10:34:52 +0100
Subject: [Buildroot] [PATCH] support/graph-depends: fix package names
 starting with a non-char
Message-ID: <20181124093452.12350-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Graphviz' dot utility does not like nodes which names does not start
with an ^[[:alpha:]], i.e. 18xx-ti-utils would cause grievance:

    Warning: syntax ambiguity - badly delimited number '18x' in line 4 [...]/graph-depends.dot splits into two tokens
    Warning: syntax ambiguity - badly delimited number '18x' in line 5 [...]/graph-depends.dot splits into two tokens
    Warning: syntax ambiguity - badly delimited number '18x' in line 6 [...]/graph-depends.dot splits into two tokens
    Warning: syntax ambiguity - badly delimited number '18x' in line 7 [...]/graph-depends.dot splits into two tokens

Prefix nodes with an underscore to fix that.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/graph-depends | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/support/scripts/graph-depends b/support/scripts/graph-depends
index 621e603278..3c091da5e0 100755
--- a/support/scripts/graph-depends
+++ b/support/scripts/graph-depends
@@ -94,9 +94,10 @@ def get_all_depends(pkgs, get_depends_func):
 
 
 # The Graphviz "dot" utility doesn't like dashes in node names. So for
-# node names, we strip all dashes.
+# node names, we strip all dashes. Also, nodes can't start with a number,
+# so we prepend an underscore.
 def pkg_node_name(pkg):
-    return pkg.replace("-", "")
+    return "_" + pkg.replace("-", "")
 
 
 TARGET_EXCEPTIONS = [
-- 
2.14.1
