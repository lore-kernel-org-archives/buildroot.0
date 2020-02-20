From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 20 Feb 2020 23:56:41 +0100
Subject: [Buildroot] QtWebEngine on RPI 0 W
In-Reply-To: <20200218145224.3f449bac@gmx.net>
References: <1579861270269-0.post@n4.nabble.com>
 <20200125172550.45366ce5@gmx.net>
 <1580197267384-0.post@n4.nabble.com>
 <20200128085828.5959e493@gmx.net> <20200128104326.030b51d9@gmx.net>
 <1580384329954-0.post@n4.nabble.com>
 <20200130132047.5d82cab0@gmx.net>
 <1580734278053-0.post@n4.nabble.com>
 <1580902462241-0.post@n4.nabble.com>
 <20200205141214.075cf5a3@gmx.net>
 <1580908839250-0.post@n4.nabble.com>
 <20200218145224.3f449bac@gmx.net>
Message-ID: <20200220235641.1b8be4c1@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Rafa,

On Tue, 18 Feb 2020 14:52:24 +0100, Peter Seiderer <ps.report@gmx.net> wrote:

> Hello Rafa,
>
> On Wed, 5 Feb 2020 07:20:39 -0600 (CST), rscr <rafacrespiramon@gmail.com> wrote:
>
> > > Hi again,
> > >
> > > I have tested the QtWebEngine with a qt example and I got:
> > >
> > > # ./minimal -platform eglfs
> > > Illegal instruction
> > >
> > > Any idea of what could be causing it?
> > >
> > >Hard to say without further information..., did your compile
> > >minimal yourself or did you enable 'BR2_PACKAGE_QT5BASE_EXAMPLES=y'
> > >and used the one installed as
> > '/usr/lib/qt/examples/webenginewidgets/minimal/minimal'
> > >on the target?
> >
> > I had enabled 'BR2_PACKAGE_QT5BASE_EXAMPLES=y' and I have used the one in
> > '/usr/lib/qt/examples/webenginewidgets/minimal/minimal'
> >
> > Result of 'file minimal':
> >
> > minimal: ELF 32-bit LSB executable, ARM, EABI5 version 1 (SYSV), dynamically
> > linked, interpreter /lib/ld-, for GNU/Linux 4.19.0, stripped
> >
> > I have no problems running other samples like the qtvirtualkeyboard or touch
> > ones
> >
> >
> > >Please provide a complete .config (or defconfig) file...
> >
> > Here my defconfig:  cp4_defconfig.cp4_defconfig
> > <http://buildroot-busybox.2317881.n4.nabble.com/file/t2824/cp4_defconfig.cp4_defconfig>
> >
> >
> > >Still using buildroot-2019.02.09?
> >
> > Yes
>
> I can confirm your crash/illegal instruction with the provided config
> using minimal example on RPi0 (it crashes somewhere in the static
> constructors)...

And finally found the root cause of the problem, the qtwebengine configure step
determines the wrong compile flags for the chromium build system, simple
using some (wrong) ARMv7 arm defaults instead ARMv6 for the rpi zero...

A proof-of-concept patch sent to the mailing list, see [1]...

With the patch applied I can start qtwebengine examples minimal
and quicknanobrowser...

Regards,
Peter

[1] https://patchwork.ozlabs.org/patch/1241702/

>
> Regards,
> Peter
>
> >
> > >Regards,
> > >Peter
> >
> > Kind Regards,
> >
> > Rafa
> >
> >
> >
> >
> > --
> > Sent from: http://buildroot-busybox.2317881.n4.nabble.com/
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
