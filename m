From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Date: Tue, 2 Jan 2018 15:07:23 +0100
Subject: [Buildroot] [PATCH 1/1] support/scripts: sort pie charts
Message-ID: <20180102140723.GA9316@australia>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Make sure that the pie charts produced by 'graph-build' and 'graph-size'
targets are sorted on the size of each piece of the pie. Otherwise, making
visual analysis is difficult, as one needs to look at the legends of each
piece and do the sorting manually in their head.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 support/scripts/graph-build-time | 2 +-
 support/scripts/size-stats       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/scripts/graph-build-time b/support/scripts/graph-build-time
index 0ba0f2d3a7..9d05f2257a 100755
--- a/support/scripts/graph-build-time
+++ b/support/scripts/graph-build-time
@@ -184,7 +184,7 @@ def pkg_pie_time_per_package(data, output):
     labels = []
     values = []
     other_value = 0
-    for p in data:
+    for p in sorted(data, key=lambda p: p.get_duration()):
         if p.get_duration() < (total * 0.01):
             other_value += p.get_duration()
         else:
diff --git a/support/scripts/size-stats b/support/scripts/size-stats
index 3ff2a1ce18..85e7c1596b 100755
--- a/support/scripts/size-stats
+++ b/support/scripts/size-stats
@@ -127,7 +127,7 @@ def draw_graph(pkgsize, outputf):
     labels = []
     values = []
     other_value = 0
-    for (p, sz) in pkgsize.items():
+    for (p, sz) in sorted(pkgsize.items(), key=lambda x: x[1]):
         if sz < (total * 0.01):
             other_value += sz
         else:
-- 
2.13.6
