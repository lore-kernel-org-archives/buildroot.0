From: Daniel Mack <daniel@caiaq.de>
Date: Mon, 9 Nov 2009 07:58:15 +0100
Subject: [Buildroot] building kernel modules
In-Reply-To: <4AF7A886.8000703@cs.ucsb.edu>
References: <4AF34ADF.7090303@cs.ucsb.edu>
 <4AF7A886.8000703@cs.ucsb.edu>
Message-ID: <20091109065815.GZ14091@buzzloop.caiaq.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Nov 08, 2009 at 09:28:38PM -0800, Roman Chertov wrote:
> So I figured out how to get the external kernel module compilation
> going.  The cross compilation works fine, but the linking fails as there
> are two undefined symbols.  Also, there is a strange error regarding
> /usr/local/src/mv-kernel/arm-none-linux-gnueabi/bin/arm-none-linux-gnueabi-gcc
> 
> However, the compilation proceeds even with that error.
> 
> [rchertov at number2 src]$ sh make.sh
> make:
> /usr/local/src/mv-kernel/arm-none-linux-gnueabi/bin/arm-none-linux-gnueabi-gcc:
> Command not found
> make: Entering directory
> `/proj/tools/buildroot-2009.08/project_build_arm/uclibc/linux-2.6.29'
>   LD [M]  /proj/tools/can_driver/musec_can/src/musec_can.o
>   Building modules, stage 2.
>   MODPOST 1 modules
> WARNING: "__bad_udelay"

This error is due to an illegal usage of udelay() in the module code.
Calling this function at all is frowned upon, and calling it with too
big values fail[*] the kernel compilation for very good reasons. You
should rather use schedule_timeout() or timer functions to give CPU time
to do something useful while waiting for so long. But, without knowing
the sources, it's impossible to give any further hints.

([*] the way they implemented that depending on compile-time constraints
     is very nice, btw. Dig through the headers if your curious ;))

> [/proj/tools/can_driver/musec_can/src/musec_can.ko] undefined!
> WARNING: "__aeabi_uldivmod"
> [/proj/tools/can_driver/musec_can/src/musec_can.ko] undefined!
>   LD [M]  /proj/tools/can_driver/musec_can/src/musec_can.ko
> make: Leaving directory
> `/proj/tools/buildroot-2009.08/project_build_arm/uclibc/linux-2.6.29'
> 
> 
> I believe that the linker uses libc instead of uclibc which was compiled
> for ARM, and hence the linking step is failing.  I would appreciate it
> if somebody could point out which linker setting I am missing.  Below, I
> listed all of the variables that I redefined for the build.
> 
> ARCH=arm
> CROSS_COMPILE=/<br_dir>/build_arm/staging_dir/usr/bin/arm-linux-uclibcgnueabi-

These two look sane.

> AS      =$(CROSS_COMPILE)as
> LD      =$(CROSS_COMPILE)ld
> CC      =$(CROSS_COMPILE)gcc
> CPP     =$(CC) -E
> AR      =$(CROSS_COMPILE)ar
> NM      =$(CROSS_COMPILE)nm
> STRIP   =$(CROSS_COMPILE)strip
> OBJCOPY =$(CROSS_COMPILE)objcopy
> OBJDUMP =$(CROSS_COMPILE)objdump
> 
> 
> EXTRA_CFLAGS=-I /<br_dir>/project_build_arm/uclibc/linux-2.6.29/include\
> -I<br_dir>/build_arm/staging_dir/usr/lib/gcc/arm-linux-uclibcgnueabi/4.3.3/include
> 
> LDFLAGS=-L/<br_dir>/build_arm/staging_dir/lib
> 
> ...

But don't need all the rest. All you need to provide is ARCH=arm and
CROSS_COMPILE=..., the rest is done automatically. The kernel's build
system is very self-contained and the sources come with all kind of
headers and libraries. No need to point it to any external resources.

Following that should make the 2nd error go away.

Daniel
