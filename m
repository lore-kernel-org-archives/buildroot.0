From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Mar 2017 15:13:59 +0100
Subject: [Buildroot] [PATCH 3/5] support/testing: add fs tests
In-Reply-To: <58b77aa33486_1c373ff16a953ae4923fd@ultri3.mail>
References: <1486467363-19881-4-git-send-email-thomas.petazzoni@free-electrons.com>
 <58b77aa33486_1c373ff16a953ae4923fd@ultri3.mail>
Message-ID: <20170305151359.1c1b3ad9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 01 Mar 2017 22:51:31 -0300, Ricardo Martincoski wrote:

> I observed sometimes a testcase fails when it shouldn't.
> 
> This emulated system displays some time after boot this message:
> Switched to clocksource tsc
> 
> When the testcase is small there is a chance the message arrives when 'echo $?'
> is being issued.
> 
> I took a look at the kernel and I didn't find compile-time configs to avoid
> this message.
> There are some options for bootargs that maybe could help:
>  clocksource=tsc
>  loglevel=0
>  quiet
> But qemu can only use -append when -kernel is used too.
> 
> The only config I found that could workaround the error is
> # CONFIG_PRINTK is not set
> of course it is a big change, and it would need CONFIG_EXPERT=y and it would
> also change few more lines in the defconfig.
> 
> But I will be happy with any other solution.

Thanks for having debugged this issue! I was unable to reproduce on my
side, even for a 100 iterations loop. However, I've fixed it by running
"dmesg -n 1" as the first command after log in. This tells the kernel
to only display emergency kernel messages to the console, while the
"Switching to clocksource tsc" message has the info level, which is a
lower priority.

> I am not sure if in this case the rootfs should be read-only or not, but this
> differs from your previous iteration:

That's a mistake that was introduced while refactoring/cleaning up the
whole thing. Indeed in the "internal" case, we're running in an
initramfs, so the rootfs is read/write, and the "touch" is expected to
succeed.

Fixed as well, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
