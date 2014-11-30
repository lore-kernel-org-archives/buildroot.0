From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Sun, 30 Nov 2014 13:46:12 -0500
Subject: [Buildroot] [PATCH v2] luajit: point /usr/bin/lua to luajit if lua
	not selected
Message-ID: <1417373172-3806-1-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The luajit package is a provider of a lua interpreter, but does not install a
lua executable.  This is fine for scripts that explicitly invoke luajit, but
not so good for scripts that just need a lua interpreter and call lua.  This
mod creates a lua symlink so that the non-jit-specific scripts will still work.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>

---

Changes v1 -> v2:
   - Remove BR2_PACKAGE_LUA conditional, as suggested by Yann Morin.
     (Diverges from python3 precedent, but saves a test.)
   - Drop some detail from the commit log that might be misinterpreted.
---
 package/luajit/luajit.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/luajit/luajit.mk b/package/luajit/luajit.mk
index 2c1f8f4..85e9f15 100644
--- a/package/luajit/luajit.mk
+++ b/package/luajit/luajit.mk
@@ -64,6 +64,11 @@ define LUAJIT_INSTALL_TARGET_CMDS
 	$(MAKE) PREFIX="/usr" DESTDIR="$(TARGET_DIR)" LDCONFIG=true -C $(@D) install
 endef
 
+define LUAJIT_INSTALL_SYMLINK
+	ln -fs luajit $(TARGET_DIR)/usr/bin/lua
+endef
+LUAJIT_POST_INSTALL_TARGET_HOOKS += LUAJIT_INSTALL_SYMLINK
+
 define HOST_LUAJIT_BUILD_CMDS
 	$(MAKE) PREFIX="/usr" BUILDMODE=static -C $(@D) amalg
 endef
-- 
1.9.1
