From: Ossy <ossy1980@gmx.net>
Date: Wed, 07 Jul 2010 22:20:31 +0200
Subject: [Buildroot] init: I won't write compressed data to a terminal.
In-Reply-To: <AANLkTimdJ34gAH-YTjfOkW_iEsKZyRvBVnbLIS55oMdd@mail.gmail.com>
References: <4C33AB4E.9050604@gmx.net>
	<AANLkTimdJ34gAH-YTjfOkW_iEsKZyRvBVnbLIS55oMdd@mail.gmail.com>
Message-ID: <4C34E18F.4080109@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 07.07.2010 02:35, schrieb Mitch Davis:
> On Wed, Jul 7, 2010 at 8:16 AM, Ossy<ossy1980@gmx.net>  wrote:
>> Hi buildroot mailinglist,
>
> Hey Ossy!
>
>> After successfully compiling a whole rootfs and mounting it via loop on some
>> nfs export I started my arm ebedded device and ran into tho following error
>> after booting the image via tftp.
>>
>> "init: I won't write compressed data to a terminal."
>>
>> The bootargs include a console=ttyS0,115200 and rootfs over nfs options.
>> I guess there is is an issue with the built in zip/bzip compression.
>> But why is the init process not able to output to the terminal?
>
> I would suspect that it's not init as-such, but rather there is a
> startup script that is not working properly.
>
> What happens if you also include "init=/bin/sh" on your kernel boot
> line, then boot?
> What happens if you rename /etc/inittab to have a different name (so
> init won't find /etc/inittab) then boot?

After passing init=/bin/sh to the kernel, I ran into a similar error:
[    4.387550] eth0: link up, 100 Mb/s, full duplex, flow control disabled
[    4.716652] Looking up port of RPC 100003/2 on 192.168.1.106
[    4.727962] Looking up port of RPC 100005/1 on 192.168.1.106
[    4.739261] VFS: Mounted root (nfs filesystem) on device 0:12.
[    4.745153] Freeing init memory: 112K
sh: I won't write compressed data to a terminal.
sh: For help, type: `sh --help'.
[    4.816666] Kernel panic - not syncing: Attempted to kill init!
[    4.822617] Backtrace:
[    4.825103] [<c0028544>] (dump_backtrace+0x0/0x110) from [<c0314e70>] 
(dump_stack+0x18/0x1c)
[    4.833598]  r7:c7820000 r6:c7820000 r5:4005eef0 r4:c03f89dc
[    4.839341] [<c0314e58>] (dump_stack+0x0/0x1c) from [<c0314ec4>] 
(panic+0x50/0x13c)

I think the init process somewhere calls an inline zipping. But I can't 
imagine where and why.

Regards,
Marcus
