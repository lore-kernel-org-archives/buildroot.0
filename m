From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 12 Oct 2014 17:16:00 +0200
Subject: [Buildroot] [git commit] xserver_xorg-server: Add optional package
	xlib_libXcomposite as dependency
Message-ID: <20141012151638.11979B01DE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9e33687a13c554d6a1222d038dd159c533eacc27
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Make sure that xlib_libXcomposite is build before xserver_xorg-server.

With this defconfig

BR2_TOOLCHAIN_EXTERNAL=y
BR2_PACKAGE_XORG7=y
BR2_PACKAGE_XSERVER_XORG_SERVER=y
BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR=y
BR2_PACKAGE_XLIB_LIBXCOMPOSITE=y

and "make xserver_xorg-server" the package xlib_libXcomposite was ignored.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../xserver_xorg-server/xserver_xorg-server.mk     |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index f9522ed..c27dd80 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -161,7 +161,9 @@ ifneq ($(BR2_PACKAGE_XLIB_LIBXVMC),y)
 XSERVER_XORG_SERVER_CONF_OPTS += --disable-xvmc
 endif
 
-ifneq ($(BR2_PACKAGE_XLIB_LIBXCOMPOSITE),y)
+ifeq ($(BR2_PACKAGE_XLIB_LIBXCOMPOSITE),y)
+XSERVER_XORG_SERVER_DEPENDENCIES += xlib_libXcomposite
+else
 XSERVER_XORG_SERVER_CONF_OPTS += --disable-composite
 endif
 
