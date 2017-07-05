From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed,  5 Jul 2017 18:32:53 +0200
Subject: [Buildroot] [PATCH v2 2/3] package/kodi: remove -DCMAKE_C_FLAGS
	needed for sunxi-mali
In-Reply-To: <20170705163254.15156-1-bernd.kuhls@t-online.de>
References: <20170705163254.15156-1-bernd.kuhls@t-online.de>
Message-ID: <20170705163254.15156-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://git.buildroot.net/buildroot/commit/package/kodi/kodi.mk?id=23c3919c5e5b4fa69af9d16ce6a9286869740fd3
added CFLAGS "because configure uses gcc to detect egl support".

This was needed for the autoconf build system and is not needed for the
cmake build system anymore, tested using this defconfig

BR2_arm=y
BR2_cortex_a8=y
BR2_ARM_INSTRUCTIONS_THUMB2=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_PACKAGE_KODI=y
BR2_PACKAGE_RPI_USERLAND=y
BR2_PACKAGE_PYTHON=y
BR2_PACKAGE_PYTHON_PY_ONLY=y

$ grep -i gles .config
BR2_PACKAGE_KODI_EGL_GLES=y
BR2_PACKAGE_PROVIDES_LIBGLES="rpi-userland"
BR2_PACKAGE_HAS_LIBGLES=y

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: no changes

 package/kodi/kodi.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index 309d0d3af..3d6c70bee 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -231,7 +231,6 @@ ifeq ($(BR2_PACKAGE_KODI_EGL_GLES),y)
 KODI_DEPENDENCIES += libegl libgles
 KODI_CONF_OPTS += \
 	-DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) `$(PKG_CONFIG_HOST_BINARY) --cflags --libs egl`" \
-	-DCMAKE_C_FLAGS="$(TARGET_CFLAGS) `$(PKG_CONFIG_HOST_BINARY) --cflags --libs egl`" \
 	-DENABLE_OPENGLES=ON
 else
 KODI_CONF_OPTS += -DENABLE_OPENGLES=OFF
-- 
2.11.0
