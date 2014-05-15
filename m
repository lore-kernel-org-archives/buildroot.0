From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 15 May 2014 19:37:05 +0200
Subject: [Buildroot] [PATCH 3/3] packages: make providers declare what they
	provide
In-Reply-To: <cover.1400175284.git.yann.morin.1998@free.fr>
References: <cover.1400175284.git.yann.morin.1998@free.fr>
Message-ID: <ddf899127c90b51c88fbf298f0343852f930c698.1400175284.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Fixes:
    http://autobuild.buildroot.org/results/285/2851069d6964aa46d26b4aabe7d84e8c0c6c72ce
    http://autobuild.buildroot.net/results/9b7/9b7870354d70e27e42d3d9c1f131ab54706bf20e
    [...]

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <jacmet@uclibc.org>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Samuel Martin <s.martin49@gmail.com>
---
 package/bellagio/bellagio.mk                               | 1 +
 package/eudev/eudev.mk                                     | 1 +
 package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk | 2 ++
 package/lua/lua.mk                                         | 2 ++
 package/luajit/luajit.mk                                   | 2 ++
 package/mesa3d/mesa3d.mk                                   | 5 +++++
 package/rpi-userland/rpi-userland.mk                       | 2 ++
 package/sunxi-mali/sunxi-mali.mk                           | 1 +
 package/systemd/systemd.mk                                 | 2 ++
 package/ti-gfx/ti-gfx.mk                                   | 1 +
 10 files changed, 19 insertions(+)

diff --git a/package/bellagio/bellagio.mk b/package/bellagio/bellagio.mk
index 993015c..6db753d 100644
--- a/package/bellagio/bellagio.mk
+++ b/package/bellagio/bellagio.mk
@@ -11,5 +11,6 @@ BELLAGIO_AUTORECONF = YES
 BELLAGIO_INSTALL_STAGING = YES
 BELLAGIO_LICENSE = LGPLv2.1+
 BELLAGIO_LICENSE_FILES = COPYING
+BELLAGIO_PROVIDES = libopenmax
 
 $(eval $(autotools-package))
diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
index 8e5e83d..720c2e9 100644
--- a/package/eudev/eudev.mk
+++ b/package/eudev/eudev.mk
@@ -25,6 +25,7 @@ EUDEV_CONF_OPT =		\
 	--enable-libkmod
 
 EUDEV_DEPENDENCIES = host-gperf host-pkgconf util-linux kmod
+EUDEV_PROVIDES = udev
 
 ifeq ($(BR2_PACKAGE_EUDEV_RULES_GEN),y)
 EUDEV_CONF_OPT += --enable-rule_generator
diff --git a/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk b/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk
index e799fd2..49a8287 100644
--- a/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk
+++ b/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk
@@ -23,6 +23,8 @@ GPU_VIV_BIN_MX6Q_LICENSE = Freescale Semiconductor Software License Agreement
 # for which a separate license is needed...
 GPU_VIV_BIN_MX6Q_REDISTRIBUTE = NO
 
+GPU_VIV_BIN_MX6Q_PROVIDES = libegl libgles
+
 # DirectFB is not supported (wrong version)
 ifeq ($(BR2_PACKAGE_XORG7),y)
 GPU_VIV_BIN_MX6Q_DEPENDENCIES = xlib_libXdamage xlib_libXext
diff --git a/package/lua/lua.mk b/package/lua/lua.mk
index bc8799a..524f6a2 100644
--- a/package/lua/lua.mk
+++ b/package/lua/lua.mk
@@ -14,6 +14,8 @@ LUA_INSTALL_STAGING = YES
 LUA_LICENSE = MIT
 LUA_LICENSE_FILES = COPYRIGHT
 
+LUA_PROVIDES = luainterpreter
+
 LUA_CFLAGS = -Wall -fPIC -DLUA_USE_POSIX
 
 ifeq ($(BR2_PACKAGE_LUA_5_2),y)
diff --git a/package/luajit/luajit.mk b/package/luajit/luajit.mk
index c4b065d..72240b2 100644
--- a/package/luajit/luajit.mk
+++ b/package/luajit/luajit.mk
@@ -12,6 +12,8 @@ LUAJIT_LICENSE_FILES = COPYRIGHT
 
 LUAJIT_INSTALL_STAGING = YES
 
+LUAJIT_PROVIDES = luainterpreter
+
 ifneq ($(BR2_LARGEFILE),y)
 LUAJIT_NO_LARGEFILE = TARGET_LFSFLAGS=
 endif
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 63ba574..fa17177 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -13,6 +13,8 @@ MESA3D_AUTORECONF = YES
 
 MESA3D_INSTALL_STAGING = YES
 
+MESA3D_PROVIDES =
+
 MESA3D_DEPENDENCIES = \
 	expat \
 	host-bison \
@@ -71,6 +73,7 @@ ifeq ($(MESA3D_DRI_DRIVERS-y),)
 MESA3D_CONF_OPT += \
 	--without-dri-drivers
 else
+MESA3D_PROVIDES += libgl
 MESA3D_CONF_OPT += \
 	--enable-dri \
 	--enable-shared-glapi \
@@ -85,6 +88,7 @@ endif
 MESA3D_CONF_OPT += --enable-opengl
 
 ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_EGL),y)
+MESA3D_PROVIDES += libegl
 # egl depends on gbm, gbm depends on udev
 MESA3D_DEPENDENCIES += udev
 MESA3D_EGL_PLATFORMS = drm
@@ -105,6 +109,7 @@ MESA3D_CONF_OPT += \
 endif
 
 ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_ES),y)
+MESA3D_PROVIDES += libgles
 MESA3D_CONF_OPT += --enable-gles1 --enable-gles2
 else
 MESA3D_CONF_OPT += --disable-gles1 --disable-gles2
diff --git a/package/rpi-userland/rpi-userland.mk b/package/rpi-userland/rpi-userland.mk
index f6e4443..690fd1e 100644
--- a/package/rpi-userland/rpi-userland.mk
+++ b/package/rpi-userland/rpi-userland.mk
@@ -11,6 +11,8 @@ RPI_USERLAND_LICENSE_FILES = LICENCE
 RPI_USERLAND_INSTALL_STAGING = YES
 RPI_USERLAND_CONF_OPT = -DVMCS_INSTALL_PREFIX=/usr -DBUILD_SHARED_LIBS=OFF
 
+RPI_USERLAND_PROVIDES = libegl libgles libopenmax libopenvg
+
 define RPI_USERLAND_POST_TARGET_CLEANUP
     rm -Rf $(TARGET_DIR)/usr/src
 endef
diff --git a/package/sunxi-mali/sunxi-mali.mk b/package/sunxi-mali/sunxi-mali.mk
index c625c6e..c6900c8 100644
--- a/package/sunxi-mali/sunxi-mali.mk
+++ b/package/sunxi-mali/sunxi-mali.mk
@@ -9,6 +9,7 @@ SUNXI_MALI_SITE = $(call github,linux-sunxi,sunxi-mali,$(SUNXI_MALI_VERSION))
 
 SUNXI_MALI_INSTALL_STAGING = YES
 SUNXI_MALI_DEPENDENCIES = sunxi-mali-prop
+SUNXI_MALI_PROVIDES = libegl libgles
 
 # The options below must be provided in the environment.  Providing these
 # through options overrides the value and prevents the makefiles from
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index f7661ab..e1c984f 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -17,6 +17,8 @@ SYSTEMD_DEPENDENCIES = \
 	kmod \
 	host-gperf
 
+SYSTEMD_PROVIDES = udev
+
 # Make sure that systemd will always be built after busybox so that we have
 # a consistent init setup between two builds
 ifeq ($(BR2_PACKAGE_BUSYBOX),y)
diff --git a/package/ti-gfx/ti-gfx.mk b/package/ti-gfx/ti-gfx.mk
index e48715d..324e19c 100644
--- a/package/ti-gfx/ti-gfx.mk
+++ b/package/ti-gfx/ti-gfx.mk
@@ -19,6 +19,7 @@ TI_GFX_LICENSE_FILES = TSPA.txt
 TI_GFX_INSTALL_STAGING = YES
 
 TI_GFX_DEPENDENCIES = linux
+TI_GFX_PROVIDES = libegl libgles powervr
 
 ifeq ($(BR2_PACKAGE_TI_GFX_ES3),y)
 TI_GFX_OMAPES = 3.x
-- 
1.8.3.2
