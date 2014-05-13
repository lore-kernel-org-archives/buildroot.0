From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 May 2014 22:22:47 +0200
Subject: [Buildroot] [PATCH 0/1] Fix redundant usage of -mcpu and
 -march/-mtune
In-Reply-To: <CABbD_XBAUfowR-_TbvypUAH+R3UCWZ0RQeKA__AGJ1dPqWQ-BA@mail.gmail.com>
References: <1399989494-21343-1-git-send-email-kaszak@gmail.com>
 <20140513160403.6f7b1369@free-electrons.com>
 <CABbD_XBAUfowR-_TbvypUAH+R3UCWZ0RQeKA__AGJ1dPqWQ-BA@mail.gmail.com>
Message-ID: <20140513222247.28e07ea2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear K?roly Kasza,

On Tue, 13 May 2014 16:33:18 +0200, K?roly Kasza wrote:

> The BR2_cortex_a7=y breaks it, it will generate a warning while compiling
> busybox (every invocation of gcc):
> warning: switch -mcpu=cortex-a7 conflicts with -march=armv7-a switch
> [enabled by default]
> 
> Then an error with mmc-utils like this:
> mmc.c:1:0: error: switch -mcpu=cortex-a7 conflicts with -march=armv7-a
> switch [-Werror]

Indeed, with Cortex-A7, I can reproduce this. This is because
Cortex-A7, A-12 and A-15 support more features than the other armv7-a
cores (A5, A8, A9), so gcc has a separate -march argument: armv7ve.

So normally, we should set BR2_GCC_TARGET_ARCH to armv7ve for those
Cortex-A variants. I'm currently experimenting with this, but I'm
having a few issues. Also, it's likely that armv7ve is quite recent,
and may not be present in older gcc versions.

> > The potential problem I see is that the code you're changing is used
> > for *all* architectures, but the change you're making has only been
> > made with ARM specificities in mind. Does ignoring -march and -mtune
> > when -mcpu is defined also works for all other architectures?
> >
> This is a tough question, because based on the GCC online manual, not all
> architectures accept all three parameters.
> It looks like -mcpu is always the most definite, but is is deprecated on
> i386 and x86_64 for example.
> 
> Maybe it would be wise to define and use these 3 parameters only based on
> the target architecture.

This is already the case. They are only passed if
BR2_GCC_TARGET_{ARCH,CPU,TUNE} are defined. Some architectures (such as
ARM) defines all three, but other architectures (such as x86) do not.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
