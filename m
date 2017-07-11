From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 11 Jul 2017 23:48:37 +0200
Subject: [Buildroot] [PATCH 2/3] fs/squashfs: align size to 1MiB
In-Reply-To: <2a123420-ecda-47a0-c0c3-155e3ad77f07@mind.be>
References: <cover.1499703968.git.yann.morin.1998@free.fr>
 <03816ee56333f1eddb6ca8a048aea947fc027963.1499703968.git.yann.morin.1998@free.fr>
 <20170710232439.7dba43f1@windsurf.lan>
 <20170710213516.GB22898@scaer> <87pod6rak1.fsf@dell.be.48ers.dk>
 <20170711204204.GA2991@scaer>
 <2a123420-ecda-47a0-c0c3-155e3ad77f07@mind.be>
Message-ID: <20170711214837.GC2991@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2017-07-11 23:31 +0200, Arnout Vandecappelle spake thusly:
> On 11-07-17 22:42, Yann E. MORIN wrote:
> [snip]
> > $ qemu-system-arm -M vexpress-a9 -smp 1 -m 256 -kernel output/images/zImage -dtb output/images/vexpress-v2p-ca9.dtb 
> > -drive file=output/images/rootfs.squashfs,if=sd,format=raw
> > -append "console=ttyAMA0,115200 root=/dev/mmcblk0" -serial stdio -net
> nic,model=lan9118 -net user
> [snip]
> > mmcblk0: mmc0:4567 QEMU! 2.25 MiB
> 
>  Hm, you're emulating an SD card here. I'm not sure how qemu deals with emulated
> devices where the backing file doesn't have a size that corresponds to what the
> kernel driver expects... Possibly the last bit is just chopped off, which might
> lead to an issue like this...
> 
>  Does it also happen when you emulate it as an IDE device? Or even better, does
> it also happen on actual hardware?
> 
>  I don't feel good doing such padding just to make qemu happy when actual
> hardware doesn't need it...

So, I booted a rpi2 with a squashfs as rootfs, and it boots all the way
to a login prompt, and the image is not padded to 256KiB:

    $ ls -l images/rootfs.squashfs
    -rw-r--r-- 1 ymorin ymorin 20086784 juil. 11 23:42 images/rootfs.squashfs

Which means that this is a qemu limitation...

I've marked this patch and the next one as rejected.

Thanks! :-)

Thomas, so what do you want to do in the runtime testing infra: I would
be wary to add a call to truncate in all cases that generate a squashfs
image (I already have 6 of them).

Would it be acceptable that the emulator class first truncates its input
image to pad it to a 1MiB boundary, whatever the input image?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
