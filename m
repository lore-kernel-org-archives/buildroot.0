From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 30 Nov 2014 23:11:29 +0100
Subject: [Buildroot] [git commit] luajit: point /usr/bin/lua to luajit if
	lua not selected
Message-ID: <20141130221326.2EFD07FFB2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=754a3cf860c1e5f398a76a61177f3acae91a999c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The luajit package is a provider of a lua interpreter, but does not install a
lua executable.  This is fine for scripts that explicitly invoke luajit, but
not so good for scripts that just need a lua interpreter and call lua.  This
mod creates a lua symlink so that the non-jit-specific scripts will still work.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/luajit/luajit.mk |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

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
