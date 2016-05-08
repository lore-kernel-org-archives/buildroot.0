From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Sun, 08 May 2016 18:54:47 +0200
Subject: [Buildroot] [PATCH] ipsec-tools: add patches to fix musl build
In-Reply-To: <20160508154028.66be1c03@free-electrons.com>
References: <1462707126-21048-1-git-send-email-joerg.krause@embedded.rocks>
 <20160508154028.66be1c03@free-electrons.com>
Message-ID: <1462726487.22644.25.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On So, 2016-05-08 at 15:40 +0200, Thomas Petazzoni wrote:
> Hello,
> 
> On Sun,??8 May 2016 13:32:06 +0200, J?rg Krause wrote:
> 
> > 1) Fix missing definition of __P() macro:
> > 
> > __P was used for compatibility with some old K&R C compilers, when
> > there were
> > no prototypes (which were introduced to C with C89).
> > 
> > This macro definition is not available when building with the musl
> > C library,
> > so the local compatibility header "gnuc.h" already present in one
> > of the
> > subdirs is made available for all subdirs and the necessary include
> > is added
> > to the needed header and source files.
> 
> Isn't it simpler to just drop __P from where it is used? Do they
> still
> need to support those old K&R C compilers that predate C89 ? That
> seem
> very unlikely, no?

There are about 580 occurances of __P and upstream disliked my attempt
to get rid of __P.

> > 4) Check for strtouq
> > 
> > strtouq() is a BSD function and not available on musl. Add a
> > autoconf check
> > for its present and if not available, replace it with its
> > equivalent strtoull
> > or strtoul (if strtoull is not available).
> 
> Are you sure replacing strtouq by strtoul is safe? strtouq() is
> converting to a 64 bits integer, while strtoul() converts to an
> unsigned long, which is only 32 bits on 32 bits architectures. So
> replacing strtouq() with strtoul() on 32 bits architectures is
> only
> safe if you're sure that the value being passed fits on 32 bits.

I was not sure about this, too. The Linux man page says: "Depending on
the wordsize of the current architecture, this may be equivalent to
strtoull() or to strtoul()." This confused my a little bit. So, I guess
it's only sure to replace with strtoull().

> 
> > +# We are patch configure.ac, so we need to run autoreconfigure the
> > package.
> 
> are patch -> are patching
> 
> > +# Although this package uses autoconf, it does not work with the
> > autoreconf
> > +# tool, so we # need to call their bootstrap script which does the
> 
> # sign in a middle of a line, probably a rewrap that went wrong.
> 
> > +# reconfiguration.
> > +define IPSEC_TOOLS_RUN_BOOTSTRAP
> > +	cd $(@D) && PATH=$(BR_PATH) ./bootstrap
> > +endef
> > +IPSEC_TOOLS_PRE_CONFIGURE_HOOKS += IPSEC_TOOLS_RUN_BOOTSTRAP
> 
> You need to add host-autoconf (and possibly host-automake/host-
> libtool)
> in the dependencies for this to work.

I see!

> Or alternatively, fix the autoreconfiguration problems so that it
> autoreconfigures properly :)

I proposed a patch upstream to fix autoreconf, but it was insisted that
bootstrap should be used nonetheless. So, it seems easier to add the
autoreconf patch to Buildroot.

Best regards
J?rg Krause
