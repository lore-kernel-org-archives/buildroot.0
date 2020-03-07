From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 7 Mar 2020 14:08:45 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for
 2020-03-06
In-Reply-To: <20200307072525.145C386ECB@fraxinus.osuosl.org>
References: <20200307072525.145C386ECB@fraxinus.osuosl.org>
Message-ID: <20200307140845.6077960f@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 07 Mar 2020 07:25:18 -0000, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

[...]

> Results for branch 'master'
> ===========================

[...]

>     arm      |         mesa3d-19.3.4          | NOK | http://autobuild.buildroot.net/results/ff7d6a08211aaea4eb0d61e548f3e385b199967e |

Fails with:

megadriver_stub.c:(.text.startup+0x20): undefined reference to `dladdr'
megadriver_stub.c:(.text.startup+0xb8): undefined reference to `dlsym'

The failing link command (extracted) is:

cd build/mesa3d-19.3.4/build && \
	.../host/bin/arm-none-linux-gnueabi-g++  \
	-o src/mesa/drivers/dri/libmesa_dri_drivers.so  \
	-Wl,--as-needed -Wl,--no-undefined -Wl,-O1 \
	-shared -fPIC \
	-Wl,--start-group \
	-Wl,-soname,libmesa_dri_drivers.so \
	-Wl,--whole-archive \
	src/mesa/drivers/dri/swrast/libswrast_dri.a \
	-Wl,--no-whole-archive \
	src/mesa/drivers/dri/common/libmegadriver_stub.a \
	src/mesa/drivers/dri/common/libdricommon.a \
	src/mapi/shared-glapi/libglapi.so.0.0.0 \
	src/mesa/libmesa_classic.a \
	src/compiler/glsl/libglsl.a \
	src/compiler/glsl/glcpp/libglcpp.a \
	src/util/libmesa_util.a \
	src/compiler/nir/libnir.a \
	src/compiler/libcompiler.a \
	src/util/libxmlconfig.a \
	-Wl,--build-id=sha1 -Wl,-Bsymbolic -Wl,--gc-sections \
	.../host/arm-buildroot-linux-gnueabi/sysroot/usr/lib/libdrm.so \
	-lm -pthread -ldl \
	.../host/arm-buildroot-linux-gnueabi/sysroot/usr/lib/libexpat.so \
	.../host/arm-buildroot-linux-gnueabi/sysroot/usr/lib/libz.so \
	-Wl,--end-group \
	'-Wl,-rpath,$ORIGIN/common:$ORIGIN/../../../mapi/shared-glapi:$ORIGIN/../..:$ORIGIN/../../../compiler/glsl:$ORIGIN/../../../compiler/glsl/glcpp:$ORIGIN/../../../util:$ORIGIN/../../../compiler/nir:$ORIGIN/../../../compiler' \
	-Wl,-rpath-link,.../build/mesa3d-19.3.4/build/src/mesa/drivers/dri/common \
	-Wl,-rpath-link,.../build/mesa3d-19.3.4/build/src/mapi/shared-glapi \
	-Wl,-rpath-link,.../build/mesa3d-19.3.4/build/src/mesa \
	-Wl,-rpath-link,.../build/mesa3d-19.3.4/build/src/compiler/glsl \
	-Wl,-rpath-link,.../build/mesa3d-19.3.4/build/src/compiler/glsl/glcpp \
	-Wl,-rpath-link,.../build/mesa3d-19.3.4/build/src/util \
	-Wl,-rpath-link,.../build/mesa3d-19.3.4/build/src/compiler/nir \
	-Wl,-rpath-link,.../build/mesa3d-19.3.4/build/src/compiler

src/mesa/drivers/dri/common/libmegadriver_stub.a(megadriver_stub.c.o): In function `megadriver_stub_init':
megadriver_stub.c:(.text.startup+0x20): undefined reference to `dladdr'
megadriver_stub.c:(.text.startup+0xb8): undefined reference to `dlsym'
collect2: error: ld returned 1 exit status

Note the existing '-ldl' in the middle (enclosed by --start-group/--end-group).

If I add the '-ldl' at any place outside of the --start-group/--end-group the
linking succeeds...., any hints how to solve this?


The linking can be fixed alternatively by the following patch:

--- build/mesa3d-19.3.4/src/mesa/drivers/dri/meson.build_orig	2020-03-07 14:04:25.110285278 +0100
+++ build/mesa3d-19.3.4/src/mesa/drivers/dri/meson.build	2020-03-07 14:05:37.395622029 +0100
@@ -57,9 +57,8 @@
   libmesa_dri_drivers = shared_library(
     'mesa_dri_drivers',
     [],
-    link_whole : _dri_drivers,
     link_with : [
-      libmegadriver_stub, libdricommon, libglapi,
+      _dri_drivers, libmegadriver_stub, libdricommon, libglapi,
       libmesa_classic,
     ],
     dependencies : [


Resulting in the removal of the lines
	-Wl,--whole-archive

	-Wl,--no-whole-archive

from the linking command...

Toolchain or meson bug (or something completely different)?

Regards,
Peter
