From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 22 Jun 2016 10:34:56 +0200
Subject: [Buildroot] [git commit] lua: add upstream patch to fix 5.3.3 loop
	parser
Message-ID: <20160622083621.09C168212D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=23a9a94f1e78b51abcf2c84c4366c219726ad001
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lua/5.3.3/0012-fix-loop-parser.patch | 31 ++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

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
