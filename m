From: Markus Mayer <mmayer@broadcom.com>
Date: Tue, 18 Dec 2018 15:16:32 -0800
Subject: [Buildroot] [PATCH 4/4] dropbear: use BR2_SYSTEM_DEFAULT_PATH
 as default PATH
In-Reply-To: <CAGt4E5uXpteKpCCt_XmKG2HONQ3PQQADHjSyjeBKRPhphxhWhQ@mail.gmail.com>
References: <20181218005116.17435-1-mmayer@broadcom.com>
 <20181218005116.17435-5-mmayer@broadcom.com>
 <20181218194732.GF24194@scaer>
 <CAGt4E5uXpteKpCCt_XmKG2HONQ3PQQADHjSyjeBKRPhphxhWhQ@mail.gmail.com>
Message-ID: <CAGt4E5tLubsCtOawS8qsrRVVsbz6_7L_PLyFw6wiSwJMaKTU9A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 18 Dec 2018 at 14:08, Markus Mayer <markus.mayer@broadcom.com> wrote:
>
> On Tue, 18 Dec 2018 at 11:47, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> >
>
> > In fact I think I missed that in the initial patch: we should ensure
> > that it can't be empty (unelss there is a good reason to accept a
> > system-wide empty PATH). Maybe something in system/system.mk:
> >
> >     ifeq ($(BR_BUILDLING)$(BR2_SYSTEM_DEFAULT_PATH)),y"")
> >     $(error BR2_SYSTEM_DEFAULT_PATH can't be empty)
> >     endif
>
> Makes sense to me. I can't think of a good use-case for an empty
> default PATH. I'll add this for now. If it is decided that an empty
> path does make sense, I can remove it again from the series.

Hm. I can't seem to get this to work.

ifeq ($(BR_BUILDING)$(BR2_SYSTEM_DEFAULT_PATH)),y"")
#$(error BR2_SYSTEM_DEFAULT_PATH can't be empty)
$(error '$(BR_BUILDING)$(BR2_SYSTEM_DEFAULT_PATH)')
endif

For debug purposes, I replaced the error message with a message that
prints the value of the two variables with single quotes around, so
potential spaces and such become visible. It never enters the if. If I
change it to ifneq, it enters the "if", but prints the exact values
that it supposedly does not match.

How can it have the value y"" and still enter ifneq?

system/system.mk:101: *** 'y""'.  Stop.
Makefile:25: recipe for target '_all' failed

If I keep the ifneq and set the default path so some value:

system/system.mk:101: *** 'y"abc"'.  Stop.
Makefile:25: recipe for target '_all' failed

It still matches. This time, it makes sense.

Any thoughs why case of y"" doesn't match as I would have anticipated?

Thanks,
-Markus


> > (no need to properly finish the sentence, the $(error) will do it for
> > you.)
> >
> > And then we can safely use it as-is, unconditionally, in the three other
> > locations (profile, openssh, dropbear).
> >
> > Of course, if we decide that an empty BR2_SYSTEM_DEFAULT_PATH is valid,
> > then we should also use it as-is in dropbear and openssh, because we
> > should just abide by the user's decision.
> >
> > Regards,
> > Yann E. MORIN.
