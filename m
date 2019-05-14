From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 May 2019 19:21:39 +0200
Subject: [Buildroot] [git commit branch/next] package/lua-flu: bump to
 20181218 release
Message-ID: <20190514171615.5ADFF8A500@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2b31f91e6d354d25260dd67ac932744f82f0887c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Also drop patch which is part of new release.

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lua-flu/0001-use-system-xattr-h.patch | 169 --------------------------
 package/lua-flu/lua-flu.hash                  |   4 +-
 package/lua-flu/lua-flu.mk                    |   4 +-
 3 files changed, 4 insertions(+), 173 deletions(-)

diff --git a/package/lua-flu/0001-use-system-xattr-h.patch b/package/lua-flu/0001-use-system-xattr-h.patch
deleted file mode 100644
index 1cd44b4617..0000000000
--- a/package/lua-flu/0001-use-system-xattr-h.patch
+++ /dev/null
@@ -1,169 +0,0 @@
-Use system <sys/xattr.h>
-
-The one from attr is no longer installed with latest version.
-
-ENOATTR was in fact defined as ENODATA, so switch to using that instead.
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-
----
-Upstream status: merged:
-    https://bitbucket.org/doub/flu/pull-requests/1
-    https://bitbucket.org/doub/flu/commits/2d75cc2be79026b94188b11c6f53b219c24a5f70
-
-
-diff -durN lua-flu-20150331-1.orig/doub-flu-a7daae986339/doc/doc.lua lua-flu-20150331-1/doub-flu-a7daae986339/doc/doc.lua
---- lua-flu-20150331-1.orig/doub-flu-a7daae986339/doc/doc.lua	2015-03-31 18:54:19.000000000 +0200
-+++ lua-flu-20150331-1/doub-flu-a7daae986339/doc/doc.lua	2018-05-06 09:22:28.499324049 +0200
-@@ -327,7 +327,7 @@
- 				name = "fs.getxattr";
- 				parameters = {"path", "name"};
- 				results = {"value"};
--				doc = [[Get an extended attribute. If the attribute doesn't exist `ENOATTR` should be thrown.]];
-+				doc = [[Get an extended attribute. If the attribute doesn't exist `ENODATA` should be thrown.]];
- 			},
- 			{
- 				name = "fs.listxattr";
-@@ -338,7 +338,7 @@
- 			{
- 				name = "fs.removexattr";
- 				parameters = {"path", "name"};
--				doc = [[Remove an extended attribute. If the attribute doesn't exist `ENOATTR` should be thrown.]];
-+				doc = [[Remove an extended attribute. If the attribute doesn't exist `ENODATA` should be thrown.]];
- 			},
- 			{
- 				name = "fs.opendir";
-diff -durN lua-flu-20150331-1.orig/doub-flu-a7daae986339/doc/luafs.lua lua-flu-20150331-1/doub-flu-a7daae986339/doc/luafs.lua
---- lua-flu-20150331-1.orig/doub-flu-a7daae986339/doc/luafs.lua	2015-03-31 18:54:19.000000000 +0200
-+++ lua-flu-20150331-1/doub-flu-a7daae986339/doc/luafs.lua	2018-05-06 09:22:28.495324054 +0200
-@@ -222,8 +222,8 @@
- -- :NOTE: since the filesystem is a pure tree (not a DAG), use the path to find attribs
- 
- function luafs.getxattr(path, name)
--	local attrs = assert(xattrs[path], errno.ENOATTR)
--	return assert(attrs[name], errno.ENOATTR)
-+	local attrs = assert(xattrs[path], errno.ENODATA)
-+	return assert(attrs[name], errno.ENODATA)
- end
- 
- function luafs.setxattr(path, name, value, flags)
-@@ -236,7 +236,7 @@
- end
- 
- function luafs.removexattr(path, name)
--	local attrs = assert(xattrs[path], errno.ENOATTR)
-+	local attrs = assert(xattrs[path], errno.ENODATA)
- 	attrs[name] = nil
- 	if next(attrs)==nil then
- 		xattrs[path] = nil
-diff -durN lua-flu-20150331-1.orig/doub-flu-a7daae986339/doc/manual.html lua-flu-20150331-1/doub-flu-a7daae986339/doc/manual.html
---- lua-flu-20150331-1.orig/doub-flu-a7daae986339/doc/manual.html	2015-03-31 18:54:19.000000000 +0200
-+++ lua-flu-20150331-1/doub-flu-a7daae986339/doc/manual.html	2018-05-06 09:22:28.499324049 +0200
-@@ -347,7 +347,7 @@
- 		<div class="function">
- 		<h3><a name="fs.getxattr"><code>value = fs.getxattr (path, name)</code></a></h3>
- 
--<p>Get an extended attribute. If the attribute doesn't exist <code>ENOATTR</code> should be thrown.</p>
-+<p>Get an extended attribute. If the attribute doesn't exist <code>ENODATA</code> should be thrown.</p>
- 		</div>
- 
- 		<div class="function">
-@@ -359,7 +359,7 @@
- 		<div class="function">
- 		<h3><a name="fs.removexattr"><code>fs.removexattr (path, name)</code></a></h3>
- 
--<p>Remove an extended attribute. If the attribute doesn't exist <code>ENOATTR</code> should be thrown.</p>
-+<p>Remove an extended attribute. If the attribute doesn't exist <code>ENODATA</code> should be thrown.</p>
- 		</div>
- 
- 		<div class="function">
-diff -durN lua-flu-20150331-1.orig/doub-flu-a7daae986339/errno.c lua-flu-20150331-1/doub-flu-a7daae986339/errno.c
---- lua-flu-20150331-1.orig/doub-flu-a7daae986339/errno.c	2015-03-31 18:54:19.000000000 +0200
-+++ lua-flu-20150331-1/doub-flu-a7daae986339/errno.c	2018-05-06 09:23:06.323282527 +0200
-@@ -3,7 +3,7 @@
- #include <lua.h>
- #include <lauxlib.h>
- #include <stdlib.h>
--#include <attr/xattr.h>
-+#include <sys/xattr.h>
- #include "compat.h"
- 
- /****************************************************************************/
-@@ -103,7 +103,7 @@
- 	REGISTER_ERROR(EDOM)
- 	REGISTER_ERROR(ERANGE)
- 	REGISTER_ERROR(ENOSYS)
--	REGISTER_ERROR(ENOATTR)
-+	REGISTER_ERROR(ENODATA)
- 	#undef REGISTER_ERROR
- }
- 
-diff -durN lua-flu-20150331-1.orig/doub-flu-a7daae986339/flu-20150331-1.rockspec lua-flu-20150331-1/doub-flu-a7daae986339/flu-20150331-1.rockspec
---- lua-flu-20150331-1.orig/doub-flu-a7daae986339/flu-20150331-1.rockspec	2018-05-06 09:22:04.123351349 +0200
-+++ lua-flu-20150331-1/doub-flu-a7daae986339/flu-20150331-1.rockspec	2018-05-06 09:23:06.323282527 +0200
-@@ -14,7 +14,7 @@
- 		library = 'fuse',
- 	},
- 	ATTR = {
--		header = 'attr/xattr.h',
-+		header = 'sys/xattr.h',
- 	},
- }
- dependencies = {
-diff -durN lua-flu-20150331-1.orig/doub-flu-a7daae986339/flu.c lua-flu-20150331-1/doub-flu-a7daae986339/flu.c
---- lua-flu-20150331-1.orig/doub-flu-a7daae986339/flu.c	2015-03-31 18:54:19.000000000 +0200
-+++ lua-flu-20150331-1/doub-flu-a7daae986339/flu.c	2018-05-06 09:23:06.323282527 +0200
-@@ -15,7 +15,7 @@
- #include <errno.h>
- #include <string.h>
- #include <fuse.h>
--#include <attr/xattr.h>
-+#include <sys/xattr.h>
- #include <lua.h>
- #include <lauxlib.h>
- 
-diff -durN lua-flu-20150331-1.orig/doub-flu-a7daae986339/flu.rockspec.in lua-flu-20150331-1/doub-flu-a7daae986339/flu.rockspec.in
---- lua-flu-20150331-1.orig/doub-flu-a7daae986339/flu.rockspec.in	2015-03-31 18:54:19.000000000 +0200
-+++ lua-flu-20150331-1/doub-flu-a7daae986339/flu.rockspec.in	2018-05-06 09:23:06.323282527 +0200
-@@ -14,7 +14,7 @@
- 		library = 'fuse',
- 	},
- 	ATTR = {
--		header = 'attr/xattr.h',
-+		header = 'sys/xattr.h',
- 	},
- }
- dependencies = {
-diff -durN lua-flu-20150331-1.orig/doub-flu-a7daae986339/README.md lua-flu-20150331-1/doub-flu-a7daae986339/README.md
---- lua-flu-20150331-1.orig/doub-flu-a7daae986339/README.md	2015-03-31 18:54:19.000000000 +0200
-+++ lua-flu-20150331-1/doub-flu-a7daae986339/README.md	2018-05-06 09:22:28.495324054 +0200
-@@ -345,7 +345,7 @@
- 
- ### `value = fs.getxattr (path, name)`
- 
--Get an extended attribute. If the attribute doesn't exist `ENOATTR` should be thrown.
-+Get an extended attribute. If the attribute doesn't exist `ENODATA` should be thrown.
- 
- ---
- 
-@@ -357,7 +357,7 @@
- 
- ### `fs.removexattr (path, name)`
- 
--Remove an extended attribute. If the attribute doesn't exist `ENOATTR` should be thrown.
-+Remove an extended attribute. If the attribute doesn't exist `ENODATA` should be thrown.
- 
- ---
- 
-diff -durN lua-flu-20150331-1.orig/flu-20150331-1.rockspec lua-flu-20150331-1/flu-20150331-1.rockspec
---- lua-flu-20150331-1.orig/flu-20150331-1.rockspec	2015-04-02 23:44:11.000000000 +0200
-+++ lua-flu-20150331-1/flu-20150331-1.rockspec	2018-05-06 09:23:06.323282527 +0200
-@@ -14,7 +14,7 @@
- 		library = 'fuse',
- 	},
- 	ATTR = {
--		header = 'attr/xattr.h',
-+		header = 'sys/xattr.h',
- 	},
- }
- dependencies = {
diff --git a/package/lua-flu/lua-flu.hash b/package/lua-flu/lua-flu.hash
index 2195b42468..63f414d38f 100644
--- a/package/lua-flu/lua-flu.hash
+++ b/package/lua-flu/lua-flu.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256 1389c22daec77161ec93ff90c39ee70e0f8a656ff92f22f9cf5d7121999d5c53  flu-20150331-1.src.rock
-sha256 409f7c274eb26874a382241d675a360ba6b2659742c5941e680d71a41dd35913  doub-flu-a7daae986339/doc/LICENSE.txt
+sha256 221ba8f8d3abbf12d5fc217dbb965605391892eb314eff1cd9c7beca90fe9887  flu-20181218-1.src.rock
+sha256 409f7c274eb26874a382241d675a360ba6b2659742c5941e680d71a41dd35913  doub-flu-63f077a988cd/doc/LICENSE.txt
diff --git a/package/lua-flu/lua-flu.mk b/package/lua-flu/lua-flu.mk
index c01a4848c7..4c7b765470 100644
--- a/package/lua-flu/lua-flu.mk
+++ b/package/lua-flu/lua-flu.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-LUA_FLU_VERSION = 20150331-1
+LUA_FLU_VERSION = 20181218-1
 LUA_FLU_NAME_UPSTREAM = Flu
-LUA_FLU_SUBDIR = doub-flu-a7daae986339
+LUA_FLU_SUBDIR = doub-flu-63f077a988cd
 LUA_FLU_LICENSE = MIT
 LUA_FLU_LICENSE_FILES = $(LUA_FLU_SUBDIR)/doc/LICENSE.txt
 LUA_FLU_DEPENDENCIES = attr libfuse
