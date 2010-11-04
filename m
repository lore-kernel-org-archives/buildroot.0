From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Thu, 04 Nov 2010 10:58:33 +0200
Subject: [Buildroot] [PATCH 1/2] Create X symlink for TinyX
Message-ID: <20101104085833.30286.42896.stgit@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When installing TinyX to target create /usr/bin/X symlink
to Xfbdev as it is the only TinyX driver we build.
This makes utils like startx happy :)

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---

 .../xserver_xorg-server/xserver_xorg-server.mk     |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index d9ea570..7fc2a8a 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -74,6 +74,10 @@ endif
 ifeq ($(BR2_PACKAGE_XSERVER_tinyx),y)
 XSERVER_XORG_SERVER_CONF_OPT += --enable-kdrive --enable-xfbdev \
 		--disable-glx --disable-dri --disable-xsdl
+define XSERVER_CREATE_X_SYMLINK
+ ln -f -s Xfbdev $(TARGET_DIR)/usr/bin/X
+endef
+XSERVER_XORG_SERVER_POST_INSTALL_TARGET_HOOKS += XSERVER_CREATE_X_SYMLINK
 else
 XSERVER_XORG_SERVER_CONF_OPT += --disable-kdrive --disable-xfbdev
 endif
