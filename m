From: Gilles Talis <gilles.talis@gmail.com>
Date: Wed, 16 Sep 2020 21:05:27 +0200
Subject: [Buildroot] [PATCH/next] package/hawktracer: new package
In-Reply-To: <CAEyMn7bLOL1OVkH69e_h7en6V6tGTqB9ATx3F8b-ysWR-1CxUQ@mail.gmail.com>
References: <20200517123726.81405-1-gilles.talis@gmail.com>
 <CAEyMn7bLOL1OVkH69e_h7en6V6tGTqB9ATx3F8b-ysWR-1CxUQ@mail.gmail.com>
Message-ID: <CAKcgs2zt8CuHmM41Mhg9fkkbj9PJf1y=yQAGJYFOveo2s=z8aA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Heiko,

Le mar. 15 sept. 2020 ? 23:31, Heiko Thiery <heiko.thiery@gmail.com> a ?crit :
>
> Hi Gilles,
>
> Am So., 17. Mai 2020 um 14:38 Uhr schrieb Gilles Talis <gilles.talis@gmail.com>:
> >
> > HawkTracer is a highly portable, low-overhead, configurable profiling tool
> >
> > Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
> > ---
> >  DEVELOPERS                         |  1 +
> >  package/Config.in                  |  1 +
> >  package/hawktracer/Config.in       | 20 ++++++++++++
> >  package/hawktracer/hawktracer.hash |  3 ++
> >  package/hawktracer/hawktracer.mk   | 51 ++++++++++++++++++++++++++++++
> >  5 files changed, 76 insertions(+)
> >  create mode 100644 package/hawktracer/Config.in
> >  create mode 100644 package/hawktracer/hawktracer.hash
> >  create mode 100644 package/hawktracer/hawktracer.mk
> >
> > diff --git a/DEVELOPERS b/DEVELOPERS
> > index e427ab15d4..7775768a6f 100644
> > --- a/DEVELOPERS
> > +++ b/DEVELOPERS
> > @@ -1024,6 +1024,7 @@ F:        board/freescale/imx8mmevk/
> >  F:     configs/freescale_imx8mmevk_defconfig
> >  F:     package/cctz/
> >  F:     package/fdk-aac/
> > +F:     package/hawktracer/
> >  F:     package/httping/
> >  F:     package/iozone/
> >  F:     package/leptonica/
> > diff --git a/package/Config.in b/package/Config.in
> > index c245abbc42..b061805da0 100644
> > --- a/package/Config.in
> > +++ b/package/Config.in
> > @@ -1594,6 +1594,7 @@ endmenu
> >
> >  menu "Logging"
> >         source "package/glog/Config.in"
> > +       source "package/hawktracer/Config.in"
> >         source "package/liblog4c-localtime/Config.in"
> >         source "package/liblogging/Config.in"
> >         source "package/log4cplus/Config.in"
> > diff --git a/package/hawktracer/Config.in b/package/hawktracer/Config.in
> > new file mode 100644
> > index 0000000000..7a80f31413
> > --- /dev/null
> > +++ b/package/hawktracer/Config.in
> > @@ -0,0 +1,20 @@
> > +config BR2_PACKAGE_HAWKTRACER
> > +       bool "hawktracer"
>
> I tried to build but it seems a compiler with C++ support is required.
>
> -- 8< --
> CMake Error at CMakeLists.txt:3 (project):
>   The CMAKE_CXX_COMPILER:
>
>     /home/hthiery/sources/mainline/buildroot/output/host/bin/aarch64-buildroot-linux-uclibc-g++
>
>   is not a full path to an existing compiler tool.
>
>   Tell CMake where to find the compiler by setting either the environment
>   variable "CXX" or the CMake cache entry CMAKE_CXX_COMPILER to the full path
>   to the compiler, or to the compiler name if it is in the PATH.
> -- 8< --
>
> > +       help
> > +         HawkTracer is a highly portable, low-overhead, configurable
> > +         profiling tool built in Amazon Video for getting performance
> > +         metrics from low-end devices.
> > +
> > +         https://www.hawktracer.org/
> > +
> > +if BR2_PACKAGE_HAWKTRACER
> > +
> > +config BR2_PACKAGE_HAWKTRACER_TCP_LISTENER
> > +       bool "Enable hawktracer TCP listener"
> > +       default y
> > +       depends on BR2_TOOLCHAIN_HAS_THREADS
> > +
> > +comment "Hawktracer TCP listener feature needs a toolchain w/ threads"
> > +       depends on !BR2_TOOLCHAIN_HAS_THREADS
> > +
> > +endif
> > diff --git a/package/hawktracer/hawktracer.hash b/package/hawktracer/hawktracer.hash
> > new file mode 100644
> > index 0000000000..e444a881b8
> > --- /dev/null
> > +++ b/package/hawktracer/hawktracer.hash
> > @@ -0,0 +1,3 @@
> > +# Computed locally
> > +sha256  68b5c95fd98aaf255b51c1dbf676950701cbcb67398f4266f083e91396345f75  hawktracer-4beb43d110b7718a1a07fc7ce69550dfd102a0e7.tar.gz
> > +sha256  2f377333e64ad08ad3afec8ed6c2c96ced2a6d7d67443eb2784a931bb7b3fd59  LICENSE
> > diff --git a/package/hawktracer/hawktracer.mk b/package/hawktracer/hawktracer.mk
> > new file mode 100644
> > index 0000000000..a9530aa713
> > --- /dev/null
> > +++ b/package/hawktracer/hawktracer.mk
> > @@ -0,0 +1,51 @@
> > +################################################################################
> > +#
> > +# hawktracer
> > +#
> > +################################################################################
> > +
> > +HAWKTRACER_VERSION = 4beb43d110b7718a1a07fc7ce69550dfd102a0e7
> > +HAWKTRACER_SITE = $(call github,amzn,hawktracer,$(HAWKTRACER_VERSION))
> > +HAWKTRACER_LICENSE = MIT
> > +HAWKTRACER_LICENSE_FILES = LICENSE
> > +HAWKTRACER_INSTALL_STAGING = YES
> > +
> > +HAWKTRACER_CONF_OPTS = \
> > +       -DENABLE_ASAN=OFF \
> > +       -DENABLE_TESTS=OFF \
> > +       -DENABLE_CODE_COVERAGE=OFF \
> > +       -DENABLE_BENCHMARKS=OFF \
> > +       -DENABLE_DOC=OFF \
> > +       -DENABLE_PYTHON_BINDINGS=OFF \
> > +       -DENABLE_MAINTAINER_MODE=OFF \
> > +       -DENABLE_RELEASE_MODE=OFF \
> > +       -DENABLE_CLIENT=OFF \
> > +       -DENABLE_EXAMPLES=OFF
> > +
> > +ifeq ($(BR2_STATIC_LIBS),y)
> > +HAWKTRACER_CONF_OPTS += -DBUILD_STATIC_LIB=ON
> > +else
> > +HAWKTRACER_CONF_OPTS += -DBUILD_STATIC_LIB=OFF
> > +endif
> > +
> > +ifeq ($(BR2_PACKAGE_HAWKTRACER_TCP_LISTENER),y)
> > +HAWKTRACER_CONF_OPTS += -DENABLE_TCP_LISTENER=ON
> > +else
> > +HAWKTRACER_CONF_OPTS += -DENABLE_TCP_LISTENER=OFF
> > +endif
> > +
> > +# Enable C++ compilation if supported by toolchain (requires C++11)
> > +ifeq ($(BR2_INSTALL_LIBSTDCPP)$(BR2_TOOLCHAIN_GCC_AT_LEAST_4_8),yy)
> > +HAWKTRACER_CONF_OPTS += -DFORCE_C_COMPILATION=OFF
> > +else
> > +HAWKTRACER_CONF_OPTS += -DFORCE_C_COMPILATION=ON
> > +endif
> > +
> > +# Enable threads support if supported by toolchain
> > +ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
> > +HAWKTRACER_CONF_OPTS += -DENABLE_THREADS=ON
> > +else
> > +HAWKTRACER_CONF_OPTS += -DENABLE_THREADS=OFF
> > +endif
> > +
> > +$(eval $(cmake-package))
>
> Thank you
>
> --
> Heiko
Thanks for running the test. I will take a look and send a v2.

cheers
Gilles.
