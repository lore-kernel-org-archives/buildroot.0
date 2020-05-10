From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 10 May 2020 22:33:57 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/irrlicht: disable
 bundled libpng NEON support
Message-ID: <20200510203114.8BD0A913C5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e89604a8064cb7245473f9776a36d62be1682eae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Irrlicht fail to detect properly the NEON support on aarch64 or ARM with NEON FPU support.
While linking an application with libIrrlicht.so, we get an undefined reference to
png_init_filter_functions_neon.
Some files are missing in the libpng bundled in Irrlicht, in particular arm/arm_init.c [1],
so disable NEON support completely.

This can be reproduced by building minetest using this defconfig for aarch64:
BR2_aarch64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_PACKAGE_MINETEST=y
BR2_PACKAGE_MINETEST_CLIENT=y
BR2_PACKAGE_MINETEST_SERVER=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST=y
BR2_PACKAGE_MESA3D_OPENGL_GLX=y
BR2_PACKAGE_XORG7=y

Or for ARM with NEON FPU support:
BR2_arm=y
BR2_cortex_a15=y
BR2_ARM_FPU_NEON=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_PACKAGE_MINETEST=y
BR2_PACKAGE_MINETEST_CLIENT=y
BR2_PACKAGE_MINETEST_SERVER=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST=y
BR2_PACKAGE_MESA3D_OPENGL_GLX=y
BR2_PACKAGE_XORG7=y

[1] https://github.com/glennrp/libpng/tree/v1.6.37/arm

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit bf5f4f417a9e6e7eed5ea6a99c26583958890515)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/irrlicht/irrlicht.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/irrlicht/irrlicht.mk b/package/irrlicht/irrlicht.mk
index a1e190d98d..bd82815cde 100644
--- a/package/irrlicht/irrlicht.mk
+++ b/package/irrlicht/irrlicht.mk
@@ -38,6 +38,13 @@ ifeq ($(BR2_STATIC_LIBS),)
 IRRLICHT_CONF_OPTS += sharedlib
 endif
 
+# Irrlicht fail to detect properly the NEON support on aarch64 or ARM with NEON FPU support.
+# While linking an application with libIrrlicht.so, we get an undefined reference to
+# png_init_filter_functions_neon.
+# Some files are missing in the libpng bundled in Irrlicht, in particular arm/arm_init.c,
+# so disable NEON support completely.
+IRRLICHT_CONF_OPTS += CPPFLAGS="$(TARGET_CPPFLAGS) -DPNG_ARM_NEON_OPT=0"
+
 define IRRLICHT_BUILD_CMDS
 	$(TARGET_MAKE_ENV)
 		$(MAKE) -C $(@D)/$(IRRLICHT_SUBDIR) $(IRRLICHT_CONF_OPTS)
