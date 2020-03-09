From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 9 Mar 2020 22:21:54 +0100
Subject: [Buildroot] [PATCH v6 01/28] package/qt5base: Do not build
 shared libs if BR2_STATIC_LIBS is chosen
In-Reply-To: <20200217212350.29750-2-anaumann@ultratronik.de>
References: <20200217212350.29750-1-anaumann@ultratronik.de>
 <20200217212350.29750-2-anaumann@ultratronik.de>
Message-ID: <20200309222154.0eec932a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Andreas,

On Mon, 17 Feb 2020 22:23:23 +0100
Andreas Naumann <anaumann@ultratronik.de> wrote:

> Traditionally we configured qt5 to always build shared libraries. This resulted
> in many conditionals when setting buildroot to static-libs only, because each
> module's target install had to be guarded.
> So to avoid this and simplify target install in a subsequent commit, configure
> qt to build (and install) only the type of libs which the buildroot defconfig
> is set to.
> Unfortunately it seems that Qt does not support building both dynamic and static
> libs at the same time, so we still set it shared if buildroot asks for both.
> 
> Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
> ---
>  package/qt5/qt5base/qt5base.mk | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
> index 774c771bc9..c662921b8f 100644
> --- a/package/qt5/qt5base/qt5base.mk
> +++ b/package/qt5/qt5base/qt5base.mk
> @@ -24,8 +24,13 @@ QT5BASE_CONFIGURE_OPTS += \
>  	-no-iconv \
>  	-system-zlib \
>  	-system-pcre \
> -	-no-pch \
> -	-shared
> +	-no-pch
> +
> +ifeq ($(BR2_STATIC_LIBS),y)
> +QT5BASE_CONFIGURE_OPTS += -static
> +else
> +QT5BASE_CONFIGURE_OPTS += -shared
> +endif

From package/qt5/Config.in:

menuconfig BR2_PACKAGE_QT5
        bool "Qt5"
        depends on BR2_INSTALL_LIBSTDCPP
        depends on BR2_USE_WCHAR
        depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
        depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
        depends on !BR2_ARM_CPU_ARMV4 # needs ARMv5+
        # no built-in double-conversion support
        depends on !BR2_arc && !BR2_nios2 && !BR2_xtensa
        depends on !BR2_STATIC_LIBS

So Qt5 cannot be enabled when BR2_STATIC_LIBS=y. See also:

commit 2215b8a75edea384182f0511b6649306e60b55d1
Author: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date:   Wed Aug 26 17:06:18 2015 +0200

    qt5: disable for static-only builds
    
    Even though we have some specific code to support building Qt5 for
    static-only configurations, it doesn't work. The first problem is that
    our custom qmake.conf always passes -ldl, which makes a number of Qt5
    config.tests fail at configure time. Once this problem is fixed by
    removing -ldl from QMAKE_LIBS and adding it to QMAKE_LIBS_DYNLOAD
    instead, the next problem is that the plugin infrastructure of Qt5
    assumes that Linux has dynamic library support: the qlibrary_unix.cpp
    file includes <dlfcn.h>, and the only condition for this file to not
    be included is:
    
    Until recently, building Qt5 statically was working because our C
    library was not built static-only: it provided <dlfcn.h> and
    libdl.so. But now that we have a really static only toolchain, Qt5 no
    longer builds.
    
    The easiest solution is to simply make Qt5 depend on dynamic library
    support.
    
    Fixes:
    
       http://autobuild.buildroot.net/results/538/538e0325adba9fabbe4ec8e550fbb6a7219f5e7a/
    
    Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
    Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

So I don't think this patch is necessary, unless I missed something.
How did you test it?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
