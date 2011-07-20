From: ANDY KENNEDY <ANDY.KENNEDY@adtran.com>
Date: Wed, 20 Jul 2011 04:53:31 +0000
Subject: [Buildroot] [Patch] Allow file to be built against static libs.
In-Reply-To: <87oc0q2ddu.fsf@macbook.be.48ers.dk>
References: <F9C551623D2CBB4C9488801D14F864C6044668@ex-mb1.corp.adtran.com>
 <87sjq22f6n.fsf@macbook.be.48ers.dk> <87oc0q2ddu.fsf@macbook.be.48ers.dk>
Message-ID: <F9C551623D2CBB4C9488801D14F864C60448FD@ex-mb1.corp.adtran.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> >>>>> "Peter" == Peter Korsgaard <jacmet@uclibc.org> writes:
> 
> >>>>> "ANDY" == ANDY KENNEDY <ANDY.KENNEDY@adtran.com> writes:
>  ANDY> If selected "prefer static libs", file fails to build
> reporting:
>  ANDY> relocation R_X86_64_32S against `zcalloc' can not be used
> when making
>  ANDY> a shared object; recompile with -fPIC
>  ANDY> The suggested -fPIC doesn't work.  The issue is that the
> default
>  ANDY> configure has --enable-shared --enable-static.  This patch
> modifies
>  ANDY> the configure to disable shared when "prefer static libs" is
> selected.
> 
>  ANDY> FILE_DEPENDENCIES = host-file zlib
>  ANDY> HOST_FILE_DEPENDENCIES = host-zlib
> 
>  ANDY> +ifeq ($(BR2_PREFER_STATIC_LIB),y)
>  ANDY> +FILE_CONF_OPT = --disable-shared --enable-static
>  ANDY> +HOST_FILE_CONF_OPT = --disable-shared --enable-static
> 
>  Peter> We indeed force --enable-shared --disable-static for host
> builds, but
>  Peter> that doesn't really matter. For target builds we use (see
>  Peter> package/Makefile.in) --enable-static --enable-shared when
>  Peter> PREFER_STATIC_LIB is enabled, so rather than something file
> specific, I
>  Peter> think it would make more sense to set that to --enable-
> static
>  Peter> --disable-shared instead.
> 
> Ehh, drop that, I remembered wrong - We're already doing --enable-
> static --disable-shared.

Okay, well, sortta, but not really.  I believe this to be the culprit:

#############################################################
#
# zlib
#
#############################################################
ZLIB_VERSION:=1.2.5
ZLIB_SOURCE:=zlib-$(ZLIB_VERSION).tar.bz2
ZLIB_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/libpng
ZLIB_INSTALL_STAGING=YES

ifeq ($(BR2_PREFER_STATIC_LIB),y)
ZLIB_PIC :=
ZLIB_SHARED := --static
else
ZLIB_PIC := -fPIC
ZLIB_SHARED := --shared
endif


I'm guessing this shouldn't be that way.  I don't, however, really
know how to fix this one up.  I'm guessing that this needs to be
something along the lines of:

ifeq ($(BR2_PREFER_STATIC_LIBZ),y)
ZLIB_CONF_ENV = "LDFLAGS+=--static"
else
ZLIB_CONF_ENV = "LDFLAGS+=-fPIC --shared"
endif

Or something like that.  It appears, however, that the current
state of the build makes ONLY a static libz if PREFER_STATIC_LIB
is set.

So, file just happened to be the red herring.

Somebody who is more awake than I show me how to fix that puppy,
please.

Andy
