From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Mon, 31 Jul 2017 23:18:00 +0200
Subject: [Buildroot] [PATCH 2/2] swupdate: support for Lua 5.1 is broken
In-Reply-To: <20170731211800.5888-1-joerg.krause@embedded.rocks>
References: <20170731211800.5888-1-joerg.krause@embedded.rocks>
Message-ID: <20170731211800.5888-2-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Before commit 87b6ac1478821351c92f7ca1c3154550e4713b28 support for Lua
was always disabled by the default config file:

```
CONFIG_LUA is not set
```

The commit removed this setting and Lua support is now enabled if a Lua
interpreter is enabled. As the swupdate build system uses pkg-config to check
for the lua library by default (LUAPKG="lua") this throws a lot of
undefined referenced in case LuaJIT is uses as Lua interpreter, e.g.:

```
corelib/lib.a(lua_interface.o): In function `l_info':
lua_interface.c:(.text.l_info+0x14): undefined reference to `luaL_checklstring'
```

However, since version 2017.07 support for Lua 5.1 is broken in swupdate. Therefore,
remove support for Lua 5.1 and LuaJIT in the swupdate package for now
until upstream might fix this issue.

Reported upstream:
https://groups.google.com/forum/#!topic/swupdate/WAm8npAOd6o

Fixes:
http://autobuild.buildroot.net/results/df2/df2a71efe5af52d7b8721a355c49934b1be197a3/
http://autobuild.buildroot.net/results/400/4006225c8a47eb0b56399c83bd6d00406a0f62c2/
http://autobuild.buildroot.net/results/098/098f9d6cd905359adac4fb15e1d54c5022757325/
http://autobuild.buildroot.net/results/e5f/e5f6f99d96d9c661454335e7f931a03c3ae6a9e2/
http://autobuild.buildroot.net/results/f3a/f3a0abe8d5e35c85da40d20dab260c28506a0d4c/

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/swupdate/Config.in   | 7 ++-----
 package/swupdate/swupdate.mk | 4 ++--
 2 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/package/swupdate/Config.in b/package/swupdate/Config.in
index dbc69f1fe8..7a0f9d12e5 100644
--- a/package/swupdate/Config.in
+++ b/package/swupdate/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_SWUPDATE
 	depends on BR2_USE_MMU # fork()
 	# swupdate requires a parser and uses libconfig as default
 	select BR2_PACKAGE_LIBCONFIG if !BR2_PACKAGE_JSON_C && \
-		!BR2_PACKAGE_HAS_LUAINTERPRETER
+		!BR2_PACKAGE_LUA_5_2 && !BR2_PACKAGE_LUA_5_3
 	help
 	  swupdate provides a reliable way to update the software on an
 	  embedded system.
@@ -19,11 +19,8 @@ config BR2_PACKAGE_SWUPDATE
 	  use your own modified configuration, you have to select the
 	  necessary packages manually:
 
-	  * Select BR2_PACKAGE_LUA or BR2_PACKAGE_LUAJIT if you want
+	  * Select BR2_PACKAGE_LUA_5_2 or BR2_PACKAGE_LUA_5_3 if you want
 	    to have Lua support.
-	    CONFIG_HANDLER_IN_LUA is not supported in LuaJIT or Lua 5.1.
-	    Note that for LuaJIT support, you need to set
-	    CONFIG_LUAVERSION="jit-5.1".
 	  * Select BR2_LIBCURL if you want to use the download feature.
 	  * Select BR2_PACKAGE_OPENSSL is you want to add encryption support.
 	  * Select BR2_PACKAGE_MTD if you want to use swupdate with UBI
diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
index ee92adddf0..fbb092da05 100644
--- a/package/swupdate/swupdate.mk
+++ b/package/swupdate/swupdate.mk
@@ -39,8 +39,8 @@ else
 SWUPDATE_MAKE_ENV += HAVE_LIBCURL=n
 endif
 
-ifeq ($(BR2_PACKAGE_HAS_LUAINTERPRETER),y)
-SWUPDATE_DEPENDENCIES += luainterpreter host-pkgconf
+ifeq ($(BR2_PACKAGE_LUA_5_2)$(BR2_PACKAGE_LUA_5_3),y)
+SWUPDATE_DEPENDENCIES += lua host-pkgconf
 SWUPDATE_MAKE_ENV += HAVE_LUA=y
 else
 SWUPDATE_MAKE_ENV += HAVE_LUA=n
-- 
2.13.3
