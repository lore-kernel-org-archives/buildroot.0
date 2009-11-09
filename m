From: Daniel Mack <daniel@caiaq.de>
Date: Mon, 9 Nov 2009 23:59:51 +0100
Subject: [Buildroot] building kernel modules
In-Reply-To: <4AF899C8.5010702@cs.ucsb.edu>
References: <4AF34ADF.7090303@cs.ucsb.edu> <4AF7A886.8000703@cs.ucsb.edu>
	<20091109065815.GZ14091@buzzloop.caiaq.de>
	<4AF899C8.5010702@cs.ucsb.edu>
Message-ID: <20091109225951.GI14091@buzzloop.caiaq.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Nov 09, 2009 at 02:38:00PM -0800, Roman Chertov wrote:
> > But don't need all the rest. All you need to provide is ARCH=arm and
> > CROSS_COMPILE=..., the rest is done automatically. The kernel's build
> > system is very self-contained and the sources come with all kind of
> > headers and libraries. No need to point it to any external resources.
> > 
> > Following that should make the 2nd error go away.
> 
> I have changed my makefile to this
> 
> obj-m  := musec_can.o
> musec_can-y := main.o hms30c7202_can.o c_can.o \
>         irq.o open.o close.o read.o write.o ioctl.o
> 
> The makefile is then invoked via a shell script:
> 
> make ARCH=arm \
> CROSS_COMPILE=/<br_dir>/build_arm/staging_dir/usr/bin/arm-linux-uclibcgnueabi-\
> -C /proj/tools/buildroot-2009.08/project_build_arm/uclibc/linux-2.6.29 \
> M=`pwd` modules
> 
> 
> I have also configured buildroot to use gcc 4.4.1.  I also rebuilt
> uclibc and the kernel with new compiler.  When I make the module, I get
> the following during the linking phase.
> 
> make: Entering directory
> `/proj/tools/buildroot-2009.08/project_build_arm/uclibc/linux-2.6.29'
>   Building modules, stage 2.
>   MODPOST 1 modules
> WARNING: "__aeabi_uldivmod"

Hmm. If you only get this error for your own module (and not the kernel
itself), you should have a look at the assembly output and see what gcc
does there and why. It shouldn't be using the __aeabi_uldivmod function
which is part of libgcc which the kernel does not seem to link on your
platform. According to the postings below, these errors are likely to be
caused by false gcc optimisations.

You should get around that by altering your sources, but again, without
the code, this is all speculating.

Those links could also help:

  http://www.spinics.net/lists/arm-kernel/msg48776.html
  http://lists.arm.linux.org.uk/lurker/message/20080227.081641.1580db5d.en.html

In case you consider bringing your driver mainline, you can also post it
to LKML and get some feedback there.

After all, what you're seeing is an effect that has to do with your
code, the kernel and gcc. And not with buildroot :)

Daniel
