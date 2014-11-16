From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 16 Nov 2014 11:07:14 +0100
Subject: [Buildroot] Analysis of build results
In-Reply-To: <20141111234919.3178e9d3@free-electrons.com>
References: <20141111073014.AA83D101626@stock.ovh.net>
 <20141111234919.3178e9d3@free-electrons.com>
Message-ID: <20141116100714.GB3965@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-11-11 23:49 +0100, Thomas Petazzoni spake thusly:
> >         i486 |                alsa-lib-1.0.28 | NOK | http://autobuild.buildroot.net/results/6ce1ecdf2bf1f14f1497e9960a1b6689568a3658/
> >      powerpc |                alsa-lib-1.0.28 | NOK | http://autobuild.buildroot.net/results/a990b0deb0269e91bcd7fb008eb40a2e00350114/
> 
> This is the same problem twice: uClibc behaving badly when vfork() is
> used in static linking configurations. This is now fixed for the
> internal toolchain backend. The first build failure is with an external
> Crosstool-NG toolchain using uClibc. Yann, what would be your
> recommendation here? Is it something you intend to fix upstream in
> Crosstool-NG? Or should I add an exception for this toolchain to not be
> used in static linking configurations?

Is that fixed in Buildroot with that patch patch:
    package/uclibc/0.9.33.2/0062-nptl-remove-duplicate-vfork-in-libpthread.patch

It is not in upstream uClibc yet, so I've pinged them about applying
that patch.

I'm a bit warry of carrying patches in crosstool-NG, that are not
upstream. But uClibc is, well, a special case, isn't it? ;-)
Maybe I could just vampirise the patches from Buildroot, and be done
with it.

> >         i686 |                     qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/9efc2b14a28fd21ed2ce492f41de538673d13dce/
> >         i686 |                     qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/0f640d6b701bb854ada2023861a234dfe489f038/
> >       x86_64 |                     qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/c58f7e10a416e0eaf7e49f0bb5ce9e6f85bc1559/
> >       x86_64 |                     qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/5979559734620358a92186a6e67aea46b6034b44/
> 
> ERROR: fdt disabled but some requested targets require it.
>        You can turn off fdt only if you also disable all the system emulation
>        targets which need it (by specifying a cut down --target-list).

O...K... Well, fdt support comes later in my series, and it is a part
that is not yet applied.

I'll see to re-order the series to be able to just submit the FDT part,
before the release.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
