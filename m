From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 13 Jul 2020 08:30:05 +0200
Subject: [Buildroot] [PATCH] package/mesa3d: disable --as-needed linker
 flag for Codesourcery ARM 2014.05 toolchain
In-Reply-To: <20200613104708.2415431-1-romain.naour@gmail.com> (Romain Naour's
 message of "Sat, 13 Jun 2020 12:47:08 +0200")
References: <20200613104708.2415431-1-romain.naour@gmail.com>
Message-ID: <87imeskjv6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > Meson build system enable by default -Wl,--as-needed [1][2] in the linker command line
 > and due to this the libmesa_dri_drivers.so build fail with the Codesourcery ARM and
 > Aarch64 2014.05 toolchain:

 > /home/buildroot/autobuild/run/instance-1/output-1/host/bin/arm-none-linux-gnueabi-g++
 >   -o src/mesa/drivers/dri/libmesa_dri_drivers.so
 >   -Wl,--as-needed -Wl,--no-undefined -Wl,-O1 -shared -fPIC -Wl,--start-group
 >   -Wl,-soname,libmesa_dri_drivers.so -Wl,--whole-archive
 >   src/mesa/drivers/dri/radeon/libr100.a src/mesa/drivers/dri/nouveau/libnouveau_vieux.a
 >   -Wl,--no-whole-archive
 >   src/mesa/drivers/dri/common/libmegadriver_stub.a
 >   src/mesa/drivers/dri/common/libdricommon.a
 >   src/mapi/shared-glapi/libglapi.so.0.0.0
 >   src/mesa/libmesa_classic.a src/mesa/libmesa_common.a
 >   src/compiler/glsl/libglsl.a src/compiler/glsl/glcpp/libglcpp.a
 >   src/util/libmesa_util.a src/util/format/libmesa_format.a
 >   src/compiler/nir/libnir.a src/compiler/libcompiler.a
 >   src/util/libxmlconfig.a
 >   [...]

 > src/mesa/drivers/dri/common/libmegadriver_stub.a(megadriver_stub.c.o): In function `megadriver_stub_init':
 > megadriver_stub.c:(.text.startup+0x20): undefined reference to `dladdr'
 > megadriver_stub.c:(.text.startup+0xbc): undefined reference to `dlsym'
 > collect2: error: ld returned 1 exit status

 > This problem seems to be specific to this toolchain release (ARM and aarch64)
 > CodeSourcery 2014.05: gcc 4.8.3-prerelease; binutils 2.24.51.20140217; glibc 2.18

 > The following prebuilt toolchain has been tested and doesn't trigger this issue:
 > Linaro 4.9-4.9-2014.11: gcc 4.9.3; binutils 2.24.0; glibc 2.19
 > CodeSourcery 2014.11: gcc 4.9.1; binutils 2.24.51.20140217; glibc 2.20

 > Older toolchains doesn't have a recent enough glibc or linux-headers version
 > to breaking the build with mesa3d 20.1.0 or libdrm 2.4.102.

 > In order to build mesa3d with the CodeSourcery 2014.05 using --as-needed would be
 > reorder the static librairies:

 >  diff --git a/src/mesa/drivers/dri/meson.build b/src/mesa/drivers/dri/meson.build
 >  index b09ca16e38a..9ac6731c522 100644
 >  --- a/src/mesa/drivers/dri/meson.build
 >  +++ b/src/mesa/drivers/dri/meson.build
 >  @@ -59,7 +59,7 @@ if _dri_drivers != []
 >       [],
 >       link_whole : _dri_drivers,
 >       link_with : [
 >  -      libmegadriver_stub, libdricommon, libglapi,
 >  +      libdricommon, libmegadriver_stub, libglapi,
 >         libmesa_classic,
 >       ],

 > Instead, we can disable --as-needed from the meson build system using
 > "-Db_asneeded=false" only for this toolchain.

 > [1] https://mesonbuild.com/Builtin-options.html
 > [2] https://wiki.gentoo.org/wiki/Project:Quality_Assurance/As-needed

 > Fixes:
 > http://autobuild.buildroot.net/results/eec39a4fbfbfaa58980fab36f2fd902a16eecf0f/build-end.log

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>
 > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Cc: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed to 2020.02.x and 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
