From: =?UTF-8?Q?K=C3=A1roly_Kasza?= <kaszak@gmail.com>
Date: Tue, 13 May 2014 16:33:18 +0200
Subject: [Buildroot] [PATCH 0/1] Fix redundant usage of -mcpu and
	-march/-mtune
In-Reply-To: <20140513160403.6f7b1369@free-electrons.com>
References: <1399989494-21343-1-git-send-email-kaszak@gmail.com>
 <20140513160403.6f7b1369@free-electrons.com>
Message-ID: <CABbD_XBAUfowR-_TbvypUAH+R3UCWZ0RQeKA__AGJ1dPqWQ-BA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Tue, May 13, 2014 at 4:04 PM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Dear Karoly Kasza,
>
> Thanks for your report!
>
> On Tue, 13 May 2014 15:58:13 +0200, Karoly Kasza wrote:
>
> > I've been using the Linaro external toolchain in the latest GIT to
> generate ARM
> > code. I've found that when using this external compiler, Buildroot
> > compulsorily specifies the -mcpu and -march switches to GCC, which is
> redundant
> > (-march and -mtune can be concluded from -mcpu, see
> > http://gcc.gnu.org/onlinedocs/gcc/ARM-Options.html )
> > While most of the time this only generates a warning, mmc-utils can not
> be
> > compiled this way and probably other packages suffer from this as well.
>
> Which mmc-utils problem have you seen? I've just tried building the
> following configuration:
>
> BR2_arm=y
> BR2_cortex_a8=y
> BR2_ARM_EABIHF=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_PACKAGE_MMC_UTILS=y
>
> And it just built fine, and uses a Linaro toolchain.
>
>
The BR2_cortex_a7=y breaks it, it will generate a warning while compiling
busybox (every invocation of gcc):
warning: switch -mcpu=cortex-a7 conflicts with -march=armv7-a switch
[enabled by default]

Then an error with mmc-utils like this:
mmc.c:1:0: error: switch -mcpu=cortex-a7 conflicts with -march=armv7-a
switch [-Werror]


On second thought, the above problem may come from when defining an -march
that is the same as -mcpu it will generate a warning, but it won't if these
two differ. In buildroot/arch/Config.in.arm BR2_GCC_TARGET_ARCH (from which
-march is derived) is always defined as armv7-a when using any Cortex CPU
(because Linaro always generates armv7 code?).
So -march should be ignored when -mcpu matches it (for example armv7 and
Cortex-a7) but it may be needed to be defined for different -mcpu -s.


> I recommend altering toolchain/toolchain-external/toolchain-external.mk,
> > so it won't supply redundant GCC switches.
>
> The potential problem I see is that the code you're changing is used
> for *all* architectures, but the change you're making has only been
> made with ARM specificities in mind. Does ignoring -march and -mtune
> when -mcpu is defined also works for all other architectures?
>
>
This is a tough question, because based on the GCC online manual, not all
architectures accept all three parameters.
It looks like -mcpu is always the most definite, but is is deprecated on
i386 and x86_64 for example.

Maybe it would be wise to define and use these 3 parameters only based on
the target architecture.


Regards,
Karoly


> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140513/1f74c876/attachment.html>
