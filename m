From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Date: Mon, 30 Apr 2012 12:29:43 +0200
Subject: [Buildroot] [PATCH 1/2] add host arch detection and Kconfig
 (BR2_HOSTARCH)
In-Reply-To: <201204281738.17492.arnout@mind.be>
References: <1334675140-20303-1-git-send-email-plagnioj@jcrosoft.com>
 <201204281738.17492.arnout@mind.be>
Message-ID: <20120430102943.GB2992@game.jcrosoft.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 17:38 Sat 28 Apr     , Arnout Vandecappelle wrote:
> On Tuesday 17 April 2012 17:05:39 Jean-Christophe PLAGNIOL-VILLARD wrote:
> > This will allow to install binary package only if they are supported by the
> > host. As example Atmel SAM-BA (x86 only).
> > 
> > Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
> > ---
> >  Config.in |    4 ++++
> >  Makefile  |   10 ++++++++++
> >  2 files changed, 14 insertions(+), 0 deletions(-)
> > 
> > diff --git a/Config.in b/Config.in
> > index 68abb9b..be424b7 100644
> > --- a/Config.in
> > +++ b/Config.in
> > @@ -10,6 +10,10 @@ config BR2_VERSION
> >  	string
> >  	option env="BR2_VERSION_FULL"
> >  
> > +config BR2_HOSTARCH
> > +	string
> > +	option env="HOSTARCH"
> > +
> >  source "target/Config.in.arch"
> >  
> >  menu "Build options"
> > diff --git a/Makefile b/Makefile
> > index 3a09417..b14940b 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -32,6 +32,16 @@ ifneq ($(firstword $(sort $(MAKE_VERSION) $(MIN_MAKE_VERSION))),$(MIN_MAKE_VERSI
> >  $(error You have make '$(MAKE_VERSION)' installed. GNU make >= $(MIN_MAKE_VERSION) is required)
> >  endif
> >  
> > +export HOSTARCH := $(shell uname -m | \
> > +	sed -e s/i.86/x86/ \
> > +	    -e s/sun4u/sparc64/ \
> > +	    -e s/arm.*/arm/ \
> > +	    -e s/sa110/arm/ \
> > +	    -e s/ppc64/powerpc/ \
> > +	    -e s/ppc/powerpc/ \
> > +	    -e s/macppc/powerpc/\
> > +	    -e s/sh.*/sh/)
> 
>  If it's going to be any use, I guess we still need to be able to
> distinguish arm/armeb and sh/sh64.  But I don't know how these look
> in the uname. 

If you can found one sh64 board good luck I may have one somewhere but not
even sure I can still found a sh64

for arme if you can found a board with enough power power to build something on it
as big as buildroot

today the Cortex A15 and A9 are little endian

Best Regards,
J.
