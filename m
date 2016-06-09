From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Jun 2016 23:44:20 +0200
Subject: [Buildroot] [PATCH 1/4] package/efl: switch to luajit support
In-Reply-To: <1461790014-17051-1-git-send-email-romain.naour@gmail.com>
References: <1461790014-17051-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20160609234420.47a3588d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain,

On Wed, 27 Apr 2016 22:46:51 +0200, Romain Naour wrote:
> In efl 1.15.x, Lua "old" support is broken with Lua 5.2+ [1].
> 
> With the patch added in efl 1.16 to fixes this issue, libevas fail to link with
> the following error:
> 
> CCLD bin/ecore_evas/ecore_evas_convert
> host-efl-1.16.1/src/lib/evas/.libs/libevas.so: undefined reference to `luaL_openlib'
> collect2: error: ld returned 1 exit status
> Makefile:19021: recipe for target 'bin/ecore_evas/ecore_evas_convert' failed
> 
> Since 9ba8d1cce4ab00307827083bae234d87b37fb967, the luajit support can be
> enabled in efl package.
> In order to update the efl stack to 1.17, switch to luajit support and remove
> Lua "old" support since it's not fixed upstream yet. But the drawback is the
> efl stack depends implicitely on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS.
> 
> [1] https://phab.enlightenment.org/T2728
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  package/efl/Config.in |  6 +++---
>  package/efl/efl.mk    | 17 +++++++++--------
>  2 files changed, 12 insertions(+), 11 deletions(-)

I've applied this series of four patches, and did just one change:
modified this patch (1/4) to select luajit instead of using a "depends
on". But with the following defconfig:

BR2_arm=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2016.05-2-g5dabb45.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_4_8=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_10=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_INIT_NONE=y
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_EFL=y
# BR2_TARGET_ROOTFS_TAR is not set

The build fails with:

  CC       lib/ector/gl/lib_ector_libector_la-ector_gl_shader.lo
In file included from ../src/lib/ector/ector_private.h:6,
                 from lib/ector/gl/ector_renderer_gl_gradient_radial.c:9:
../src/lib/ector/ector_gl_internal.h:778: error: redefinition of typedef 'GLshort'
../src/lib/ector/gl/Ector_GL.h:16: note: previous declaration of 'GLshort' was here
../src/lib/ector/ector_gl_internal.h:783: error: redefinition of typedef 'GLuint'
../src/lib/ector/gl/Ector_GL.h:15: note: previous declaration of 'GLuint' was here
make[5]: *** [lib/ector/gl/lib_ector_libector_la-ector_renderer_gl_gradient_radial.lo] Error 1
make[5]: *** Waiting for unfinished jobs....
In file included from ../src/lib/ector/ector_private.h:6,
                 from lib/ector/gl/ector_renderer_gl_gradient_linear.c:9:
../src/lib/ector/ector_gl_internal.h:778: error: redefinition of typedef 'GLshort'
../src/lib/ector/gl/Ector_GL.h:16: note: previous declaration of 'GLshort' was here
../src/lib/ector/ector_gl_internal.h:783: error: redefinition of typedef 'GLuint'
../src/lib/ector/gl/Ector_GL.h:15: note: previous declaration of 'GLuint' was here
make[5]: *** [lib/ector/gl/lib_ector_libector_la-ector_renderer_gl_gradient_linear.lo] Error 1
[...]
make[4]: *** [all-recursive] Error 1
make[3]: *** [all] Error 2
make[2]: *** [all-recursive] Error 1
make[1]: *** [all] Error 2
make[1]: Leaving directory `/home/test/buildroot/output/build/host-efl-1.17.0'
make: *** [/home/test/buildroot/output/build/host-efl-1.17.0/.stamp_built] Error 2

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
