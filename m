From: Ulf Samuelsson <ulf@atmel.com>
Date: Tue, 21 Aug 2007 22:58:40 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/dependencies
In-Reply-To: <20070821202512.GA21092@aon.at>
References: <20070821201424.A0BC1A5D3C@busybox.net>
	<1187727179.6145.34.camel@86-115-11-152>
	<20070821202512.GA21092@aon.at>
Message-ID: <1187729920.15882.4.camel@86-115-11-152>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

tis 2007-08-21 klockan 22:25 +0200 skrev Bernhard Fischer:
> On Tue, Aug 21, 2007 at 10:12:59PM +0200, Ulf Samuelsson wrote:
> >tis 2007-08-21 klockan 13:14 -0700 skrev aldot at uclibc.org:
> >> Author: aldot
> >> Date: 2007-08-21 13:14:23 -0700 (Tue, 21 Aug 2007)
> >> New Revision: 19631
> >> 
> >> Log:
> >> - make sure that sstrip is available early enough
> >> 
> >> 
> >> Modified:
> >>    trunk/buildroot/toolchain/dependencies/dependencies.mk
> >> 
> >> 
> >> Changeset:
> >> Modified: trunk/buildroot/toolchain/dependencies/dependencies.mk
> >> ===================================================================
> >> --- trunk/buildroot/toolchain/dependencies/dependencies.mk	2007-08-21 19:45:17 UTC (rev 19630)
> >> +++ trunk/buildroot/toolchain/dependencies/dependencies.mk	2007-08-21 20:14:23 UTC (rev 19631)
> >> @@ -5,7 +5,11 @@
> >>  #
> >>  ######################################################################
> >>  
> >> -dependencies: host-sed host-lzma
> >> +ifeq ($(BR2_STRIP_sstrip),y)
> >> +# XXX: this is a little bit ugly, yep.
> >> +MAYBE_SSTRIP_HOST:=sstrip_host
> >> +endif
> >> +dependencies: host-sed host-lzma $(MAYBE_SSTRIP_HOST)
> >>  	@HOSTCC="$(firstword $(HOSTCC))" MAKE="$(MAKE)" \
> >>  		HOST_SED_DIR="$(HOST_SED_DIR)" \
> >>  		$(TOPDIR)/toolchain/dependencies/dependencies.sh
> >> 
> >
> >Why not add host-sed/host-lzma (conditionally) to TARGETS early enough?
> >I tried this, and this seemed to work, but I never got to commit that.
> >
> >ifeq ($(BR2_STRIP_sstrip),y)
> >TARGETS+=sstrip_host
> >endif
> >
> >in toolchain/Makefile.in
> >
> >Should do wonders.
> 
> I expect this not to work.
> Try the usual testcase for this kind of stuff:
> set BR2_JLEVEL=1
> $ make clean
> $ make -j 64
> (or 128)
> and see it go up in flames if you don't have proper deps in certain
> sequence points..
> 
> See?

Oh, Oh... Yes!

It would be nice to have a 64-128 CPU build server making the problem
 dead obvious :-)

Whatabout:

HOSTTOOLS:=host-sed host-lzma
ifeq ($(BR2_STRIP_sstrip),y)
HOSTTOOLS+=sstrip_host
endif

dependencies:  $(HOSTTOOLS)
  	@HOSTCC="$(firstword $(HOSTCC))" MAKE="$(MAKE)" \
  		HOST_SED_DIR="$(HOST_SED_DIR)" \
  		$(TOPDIR)/toolchain/dependencies/dependencies.sh


> >Same for the other stuff we need to have available.
-- 
Best Regards,
Ulf Samuelsson
