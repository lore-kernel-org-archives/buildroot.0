From: =?UTF-8?Q?Mihajlo_Jovanovi=C4=87?= <jovanovic.mihajlo@gmail.com>
Date: Tue, 10 Jul 2012 12:22:02 +0200
Subject: [Buildroot] /dev/ttyS0 in filesystem created by Buildroot can't
 be opened in Qemu
In-Reply-To: <20120709161602.GG3783@tarshish>
References: <CAM1vXnbUXsTaCbtRnS5z8SdqKTTY-EV3=o79vcGbwnSjukYmNw@mail.gmail.com>
 <20120709084152.GJ22116@sapphire.tkos.co.il>
 <CAM1vXnZsLGimtxeVZ3k6n+K6k3OdV=VwWPVEuujAD0-ZT176Bg@mail.gmail.com>
 <20120709161602.GG3783@tarshish>
Message-ID: <CAM1vXnaJ2c1NY1CRqcAwo0ZY8M-MTBwEsx_gGQzZkXRLf+gvVA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

Thanks for this, I was not browsing through Buildroot directories carefully
enough to find that readme.

Actually, I had to change the command to

qemu-system-arm -M vexpress-a9 -kernel output/images/zImage -drive
file=output/images/rootfs.ext2,if=sd -append "console=ttyAMA0,115200
root=/dev/mmcblk0 rw " -serial stdio -net nic,model=lan9118 -net user

otherwise ext2 was read only, and I got messages that /dev/null and
/dev/ttyAMA0 can not be open.

However, now when I launch Qemu it freezes while starting network:

 Freeing init memory: 172K

Starting logging: OK

Starting mdev...

Starting network...

It just waits there until I terminate it. I have recompiled the kernel and
deactivate networking as I really don't need it now, but without success.
It just printed an additional message that sockets are not implemented.

I have used unmodified qemu_arm_vexpress_defconfig file, but maybe
something has to be changed in configuration anyway. I am launching Qemu on
Ubuntu 12.04 virtual machine under Windows 7, so I'm not sure if that might
be causing any problems.

My goal is just to get command prompt. After that I would like to rebuild
filesystem and to run some DirectFB examples.

Best regards,

Mihajlo

2012/7/9 Baruch Siach <baruch@tkos.co.il>

> Hi Mihajlo,
>
> On Mon, Jul 09, 2012 at 04:40:52PM +0200, Mihajlo Jovanovi? wrote:
> > Hi Baruch,
> >
> > Thanks for this hint. I have rebuilt everything with
> > qemu_arm_vexpress_defconfig configuration file.
> >
> > I have noticed that it created ext2 filesystem, instead of cpio, as I was
> > planning to do, to be as close to tutorial as possible.
> >
> > Nevertheless, I have launched Qemu like this:
> >
> > qemu-system-arm -M vexpress-a9 -kernel zImage -initrd rootfs.ext2 -serial
> > stdio -append "console=ttyAMA0"
> >
> > Where zImage and rootfs.ext2 are kernel image and filesystem created by
> > Buildroot, respectively.
> >
> > Now there are no complaints about missing /dev/ttyS0 any more, but kernel
> > prints the message that it can not mount filesystem:
>
> [...]
>
> Quoting board/qemu/arm-vexpress/readme.txt:
>
> Run the emulation with:
>
>   qemu-system-arm -M vexpress-a9 -kernel output/images/zImage -drive
> file=output/images/rootfs.ext2,if=sd -append "console=ttyAMA0,115200
> root=/dev/mmcblk0" -serial stdio -net nic,model=lan9118 -net user
>
> The login prompt will appear in the terminal that started Qemu. The
> graphical window is the framebuffer.
>
> baruch
>
> --
>      http://baruch.siach.name/blog/                  ~. .~   Tk Open
> Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
>    - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120710/bf36442a/attachment.html>
