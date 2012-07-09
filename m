From: =?UTF-8?Q?Mihajlo_Jovanovi=C4=87?= <jovanovic.mihajlo@gmail.com>
Date: Mon, 9 Jul 2012 16:40:52 +0200
Subject: [Buildroot] /dev/ttyS0 in filesystem created by Buildroot can't
 be opened in Qemu
In-Reply-To: <20120709084152.GJ22116@sapphire.tkos.co.il>
References: <CAM1vXnbUXsTaCbtRnS5z8SdqKTTY-EV3=o79vcGbwnSjukYmNw@mail.gmail.com>
 <20120709084152.GJ22116@sapphire.tkos.co.il>
Message-ID: <CAM1vXnZsLGimtxeVZ3k6n+K6k3OdV=VwWPVEuujAD0-ZT176Bg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

Thanks for this hint. I have rebuilt everything with
qemu_arm_vexpress_defconfig configuration file.

I have noticed that it created ext2 filesystem, instead of cpio, as I was
planning to do, to be as close to tutorial as possible.

Nevertheless, I have launched Qemu like this:

qemu-system-arm -M vexpress-a9 -kernel zImage -initrd rootfs.ext2 -serial
stdio -append "console=ttyAMA0"

Where zImage and rootfs.ext2 are kernel image and filesystem created by
Buildroot, respectively.

Now there are no complaints about missing /dev/ttyS0 any more, but kernel
prints the message that it can not mount filesystem:

.
.
.

NET: Registered protocol family 17

VFP support v0.3: implementor 41 architecture 3 part 30 variant 9 rev 0

input: ImExPS/2 Generic Explorer Mouse as
/devices/mb:kmi1/serio1/input/input1

rtc-pl031 mb:rtc: setting system clock to 2012-07-09 14:10:33 UTC
(1341843033)

VFS: Cannot open root device "(null)" or unknown-block(0,0)

Please append a correct "root=" boot option; here are the available
partitions:

Kernel panic - not syncing: VFS: Unable to mount root fs on
unknown-block(0,0)

[<80014de4>] (unwind_backtrace+0x0/0xf8) from [<8033065c>]
(panic+0x88/0x1d8)

[<8033065c>] (panic+0x88/0x1d8) from [<80438c64>]
(mount_block_root+0x15c/0x210)

[<80438c64>] (mount_block_root+0x15c/0x210) from [<80438df0>]
(mount_root+0xd8/0xf4)

[<80438df0>] (mount_root+0xd8/0xf4) from [<80438f34>]
(prepare_namespace+0x128/0x180)

[<80438f34>] (prepare_namespace+0x128/0x180) from [<80438918>]
(kernel_init+0x13c/0x178)

[<80438918>] (kernel_init+0x13c/0x178) from [<8000f388>]
(kernel_thread_exit+0x0/0x8)

Just for the reference, the complete log is attached to this e-mail.

It looks as if I missed to specify root option or something similar.

I have tried to specify hard-disk image (-hda option in Qemu) and to append
option "root=/dev/sda1", but it ended up more or less the same:

qemu-system-arm -M vexpress-a9 -kernel zImage -hda /ARM_hda.img -initrd
rootfs.ext2 -serial stdio -append "root=/dev/sda1 console=ttyAMA0"

Thanks in advance!

Mihajlo


2012/7/9 Baruch Siach <baruch@tkos.co.il>

> Hi Mihajlo,
>
> On Mon, Jul 09, 2012 at 10:31:49AM +0200, Mihajlo Jovanovi? wrote:
> > Hi everyone,
> >
> > I am working with QEMU 1.1.0, emulating Versatile Express board with ARM
> > Cortex-A9. I have managed to launch simple "Hello World" example
> following
> > this instructions:
> >
> >
> http://balau82.wordpress.com/2012/03/31/compile-linux-kernel-3-2-for-arm-and-emulate-with-qemu/
> >
> > but now I want to create filesystem by myself.
> >
> > I decided to use buildroot, version 2012.05. and I've configured it to
> > create toolchain, kernel and filesystem image for ARM Cortex-A9 target.
> >
> > Kernel is of version 3.3.7 and for the filesystem I've selected to be
> cpio,
> > non-compressed. The initrd argument in call to qemu-system-arm is
> pointing
> > to
> >
> > */output/images/rootfs.cpio*
> >
> > When I launch QEMU kernel boots, but then I get this message:
> >
> > *Initializing random number generator... done.*
> >
> > *Starting network...*
> >
> > *can't open /dev/ttyS0: No such device or address*
>
> Versatile systems use the amba-pl011 serial driver, that have its device
> node
> at /dev/ttyAMA0 by default. Change "Port to run a getty (login prompt) on"
> (under "System configuration") to ttyAMA0 and try again.
>
> You can also use qemu_arm_vexpress_defconfig as a base for experimentation.
> Just do:
>
>     make qemu_arm_vexpress_defconfig
>
> This defconfig already includes the right getty port for Versatile Express.
>
> baruch
>
> > *...*
> >
> > All I can do is to terminate QEMU.
> >
> > I have checked the contents of rootfs.cpio like this:
> >
> > cpio -t < rootfs.cpio
> >
> > and saw that there is /dev/ttyS0.
> >
> > Have I missed something in configuring the filesystem? Or should I use
> > filesystem in
> >
> > */output/target*
> >
> > to somehow create device(s) there (Buildroot does not do that), and then
> > rebuild the filesystem?
> >
> > I'm new to Buildroot, so any hint or suggestion is more than welcome.
>
>
> --
>      http://baruch.siach.name/blog/                  ~. .~   Tk Open
> Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
>    - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120709/ef969e22/attachment.html>
