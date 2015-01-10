From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Jan 2015 11:39:53 +0100
Subject: [Buildroot] [git commit] lua: add a upstream patch
Message-ID: <20150110104015.F1455801D5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6aa156fa1f532a0079670667c0946e7c9008692f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: fix minor typo in commit title.]

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lua/5.2.3/0012-fix-ephemeron-table.patch |   19 +++++++++++++++++++
 1 files changed, 19 insertions(+), 0 deletions(-)

diff --git a/package/lua/5.2.3/0012-fix-ephemeron-table.patch b/package/lua/5.2.3/0012-fix-ephemeron-table.patch
new file mode 100644
index 0000000..f231016
--- /dev/null
+++ b/package/lua/5.2.3/0012-fix-ephemeron-table.patch
@@ -0,0 +1,19 @@
+Ephemeron table can wrongly collect entry with strong key.
+
+Fetch from: http://www.lua.org/bugs.html#5.2.3-2
+
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+
+Index: b/src/lgc.c
+===================================================================
+--- a/src/lgc.c
++++ b/src/lgc.c
+@@ -403,7 +403,7 @@
+       reallymarkobject(g, gcvalue(gval(n)));  /* mark it now */
+     }
+   }
+-  if (prop)
++  if (g->gcstate != GCSatomic || prop)
+     linktable(h, &g->ephemeron);  /* have to propagate again */
+   else if (hasclears)  /* does table have white keys? */
+     linktable(h, &g->allweak);  /* may have to clean white keys */
