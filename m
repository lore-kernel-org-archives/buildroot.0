From: Guillermo A. Amaral <g@maral.me>
Date: Sun, 14 Jan 2018 08:39:32 -0800
Subject: [Buildroot] [PATCH 1/1] Fix nconfig for systems with both
 ncurses and ncursesw
In-Reply-To: <20180114143437.02932d85@windsurf>
References: <20180114031202.30678-1-g@maral.me>
 <20180114143437.02932d85@windsurf>
Message-ID: <20180114163932.GA24925@enterprise.starfleet>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Jan 14, 2018 at 02:34:37PM +0100, Thomas Petazzoni wrote:
> Hello,
> 
> On Sat, 13 Jan 2018 19:12:02 -0800, Guillermo A. Amaral wrote:
> > Buildroot's "make ncurses" stopped working a while ago on all my Gentoo
> 
> Are you sure it's "make ncurses" that failed ? Or "make nconfig" ?

ROFL, yes "make nconfig"; Ah, the perils of having similar sounding
names (and me not double checking my emails).

> > systems, running the command would just cause it to crash.
> > 
> > I look into it and found that the issue was caused by lxdialog's cflags
> > which are also used to build nconfig; It would detect *ncursesw* and turn
> > on WIDECHAR support -- but the Makefile would still link to plain
> > *ncurses* while building nconfig (which was built without WIDECHAR
> > support).
> > 
> > This would cause a crash after using *wattrset* on a WINDOW instance.
> > WIDECHAR *wattrset* would try to set the _color member in the WINDOW
> > struct which does not exist in the NON-WIDECHAR ncurses instance. It
> > would end up clobbering data outside the struct (usually _line entries).
> > 
> > Just linking to *ncursesw* instead could possibly brick nconfig on older
> 
> brick -> break

I meant 'brick nconfig', as in have a once working command completely
stop working; But I agree 'break' is clearer.

Something tells me you must be super fun at parties. ;-)

> > systems, so I decided to use the same lxdialog script used to find
> > ncurses' cflags/ldflags for menuconfig.
> > 
> > Signed-off-by: Guillermo A. Amaral <g@maral.me>
> > ---
> >  support/kconfig/Makefile | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> > 
> > diff --git a/support/kconfig/Makefile b/support/kconfig/Makefile
> > index 7eb4071b4e..f54a60baff 100644
> > --- a/support/kconfig/Makefile
> > +++ b/support/kconfig/Makefile
> > @@ -220,8 +220,10 @@ HOSTCFLAGS_gconf.o	= `pkg-config --cflags gtk+-2.0 gmodule-2.0 libglade-2.0` \
> >  HOSTLOADLIBES_mconf   = $(shell $(CONFIG_SHELL) $(check-lxdialog) -ldflags $(HOSTCC))
> >  
> >  HOSTLOADLIBES_nconf	= $(shell \
> > -				pkg-config --libs menu panel ncurses 2>/dev/null \
> > -				|| echo "-lmenu -lpanel -lncurses"  )
> > +				pkg-config --libs menu panel 2>/dev/null \
> > +				|| echo "-lmenu -lpanel")
> > +HOSTLOADLIBES_nconf	+= $(shell $(CONFIG_SHELL) $(check-lxdialog) -ldflags)
> > +
> >  $(obj)/qconf.o: $(obj)/.tmp_qtcheck
> >  
> >  ifeq ($(qconf-target),1)
> 
> Thanks for your patch. I have a few questions:
> 
>  - Could you submit it upstream to the Linux kernel?

Yes I can.

>  - You should also create a patch in support/kconfig/patches/. Indeed,
>    we keep a quilt stack of patches on top of the upstream Linux kernel
>    kconfig code.

Ah, I missed that directory. Will do.

>  - Why are you not passing $(HOSTCC) like is done for
>    HOSTLOADLIBES_mconf ?

It didn't seem to need it, but I see now it's used as a backup if
pkg-config fails to find the package, I'll add that in.

Cheers

> Best regards,
> 
> Thomas Petazzoni
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com

-- 
gamaral
