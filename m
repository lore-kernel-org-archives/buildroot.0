From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Nov 2018 18:49:20 +0100
Subject: [Buildroot] [git commit branch/2018.08.x] support/graph-depends:
 fix package names starting with a non-alpha
Message-ID: <20181126174613.045E98883B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=39e89d1d52cdeae6004ff0dd923dd186412ccd16
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.08.x

Graphviz' dot utility does not like nodes which names does not start
with an ^[[:alpha:]], i.e. 18xx-ti-utils would cause grievance:

    Warning: syntax ambiguity - badly delimited number '18x' in line 4 [...]/graph-depends.dot splits into two tokens
    Warning: syntax ambiguity - badly delimited number '18x' in line 5 [...]/graph-depends.dot splits into two tokens
    Warning: syntax ambiguity - badly delimited number '18x' in line 6 [...]/graph-depends.dot splits into two tokens
    Warning: syntax ambiguity - badly delimited number '18x' in line 7 [...]/graph-depends.dot splits into two tokens

Prefix nodes with an underscore to fix that.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 020206ca5784ca60fd72c7ff0aea6557d1d9bf6e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
