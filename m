From: ANDY KENNEDY <ANDY.KENNEDY@adtran.com>
Date: Tue, 19 Nov 2013 23:39:19 +0000
Subject: [Buildroot] [PATCH] pciutils: install static lib with shared
In-Reply-To: <528BEA7C.8040700@mind.be>
References: <F9C551623D2CBB4C9488801D14F864C663264BB0@ex-mb1.corp.adtran.com>
 <528BEA7C.8040700@mind.be>
Message-ID: <F9C551623D2CBB4C9488801D14F864C66326538F@ex-mb1.corp.adtran.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

<snip>
> > +define PCIUTILS_DO_SHARED_BUILD
> > +	$(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" \
> > +		HOST="$(KERNEL_ARCH)-linux" \
> > +		OPT="$(TARGET_CFLAGS)" \
> > +		LDFLAGS="$(TARGET_LDFLAGS)" \
> > +		RANLIB=$(TARGET_RANLIB) \
> > +		AR=$(TARGET_AR) \
> > +		-C $(PCIUTILS_DIR) \
> > +		SHARED=yes \
> > +		ZLIB=$(PCIUTILS_ZLIB) \
> > +		DNS=$(PCIUTILS_DNS) \
> > +		LIBKMOD=$(PCIUTILS_KMOD) \
> > +		PREFIX=/usr
> 
>   This should be refactored so the long list of arguments isn't repeated.
> E.g.
>

Yeah, I had already started that one (with the intent to  come back with
a V2 patch).  I'm in process right now of getting that a bit cleaner.

<snip> 
> >
> >   # Ditch install-lib if SHARED is an option in the future
> 
>   As this comment says, for the static case, install-lib is not necessary
> for the target install.

Right.  That is more stuff that I saw after I had done the initial work.

After looking at it more, I wonder if I can refactor the whole file to make
it take advantage of autotools as well.  It seems that including something
like PCIUTIL_MAKE_OPTS+=install-lib may be a cleaner design.

> 
>   Wouldn't the install commands have to be done twice as well for staging?

No, I don't think so.  I wonder if it grabs up the two files at the same
time (perhaps with a wildcard of some kind) during the copy.  It did pull
both into my staging.

> 
> 
>   Regards,
>   Arnout

Thanks for the review.  I'll make the changes I've stated above in the
next few days and resubmit.

Andy
