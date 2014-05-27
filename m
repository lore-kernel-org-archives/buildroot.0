From: =?UTF-8?Q?K=C3=A1roly_Kasza?= <kaszak@gmail.com>
Date: Tue, 27 May 2014 17:40:44 +0200
Subject: [Buildroot] [PATCH 0/1] Fix redundant usage of -mcpu and
	-march/-mtune
In-Reply-To: <20140514095932.73856d89@free-electrons.com>
References: <1399989494-21343-1-git-send-email-kaszak@gmail.com>
 <20140513160403.6f7b1369@free-electrons.com>
 <CABbD_XBAUfowR-_TbvypUAH+R3UCWZ0RQeKA__AGJ1dPqWQ-BA@mail.gmail.com>
 <20140513222247.28e07ea2@free-electrons.com>
 <CABbD_XDXkz6Rjbvf47SvH-bkfVacYL_nPP9x7ZpjV-Wk7JWWhw@mail.gmail.com>
 <20140514095932.73856d89@free-electrons.com>
Message-ID: <CABbD_XCWVoXRGDYAbZnXaM2stX9HrqkvRBq3CVgsHLFPj9fbdQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Looks like the armv7-a conflict is well known in GCC with Cortex A7 and
A15. These 2 CPU types won't accept -march=armv7-a, see
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=57907 . The solution is
armv7ve that you mentioned, but only intruduced in gcc 4.9 on the 29th
January (the external toolchains including Linaro's don't support this yet).

I think in Buildroot arch/Config.in.arm should be altered and
set BR2_GCC_TARGET_ARCH to none for the Cortex A7 and A15.

BR
Karoly



On Wed, May 14, 2014 at 9:59 AM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Dear K?roly Kasza,
>
> On Wed, 14 May 2014 09:55:09 +0200, K?roly Kasza wrote:
>
> > > So normally, we should set BR2_GCC_TARGET_ARCH to armv7ve for those
> > > Cortex-A variants. I'm currently experimenting with this, but I'm
> > > having a few issues. Also, it's likely that armv7ve is quite recent,
> > > and may not be present in older gcc versions.
> > >
> > >
> > That's the case with the Linaro 2014.02 toolchain - in GCC 4.8.2 the
> > armv7ve does not exist
> > (
> http://gcc.gnu.org/onlinedocs/gcc-4.8.2/gcc/ARM-Options.html#ARM-Options).
>
> Yeah, in gcc 4.8.2 vanilla. But Linaro toolchains don't use a vanilla
> gcc, they have lots of ARM related patches. And if the Linaro
> toolchains complains that -march=armv7-a is incompatible with
> -mcpu=cortex-a7, then quite certainly it means that cortex-a7 is part
> of a different -march family, according to this toolchain.
>
> > > This is already the case. They are only passed if
> > > BR2_GCC_TARGET_{ARCH,CPU,TUNE} are defined. Some architectures (such as
> > > ARM) defines all three, but other architectures (such as x86) do not.
> > >
> > Now I see. In this case, maybe the simplest would be to just leave
> > BR2_GCC_TARGET_ARCH
> > undefined in arch/Config.in.arm if the user selected a proper CPU (and
> not
> > just some generic one).
>
> Not sure what you mean by "not just some generic one". In the
> menuconfig, what we ask the user is to define the specific ARM core
> being used. From that we can derive the -march and -mcpu values. But
> indeed, the -march value is quite useless.
>
> However, I believe there are place in Buildroot where we do use the
> BR2_GCC_TARGET_ARCH value for other things than just the compiler
> flags. We would have to audit those before removing BR2_GCC_TARGET_ARCH
> from Config.in.arm.
>
> > Also, based on the documentation it should be completely unnecessary to
> > define -march if we have the accurate CPU with -mcpu (on ARM at least).
>
> Correct.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140527/1957d79c/attachment.html>
