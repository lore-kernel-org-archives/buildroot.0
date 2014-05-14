From: =?UTF-8?Q?K=C3=A1roly_Kasza?= <kaszak@gmail.com>
Date: Wed, 14 May 2014 14:33:25 +0200
Subject: [Buildroot] [PATCH 0/1] Fix redundant usage of -mcpu and
	-march/-mtune
In-Reply-To: <20140514095932.73856d89@free-electrons.com>
References: <1399989494-21343-1-git-send-email-kaszak@gmail.com>
 <20140513160403.6f7b1369@free-electrons.com>
 <CABbD_XBAUfowR-_TbvypUAH+R3UCWZ0RQeKA__AGJ1dPqWQ-BA@mail.gmail.com>
 <20140513222247.28e07ea2@free-electrons.com>
 <CABbD_XDXkz6Rjbvf47SvH-bkfVacYL_nPP9x7ZpjV-Wk7JWWhw@mail.gmail.com>
 <20140514095932.73856d89@free-electrons.com>
Message-ID: <CABbD_XDgwhc_yJdceiCvY0+TYGdOCdJrnBvH0xptDQaJdPfgyg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

On Wed, May 14, 2014 at 9:59 AM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Dear K?roly Kasza,
>
> On Wed, 14 May 2014 09:55:09 +0200, K?roly Kasza wrote:
>
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
>
I ran gcc-linaro-arm-linux-gnueabihf-4.8-2014.02_linux#
./bin/arm-linux-gnueabihf-gcc --target-help

It says:

...

 Known ARM architectures (for use with the -march= option):
    armv2 armv2a armv3 armv3m armv4 armv4t armv5 armv5e armv5t armv5te armv6
    armv6-m armv6j armv6k armv6s-m armv6t2 armv6z armv6zk armv7 armv7-a
armv7-m
    armv7-r armv7e-m armv8-a armv8-a+crc iwmmxt iwmmxt2 native
...

So it looks like it does not currently support armv7-ve. I don't know what
-march does -mcpu=cortex-a7 define, if not armv7-a.
There is a newer Linaro toolchain (2014.04), which is not yet in the
Buildroot GIT. It is still based on GCC 4.8, and
still does not support armv7-ve.

I also built an internal Buildroot toolchain using GCC 4.9, its possible
targets include armv7ve.

> > This is already the case. They are only passed if
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
>
I meant giving an option like "Generic ARM" or something, and then letting
the user to choose -mtune and -march values.
The documentation mentions this "-mcpu=generic-arch is also permissible,
and is equivalent to -march=arch -mtune=generic-arch.".

I would use this to specify BIG.little architecture for the Cortex-A15,
which in not available right now in the CPU section.
This requires a value for -mcpu=cortex-a15.cortex-a7 (also not available in
Linaro).

Kind regards,
Karoly
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140514/19aa8cec/attachment.html>
