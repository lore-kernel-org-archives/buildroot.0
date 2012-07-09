From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 9 Jul 2012 11:41:53 +0300
Subject: [Buildroot] /dev/ttyS0 in filesystem created by Buildroot can't
 be opened in Qemu
In-Reply-To: <CAM1vXnbUXsTaCbtRnS5z8SdqKTTY-EV3=o79vcGbwnSjukYmNw@mail.gmail.com>
References: <CAM1vXnbUXsTaCbtRnS5z8SdqKTTY-EV3=o79vcGbwnSjukYmNw@mail.gmail.com>
Message-ID: <20120709084152.GJ22116@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Mihajlo,

On Mon, Jul 09, 2012 at 10:31:49AM +0200, Mihajlo Jovanovi? wrote:
> Hi everyone,
> 
> I am working with QEMU 1.1.0, emulating Versatile Express board with ARM
> Cortex-A9. I have managed to launch simple "Hello World" example following
> this instructions:
> 
> http://balau82.wordpress.com/2012/03/31/compile-linux-kernel-3-2-for-arm-and-emulate-with-qemu/
> 
> but now I want to create filesystem by myself.
> 
> I decided to use buildroot, version 2012.05. and I've configured it to
> create toolchain, kernel and filesystem image for ARM Cortex-A9 target.
> 
> Kernel is of version 3.3.7 and for the filesystem I've selected to be cpio,
> non-compressed. The initrd argument in call to qemu-system-arm is pointing
> to
> 
> */output/images/rootfs.cpio*
> 
> When I launch QEMU kernel boots, but then I get this message:
> 
> *Initializing random number generator... done.*
> 
> *Starting network...*
> 
> *can't open /dev/ttyS0: No such device or address*

Versatile systems use the amba-pl011 serial driver, that have its device node 
at /dev/ttyAMA0 by default. Change "Port to run a getty (login prompt) on" 
(under "System configuration") to ttyAMA0 and try again.

You can also use qemu_arm_vexpress_defconfig as a base for experimentation.  
Just do:

    make qemu_arm_vexpress_defconfig

This defconfig already includes the right getty port for Versatile Express.

baruch

> *...*
> 
> All I can do is to terminate QEMU.
> 
> I have checked the contents of rootfs.cpio like this:
> 
> cpio -t < rootfs.cpio
> 
> and saw that there is /dev/ttyS0.
> 
> Have I missed something in configuring the filesystem? Or should I use
> filesystem in
> 
> */output/target*
> 
> to somehow create device(s) there (Buildroot does not do that), and then
> rebuild the filesystem?
> 
> I'm new to Buildroot, so any hint or suggestion is more than welcome.


-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
