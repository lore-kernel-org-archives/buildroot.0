From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Oct 2014 15:02:18 +0200
Subject: [Buildroot] [PATCH 1/1] libFTDI major version update 1. This
 version can coexists beside the 0.x version (libftdi.so, libftdi1.so).
In-Reply-To: <2.c5a9d6940ebdbeb712d0@polarstar>
References: <2.c5a9d6940ebdbeb712d0@polarstar>
Message-ID: <20141003150218.2bb79dfd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 02 Oct 2014 09:52:10 +0200, daniel.sangue at sangue.ch wrote:

> Well im new to buildroot and git and also to linux. I am at the
> buttom of the learning curve related to this topics. Thank you for
> your time and feedback.

No problem, you're welcome!

> >According to your libftdi1.mk file comments, it looks like C++
> >support can be autodetected. So maybe it's not really worth the
> >effort having an option for that: we could just enable C++ support
> >when available, and that's it.
> 
> ok, i removed the additional c++ binding option. I admit that i just
> copy pasted it from the existing libftdi(0) package.

Ah, ok.


> >> +LIBFTDI1_VERSION = 1.1
> >> +LIBFTDI1_SOURCE = libftdi1-$(LIBFTDI1_VERSION).tar.bz2
> >> +LIBFTDI1_SITE =
> >> http://www.intra2net.com/en/developer/libftdi/download/
> >
> >Please add LIBFTDI1_LICENSE and LIBFTDI1_LICENSE_FILES.
> 
> ok, i have added:
> IBFTDI1_LICENSE = LGPL2.1 GPL2
> LIBFTDI1_LICENSE_FILES = COPYING

That isn't good, the licensing is a bit more complicated. I think it
should be:

LIBFTDI1_LICENSE = LGPLv2.1 (libfti1), GPLv2 with exceptions (ftdipp1)
LIBFTDI1_LICENSE_FILES = LICENSE COPYING.GPL COPYING.LIB


> >Are you sure --{enable,disable}-libftdipp options are working for
> >CMake? It doesn't look like the usual way of passing CMake
> >configuration options, but maybe I'm missing something here.
> 
> No, i am not sure. I just can refere to the buildroot cmake example
> in the manual where LIBFOO_CONF_OPT is used:
> http://buildroot.uclibc.org/downloads/manual/manual.html#_infrastructure_for_cmake_based_packages

Yes, but it seems like the code you wrote using --enable-libftdipp and
--disable-libftdipp was copied from the other libftdi.mk package. Which
is autotools based, so --enable/--disable options make sense. But for a
CMake package, they clearly do not make sense.

I think, it should instead be:

ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
LIBFTDI1_CONF_OPT = -DFTDIPP=ON
else
LIBFTDI1_CONF_OPT = -DFTDIPP=OFF
endif

You should test this with a non-C++ capable toolchain. For example
http://autobuild.buildroot.org/toolchains/configs/br-arm-basic.config
is a configuration with a minimal toolchain, having just thread support.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
