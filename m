From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 16 Feb 2014 19:32:42 +0100
Subject: [Buildroot] [PATCH] vlc: needs dependency on host-lua if Lua is
	selected
Message-ID: <a785bb569d9872bd7cc8.1392575562@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If Lua support is requested in VLC, its configure script tries to find the
luac byte compiler, which fails if host-lua is not yet built.

This can be easily reproduced by setting a minimal config with vlc and Lua
enabled, and running: 'make clean toolchain vlc'. Final output is:

checking for LUA... no
configure: WARNING: Package lua5.2 was not found in the pkg-config search path.
Perhaps you should add the directory containing `lua5.2.pc'
to the PKG_CONFIG_PATH environment variable
No package 'lua5.2' found, trying lua 5.1 instead
checking for LUA... no
configure: WARNING: Package lua5.1 was not found in the pkg-config search path.
Perhaps you should add the directory containing `lua5.1.pc'
to the PKG_CONFIG_PATH environment variable
No package 'lua5.1' found, trying lua >= 5.1 instead
checking for LUA... yes
checking for luac... no
configure: error: Could not find the LUA byte compiler.
make: *** [<buildroot>/output/build/vlc-2.1.2/.stamp_configured] Error 1

Fix this problem by setting host-lua as a dependency to vlc.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 package/vlc/vlc.mk |  2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -226,7 +226,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_LUA),y)
 VLC_CONF_OPT += --enable-lua
-VLC_DEPENDENCIES += lua
+VLC_DEPENDENCIES += lua host-lua
 else
 VLC_CONF_OPT += --disable-lua
 endif
