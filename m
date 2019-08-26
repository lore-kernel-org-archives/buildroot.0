From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 26 Aug 2019 22:15:35 +0200
Subject: [Buildroot] [git commit branch/next] support/graph-size: display
 human-readable size
Message-ID: <20190826204924.68A2F846E5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3fc3c4ac99a81d5f473239e3b254ace5d4dfadcf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Currently, we forcibly report sizes in multiple of Kilobytes. In some
big configurations, the sizes of the system as a whole, as well as that
of individual packages, may exceed megabytes, and when some artistic
assets get used, even the gigabyte may get exceed.

These big sizes are not easy to read when expressed in kilobytes.

Additionally, some very small packages might have sizes below the
kilobyte (and when we can specify the cut-off grouping size, they may
get reported), and thus the size displayed for those would be 0 kB.

Add a helper function that can format a floating-point size into a
string with all the appropriate formatting:

  - there are at least 3 meaningfull digits visible, i.e. we display
    "3.14" or "10.4" instead of just "3" or "10", but for big number we
    don't care about too many precision either, so we report "100" or
    "1000", not "100.42" or "1000.27";

  - the proper SI prefix is appended, if needed.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 support/scripts/size-stats | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/support/scripts/size-stats b/support/scripts/size-stats
index 82258e4606..eb09e0dc60 100755
--- a/support/scripts/size-stats
+++ b/support/scripts/size-stats
@@ -22,6 +22,7 @@ import os.path
 import argparse
 import csv
 import collections
+import math
 
 try:
     import matplotlib
@@ -127,6 +128,17 @@ def build_package_size(filesdict, builddir):
 # outputf: output file for the graph
 #
 def draw_graph(pkgsize, outputf):
+    def size2string(sz):
+        divider = 1000.0
+        prefixes = ['', 'k', 'M', 'G', 'T']
+        while sz > divider and len(prefixes) > 1:
+            prefixes = prefixes[1:]
+            sz = sz/divider
+        # precision is made so that there are always at least three meaningful
+        # digits displayed (e.g. '3.14' and '10.4', not just '3' and '10')
+        precision = int(2-math.floor(math.log10(sz))) if sz < 1000 else 0
+        return '{:.{prec}f} {}B'.format(sz, prefixes[0], prec=precision)
+
     total = sum(pkgsize.values())
     labels = []
     values = []
@@ -138,13 +150,13 @@ def draw_graph(pkgsize, outputf):
         elif p == "unknown":
             unknown_value = sz
         else:
-            labels.append("%s (%d kB)" % (p, sz / 1000.))
+            labels.append("%s (%s)" % (p, size2string(sz)))
             values.append(sz)
     if unknown_value != 0:
-        labels.append("Unknown (%d kB)" % (unknown_value / 1000.))
+        labels.append("Unknown (%s)" % (size2string(unknown_value)))
         values.append(unknown_value)
     if other_value != 0:
-        labels.append("Other (%d kB)" % (other_value / 1000.))
+        labels.append("Other (%s)" % (size2string(other_value)))
         values.append(other_value)
 
     plt.figure()
@@ -158,7 +170,7 @@ def draw_graph(pkgsize, outputf):
     plt.setp(texts, fontproperties=proptease)
 
     plt.suptitle("Filesystem size per package", fontsize=18, y=.97)
-    plt.title("Total filesystem size: %d kB" % (total / 1000.), fontsize=10,
+    plt.title("Total filesystem size: %s" % (size2string(total)), fontsize=10,
               y=.96)
     plt.savefig(outputf)
 
