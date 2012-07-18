From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 18 Jul 2012 19:33:34 +0200
Subject: [Buildroot] [git commit] lua: refactor without sed
Message-ID: <20120718173430.C8C3F90ABF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ad6af5819f88bac9ca7f50e565c4fc68d3e408cc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lua/lua.mk |   16 +++++++---------
 1 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/package/lua/lua.mk b/package/lua/lua.mk
index 1e52075..8f71fc2 100644
--- a/package/lua/lua.mk
+++ b/package/lua/lua.mk
@@ -8,8 +8,9 @@ LUA_VERSION = 5.1.5
 LUA_SITE = http://www.lua.org/ftp
 LUA_INSTALL_STAGING = YES
 
+LUA_CFLAGS = -Wall
 ifeq ($(BR2_PACKAGE_LUA_SHARED_LIBRARY),y)
-	LUA_MYCFLAGS += -fPIC
+	LUA_CFLAGS += -fPIC
 endif
 
 LUA_MYLIBS += -ldl
@@ -17,28 +18,25 @@ LUA_MYLIBS += -ldl
 ifeq ($(BR2_PACKAGE_LUA_INTERPRETER_READLINE),y)
 	LUA_DEPENDENCIES = readline ncurses
 	LUA_MYLIBS += -lreadline -lhistory -lncurses
-	LUA_MYCFLAGS += -DLUA_USE_LINUX
+	LUA_CFLAGS += -DLUA_USE_LINUX
 else
-	LUA_MYCFLAGS += -DLUA_USE_POSIX -DLUA_USE_DLOPEN
+	LUA_CFLAGS += -DLUA_USE_POSIX -DLUA_USE_DLOPEN
 endif
 
-HOST_LUA_DEPENDENCIES =
-HOST_LUA_MYCFLAGS = -fPIC -DLUA_USE_DLOPEN -DLUA_USE_POSIX
+HOST_LUA_CFLAGS = -Wall -fPIC -DLUA_USE_DLOPEN -DLUA_USE_POSIX
 HOST_LUA_MYLIBS = -ldl
 
 define LUA_BUILD_CMDS
-	sed -i -e 's/-O2//' $(@D)/src/Makefile
 	$(MAKE) \
 	CC="$(TARGET_CC)" RANLIB="$(TARGET_RANLIB)" \
-	MYCFLAGS="$(TARGET_CFLAGS) $(LUA_MYCFLAGS)" \
+	CFLAGS="$(TARGET_CFLAGS) $(LUA_CFLAGS)" \
 	MYLIBS="$(LUA_MYLIBS)" AR="$(TARGET_CROSS)ar rcu" \
 	PKG_VERSION=$(LUA_VERSION) -C $(@D)/src all
 endef
 
 define HOST_LUA_BUILD_CMDS
-	sed -i -e 's/-O2//' $(@D)/src/Makefile
 	$(MAKE) \
-	MYCFLAGS="$(HOST_LUA_MYCFLAGS)" \
+	CFLAGS="$(HOST_LUA_CFLAGS)" \
 	MYLIBS="$(HOST_LUA_MYLIBS)" \
 	PKG_VERSION=$(LUA_VERSION) -C $(@D)/src all
 endef
