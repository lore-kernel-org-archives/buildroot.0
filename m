From: Thomas Weininger <Thomas.Weininger@diasemi.com>
Date: Fri, 21 Jun 2013 10:31:47 +0000
Subject: [Buildroot] Build error when trying to build the py-smbus
 package of i2c-tools
In-Reply-To: <51C421AF.20904@mind.be>
References: <4E062DFADC6E8142AA8EE9D214BA0C50E3E24C@NB-EX-MBX01.diasemi.com>
 <51C32CE0.9050902@mind.be>
 <4E062DFADC6E8142AA8EE9D214BA0C50E400ED@NB-EX-MBX01.diasemi.com>
 <51C421AF.20904@mind.be>
Message-ID: <4E062DFADC6E8142AA8EE9D214BA0C50E401E5@NB-EX-MBX01.diasemi.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> -----Original Message-----
> From: Arnout Vandecappelle [mailto:arnout at mind.be]
> Sent: Freitag, 21. Juni 2013 11:50
> To: Thomas Weininger
> Cc: buildroot at busybox.net
> Subject: Re: [Buildroot] Build error when trying to build the py-smbus
> package of i2c-tools
>
> On 21/06/13 11:28, Thomas Weininger wrote:
> > Thank you for your suggestion Arnout. I tried it out but the error stays the
> same:
> >
> > /home/diasemi/workspace/dialog/buildroot/output/host/usr/bin/ccache
> > /usr/bin/gcc -pthread -shared
> > -L/home/diasemi/workspace/dialog/buildroot/output/host/lib
> > -L/home/diasemi/workspace/dialog/buildroot/output/host/usr/lib
> > -Wl,-
> rpath,/home/diasemi/workspace/dialog/buildroot/output/host/usr/li
> > b -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -
> D_FILE_OFFSET_BITS=64
> > -pipe -mfpu=vfpv4-d16 -mfloat-abi=hard -O3 -D_LARGEFILE_SOURCE
> > -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -I../include
> > build/temp.linux-i686-2.7/smbusmodule.o
> > -L/home/diasemi/workspace/dialog/buildroot/output/host/usr/lib
> > -lpython2.7 -o build/lib.linux-i686-2.7/smbus.so
> > gcc: error: unrecognized command line option '-mfpu=vfpv4-d16'
> > gcc: error: unrecognized command line option '-mfloat-abi=hard'
> > error: command
> >
> '/home/diasemi/workspace/dialog/buildroot/output/host/usr/bin/ccache'
> > failed with exit status 1
> >
> > It still uses /usr/bin/gcc for building smbus.so and I am not sure if I
> understand why this happens. Could it be because it uses python distutils in
> order to start the build?
> >
> > The file structure in the py-smbus subdirectory of i2c-tools is:
> > py-smbus/
> > ??? Module.mk
> > ??? README
> > ??? setup.py
> > ??? smbusmodule.c
> >
> >  From the Module.mk file:
> > all-python: $(INCLUDE_DIR)/linux/i2c-dev.h
> >          $(DISTUTILS) build
>
>   Can you add 'echo $$PATH' just above the call to $(DISTUTILS), just to be
> sure that the right python will be used?  Or, in the setup.py script, add
>
> import sys
> print sys.path
>
> to check that the host-distutils will be used.
[Thomas Weininger]
I put 'echo $(PATH)' in the Module.mk file before the distutils call:
echo /home/diasemi/workspace/dialog/buildroot/output/host/bin:/home/diasemi/workspace/dialog/buildroot/output/host/usr/bin:/home/diasemi/workspace/dialog/buildroot/output/host/usr/sbin/:~/bin:~/bin:~/bin:/usr/lib/mpi/gcc/openmpi/bin:/home/diasemi/bin:/usr/local/bin:/usr/bin:/bin:/usr/bin/X11:/usr/X11R6/bin:/usr/games:/usr/lib/mit/bin:/home/diasemi/workspace/dialog/u-boot/tools:/home/diasemi/workspace/dialog/u-boot/tools:/home/diasemi/workspace/dialog/u-boot/tools
So /home/diasemi/workspace/dialog/buildroot/output/host/usr/bin/python is in PATH at this time.

And additionally I tried to print sys.path in the setup.py:
['/home/diasemi/workspace/dialog/buildroot/output/build/i2c-tools-3.1.0/py-smbus', '/home/diasemi/workspace/dialog/buildroot/output/host/usr/lib/python27.zip', '/home/diasemi/workspace/dialog/buildroot/output/host/usr/lib/python2.7', '/home/diasemi/workspace/dialog/buildroot/output/host/usr/lib/python2.7/plat-linux2', '/home/diasemi/workspace/dialog/buildroot/output/host/usr/lib/python2.7/lib-tk', '/home/diasemi/workspace/dialog/buildroot/output/host/usr/lib/python2.7/lib-old', '/home/diasemi/workspace/dialog/buildroot/output/host/usr/lib/python2.7/lib-dynload', '/home/diasemi/workspace/dialog/buildroot/output/host/usr/lib/python2.7/site-packages']
Seems also okay for me.

>
>
> >
> > So it uses Python distutils (the setup.py) in order to build smbus.so. And it
> seems to me that it uses the host distutils instead of the target system's
> one.
> > If this is the problem, then the Module.mk or the setup.py will most likely
> need to be patched in order to use the target system toolchain?
>
>   Hang on, maybe you have to build host-python-setuptools first?
[Thomas Weininger]
I can't find a python-setuptools option in the host utilities menu in Buildroot's make menuconfig. How can I build it?
However, for the target BR2_PACKAGE_PYTHON_SETUPTOOLS is set.

>
>   Regards,
>   Arnout
>
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
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
