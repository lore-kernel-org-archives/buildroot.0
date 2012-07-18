From: Francois Perrad <fperrad@gmail.com>
Date: Wed, 18 Jul 2012 15:59:12 +0200
Subject: [Buildroot] [PATCH 4/4] lua: refactor without sed
In-Reply-To: <1342619953-15512-1-git-send-email-francois.perrad@gadz.org>
References: <1342619953-15512-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1342619953-15512-4-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lua/lua.mk |   16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

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
-- 
1.7.9.5
