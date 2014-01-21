From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 21 Jan 2014 23:28:36 +0100
Subject: [Buildroot] [git commit] lua: add an upstream patch
Message-ID: <20140121223739.7EC3E9BBDB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6a471a1cb2b859941353343d0c1c84e6cd834204
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

from http://www.lua.org/bugs.html

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lua/5.1.5/lua-12-fix-reader-at-eoz.patch |   46 ++++++++++++++++++++++
 1 files changed, 46 insertions(+), 0 deletions(-)

diff --git a/package/lua/5.1.5/lua-12-fix-reader-at-eoz.patch b/package/lua/5.1.5/lua-12-fix-reader-at-eoz.patch
new file mode 100644
index 0000000..17a28ba
--- /dev/null
+++ b/package/lua/5.1.5/lua-12-fix-reader-at-eoz.patch
@@ -0,0 +1,46 @@
+When loading a file, Lua may call the reader function again after it returned end of input.
+
+Fetch from: http://www.lua.org/bugs.html#5.1.5-2
+
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+
+Index: b/src/lzio.c
+===================================================================
+--- a/src/lzio.c
++++ b/src/lzio.c
+@@ -22,10 +22,14 @@
+   size_t size;
+   lua_State *L = z->L;
+   const char *buff;
++  if (z->eoz) return EOZ;
+   lua_unlock(L);
+   buff = z->reader(L, z->data, &size);
+   lua_lock(L);
+-  if (buff == NULL || size == 0) return EOZ;
++  if (buff == NULL || size == 0) {
++    z->eoz = 1;  /* avoid calling reader function next time */
++    return EOZ;
++  }
+   z->n = size - 1;
+   z->p = buff;
+   return char2int(*(z->p++));
+@@ -51,6 +55,7 @@
+   z->data = data;
+   z->n = 0;
+   z->p = NULL;
++  z->eoz = 0;
+ }
+ 
+ 
+Index: b/src/lzio.h
+===================================================================
+--- a/src/lzio.h
++++ b/src/lzio.h
+@@ -59,6 +59,7 @@
+   lua_Reader reader;
+   void* data;			/* additional data */
+   lua_State *L;			/* Lua state (for reader) */
++  int eoz;			/* true if reader has no more data */
+ };
+ 
+ 
