From: Francois Perrad <francois.perrad@gadz.org>
Date: Wed, 25 Aug 2010 17:30:38 +0200
Subject: [Buildroot] [git commit master 1/1] luafilesystem: remove
	LARGE_FILE constraint
Message-ID: <20100825153145.F0C4B89016@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=e6c4ce6cef9f260226081f043b4f03dd4b0ad949
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a patch to luafilesystem so that it builds correctly when large
files are not supported. This allows to remove the dependency of
luafilesystem on large file support on the toolchain. Packages such as
cgilua, wsapi and xavante, which depend on luafilesystem, also get
their dependency on large file support removed.

Fixes bug #2359.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/cgilua/Config.in                           |    4 ----
 package/luafilesystem/Config.in                    |    6 +-----
 .../luafilesystem-without_large_file.patch         |   20 ++++++++++++++++++++
 package/luafilesystem/luafilesystem.mk             |    6 +++++-
 package/wsapi/Config.in                            |    4 ----
 package/xavante/Config.in                          |    4 ----
 6 files changed, 26 insertions(+), 18 deletions(-)
 create mode 100644 package/luafilesystem/luafilesystem-without_large_file.patch

diff --git a/package/cgilua/Config.in b/package/cgilua/Config.in
index a74e49f..b43ba97 100644
--- a/package/cgilua/Config.in
+++ b/package/cgilua/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_CGILUA
 	bool "cgilua"
-	depends on BR2_LARGEFILE
 	select BR2_PACKAGE_LUA_SHARED_LIBRARY
 	select BR2_PACKAGE_LUAFILESYSTEM
 	help
@@ -8,6 +7,3 @@ config BR2_PACKAGE_CGILUA
 	  and manipulating input data from Web forms.
 
 	  http://luaforge.net/projects/cgilua/
-
-comment "cgilua requires a toolchain with LARGEFILE support"
-	depends on !BR2_LARGEFILE
diff --git a/package/luafilesystem/Config.in b/package/luafilesystem/Config.in
index 6cb6c24..edcb414 100644
--- a/package/luafilesystem/Config.in
+++ b/package/luafilesystem/Config.in
@@ -1,12 +1,8 @@
 config BR2_PACKAGE_LUAFILESYSTEM
 	bool "luafilesystem"
-	depends on BR2_LARGEFILE
 	select BR2_PACKAGE_LUA_SHARED_LIBRARY
 	help
 	  LuaFileSystem offers a portable way to access
 	  the underlying directory structure and file attributes.
 
-	  http://luaforge.net/projects/luafilesystem/
-
-comment "luafilesystem requires a toolchain with LARGEFILE support"
-	depends on !BR2_LARGEFILE
+	  http://keplerproject.github.com/luafilesystem/
diff --git a/package/luafilesystem/luafilesystem-without_large_file.patch b/package/luafilesystem/luafilesystem-without_large_file.patch
new file mode 100644
index 0000000..b1f41c0
--- /dev/null
+++ b/package/luafilesystem/luafilesystem-without_large_file.patch
@@ -0,0 +1,20 @@
+diff --git a/src/lfs.c b/src/lfs.c
+index 85f01e3..ed49f50 100644
+--- a/src/lfs.c
++++ b/src/lfs.c
+@@ -22,13 +22,13 @@
+ 
+ #ifndef _WIN32
+ #ifndef _AIX
+-#define _FILE_OFFSET_BITS 64 /* Linux, Solaris and HP-UX */
++//#define _FILE_OFFSET_BITS 64 /* Linux, Solaris and HP-UX */
+ #else
+ #define _LARGE_FILES 1 /* AIX */
+ #endif
+ #endif
+ 
+-#define _LARGEFILE64_SOURCE
++//#define _LARGEFILE64_SOURCE
+ 
+ #include <errno.h>
+ #include <stdio.h>
diff --git a/package/luafilesystem/luafilesystem.mk b/package/luafilesystem/luafilesystem.mk
index a27080c..e688734 100644
--- a/package/luafilesystem/luafilesystem.mk
+++ b/package/luafilesystem/luafilesystem.mk
@@ -8,8 +8,12 @@ LUAFILESYSTEM_VERSION = 1.5.0
 LUAFILESYSTEM_SITE = http://github.com/downloads/keplerproject/luafilesystem
 LUAFILESYSTEM_DEPENDENCIES = lua
 
+ifeq ($(BR2_LARGEFILE),y)
+LFS_CFLAGS = -D_FILE_OFFSET_BITS=64 _LARGEFILE64_SOURCE
+endif
+
 define LUAFILESYSTEM_BUILD_CMDS
-	$(MAKE) -C $(@D) CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS) -fPIC"
+	$(MAKE) -C $(@D) CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS) $(LFS_CFLAGS) -fPIC"
 endef
 
 define LUAFILESYSTEM_INSTALL_TARGET_CMDS
diff --git a/package/wsapi/Config.in b/package/wsapi/Config.in
index 472bbfc..3621648 100644
--- a/package/wsapi/Config.in
+++ b/package/wsapi/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_WSAPI
 	bool "wsapi"
-	depends on BR2_LARGEFILE # luafilesystem
 	select BR2_PACKAGE_COXPCALL
 	select BR2_PACKAGE_LUAFILESYSTEM
 	select BR2_PACKAGE_RINGS
@@ -8,6 +7,3 @@ config BR2_PACKAGE_WSAPI
 	  API that abstracts the web server from Lua web applications.
 
 	  http://keplerproject.github.com/wsapi/
-
-comment "wsapi requires a toolchain with LARGEFILE support"
-	depends on !BR2_LARGEFILE
diff --git a/package/xavante/Config.in b/package/xavante/Config.in
index a1b47c3..a7df530 100644
--- a/package/xavante/Config.in
+++ b/package/xavante/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_XAVANTE
 	bool "xavante"
-	depends on BR2_LARGEFILE # luafilesystem
 	select BR2_PACKAGE_LUA_SHARED_LIBRARY
 	select BR2_PACKAGE_CGILUA
 	select BR2_PACKAGE_COPAS
@@ -13,6 +12,3 @@ config BR2_PACKAGE_XAVANTE
 	  architecture based on URI mapped handlers.
 
 	  http://keplerproject.github.com/xavante/
-
-comment "xavante requires a toolchain with LARGEFILE support"
-	depends on !BR2_LARGEFILE
-- 
1.7.1
