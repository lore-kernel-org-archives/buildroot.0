From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 26 Apr 2016 23:14:15 +0200
Subject: [Buildroot] [PATCH] core/pkg-kconfig: use olddefconfig when
 available
In-Reply-To: <CAGkQfmNa9MDGNWT2Ygn4B1R5i61frSoyiET+FojiW+8G02ZfcQ@mail.gmail.com>
References: <1461433564-21311-1-git-send-email-yann.morin.1998@free.fr>
 <20160425153508.43945e3c@free-electrons.com>
 <CAGkQfmNa9MDGNWT2Ygn4B1R5i61frSoyiET+FojiW+8G02ZfcQ@mail.gmail.com>
Message-ID: <20160426211415.GB3482@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2016-04-25 18:42 +0200, Romain Izard spake thusly:
> 2016-04-25 15:35 GMT+02:00 Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com>:
> > Hello,
> >
> > I am sorry, but I had to revert this commit. While it works in simple
> > situations, it badly breaks the Busybox build in some situations:
> >
> >   http://autobuild.buildroot.org/?reason=busybox-1.24.2
> >
> > With just Busybox enabled in a minimal configuration, everything is
> > fine. Enable "libtirpc" in the configuration, do a full rebuild ->
> > Busybox will fail to build. I don't know if it's related specifically
> > to libtirpc or to some of its dependencies, but it fails.
> >
> > A very quick research couldn't spot the source of the problem, so I
> > simply reverted for now. Could you work on this and submit a new
> > version of the patch that addresses this problem?
> >
> 
> When testing with qemu_x86_defconfig, libtirpc and busybox I reproduce
> the issue. Calling 'make busybox-menuconfig' returns errors when
> updating the config file to merge buildroot-managed options with the new
> busybox config file, as it tries to launch olddefconfig.
> 
> The first error in the build is "bash: command not found".
> 
> There is a problem with the shell command we tried to generate, as the
> command line contains multiple levels of backticks. This comes from
> libtirpc, which uses backticks to generate its CFLAGS.

No, it does not come from libtirpc. It comes from the busybox package,
see:
    https://git.buildroot.org/buildroot/tree/package/busybox/busybox.mk#n23
    https://git.buildroot.org/buildroot/tree/package/busybox/busybox.mk#n26

And that's really the reason why I dislike back-quotes...

However, because our .mk are written in Makefile, and we can't always
know the number of expansion the Makefile variables will undergo, we
can't safely use $(xxx) to replace `xxx`... Sad... :-(

> It is possible to fix this by replacing the backticks in the
> (2)_REGEN_DOT_CONFIG macro. Unfortunately, $(...) is detected by
> make as its own syntax, so it is necessarily to use quadruple dollars.

Meh... Peolple like to think they'd be happier if they had more $, but
really more $ really hurts! ;-p

> The v6 revision of the patch, as it did not use backticks, did not have
> this problem.

I'm afraid we'll have to resort to using the makefile syntax, indeed...

Romain, could you please respin your latest revision that was using the
Makefile syntax? IIRC, I did add my reviewed-by tag to it, so you can
keep it (unless you were to tweak the code). However, please add an
explanation in the commit log that we can't use shell constructs,
something along the lines of:

    We use a Makefile syntax because using a shell construct does not
    work:
      - some packages may have shell-expansion in their _KCONFIG_OPTS
      - we can't safely use $() for command substituion, so we have to
        use ``
      - `` does not nest nicely
    Using a shell construct here to check the rule, would mean using ``,
    which could conflict with the `` from the package's _KCONFIG_OPTS.

(Feel free to adapt or re-use as-is! ;-) )

Tyanks!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
