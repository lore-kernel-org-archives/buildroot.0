From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 26 Aug 2019 22:12:37 +0200
Subject: [Buildroot] [git commit] support/graph-size: report 'Unknown" after
 all packages, but before "Others"
Message-ID: <20190903133621.CEB648A5E7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e8de561436fff18a07d95ed95c985fa26c97941e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, the "unknown" category may be reported anywhere, so it does
not really stand out when there are a lot of packages in the graph.

Move it towards the end, but right before the "other" category, so that
it is a bit more visible. Like for Others, don't report it if its size
is zero.

Also, make it title case (i.e. "Unknown" instead of "unknown").

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 support/scripts/size-stats | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/support/scripts/size-stats b/support/scripts/size-stats
index 398c256e8b..82258e4606 100755
--- a/support/scripts/size-stats
+++ b/support/scripts/size-stats
@@ -131,12 +131,18 @@ def draw_graph(pkgsize, outputf):
     labels = []
     values = []
     other_value = 0
+    unknown_value = 0
     for (p, sz) in sorted(pkgsize.items(), key=lambda x: x[1]):
         if sz < (total * 0.01):
             other_value += sz
+        elif p == "unknown":
+            unknown_value = sz
         else:
             labels.append("%s (%d kB)" % (p, sz / 1000.))
             values.append(sz)
+    if unknown_value != 0:
+        labels.append("Unknown (%d kB)" % (unknown_value / 1000.))
+        values.append(unknown_value)
     if other_value != 0:
         labels.append("Other (%d kB)" % (other_value / 1000.))
         values.append(other_value)
