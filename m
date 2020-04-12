From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Apr 2020 14:48:18 +0200
Subject: [Buildroot] [git commit] package/lua: allow host-lua to find
 installed modules
Message-ID: <20200412123416.5541E8E6C3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4be3fd6fdb73085a35e89c2c1218c1e0b1e74a79
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We need to set LUA_ROOT to allow the host-lua interpreter to find
installed modules.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lua/lua.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/lua/lua.mk b/package/lua/lua.mk
index 2ff2fdf754..ce75af6b02 100644
--- a/package/lua/lua.mk
+++ b/package/lua/lua.mk
@@ -54,6 +54,11 @@ endef
 LUA_POST_PATCH_HOOKS += LUA_32BITS_LUACONF
 endif
 
+define HOST_LUA_LUACONF
+	$(SED) 's|#define LUA_ROOT.*|#define LUA_ROOT "$(HOST_DIR)/usr/"|' $(@D)/src/luaconf.h
+endef
+HOST_LUA_POST_PATCH_HOOKS += HOST_LUA_LUACONF
+
 HOST_LUA_CFLAGS = -Wall -fPIC -DLUA_USE_DLOPEN -DLUA_USE_POSIX
 ifeq ($(BR2_PACKAGE_LUA_5_3),y)
 HOST_LUA_CFLAGS += -DLUA_COMPAT_5_2
