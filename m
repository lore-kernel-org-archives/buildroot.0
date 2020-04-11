From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 11 Apr 2020 15:58:42 +0200
Subject: [Buildroot] [git commit] package/luarocks: luajit is now detected
 automatically by luarocks
Message-ID: <20200411134553.165118E522@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a27d01cde157ea0534ba66fecc3e8fb82cde9155
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since luarocks commit
https://github.com/luarocks/luarocks/commit/ffab9f32698431bb901b786460e4695806ebcf30,
available since luarocks v3.2.0, LuaJIT is now detected
automatically. It is therefore no longer necessary to explicitly
indicate in lua_interpreter that LuaJIT is used.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/luarocks/luarocks.mk | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/package/luarocks/luarocks.mk b/package/luarocks/luarocks.mk
index 123f8c0734..d48c95ced9 100644
--- a/package/luarocks/luarocks.mk
+++ b/package/luarocks/luarocks.mk
@@ -33,17 +33,10 @@ define HOST_LUAROCKS_CONFIGURE_CMDS
 	cd $(@D) && ./configure $(HOST_LUAROCKS_CONF_OPTS)
 endef
 
-ifeq ($(BR2_PACKAGE_LUAJIT),y)
-define LUAROCKS_CONFIGURE_INTERPRETER_LUAJIT
-	echo "lua_interpreter = [[luajit]]" >> $(LUAROCKS_CONFIG_FILE)
-endef
-endif
-
 define HOST_LUAROCKS_INSTALL_CMDS
 	rm -f $(LUAROCKS_CONFIG_FILE)
 	$(MAKE1) -C $(@D) install
 	cat $(HOST_LUAROCKS_PKGDIR)/luarocks-br-config.lua >> $(LUAROCKS_CONFIG_FILE)
-	$(LUAROCKS_CONFIGURE_INTERPRETER_LUAJIT)
 endef
 
 $(eval $(host-generic-package))
