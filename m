From: Francois Perrad <fperrad@gmail.com>
Date: Wed, 22 Jun 2016 10:08:55 +0200
Subject: [Buildroot] [PATCH] lua: fix loop parser
Message-ID: <1466582935-9329-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lua/5.3.3/0012-fix-loop-parser.patch | 31 ++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 package/lua/5.3.3/0012-fix-loop-parser.patch

diff --git a/package/lua/5.3.3/0012-fix-loop-parser.patch b/package/lua/5.3.3/0012-fix-loop-parser.patch
new file mode 100644
index 0000000..7b321e5
--- /dev/null
+++ b/package/lua/5.3.3/0012-fix-loop-parser.patch
@@ -0,0 +1,31 @@
+Expression list with four or more expressions in a 'for' loop can crash the interpreter.
+
+Fetch from: https://www.lua.org/bugs.html#5.3.3-1
+
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+
+--- a/src/lparser.c
++++ b/src/lparser.c
+@@ -323,6 +323,8 @@
+       luaK_nil(fs, reg, extra);
+     }
+   }
++  if (nexps > nvars)
++    ls->fs->freereg -= nexps - nvars;  /* remove extra values */
+ }
+ 
+ 
+@@ -1160,11 +1162,8 @@
+     int nexps;
+     checknext(ls, '=');
+     nexps = explist(ls, &e);
+-    if (nexps != nvars) {
++    if (nexps != nvars)
+       adjust_assign(ls, nvars, nexps, &e);
+-      if (nexps > nvars)
+-        ls->fs->freereg -= nexps - nvars;  /* remove extra values */
+-    }
+     else {
+       luaK_setoneret(ls->fs, &e);  /* close last expression */
+       luaK_storevar(ls->fs, &lh->v, &e);
+-- 
-- 
2.7.4
