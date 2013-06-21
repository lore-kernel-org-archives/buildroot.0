From: Thomas Weininger <Thomas.Weininger@diasemi.com>
Date: Fri, 21 Jun 2013 09:28:58 +0000
Subject: [Buildroot] Build error when trying to build the py-smbus
 package of i2c-tools
In-Reply-To: <51C32CE0.9050902@mind.be>
References: <4E062DFADC6E8142AA8EE9D214BA0C50E3E24C@NB-EX-MBX01.diasemi.com>
 <51C32CE0.9050902@mind.be>
Message-ID: <4E062DFADC6E8142AA8EE9D214BA0C50E400ED@NB-EX-MBX01.diasemi.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> -----Original Message-----
> From: Arnout Vandecappelle [mailto:arnout at mind.be]
> Sent: Donnerstag, 20. Juni 2013 18:25
> To: Thomas Weininger
> Cc: buildroot at busybox.net
> Subject: Re: [Buildroot] Build error when trying to build the py-smbus
> package of i2c-tools
>
> On 20/06/13 09:18, Thomas Weininger wrote:
> > Hi,
> >
> > I'm using Buildroot Git version
> > 28ab11d7855a1b85e4be15cd9c86ad0838fa1cb1
> > from 2013-06-06. I tried to change the package/i2c-tools/i2c-tools.mk
> > in order to build an extra package called py-smbus, which is part of
> > i2c-tools but not built by default. Considering the i2c-tools README
> > http://www.lm-sensors.org/browser/i2c-tools/trunk/README?rev=6171 I
> > added EXTRA="py-smbus" to the make options.
> >
> > diff --git a/package/i2c-tools/i2c-tools.mk
> > b/package/i2c-tools/i2c-tools.mk
> >
> > index 1589d04..403b96d 100644
> >
> > --- a/package/i2c-tools/i2c-tools.mk
> >
> > +++ b/package/i2c-tools/i2c-tools.mk
> >
> > @@ -9,7 +9,7 @@ I2C_TOOLS_SOURCE =
> > i2c-tools-$(I2C_TOOLS_VERSION).tar.bz2
> >
> > I2C_TOOLS_SITE = http://dl.lm-sensors.org/i2c-tools/releases
> >
> >   define I2C_TOOLS_BUILD_CMDS
> >
> > - $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
> >
> > + $(MAKE) $(TARGET_CONFIGURE_OPTS) EXTRA="py-smbus" -C $(@D)
>
>  Can you try if
>       $(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
>               EXTRA="py-smbus" -C $(@D)
> works?
>
>  The problem is that the PATH doesn't get propagated, so the Makefile is
> using the system's python instead of buildroot's python.
>
>  By the way, you should also add
>
> I2C_TOOLS_DEPENDENCIES = host-python
>
> to make sure the cross-python is built before i2c-tools.
>
>
>  If you get this working, it would be nice if you could send a patch that adds
> a configure option for py-smbus.
>
>
>  Regards,
>  Arnout
>
>
> >
> > endef
> >
> >   define I2C_TOOLS_INSTALL_TARGET_CMDS
>
> [snip]
>
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
[Thomas Weininger]

Thank you for your suggestion Arnout. I tried it out but the error stays the same:

/home/diasemi/workspace/dialog/buildroot/output/host/usr/bin/ccache /usr/bin/gcc -pthread -shared -L/home/diasemi/workspace/dialog/buildroot/output/host/lib -L/home/diasemi/workspace/dialog/buildroot/output/host/usr/lib -Wl,-rpath,/home/diasemi/workspace/dialog/buildroot/output/host/usr/lib -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -pipe -mfpu=vfpv4-d16 -mfloat-abi=hard -O3 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -I../include build/temp.linux-i686-2.7/smbusmodule.o -L/home/diasemi/workspace/dialog/buildroot/output/host/usr/lib -lpython2.7 -o build/lib.linux-i686-2.7/smbus.so
gcc: error: unrecognized command line option '-mfpu=vfpv4-d16'
gcc: error: unrecognized command line option '-mfloat-abi=hard'
error: command '/home/diasemi/workspace/dialog/buildroot/output/host/usr/bin/ccache' failed with exit status 1

It still uses /usr/bin/gcc for building smbus.so and I am not sure if I understand why this happens. Could it be because it uses python distutils in order to start the build?

The file structure in the py-smbus subdirectory of i2c-tools is:
py-smbus/
??? Module.mk
??? README
??? setup.py
??? smbusmodule.c

From the Module.mk file:
all-python: $(INCLUDE_DIR)/linux/i2c-dev.h
        $(DISTUTILS) build

So it uses Python distutils (the setup.py) in order to build smbus.so. And it seems to me that it uses the host distutils instead of the target system's one.
If this is the problem, then the Module.mk or the setup.py will most likely need to be patched in order to use the target system toolchain?
I have not much experience in writing Makefiles or setup.py files for Buildroot, so I would very much appreciate if someone could show me where I have to make changes.
Below are the contents of the original setup.py file:

#!/usr/bin/env python

from distutils.core import setup, Extension

setup(  name="smbus",
        version="1.1",
        description="Python bindings for Linux SMBus access through i2c-dev",
        author="Mark M. Hoffman",
        author_email="mhoffman at lightlink.com",
        maintainer="Mark M. Hoffman",
        maintainer_email="linux-i2c at vger.kernel.org",
        license="GPLv2",
        url="http://lm-sensors.org/",
        ext_modules=[Extension("smbus", ["smbusmodule.c"])])

Of course I will provide a patch if I get it to work. Thank you for your assistance.

Best regards,
Thomas
________________________________

Dialog Semiconductor GmbH
Neue Str. 95
D-73230 Kirchheim
Managing Directors: Dr. Jalal Bagherli, Jean-Michel Richard
Chairman of the Supervisory Board: Gregorio Reyes
Commercial register: Amtsgericht Stuttgart: HRB 231181
UST-ID-Nr. DE 811121668

Legal Disclaimer: This e-mail communication (and any attachment/s) is confidential and contains proprietary information, some or all of which may be legally privileged. It is intended solely for the use of the individual or entity to which it is addressed. Access to this email by anyone else is unauthorized. If you are not the intended recipient, any disclosure, copying, distribution or any action taken or omitted to be taken in reliance on it, is prohibited and may be unlawful.

Please consider the environment before printing this e-mail
