From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Aug 2016 23:56:07 +0200
Subject: [Buildroot] [PATCH 1/8] package/netbsd-compat-headers: provide
 compatibility headers not in musl
In-Reply-To: <39651df8-a923-c535-43e6-72b0a7edea06@mind.be>
References: <cover.1471033837.git.yann.morin.1998@free.fr>
 <1d561e7440fd9f14063d006fc3dca596c9c849c7.1471033837.git.yann.morin.1998@free.fr>
 <39651df8-a923-c535-43e6-72b0a7edea06@mind.be>
Message-ID: <20160814215607.GG30771@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2016-08-14 23:20 +0200, Arnout Vandecappelle spake thusly:
>  Subject line should be musl-compat-headers, not netbsd-...
> 
> On 12-08-16 22:49, Yann E. MORIN wrote:
> > musl provides neither sys/queue.h nor sys/cdefs.h. Those two headers are
> > however quite widely used in a lot of packages (though they should at
> > least not use cdefs,h which is only full of mostly-legacy macros, and
> > which is mostly an internal header of glibc and was never really meant to
> > be exposed to, and used by packages).
> > 
> > But we don;t live in an ideal world, so a lot of packages break when
>          don't
> 
> > those two headers are missing.
> > 
> > We already took care of sys/queue.h with the netbsd-queue package. But
> > the need for cdefs.h is getting more and more pressing.
> > 
> > We rename the netbsd-queue package into musl-compat-headers, and we
> > make it install sys/queue.h (from NetBSD) and sys/cdefs.h (a minimalist
> > one we bundle in Buildroot). We can't use the cdefs.h from NetBSD
> > because it includes machine-dependent headers; instead we bundle a very
> > minimalistic one, that covers only what we need.
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> 
>  In general I prefer to use an upstream like Khem proposes. However, in this
> case, it's really a lot easier if we can add or change the header as needed by
> breaking packages. So I like the way it's done now.

What khem ponted to is not an upstream. It is a minimalist header
OpenEmbeded crafted.

As you can read in the commit log, we can not use the upstream cdefs.h
header, as it includes a machine-dependent header. And we don't really
want to go that route of downloadign yet another header, which is
moreover different for each target...

> [snip]
> > diff --git a/package/musl-compat-headers/musl-compat-headers.mk b/package/musl-compat-headers/musl-compat-headers.mk
> > new file mode 100644
> > index 0000000..0758021
> > --- /dev/null
> > +++ b/package/musl-compat-headers/musl-compat-headers.mk
> > @@ -0,0 +1,29 @@
> > +################################################################################
> > +#
> > +# musl-compat-headers
> > +#
> > +################################################################################
> > +
> > +MUSL_COMPAT_HEADERS_SITE = http://cvsweb.netbsd.org/bsdweb.cgi/src/sys/sys
> > +MUSL_COMPAT_HEADERS_VERSION = 1.70
> > +MUSL_COMPAT_HEADERS_SOURCE = queue.h?rev=$(MUSL_COMPAT_HEADERS_VERSION)
> 
>  We may need additional files in the future (e.g. the tree.h that openembedded
> is carrying). Also, the definition of upstream here is not entirely correct,
> because that's only half the package. So I think it's nicer/cleaner to specify
> this as:
> 
> MUSL_COMPAT_HEADERS_EXTRA_DOWNLOADS = \
> 	http://cvsweb.netbsd.org/bsdweb.cgi/src/sys/sys/queue.h?rev=1.70

That's what I initially did, as I agree with you.

However, I want it to be minimaly intrusive, as it might be applied to
master and we're post -rc1.

> > +MUSL_COMPAT_HEADERS_LICENSE = BSD-3c, Public Domain or CC0
> 
>  Shouldn't we specify here
> 
> MUSL_COMPAT_HEADERS_LICENSE_FILES = queue.h cdefs.h

Good point. Will do.

> > +MUSL_COMPAT_HEADERS_ADD_TOOLCHAIN_DEPENDENCY = NO
> > +
> > +# Only installs headers
> > +MUSL_COMPAT_HEADERS_INSTALL_TARGET = NO
> > +MUSL_COMPAT_HEADERS_INSTALL_STAGING = YES
> > +
> > +define MUSL_COMPAT_HEADERS_EXTRACT_CMDS
> > +	cp $(DL_DIR)/$(MUSL_COMPAT_HEADERS_SOURCE) $(@D)/queue.h
>                      ^^^This would become
>                      $(notdir $(MUSL_COMPAT_HEADERS_EXTRA_DOWNLOADS))
> 
>  BTW I think it makes sense to use install here as well.

I re-used what was previously in the netbsd-queue package. But yes,
install is better. Will do.

[--SNIP--]
> > diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
> > index 29c1f36..967f022 100644
> > --- a/toolchain/toolchain-external/toolchain-external.mk
> > +++ b/toolchain/toolchain-external/toolchain-external.mk
> > @@ -246,11 +246,13 @@ TOOLCHAIN_EXTERNAL_CFLAGS += -msoft-float
> >  TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += -DBR_SOFTFLOAT=1
> >  endif
> >  
> > -# musl does not provide a sys/queue.h implementation, so add the
> > -# netbsd-queue package that will install a sys/queue.h file in the
> > -# staging directory based on the NetBSD implementation.
> > +# musl does not provide an implementation for sys/queue.h or sys/cdefs.h. So,
> > +# add the netbsd-compat-headers package that will install those files, into
>              ^^^^^^musl

Yeah. Remnants of successive renames back-n-forth between
musl-compat-headers, netbsd-compat-headers, netbsd-headers and
musl-compat...

Will fix.

Thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
