From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Jan 2011 09:29:27 +0100
Subject: [Buildroot] Python 2.7 and ARM targets
In-Reply-To: <AANLkTimb4i816rBar-v4o7-xwgG2-fu3sndYqX=rUAsy@mail.gmail.com>
References: <AANLkTimb4i816rBar-v4o7-xwgG2-fu3sndYqX=rUAsy@mail.gmail.com>
Message-ID: <20110125092927.2be2aa5b@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Bruce,

On Sun, 23 Jan 2011 19:02:54 +0000
bruce bushby <bruce.bushby@gmail.com> wrote:

> I Recently started using buildroot for a project involving Telit's
> GE863-PRO.

For those like me who are wondering, this processor is an AT91SAM9260 +
a GSM/GPRS modem in a single component.

> First a newbie question:
> 1. Why do I always end up with the word "unknown" in the resulting
> "arm-unknown-linux-uclibcgnueabi"?

The "unknown" part is the vendor name.

We are computing the target tuple as follows (in package/Makefile.in) :

ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
LIBC=uclibc
else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_UCLIBC),y)
LIBC=uclibc
else
LIBC=gnu
endif

# The ABI suffix is a bit special on ARM, as it needs to be
# -uclibcgnueabi for uClibc EABI, -uclibc for uClibc OABI, -gnueabi
# for glibc EABI and -gnu for glibc OABI. This means that the LIBC and
# ABI aren't strictly orthogonal, which explains why we need the test
# on LIBC below.
ifeq ($(BR2_ARM_EABI),y)
ifeq ($(LIBC),uclibc)
ABI=gnueabi
else
ABI=eabi
endif
endif

REAL_GNU_TARGET_NAME=$(ARCH)-unknown-linux-$(LIBC)$(ABI)

So as you can see, the vendor is always "unknown".

> I have the following settings in my ".config":
> BR2_arm=y
> BR2_arm926t=y
> BR2_ARM_TYPE="ARM926T"
> BR2_ARM_EABI=y
> BR2_ARCH="arm"
> BR2_GCC_TARGET_TUNE="arm926ej-s"
> BR2_GCC_TARGET_ARCH="armv5te"
> 
> Is it possible to have the results reflect my target, for example:
> "arm-ge863pro-linux-uclibcgnueabi".......or "arm-arm926-linux-uclibcgnueabi"
> ?

I think it is, if you just modify the code in package/Makefile.in, but
the vendor part of the tuple is probably not the correct place to add
informations about the specific CPU type the toolchain is targetting.

> 1. Fedora 14 uses python 2.7 and not python 2.4, this appears to cause the
> following error:
> 
> Making all in python
> make[2]: Entering directory
> `/home/bruce/arm-buildroot/buildroot/output/build/libdnet-1.11/python'
> CC="/home/bruce/arm/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc
> --sysroot=/home/bruce/arm/buildroot/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot"
> LDSHARED="/home/bruce/arm/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc
> --sysroot=/home/bruce/arm/buildroot/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot
> -shared" python2.4 setup.py build_ext
> -I/home/bruce/arm/buildroot/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/include/python2.4
> /bin/sh: python2.4: command not found

I have just tested the build of libdnet and its Python module with the
Python 2.7 work I've posted yesterday, and it builds fine.

The major difference is that with the Python 2.7 work posted yesterday,
a host Python interpreter gets installed in $(HOST_DIR), so we don't
depend on the Python interpreter version installed on the development
machine anymore.

The only thing I find strange is that the resulting dnet.so Python
module isn't linked against the libdnet library. But maybe it's normal,
I haven't looked at the details on how this Python extension is
implemented.

> So to get around this, I changed my "buildroot/package/python/python.mk" to
> install "python 2.7"  .... however that produces a follow on issue:

Bumping Python to 2.7 was a little bit more complicated than just
changing the version number. The patches to bump Python to 2.7 are
available in my branch at

 http://git.buildroot.net/~tpetazzoni/git/buildroot/log/?h=for-2011.02/python-bump

I hope to get them merged soon.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
