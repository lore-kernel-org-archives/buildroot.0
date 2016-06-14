From: Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org>
Date: Tue, 14 Jun 2016 15:53:56 +0200
Subject: [Buildroot] [PATCH 02/34] reproducibility: override locale and
 timezone
In-Reply-To: <20160507151550.48e49913@free-electrons.com>
References: <20160430074358.GE1781@hermes.click-hack.org>
 <1462002570-14706-1-git-send-email-gilles.chanteperdrix@xenomai.org>
 <1462002570-14706-2-git-send-email-gilles.chanteperdrix@xenomai.org>
 <20160507151550.48e49913@free-electrons.com>
Message-ID: <20160614135356.GD3060@hermes.click-hack.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, May 07, 2016 at 03:15:50PM +0200, Thomas Petazzoni wrote:
> Hello,
> 
> On Sat, 30 Apr 2016 09:48:58 +0200, Gilles Chanteperdrix wrote:
> > ---
> >  Makefile | 7 +++++++
> >  1 file changed, 7 insertions(+)
> 
> Missing SoB.
> 
> > diff --git a/Makefile b/Makefile
> > index ec7dccb..86b2ed2 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -218,6 +218,13 @@ ifeq ($(filter $(noconfig_targets),$(MAKECMDGOALS)),)
> >  -include $(BR2_CONFIG)
> >  endif
> >  
> > +export BR2_REPRODUCIBLE
> 
> Why ?

So that it can be used in scripts. Like wrappers script. In order to
know if we should take special actions because we are targeting a
reproducible build.

> 
> > +ifeq ($(BR2_REPRODUCIBLE),y)
> > +export TZ=UTC
> > +export LANG=C
> > +export LC_ALL=C
> > +endif
> 
> Regarding overriding TZ, LANG and LC_ALL, I'm wondering if we shouldn't
> do it unconditionally, regardless of the value of BR2_REPRODUCIBLE.
> What is the benefit of leaving those variable to their value from the
> build environment?

Obviously:
- having dates printed for your local timezone (like build timestamps
if you do not want a reproducible build). I do not know about you,
but I would hate to have to convert a build timestamp from UTC to
local timezone in order to see if I am running the binary I think I
am running.
- having compiler messages printed in your locale, if you set the
locale, it is probably what you want.

-- 
					    Gilles.
https://click-hack.org
