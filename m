From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Feb 2014 14:16:26 +0100
Subject: [Buildroot] [PATCH 4 of 7] packages: remove support for
 documentation on target
In-Reply-To: <CAAXf6LV0DwSccqT8Ur7p=NXn70FFka212O4t9pBbsS6t1VmuOQ@mail.gmail.com>
References: <patchbomb.1391597406@argentina>
 <ab1e96c7872d5567b2a4.1391597410@argentina>
 <20140205134957.463211f6@skate>
 <CAAXf6LV0DwSccqT8Ur7p=NXn70FFka212O4t9pBbsS6t1VmuOQ@mail.gmail.com>
Message-ID: <20140205141626.654ac08a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Wed, 5 Feb 2014 14:10:09 +0100, Thomas De Schampheleire wrote:

> > So the DISABLE_DOCUMENTATION variable now always has the same value,
> > and is only used in pkg-autotools.mk in one place. So I believe it
> > makes sense to remove this variable altogether, and simply pass all the
> > appropriate --<something> options directly in the <pkg>_CONFIGURE_CMDS
> > of pkg-autotools.mk.
> 
> OK.
> By the way, I added on my own todo list that we should try to expand
> the automatically passed options, for example:
> --disable-manpages --disable-man-pages --disable-manuals etc. as some
> of them are used in several packages...

I have a mixed feeling about this. The problem is that those options
are not standard, so by far not all configure scripts understand them.
Which means that when a given configure script is called, you often
have a warning:

WARNING: options --disable-foo --enable-bar unsupported

If you have gazillions of options that are unsupported, then you may
very well miss an option passed by your .mk file on which you made a
typo, for example.

So having a long list of options to disable documentation is not
something that I personally like that much, but I believe Arnout does
not share the same opinion :)

> > Then merge this KMOD_CONF_OPT += line with the existing KMOD_CONF_OPT
> > line above.
> 
> I did not do that because the --disable-static --enable-shared setting
> is accompanied with a comment:
> # static linking not supported, see
> # https://git.kernel.org/cgit/utils/kernel/kmod/kmod.git/commit/?id=b7016153ec8
> KMOD_CONF_OPT = --disable-static --enable-shared
> 
> and I felt that adding --disable-manpages here would be confusing.
> With this extra info, what is your position?

Ah, ok. In that case then it would be more natural maybe to have first
the mandatory normal options, and then this special shared/static
thing. Like:

KMOD_CONF_OPT = --disable-manpages

# blabla static blabla shared
KMOD_CONF_OPT += --disable-static --enable-shared

All these comments are cosmetic comment, so I'm in favor of merging
your patch set as is, and do followup improvements as needed.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
