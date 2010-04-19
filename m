From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Mon, 19 Apr 2010 18:08:20 +0000 (UTC)
Subject: [Buildroot] Still can't build working rootfs with crosstool-NG
	toolchain
References: <hqhq8e$uau$1@dough.gmane.org> <20100419180637.241cbdd0@surf>
Message-ID: <hqi66j$i2c$1@dough.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2010-04-19, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Mon, 19 Apr 2010 14:44:30 +0000 (UTC)
> Grant Edwards <grant.b.edwards@gmail.com> wrote:
>
>> I've spend the past week trying to use crosstool-NG instead of
>> buildroot to build a toolchain.  I had been using external buildroot
>> toolchains for the past couple months with no problems. But, that is
>> unsupported by buildroot, and I'm giving up fighting that battle.
>
> Come on, it is *not* unsupported. We are trying to support it, but
> facing issues.

I just meant that it doesn't currently work unless I maintain forked
versions of several .mk files (including ext-tool.mk).  I don't want
to do that anymore, so I'm trying to switch to ctNG and abandon my
forked files.

>> It doesn't seem to matter which toolchain I use to build the kernel, I
>> get the same results with both kernels. I'm using an Atmel
>> AT91SAM9G20EK development board, gcc 4.4.3, uClibc 0.9.30.2.
>
> The problem might be related to OABI vs. EABI. What's the
> configuration of the toolchain, the Buildroot configuration, and the
> kernel configuration for this ?

Doh.

It was indeed an OABI vs. EABI problem.  The problem was a result of
daisy-chaining several bits of my own stupidity together:

 1) At one point I had switched the buildroot toolchain to EABI, but
    somehow I switched it back either without knowing or without
    remembering.

 2) I had thought that using an EABI toolchain produced an EABI
    kernel, but it doesn't: there's a kernel configuration variable
    you have to set.  This resulted in my mistaken belief that my
    kernel was EABI and my misinterpreting some testing that I did in
    an attempt to confirm that both toolchains were EABI.

 3) I had a downloaded an EABI kernel uImage file to use for testing
    and didn't realize it had backwards OABI compatibility enabled --
    causing me to stumble even further down the path of believing all
    my different kernels, root filesystems, and toolchains were EABI.

It's all painfully obvious now...
    
-- 
Grant Edwards               grant.b.edwards        Yow! ... My pants just went
                                  at               on a wild rampage through a
                              gmail.com            Long Island Bowling Alley!!
