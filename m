From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Jan 2021 15:48:11 +0100
Subject: [Buildroot] [PATCH/RFC 1/1] package/clamav: disable on riscv64
In-Reply-To: <20201114165100.2220981-1-bernd.kuhls@t-online.de>
References: <20201114165100.2220981-1-bernd.kuhls@t-online.de>
Message-ID: <20210117154811.79532aac@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 14 Nov 2020 17:51:00 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Fixes:
> http://autobuild.buildroot.net/results/6ad/6adc1ff74be4848c057aaf7bd02cc4b7d3610b1c/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> The real fix is to add
> 
>     "#define __ARCH_WANT_RENAMEAT"
> 
> to the kernel headers in arch/riscv/include/uapi/asm/unistd.h
> Inspired by https://lore.kernel.org/patchwork/patch/856923/#1053531
> 
> But patching kernel headers/image seems to be complicated.
> Because I did not find a way to do so I am sending this patch as RFC
> combined with a request for help.

The problem is that uClibc-ng only implements renameat() in terms of
the renameat() system call, and not using the renameat2() system call.
Because RISC-V is a fairly new CPU architecture, there is no reason for
it to support the renameat system call, which is just the same as
renameat2 without the flags argument.

Waldemar ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
