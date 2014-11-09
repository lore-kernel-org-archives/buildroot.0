From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Sat,  8 Nov 2014 22:22:30 -0500
Subject: [Buildroot] [PATCH 1/1] luajit: point /usr/bin/lua to luajit if lua
	not selected
Message-ID: <1415503350-2021-1-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The luajit package is a provider of a lua interpreter, but does
not install a lua executable, as it can live side by side with lua.
This is fine for scripts that explicitly invoke luajit, but not
so good for scripts that just need a lua interpreter and call lua.
This mod creates a lua symlink so that the non-jit-specific scripts
will still work.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 package/luajit/luajit.mk |    7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/luajit/luajit.mk b/package/luajit/luajit.mk
index 2c1f8f4..f38088c 100644
--- a/package/luajit/luajit.mk
+++ b/package/luajit/luajit.mk
@@ -64,6 +64,13 @@ define LUAJIT_INSTALL_TARGET_CMDS
 	$(MAKE) PREFIX="/usr" DESTDIR="$(TARGET_DIR)" LDCONFIG=true -C $(@D) install
 endef
 
+ifneq ($(BR2_PACKAGE_LUA),y)
+define LUAJIT_INSTALL_SYMLINK
+	ln -fs luajit $(TARGET_DIR)/usr/bin/lua
+endef
+LUAJIT_POST_INSTALL_TARGET_HOOKS += LUAJIT_INSTALL_SYMLINK
+endif
+
 define HOST_LUAJIT_BUILD_CMDS
 	$(MAKE) PREFIX="/usr" BUILDMODE=static -C $(@D) amalg
 endef
-- 
1.7.9.5
