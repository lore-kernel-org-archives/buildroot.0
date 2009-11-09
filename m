From: Roman Chertov <rchertov@cs.ucsb.edu>
Date: Mon, 09 Nov 2009 14:38:00 -0800
Subject: [Buildroot] building kernel modules
In-Reply-To: <20091109065815.GZ14091@buzzloop.caiaq.de>
References: <4AF34ADF.7090303@cs.ucsb.edu> <4AF7A886.8000703@cs.ucsb.edu>
	<20091109065815.GZ14091@buzzloop.caiaq.de>
Message-ID: <4AF899C8.5010702@cs.ucsb.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> This error is due to an illegal usage of udelay() in the module code.
> Calling this function at all is frowned upon, and calling it with too
> big values fail[*] the kernel compilation for very good reasons. You
> should rather use schedule_timeout() or timer functions to give CPU time
> to do something useful while waiting for so long. But, without knowing
> the sources, it's impossible to give any further hints.
> 

I have removed udelay calls in the code. (I am porting an old 2.4 driver
to 2.6.29) and the _bad_udelay error went away.

> 
> But don't need all the rest. All you need to provide is ARCH=arm and
> CROSS_COMPILE=..., the rest is done automatically. The kernel's build
> system is very self-contained and the sources come with all kind of
> headers and libraries. No need to point it to any external resources.
> 
> Following that should make the 2nd error go away.

I have changed my makefile to this

obj-m  := musec_can.o
musec_can-y := main.o hms30c7202_can.o c_can.o \
        irq.o open.o close.o read.o write.o ioctl.o

The makefile is then invoked via a shell script:

make ARCH=arm \
CROSS_COMPILE=/<br_dir>/build_arm/staging_dir/usr/bin/arm-linux-uclibcgnueabi-\
-C /proj/tools/buildroot-2009.08/project_build_arm/uclibc/linux-2.6.29 \
M=`pwd` modules


I have also configured buildroot to use gcc 4.4.1.  I also rebuilt
uclibc and the kernel with new compiler.  When I make the module, I get
the following during the linking phase.

make: Entering directory
`/proj/tools/buildroot-2009.08/project_build_arm/uclibc/linux-2.6.29'
  Building modules, stage 2.
  MODPOST 1 modules
WARNING: "__aeabi_uldivmod"
[/proj/tools/can_driver/musec_can/src/musec_can.ko] undefined!
make: Leaving directory
`/proj/tools/buildroot-2009.08/project_build_arm/uclibc/linux-2.6.29'

Naturally, this module is not loadable as there an undefined symbol in
the module.  insmod reports the following:

insmod: can't insert './musec_can.ko': unknown symbol in module, or
unknown parameter

I would appreciate some help in resolving this.

Thanks,

Roman

> 
> Daniel
> 
