From: Francois Perrad <fperrad@gmail.com>
Date: Sat, 10 Jan 2015 09:30:53 +0100
Subject: [Buildroot] [PATCH] lua: add a uptstream patch
Message-ID: <1420878653-17988-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lua/5.2.3/0012-fix-ephemeron-table.patch | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 package/lua/5.2.3/0012-fix-ephemeron-table.patch

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
-- 
2.1.0
