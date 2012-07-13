From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 13 Jul 2012 16:53:43 +0200
Subject: [Buildroot] Starting from scratch fails - how do I get to a
 basic PXE boot?
In-Reply-To: <07221C471CA1C044B6D10EC0D483C95708D3FE8B@hercules.clumpton.homeip.net>
References: <mailman.29648.1342161106.7700.buildroot@busybox.net>
 <07221C471CA1C044B6D10EC0D483C95708D3FE8B@hercules.clumpton.homeip.net>
Message-ID: <20120713165343.6c5a4d21@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Fri, 13 Jul 2012 08:23:17 +0000,
"Bart J. Smit" <bart@smits.co.uk> a ?crit :

> I was under the impression from the on-line help that the BR2_LINUX_KERNEL_DEFCONFIG option had to specify one of the defconfig files from the configs directory. 

You're confusing two things:

 * The Buildroot defconfigs, which are stored in the configs/ directory
   of Buildroot. These defconfigs are *Buildroot* configuration for
   certain platforms.

 * The kernel defconfigs, which are part of the kernel sources, and
   available for each architecture in the arch/<ARCH>/configs/
   directory of the kernel source tree. This is the defconfig that is
   selected by BR2_LINUX_KERNEL_DEFCONFIG.

Now look at the available kernel defconfigs for x86:

$ ls arch/x86/configs/
i386_defconfig  x86_64_defconfig

So basically, on x86, for a vanilla Linux kernel, your only choice for
BR2_LINUX_KERNEL_DEFCONFIG is "i386", and for x86_64, your only choice
is "x86_64".

> It now builds without error, but booting the VM from the resulting bzImage and rootfs.cpio.gz causes it to stall at the same point as before. Could this be because I haven't cleaned the config? Any thoughts on how to wipe the slate clean? Will make clean do the trick?

'make clean' cleans up everything. The next 'make' invocation will
therefore restart the build from scratch completely.

If the thing halts at:

Starting logging: ON 
Initializing random number generator ... done.
Starting network ... 
[ 	2.227418] ip used greatest stack depth: 6392 bytes left

Then most likely the reason is that you have not properly configured
System configuration -> Port to run a getty (login prompt) on. You have
to figure out which serial port is used for the console of your
virtual machine, and set it in this configuration option.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
