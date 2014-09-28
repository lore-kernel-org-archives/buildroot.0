From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 28 Sep 2014 23:29:43 +0200
Subject: [Buildroot] [PATCH 1/1] arm: -march for Cortex A7,
 A12 and A15 is armv7ve
In-Reply-To: <CAK0XTWcRzXZmst+zZ0VT=Jzb5P2qbFef3+0nP=jGvyo8qAUcHQ@mail.gmail.com>
References: <1411866617-4994-1-git-send-email-eddy.petrisor@freescale.com>
 <20140928094630.GB3994@free.fr>
 <CAK0XTWcRzXZmst+zZ0VT=Jzb5P2qbFef3+0nP=jGvyo8qAUcHQ@mail.gmail.com>
Message-ID: <20140928212943.GF3994@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Eddy, All,

On 2014-09-28 23:53 +0300, Eddy Petri?or spake thusly:
> Pe 28.09.2014 12:46, "Yann E. MORIN" <yann.morin.1998@free.fr> a scris:
[--SNIP--]
> > The status so far is:
> >
> >   - some combinations of -march, -mcpu, -mtune are not valid, some are
> >     just a warning;
> 
> This is why I wanted to fix this. The warning might seem harmless, but on
> cortex a7, a12 and a15 the compilation of fontconfig fails since the test
> for scandir uses -Werror. This means compiling Weston on these cpus is
> impossible without a patch.
> 
> Most likely this situation is true for other packages, so correcting the
> default march might make things generally better for anyone developing now
> for the armv7ve cores.
> 
> That's why I would like this patch in, even if later it is decided march
> and mtune are dropped or another fix is implemented.

I am still not sure we want that patch in the current state, see
below...

> >   - -mcpu is not always enough to fully specify the actual CPU;
> >
> >   - gcc-5 will no longer accept some combinations of -march, -mcpu, -mtune
> >     (not sure exactly which will still be valid.)
> >
> > So, we'd like to go one of those routes (first is the preferred one):
> >
> >   - drop -march and -mtune, only keep -mcpu;
> >
> >   - conditionally set either  (-mcpu)  or  (-march and -mtune) .
> >
> > So, there is a status-quo for now on this issue. I guess we'll be
> > discussing this at the upcoming Developpers Days in D?sseldorf:
> >     http://elinux.org/Buildroot:DeveloperDaysELCE2014
> 
> I see.
> 
> Would changing the default march as proposed in my patch break any
> defconfig-s?

The problem is tht armv7ve is a new thiung with gcc-4.9, and gcc-4.8 and
below still consider those Cortex (plural: cortices?) as armv7-a.

So, if we were to apply this patch, it would break:

  - for internal toolchains that use gcc 4.8 or below; we could fix it
    by conditionally setting -march to armv7-a or armv7-ve depending on
    the version of gcc being used for the toolchain;

  - for any external toolchain that use gcc-4.8 or below; for those, we
    have no way of knowing what gcc version is being used, so we can not
    ever set -march to armv7-ve.

The only sane solution would be to drop -march altogether, which we are
still pondering...

One way I can foresee is:

  - drop -march in favour of just -mcpu, right now: makes all identified
    cases work, but a few CPUs may get non-optimized code (like those
    arm1136jf-s);

  - later re-introduce -mtune for those CPUs that require it.

But this is touching core infra, and must be carefully analysed...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
