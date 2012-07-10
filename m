From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 10 Jul 2012 13:29:11 +0300
Subject: [Buildroot] /dev/ttyS0 in filesystem created by Buildroot can't
 be opened in Qemu
In-Reply-To: <CAM1vXnaJ2c1NY1CRqcAwo0ZY8M-MTBwEsx_gGQzZkXRLf+gvVA@mail.gmail.com>
References: <CAM1vXnbUXsTaCbtRnS5z8SdqKTTY-EV3=o79vcGbwnSjukYmNw@mail.gmail.com>
 <20120709084152.GJ22116@sapphire.tkos.co.il>
 <CAM1vXnZsLGimtxeVZ3k6n+K6k3OdV=VwWPVEuujAD0-ZT176Bg@mail.gmail.com>
 <20120709161602.GG3783@tarshish>
 <CAM1vXnaJ2c1NY1CRqcAwo0ZY8M-MTBwEsx_gGQzZkXRLf+gvVA@mail.gmail.com>
Message-ID: <20120710102910.GA4206@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Mihajlo,

On Tue, Jul 10, 2012 at 12:22:02PM +0200, Mihajlo Jovanovi? wrote:
> Actually, I had to change the command to
> 
> qemu-system-arm -M vexpress-a9 -kernel output/images/zImage -drive
> file=output/images/rootfs.ext2,if=sd -append "console=ttyAMA0,115200
> root=/dev/mmcblk0 rw " -serial stdio -net nic,model=lan9118 -net user
> 
> otherwise ext2 was read only, and I got messages that /dev/null and
> /dev/ttyAMA0 can not be open.

Whether or not the root filesystem is mounted read-only should not affect the 
functionality of device nodes. There seems to be some other problem here.

> However, now when I launch Qemu it freezes while starting network:
> 
>  Freeing init memory: 172K
> 
> Starting logging: OK
> 
> Starting mdev...
> 
> Starting network...
> 
> It just waits there until I terminate it. I have recompiled the kernel and
> deactivate networking as I really don't need it now, but without success.
> It just printed an additional message that sockets are not implemented.

Did you make a clean build after changing the configuration? The Buildroot 
configuration system can't detect all configuration changes so sometimes you 
must start from clean. Specifically, make sure that your /etc/inittab has the 
right getty command with ttyAMA0.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
