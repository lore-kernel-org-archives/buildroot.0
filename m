From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 7 Apr 2015 23:08:08 +0200
Subject: [Buildroot] [git commit] boot/at91bootstrap3: migrate to
 pkg-kconfig
In-Reply-To: <1742152.8gskvjVAdm@noffke.mortara.com>
References: <20150406213231.634BE817D2@busybox.osuosl.org>
 <2107652.0TfdOuBi1l@noffke.mortara.com>
 <20150407172100.GF4216@free.fr>
 <1742152.8gskvjVAdm@noffke.mortara.com>
Message-ID: <20150407210808.GT4216@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Patrick, All,

On 2015-04-07 12:40 -0500, Patrick Noffke spake thusly:
> On Tuesday, April 07, 2015 07:21:00 PM you wrote:
> > see what it's doing in: package/pkg-kconfig.mk , and it's basically:
> >
> >     cp $(YOUR_CONFIG_FILE)  $(AT91BOOTSTRAP3_DIR)/.config
> >     make oldconfig
> >
> This is my problem.  I didn't know about oldconfig -- I thought
> defconfig was
> getting run.
>
> make oldconfig is replacing some of my settings for the at91bootstrap3
> package.
>
> In particular, in my custom config, I have
>
> #CONFIG_MACH_TYPE="1830"
> CONFIG_MACH_TYPE="0xFFFFFFFF"
> CONFIG_SDRAM=y
>
> and these are getting replaced with
>
> CONFIG_MACH_TYPE="1830"
> # CONFIG_SDRAM is not set
>
> Should oldconfig be doing this?

Yes, this is expected behaviour of oldconfig, and that's what we're
calling it for: to apply the configuration statements and make them
aligned with the actual possibilities offered by the Kconfig files.

Looking at at91bootstrap3's Kconfig fies, CONFIG_SDRAM can only be
selected by another option; it can't be set all by itself. Which means
seeting it "manually" by editing the .config file is wrong.

So, in your case, it means that your "new board" definition is
incorrect. Something should select it.

> > Well, it's pretty easy to see if this patch is the culprit:
> >
> >     git checkout 2016cb30f103024a8dfb50bcfe9a68bfac2f1118^
> >
> > then test your config and see if it works. If it does, then the
> > patch
> > may be the culprit (i.e. uncover a bug somewhere, maybe in
> > Buildroot,
> > maybe in at91bootstrap3 itself); if the config does not work, then
> > the
> > bug pre-existed that patch.
>
> When I checkout this revision, the package builds fine.

Maybe, but still the board definition (or whatever it is called in
at91bootstrap3) that you wrote is incorrect.

I'm highly tempted to say that this is not a problem of using
pkg-kconfig that is causing you troubles, but merely that this switch is
exposing an problem on your side.

See how other boards are doing it:

    $ make at91bootstrap3-patch
    $ cd output/build/at91bootstrap3-v3.7.1
    $ grep -r -E 'select[[:space:]]+CONFIG_SDRAM' .
    ./board/at91sam9261ek/Config.in.board:  select CONFIG_SDRAM
    ./board/at91sam9rlek/Config.in.board:   select CONFIG_SDRAM
    ./board/at91sam9260ek/Config.in.board:  select CONFIG_SDRAM
    ./board/at91sam9g10ek/Config.in.board:  select CONFIG_SDRAM
    ./board/at91sam9g20ek/Config.in.board:  select CONFIG_SDRAM
    ./board/at91sam9263ek/Config.in.board:  select CONFIG_SDRAM
    ./board/at91sam9xeek/Config.in.board:   select CONFIG_SDRAM

Then look at how those files are defining the board's capabilities
(hint: it is very straightforward!).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
