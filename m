From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Date: Thu, 21 Dec 2017 09:30:46 +0100
Subject: [Buildroot] musl and linux-tool-gpio
In-Reply-To: <CACPK8Xc7=f_p8Ws4u4yYn3yx_63AXP8XaWELiy49M2K459AaeA@mail.gmail.com>
References: <CACPK8Xc7=f_p8Ws4u4yYn3yx_63AXP8XaWELiy49M2K459AaeA@mail.gmail.com>
Message-ID: <20171221083046.gt7b6zvurxhukhcm@latitude>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Dec 21, 2017 at 11:31:26AM +1030, Joel Stanley wrote:
> Hello buildroot,
> 
> I was trying to create an ARM image that used a musl libc and contains
> the Linux gpio tools. It fails to build as tools/gpio/gpio-event-mon.c
> requires but does not directly include sys/types.h for the u_int32_t
> types.
> 
> On a glibc system sys/types.h appears to be included through unistd.h.
> 
> I've sent a patch to the kernel:
> 
>  https://patchwork.kernel.org/patch/10126851/

Hi Joel,

I've independently hit the same problem, and sent a different patch:

	https://www.spinics.net/lists/linux-gpio/msg27047.html

... which should land in 4.16, AFAIUI.

> How do I fix this for buildroot? We could disable the gpio tools for
> kernels that do not include this fix. Or we could disable the tools
> for musl builds.
> 
> Better would be to patch the kernel build in buildroot, but it appears
> that patches can't be added to linux-tools in the same way as other
> packages.

I think you can patch the linux package instead. For buildroot-provided
kernels this should be safe and not cause any patch conflicts.

For user-provided custom kernels, I don't know. The user *could* patch
gpio-event-mon.c in the custom kernel, and use gpio-event-mon without
problems, so maybe buildroot shouldn't even add a workaround here.


Thanks,
Jonathan Neusch?fer
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 819 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20171221/91500359/attachment.asc>
