From: =?UTF-8?Q?=C5=81ukasz_Przenios=C5=82o?= <bremenpl@gmail.com>
Date: Thu, 20 Dec 2018 08:39:26 +0100
Subject: [Buildroot] Cross compiling kernel module for the target
Message-ID: <CA+OsCCTCqQ+Fne+=VtXKgi5E_ezkdTAva-zTk6KaWa9egem0Sg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hello there,
I am using Buildroot to compile the kernel for my ARM target, which is a
Beaglebone black. This part works. Now I would like to use the
crosscompiler available from the output of the buildroot in order to
compile a "Hello World" Kernel module. I have already checked a regular c
file Hello World and it crosscompiles on host and runs on the target
correctly. I am having problems with setting up the whole environment for
the kernel module development. There are many tutorials available for
kernel modules development, but they assume developing on the target/ host.
I am able to compile a native host x86 kernel module, that works.

I am still missing some dependencies when trying to crosscompile for the
Beagle, I am not sure either I need to build some further packages, but
when doing xconfig I think I checked everything related to the kernel
modules. At the moment I have the following Makefile:

obj-m	:= simp.o
KERNELDIR ?= /home/lukasz/brl/Machine/beaglebone/build/linux-headers-a75d8e93056181d512f6c818e8627bd4554aaf92
PWD       := $(shell pwd)

all: default

default:
	$(MAKE) -C $(KERNELDIR) M=$(PWD) modules

clean:
	rm -rf *.o *~ core .depend .*.cmd *.ko *.mod.c .tmp_versions

And the example module code (simp.c):

#include <linux/init.h>
#include <linux/module.h>

MODULE_LICENSE("Dual BSD/GPL");

static int hello_init(void)
{
	printk(KERN_ALERT "Hello, world\n");
	return 0;
}

static void hello_exit(void)
{
	printk(KERN_ALERT "Goodbye, cruel world\n");
}

module_init(hello_init);
module_exit(hello_exit);

When trying to make:

make ARCH=arm CROSS_COMPILE=arm-buildroot-linux-uclibcgnueabihf-
-I/home/lukasz/brl/Machine/beaglebone/build/linux-a75d8e93056181d512f6c818e8627bd4554aaf92/include
-I/home/lukasz/brl/Machine/beaglebone/build/linux-a75d8e93056181d512f6c818e8627bd4554aaf92
-I/home/lukasz/brl/Machine/beaglebone/build/linux-a75d8e93056181d512f6c818e8627bd4554aaf92/include/generated/autoconf.h

I get the following error:

make -C /home/lukasz/brl/Machine/beaglebone/build/linux-headers-a75d8e93056181d512f6c818e8627bd4554aaf92
M=/tmp/test modules
make[1]: Entering directory
'/home/lukasz/brl/Machine/beaglebone/build/linux-headers-a75d8e93056181d512f6c818e8627bd4554aaf92'

  WARNING: Symbol version dump ./Module.symvers
           is missing; modules will have no dependencies and modversions.

  CC [M]  /tmp/test/simp.o
In file included from <command-line>:0:0:
././include/linux/kconfig.h:4:32: fatal error: generated/autoconf.h:
No such file or directory
 #include <generated/autoconf.h>
                                ^
compilation terminated.
scripts/Makefile.build:299: recipe for target '/tmp/test/simp.o' failed
make[2]: *** [/tmp/test/simp.o] Error 1
Makefile:1493: recipe for target '_module_/tmp/test' failed
make[1]: *** [_module_/tmp/test] Error 2
make[1]: Leaving directory
'/home/lukasz/brl/Machine/beaglebone/build/linux-headers-a75d8e93056181d512f6c818e8627bd4554aaf92'
Makefile:8: recipe for target 'default' failed
make: *** [default] Error 2

Which I dont understand, since included the .h file specifically. I would
appreciate all help regarding this. I was trying to find anyone else doing
something similar (trying to cross compile a kernel module on the host
using buildroot build tools), but was unable to. Most of the cases are
already to advanced or dont apply to my problem.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20181220/338d77b1/attachment.html>
