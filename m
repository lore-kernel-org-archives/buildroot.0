From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 6 Oct 2010 17:10:26 +0200
Subject: [Buildroot] [git commit master 1/1] directfb: cleanup,
	use autotarget variables right away
Message-ID: <20101006151258.4CE418BE58@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=e99a9b2c22a32d4c840793780f7e0a44730def52
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Purely cosmetical.

Structure package like the other autotarget packages, and use
DIRECTFB_{CONF_OPT,DEPENDENCIES} right away instead of a number
of extra variables.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/directfb/directfb.mk |  158 ++++++++++++++++--------------------------
 1 files changed, 61 insertions(+), 97 deletions(-)

diff --git a/package/directfb/directfb.mk b/package/directfb/directfb.mk
index 05d3673..e4b6d90 100644
--- a/package/directfb/directfb.mk
+++ b/package/directfb/directfb.mk
@@ -12,152 +12,116 @@ DIRECTFB_LIBTOOL_PATCH = NO
 DIRECTFB_INSTALL_STAGING = YES
 DIRECTFB_INSTALL_TARGET = YES
 
+DIRECTFB_CONF_OPT = \
+	--localstatedir=/var \
+	--enable-static \
+	--enable-shared \
+	--disable-explicit-deps \
+	--program-prefix='' \
+	--enable-zlib \
+	--enable-freetype \
+	--enable-fbdev \
+	--disable-sysfs \
+	--disable-sdl \
+	--disable-vnc \
+	--disable-osx \
+	--disable-video4linux \
+	--disable-video4linux2
+
+DIRECTFB_DEPENDENCIES = freetype zlib
+
 ifeq ($(BR2_PACKAGE_DIRECTFB_MULTI),y)
-DIRECTFB_MULTI:=--enable-multi --enable-fusion
-DIRECTFB_FUSION:=linux-fusion
-else
-DIRECTFB_MULTI:=
-DIRECTFB_FUSION:=
+DIRECTFB_CONF_OPT += --enable-multi --enable-fusion
+DIRECTFB_DEPENDENCIES += linux-fusion
 endif
 
 ifeq ($(BR2_PACKAGE_DIRECTFB_DEBUG),y)
-DIRECTFB_DEBUG:=--enable-debug
-else
-DIRECTFB_DEBUG:=
+DIRECTFB_CONF_OPT += --enable-debug
 endif
 
 ifeq ($(BR2_PACKAGE_DIRECTFB_TRACE),y)
-DIRECTFB_TRACE:=--enable-trace
-else
-DIRECTFB_TRACE:=
+DIRECTFB_CONF_OPT += --enable-trace
 endif
 
 ifeq ($(BR2_PACKAGE_XSERVER),y)
-DIRECTFB_X:=--enable-x11
+DIRECTFB_CONF_OPT += --enable-x11
 else
-DIRECTFB_X:=--disable-x11
+DIRECTFB_CONF_OPT += -disable-x11
 endif
 
 ifeq ($(BR2_PACKAGE_DIRECTFB_UNIQUE),y)
-DIRECTFB_UNIQUE:=--enable-unique
+DIRECTFB_CONF_OPT += --enable-unique
 else
-DIRECTFB_UNIQUE:=--disable-unique
+DIRECTFB_CONF_OPT += --disable-unique
 endif
 
-DIRECTFB_GFX:=
-ifeq ($(BR2_PACKAGE_DIRECTFB_ATI128),y)
-DIRECTFB_GFX+= ati128
-endif
-ifeq ($(BR2_PACKAGE_DIRECTFB_CLE266),y)
-DIRECTFB_GFX+= cle266
-endif
-ifeq ($(BR2_PACKAGE_DIRECTFB_CYBER5K),y)
-DIRECTFB_GFX+= cyber5k
-endif
-ifeq ($(BR2_PACKAGE_DIRECTFB_MATROX),y)
-DIRECTFB_GFX+= matrox
-endif
-ifeq ($(BR2_PACKAGE_DIRECTFB_PXA3XX),y)
-DIRECTFB_GFX+= pxa3xx
-endif
-ifeq ($(BR2_PACKAGE_DIRECTFB_UNICHROME),y)
-DIRECTFB_GFX+= unichrome
-endif
-ifeq ($(BR2_PACKAGE_DIRECTFB_I830),y)
-DIRECTFB_GFX+= i830
-endif
-ifeq ($(DIRECTFB_GFX),)
+DIRECTFB_GFX := \
+	$(if $(BR2_PACKAGE_DIRECTFB_ATI128),ati128) \
+	$(if $(BR2_PACKAGE_DIRECTFB_CLE266),cle266) \
+	$(if $(BR2_PACKAGE_DIRECTFB_CYBER5K),cyber5k) \
+	$(if $(BR2_PACKAGE_DIRECTFB_MATROX),matrox) \
+	$(if $(BR2_PACKAGE_DIRECTFB_PXA3XX),pxa3xx) \
+	$(if $(BR2_PACKAGE_DIRECTFB_UNICHROME),unichrome) \
+	$(if $(BR2_PACKAGE_DIRECTFB_I830),i830)
+
+ifeq ($(strip $(DIRECTFB_GFX)),)
 DIRECTFB_GFX:=none
 else
 DIRECTFB_GFX:=$(subst $(space),$(comma),$(strip $(DIRECTFB_GFX)))
 endif
 
-DIRECTFB_INPUT:=
-ifeq ($(BR2_PACKAGE_DIRECTFB_LINUXINPUT),y)
-DIRECTFB_INPUT+= linuxinput
-endif
-ifeq ($(BR2_PACKAGE_DIRECTFB_KEYBOARD),y)
-DIRECTFB_INPUT+= keyboard
-endif
-ifeq ($(BR2_PACKAGE_DIRECTFB_PS2MOUSE),y)
-DIRECTFB_INPUT+= ps2mouse
-endif
-ifeq ($(BR2_PACKAGE_DIRECTFB_SERIALMOUSE),y)
-DIRECTFB_INPUT+= serialmouse
-endif
+DIRECTFB_CONF_OPT += --with-gfxdrivers=$(DIRECTFB_GFX)
+
+DIRECTFB_INPUT := \
+	$(if $(BR2_PACKAGE_DIRECTFB_LINUXINPUT),linuxinput) \
+	$(if $(BR2_PACKAGE_DIRECTFB_KEYBOARD),keyboard) \
+	$(if $(BR2_PACKAGE_DIRECTFB_PS2MOUSE),ps2mouse) \
+	$(if $(BR2_PACKAGE_DIRECTFB_SERIALMOUSE),serialmouse) \
+	$(if $(BR2_PACKAGE_DIRECTFB_TSLIB),tslib)
+
 ifeq ($(BR2_PACKAGE_DIRECTFB_TSLIB),y)
-DIRECTFB_INPUT+= tslib
-DIRECTFB_DEP+= tslib
+DIRECTFB_DEPENDENCIES += tslib
 endif
-ifeq ($(DIRECTFB_INPUT),)
+
+ifeq ($(strip $(DIRECTFB_INPUT)),)
 DIRECTFB_INPUT:=none
 else
 DIRECTFB_INPUT:=$(subst $(space),$(comma),$(strip $(DIRECTFB_INPUT)))
 endif
 
+DIRECTFB_CONF_OPT += --with-inputdrivers=$(DIRECTFB_INPUT)
+
 ifeq ($(BR2_PACKAGE_DIRECTFB_GIF),y)
-DIRECTFB_GIF:=--enable-gif
+DIRECTFB_CONF_OPT += --enable-gif
 else
-DIRECTFB_GIF:=--disable-gif
+DIRECTFB_CONF_OPT += --disable-gif
 endif
 
 ifeq ($(BR2_PACKAGE_DIRECTFB_PNG),y)
-DIRECTFB_PNG:=--enable-png
-DIRECTFB_DEP+= libpng
+DIRECTFB_CONF_OPT += --enable-png
+DIRECTFB_DEPENDENCIES += libpng
 DIRECTFB_CONF_ENV += ac_cv_path_LIBPNG_CONFIG=$(STAGING_DIR)/usr/bin/libpng-config
 else
-DIRECTFB_PNG:=--disable-png
+DIRECTFB_CONF_OPT += --disable-png
 endif
 
 ifeq ($(BR2_PACKAGE_DIRECTFB_JPEG),y)
-DIRECTFB_JPEG:=--enable-jpeg
-DIRECTFB_DEP+= jpeg
+DIRECTFB_CONF_OPT += --enable-jpeg
+DIRECTFB_DEPENDENCIES += jpeg
 else
-DIRECTFB_JPEG:=--disable-jpeg
+DIRECTFB_CONF_OPT += --disable-jpeg
 endif
 
 ifeq ($(BR2_PACKAGE_DIRECTB_DITHER_RGB16),y)
-DIRECTFB_DITHER_RGB16:=--with-dither-rgb16=advanced
+DIRECTFB_CONF_OPT += --with-dither-rgb16=advanced
 else
-DIRECTFB_DITHER_RGB16:=--with-dither-rgb16=none
+DIRECTFB_CONF_OPT += --with-dither-rgb16=none
 endif
 
 ifeq ($(BR2_PACKAGE_DIRECTB_TESTS),y)
-DIRECTFB_TESTS:=--with-tests
-else
-DIRECTFB_TESTS:=
+DIRECTFB_CONF_OPT += --with-tests
 endif
 
-DIRECTFB_CONF_OPT = \
-	--localstatedir=/var \
-	--with-gfxdrivers=$(DIRECTFB_GFX) \
-	--with-inputdrivers=$(DIRECTFB_INPUT) \
-	--enable-static \
-	--enable-shared \
-	--disable-explicit-deps \
-	--program-prefix='' \
-	$(DIRECTFB_MULTI) \
-	$(DIRECTFB_DEBUG) \
-	$(DIRECTFB_TRACE) \
-	$(DIRECTFB_X) \
-	$(DIRECTFB_JPEG) \
-	$(DIRECTFB_PNG) \
-	$(DIRECTFB_GIF) \
-	$(DIRECTFB_UNIQUE) \
-	$(DIRECTFB_DITHER_RGB16) \
-	--enable-linux-input \
-	--enable-zlib \
-	--enable-freetype \
-	--enable-fbdev \
-	--disable-sysfs \
-	--disable-sdl \
-	--disable-vnc \
-	--disable-video4linux \
-	--disable-video4linux2 \
-	$(DIRECTFB_TESTS)
-
-DIRECTFB_DEPENDENCIES = $(DIRECTFB_DEP) freetype $(DIRECTFB_FUSION)
-
 HOST_DIRECTFB_DEPENDENCIES = host-pkg-config
 HOST_DIRECTFB_CONF_OPT = \
 		--enable-shared \
-- 
1.7.1
