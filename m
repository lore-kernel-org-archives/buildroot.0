From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 27 Mar 2014 08:42:47 +0100
Subject: [Buildroot] [git commit] libubox: fix build with lua option
Message-ID: <20140327074324.2D2269C3BE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9efd3bd079ce24791e6b6bdd6f02983991b68b8c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.org/results/fc6/fc64896ca5c3b05dfe4b5c5e7d25fc4b6c9976ad/
and a bunch of similar failures.

When Lua package is selected, libubox sets an option to build with Lua
binding. Unfortunately, if LUAPATH is not passed libubox seeks it on
the host instead of staging due to hard coded pkg-config commands in
its CMake file. As a result Lua is not found and the build fails.
Fix it by passing LUAPATH in LIBUBOX_CONF_OPT.

Similarly, libubox seeks LUA_CFLAGS with the host's pkg-config for the
same reason. To prevent potential errors, fix it by passing LUA_CFLAGS
in LIBUBOX_CONF_OPT.

Finally, libubox fails to build with Lua 5.2 because it uses functions
removed from this version.
Fix it by activating the option only with Lua 5.1.

Signed-off-by: Hadrien Boutteville <hadrien.boutteville@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libubox/libubox.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/libubox/libubox.mk b/package/libubox/libubox.mk
index 28d5c63..22efc9a 100644
--- a/package/libubox/libubox.mk
+++ b/package/libubox/libubox.mk
@@ -10,8 +10,10 @@ LIBUBOX_LICENSE = LGPLv2.1, GPLv2, BSD-3c, MIT
 LIBUBOX_INSTALL_STAGING = YES
 LIBUBOX_DEPENDENCIES = host-pkgconf $(if $(BR2_PACKAGE_JSON_C),json-c)
 
-ifeq ($(BR2_PACKAGE_LUA),y)
+ifeq ($(BR2_PACKAGE_LUA_5_1),y)
 	LIBUBOX_DEPENDENCIES += lua
+	LIBUBOX_CONF_OPT += -DLUAPATH=$(STAGING_DIR)/usr/lib/lua/5.1 \
+		-DLUA_CFLAGS=-I$(STAGING_DIR)/usr/include
 else
 	LIBUBOX_CONF_OPT += -DBUILD_LUA:BOOL=OFF
 endif
