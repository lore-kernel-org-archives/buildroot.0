From: =?UTF-8?Q?K=C3=A1roly_Kasza?= <kaszak@gmail.com>
Date: Wed, 14 May 2014 09:55:09 +0200
Subject: [Buildroot] [PATCH 0/1] Fix redundant usage of -mcpu and
	-march/-mtune
In-Reply-To: <20140513222247.28e07ea2@free-electrons.com>
References: <1399989494-21343-1-git-send-email-kaszak@gmail.com>
 <20140513160403.6f7b1369@free-electrons.com>
 <CABbD_XBAUfowR-_TbvypUAH+R3UCWZ0RQeKA__AGJ1dPqWQ-BA@mail.gmail.com>
 <20140513222247.28e07ea2@free-electrons.com>
Message-ID: <CABbD_XDXkz6Rjbvf47SvH-bkfVacYL_nPP9x7ZpjV-Wk7JWWhw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas


On Tue, May 13, 2014 at 10:22 PM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Dear K?roly Kasza,
>
> On Tue, 13 May 2014 16:33:18 +0200, K?roly Kasza wrote:
>
> > The BR2_cortex_a7=y breaks it, it will generate a warning while compiling
> > busybox (every invocation of gcc):
> > warning: switch -mcpu=cortex-a7 conflicts with -march=armv7-a switch
> > [enabled by default]
> >
> > Then an error with mmc-utils like this:
> > mmc.c:1:0: error: switch -mcpu=cortex-a7 conflicts with -march=armv7-a
> > switch [-Werror]
>
> Indeed, with Cortex-A7, I can reproduce this. This is because
> Cortex-A7, A-12 and A-15 support more features than the other armv7-a
> cores (A5, A8, A9), so gcc has a separate -march argument: armv7ve.
>
> So normally, we should set BR2_GCC_TARGET_ARCH to armv7ve for those
> Cortex-A variants. I'm currently experimenting with this, but I'm
> having a few issues. Also, it's likely that armv7ve is quite recent,
> and may not be present in older gcc versions.
>
>
That's the case with the Linaro 2014.02 toolchain - in GCC 4.8.2 the
armv7ve does not exist
(http://gcc.gnu.org/onlinedocs/gcc-4.8.2/gcc/ARM-Options.html#ARM-Options).


> > > The potential problem I see is that the code you're changing is used
> > > for *all* architectures, but the change you're making has only been
> > > made with ARM specificities in mind. Does ignoring -march and -mtune
> > > when -mcpu is defined also works for all other architectures?
> > >
> > This is a tough question, because based on the GCC online manual, not all
> > architectures accept all three parameters.
> > It looks like -mcpu is always the most definite, but is is deprecated on
> > i386 and x86_64 for example.
> >
> > Maybe it would be wise to define and use these 3 parameters only based on
> > the target architecture.
>
> This is already the case. They are only passed if
> BR2_GCC_TARGET_{ARCH,CPU,TUNE} are defined. Some architectures (such as
> ARM) defines all three, but other architectures (such as x86) do not.
>
> Now I see. In this case, maybe the simplest would be to just leave
BR2_GCC_TARGET_ARCH
undefined in arch/Config.in.arm if the user selected a proper CPU (and not
just some generic one).

Also, based on the documentation it should be completely unnecessary to
define -march if we
have the accurate CPU with -mcpu (on ARM at least).


> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>

Regards,
Karoly
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140514/cd5221cb/attachment.html>
