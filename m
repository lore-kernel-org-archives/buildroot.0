From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 23 Oct 2019 08:22:20 +0200
Subject: [Buildroot] [PATCH 3/3] package/x11r7/xserver_xorg-server: switch
 to virtual opengl provider
In-Reply-To: <20191023062220.5646-1-bernd.kuhls@t-online.de>
References: <20191023062220.5646-1-bernd.kuhls@t-online.de>
Message-ID: <20191023062220.5646-3-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This allows to use xserver_xorg-server without mesa3d.

Build-tested using this defconfig:

BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_PACKAGE_XORG7=y
BR2_PACKAGE_XSERVER_XORG_SERVER=y
BR2_PACKAGE_NVIDIA_DRIVER=y

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xserver_xorg-server/xserver_xorg-server.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index 41c82ad930..8ccc04224d 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -120,9 +120,9 @@ else # modular
 XSERVER_XORG_SERVER_CONF_OPTS += --disable-kdrive --disable-xfbdev
 endif
 
-ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_GLX),y)
+ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
 XSERVER_XORG_SERVER_CONF_OPTS += --enable-dri --enable-glx
-XSERVER_XORG_SERVER_DEPENDENCIES += mesa3d
+XSERVER_XORG_SERVER_DEPENDENCIES += libgl
 else
 XSERVER_XORG_SERVER_CONF_OPTS += --disable-dri --disable-glx
 endif
-- 
2.20.1
