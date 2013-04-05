From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 5 Apr 2013 15:19:17 +0200
Subject: [Buildroot] Cross-Compiling out-of-tree driver
In-Reply-To: <trinity-e6e255fe-1d77-40c4-934f-3c35573b2dbc-1365166479514@3capp-gmx-bs29>
References: <trinity-59b60d3c-656f-45cc-86d2-b8be6566e03e-1365162059588@3capp-gmx-bs42>
 <20130405140752.195f40c9@skate>
 <trinity-e6e255fe-1d77-40c4-934f-3c35573b2dbc-1365166479514@3capp-gmx-bs29>
Message-ID: <20130405151917.598647db@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Andreas,

Please do not reply to me directly: the list should be kept in Cc.
Thanks.

On Fri, 5 Apr 2013 14:54:39 +0200 (CEST), universeII at gmx.de wrote:

> thanks for your quick response. I'm still a little bit confused how to complile the driver.
> I have the dummy driver in an own directory including the Makefile which is just a "normal"
> makefile for compiling a driver out-of-tree.
> Example:
> 
> obj-m := dummy_driver.o
> KDIR := /lib/modules/$(shell uname -r)/build
> PWD := $(shell pwd)
> 
> default:
>     $(MAKE) -C $(KDIR) M=$(PWD) modules
> 
> 
> I change to the directory and issue a "make" command. I was woundering if it is possible to just set
> KDIR and the gcc approriately to the kernel sources and (cross-compile) tools from buildroot.

Aah, ok, you want to build your module manually outside of Buildroot.
What I showed in my previous e-mail was how to integrate it as a
Buildroot package.

If you want to build your out-of-tree module manually against a Linux
kernel that has been built by Buildroot, then you should just do:

KDIR = /path/to/buildroot/output/build/linux-x.y.z/

that should be enough. Then of course, you should install your module,
so maybe add something like:

DESTDIR = /path/to/buildroot/output/target/

install:
	$(MAKE) -C $(KDIR) M=$(PWD) INSTALL_MOD_PATH=$(DESTDIR)	modules_install

run "make install" in your module, which should install it in the
output/target/lib/modules/<kernelversion>/ directory. Then, run "make"
again in Buildroot so that your filesystem image gets regenerated to
include the module.

Of course, this is only needed if you want a clean installation of your
module. For quick and dirty testing, you can also just copy the .ko
file to your target, and insmod it.

> I had a look at your patch file and it seems to me that the .mk is somehow included in the
> buildroot make structure (I'm sorry that I do not know so much details how buildroot work internally)?

Yes, my patch shows how to add an out-of-tree kernel driver as a
Buildroot package, so that it is nicely integrated in the Buildroot
build process.

> How do you in this case issue a compilation of your driver?

You just enable your new package in 'make menuconfig', and run the
usual Buildroot 'make' command.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
