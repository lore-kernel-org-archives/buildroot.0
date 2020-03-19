From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 19 Mar 2020 22:59:55 +0100
Subject: [Buildroot] [git commit] boot/barebox: license files hashes
 only valid for latest version
In-Reply-To: <CAGm1_ktj7smV2dxvFg1b=NLG55f+JwZy63+ZOHoj3bCuVJf2tA@mail.gmail.com>
References: <20200206193221.B87B38D427@busybox.osuosl.org>
 <CAGm1_kvY1+5QbCX=vTB6AYRVESTVntm9AT+1tiSVifV8jH8Qyg@mail.gmail.com>
 <20200319180446.GH10025@scaer>
 <CAGm1_ktj7smV2dxvFg1b=NLG55f+JwZy63+ZOHoj3bCuVJf2tA@mail.gmail.com>
Message-ID: <20200319215955.GI10025@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yegor, All,

On 2020-03-19 21:41 +0100, Yegor Yefremov spake thusly:
> On Thu, Mar 19, 2020 at 7:04 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > On 2020-03-19 14:32 +0100, Yegor Yefremov spake thusly:
[--SNIP--]
> > > This approach works with barebox. But when I also use barebox-aux from
> > > git (for am335x), I get the following error:
> > >
> > > ERROR: No hash found for barebox-aux-1e23cf5c7b71c29cc8dd7b0c5b80929d286b554e.tar.gz
[--SNIP--]
> > Care to provide a defconfig, or even just the URL to that git repo,
> > please?
> 
> You can take our BSP [1] and this defconfig [2] to reproduce this
> issue. Just replace barebox version to the official barebox git and
> use the latest commit ID.
> am335x requires two images MLO and barebox.bin so it has to use both
> barebox and barebox-aux.
> 
> [1] https://github.com/visionsystemsgmbh/onrisc_br_bsp
> [2] https://github.com/visionsystemsgmbh/onrisc_br_bsp/blob/master/configs/baltos_experimental_defconfig

This is not really a minimal defconfig, and does not use stock
Buildroot, so I came up with one by myself:

    BR2_arm=y
    BR2_cortex_a7=y
    BR2_TOOLCHAIN_EXTERNAL=y
    BR2_TARGET_BAREBOX=y
    BR2_TARGET_BAREBOX_CUSTOM_GIT=y
    BR2_TARGET_BAREBOX_CUSTOM_GIT_REPO_URL="https://git.pengutronix.de/git/barebox"
    BR2_TARGET_BAREBOX_CUSTOM_GIT_VERSION="v2020.03.0"
    BR2_TARGET_BAREBOX_BOARD_DEFCONFIG="foo"
    BR2_TARGET_BAREBOX_AUX=y
    BR2_TARGET_BAREBOX_AUX_BOARD_DEFCONFIG="bar"

And ran 'make source', to indeed get the same problem.

I've sent two related patches to fix the issue:

    https://patchwork.ozlabs.org/patch/1258482/
    https://patchwork.ozlabs.org/patch/1258485/

Only the second is required to fix the issue. The first one is a bonus
to avoid downloading twice.

Care to test them, please?

Regards,
Yann E. MORIN.

> Thanks.
> 
> Yegor
> 
> > Regards,
> > Yann E. MORIN.
> >
> > > package/pkg-generic.mk:167: recipe for target
> > > '/home/user/buildroot/bsp-experimental/build/barebox-aux-1e23cf5c7b71c29cc8dd7b0c5b80929d286b554e/.stamp_downloaded'
> > > failed
> > > make[1]: *** [/home/user/buildroot/bsp-experimental/build/barebox-aux-1e23cf5c7b71c29cc8dd7b0c5b80929d286b554e/.stamp_downloaded]
> > > Error 1
> > > Makefile:84: recipe for target '_all' failed
> > > make: *** [_all] Error 2
> > >
> > > Any idea how to fix this?
> > >
> > > Yegor
> >
> > --
> > .-----------------.--------------------.------------------.--------------------.
> > |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> > | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> > | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> > | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> > '------------------------------^-------^------------------^--------------------'

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
