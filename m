From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 24 Apr 2019 22:46:10 +0200
Subject: [Buildroot] [PATCH 1/4] package/bind: enable static build
In-Reply-To: <20190424223453.0819e407@windsurf>
References: <20190423212406.13909-1-fontaine.fabrice@gmail.com>
 <20190424223453.0819e407@windsurf>
Message-ID: <CAPi7W83ERzgtxe32UMKer40RkgMPfyfsfiZ4TXRZXO8uCzr4Xg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

Le mer. 24 avr. 2019 ? 22:34, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> a ?crit :
>
> Hello Fabrice,
>
> On Tue, 23 Apr 2019 23:24:03 +0200
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
>
> > Static build has been disabled in 2014 with commit
> > 6045904752b06a8b8e52ba8fc2e49a8548964e8d however bind can be built
> > statically thanks to --without-dlopen so enable it back
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > ---
> >  ...n_driver.c-fix-build-without-dlfcn.h.patch | 28 +++++++++++++++++++
> >  package/bind/Config.in                        |  5 ++--
> >  package/bind/bind.mk                          |  4 ++-
> >  3 files changed, 33 insertions(+), 4 deletions(-)
> >  create mode 100644 package/bind/0002-dlz_open_driver.c-fix-build-without-dlfcn.h.patch
>
> The series looks good in principle, but sadly the following defconfig:
>
> BR2_arm=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
> BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2019.02-rc1.tar.bz2"
> BR2_TOOLCHAIN_EXTERNAL_GCC_4_9=y
> BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_14=y
> BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
> # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
> BR2_TOOLCHAIN_EXTERNAL_CXX=y
> BR2_INIT_NONE=y
> BR2_SYSTEM_BIN_SH_NONE=y
> # BR2_PACKAGE_BUSYBOX is not set
> BR2_PACKAGE_DHCP=y
> # BR2_TARGET_ROOTFS_TAR is not set
>
> fails to build with:
>
> configure: error: Cannot find static libraries at /home/thomas/projets/buildroot/output/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib
> make[1]: *** [package/pkg-generic.mk:231: /home/thomas/projets/buildroot/output/build/dhcp-4.4.1/.stamp_configured] Error 1
>
> Looking at configure.ac sheds some light:
>
> AC_ARG_ENABLE(libtool,
>         AS_HELP_STRING([--enable-libtool],
> [use GNU libtool for dynamic shared libraries (default is no).]),
>         want_libtool="$enableval")
>
> if test "$use_libbind" != "no"; then
>         if test "$want_libtool" = "yes" -a \
>                 ! -f "$use_libbind/lib/libisc.la"
>         then
>                 AC_MSG_ERROR([Cannot find dynamic libraries at $use_libbind/lib])
>         fi
>         if test "$want_libtool" = "no" -a \
>                 ! -f "$use_libbind/lib/libisc.a"
>         then
>                 AC_MSG_ERROR([Cannot find static libraries at $use_libbind/lib])
>         fi
> fi
>
> We are not passing --enable-libtool, so the code checks is libisc.a
> exists, and it doesn't because a default build is BR2_SHARED_LIBS=y,
> and therefore bind doesn't build/install any static library.
>
> I suppose passing --enable-libtool would work, but I haven't tested.
OK, I'll test it and send a v2.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
Fabrice
