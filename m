From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Jun 2020 09:36:21 +0200
Subject: [Buildroot] [git commit] package/mesa3d: disable --as-needed linker
 flag for Codesourcery ARM 2014.05 toolchain
Message-ID: <20200614073739.5A99982A4E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d3f576d2f37a05275c0d25f855dc24935ff5de5c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Meson build system enable by default -Wl,--as-needed [1][2] in the linker command line
and due to this the libmesa_dri_drivers.so build fail with the Codesourcery ARM and
Aarch64 2014.05 toolchain:

/home/buildroot/autobuild/run/instance-1/output-1/host/bin/arm-none-linux-gnueabi-g++
  -o src/mesa/drivers/dri/libmesa_dri_drivers.so
  -Wl,--as-needed -Wl,--no-undefined -Wl,-O1 -shared -fPIC -Wl,--start-group
  -Wl,-soname,libmesa_dri_drivers.so -Wl,--whole-archive
  src/mesa/drivers/dri/radeon/libr100.a src/mesa/drivers/dri/nouveau/libnouveau_vieux.a
  -Wl,--no-whole-archive
  src/mesa/drivers/dri/common/libmegadriver_stub.a
  src/mesa/drivers/dri/common/libdricommon.a
  src/mapi/shared-glapi/libglapi.so.0.0.0
  src/mesa/libmesa_classic.a src/mesa/libmesa_common.a
  src/compiler/glsl/libglsl.a src/compiler/glsl/glcpp/libglcpp.a
  src/util/libmesa_util.a src/util/format/libmesa_format.a
  src/compiler/nir/libnir.a src/compiler/libcompiler.a
  src/util/libxmlconfig.a
  [...]

src/mesa/drivers/dri/common/libmegadriver_stub.a(megadriver_stub.c.o): In function `megadriver_stub_init':
megadriver_stub.c:(.text.startup+0x20): undefined reference to `dladdr'
megadriver_stub.c:(.text.startup+0xbc): undefined reference to `dlsym'
collect2: error: ld returned 1 exit status

This problem seems to be specific to this toolchain release (ARM and aarch64)
CodeSourcery 2014.05: gcc 4.8.3-prerelease; binutils 2.24.51.20140217; glibc 2.18

The following prebuilt toolchain has been tested and doesn't trigger this issue:
Linaro 4.9-4.9-2014.11: gcc 4.9.3; binutils 2.24.0; glibc 2.19
CodeSourcery 2014.11: gcc 4.9.1; binutils 2.24.51.20140217; glibc 2.20

Older toolchains doesn't have a recent enough glibc or linux-headers version
to breaking the build with mesa3d 20.1.0 or libdrm 2.4.102.

In order to build mesa3d with the CodeSourcery 2014.05 using --as-needed would be
reorder the static librairies:

 diff --git a/src/mesa/drivers/dri/meson.build b/src/mesa/drivers/dri/meson.build
 index b09ca16e38a..9ac6731c522 100644
 --- a/src/mesa/drivers/dri/meson.build
 +++ b/src/mesa/drivers/dri/meson.build
 @@ -59,7 +59,7 @@ if _dri_drivers != []
      [],
      link_whole : _dri_drivers,
      link_with : [
 -      libmegadriver_stub, libdricommon, libglapi,
 +      libdricommon, libmegadriver_stub, libglapi,
        libmesa_classic,
      ],

Instead, we can disable --as-needed from the meson build system using
"-Db_asneeded=false" only for this toolchain.

[1] https://mesonbuild.com/Builtin-options.html
[2] https://wiki.gentoo.org/wiki/Project:Quality_Assurance/As-needed

Fixes:
http://autobuild.buildroot.net/results/eec39a4fbfbfaa58980fab36f2fd902a16eecf0f/build-end.log

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/mesa3d/mesa3d.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index e726bd33b3..59d96fe7c2 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -27,6 +27,12 @@ MESA3D_CONF_OPTS = \
 	-Dgallium-omx=disabled \
 	-Dpower8=false
 
+# Codesourcery ARM 2014.05 fail to link libmesa_dri_drivers.so with --as-needed linker
+# flag due to a linker bug between binutils 2.24 and 2.25 (2.24.51.20140217).
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM),y)
+MESA3D_CONF_OPTS += -Db_asneeded=false
+endif
+
 ifeq ($(BR2_PACKAGE_MESA3D_LLVM),y)
 MESA3D_DEPENDENCIES += host-llvm llvm
 MESA3D_MESON_EXTRA_BINARIES += llvm-config='$(STAGING_DIR)/usr/bin/llvm-config'
