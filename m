From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Apr 2018 00:08:38 +0200
Subject: [Buildroot] [git commit] ncmpc: fix build with ncursesw
Message-ID: <20180401220846.2FAC5837CB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=70e6b08d41be1c5d5a4272c8b4210963ca9a278e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/c5bb5f978602896179ff9c58ecf4ced40bb96b57

When ncurses is built with wide support, we install libncursesw (plus a
libncurses symlink) but NOT ncursesw.h, only ncurses.h.  This combination
confuses the ncmpc build system as it expects a ncursesw.h when it finds
libncursesw:

meson.build:92:4: ERROR: Problem encountered: No ncursesw header found

The ncurses/ncursesw logic in the build system is only used to know what
header file to #include, and what library to link with.  As we already
provide a libncurses symlink when building with wide support we can simply
force ncmpc to use the ncurses variant.

[Peter: extend commit message]
Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ncmpc/ncmpc.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/ncmpc/ncmpc.mk b/package/ncmpc/ncmpc.mk
index 0c9dfd4658..6bce627562 100644
--- a/package/ncmpc/ncmpc.mk
+++ b/package/ncmpc/ncmpc.mk
@@ -14,6 +14,7 @@ NCMPC_LICENSE_FILES = COPYING
 
 NCMPC_CONF_OPTS += \
 	--prefix=/usr \
+	-Dcurses=ncurses \
 	--buildtype $(if $(BR2_ENABLE_DEBUG),debug,release) \
 	--cross-file $(HOST_DIR)/etc/meson/cross-compilation.conf
 
