From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 8 Oct 2018 21:45:38 +0200
Subject: [Buildroot] [PATCH 2/4] package/asterisk: enable for non-glibc
 toolchains
In-Reply-To: <651cc680-f4ea-7ce5-a774-21602cb083e7@mind.be>
References: <20181003131358.28002-1-bernd.kuhls@t-online.de>
 <20181003131358.28002-2-bernd.kuhls@t-online.de>
 <651cc680-f4ea-7ce5-a774-21602cb083e7@mind.be>
Message-ID: <20181008194538.GJ2869@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, Bernd, All,

On 2018-10-08 19:19 +0200, Arnout Vandecappelle spake thusly:
> On 3/10/18 15:13, Bernd Kuhls wrote:
[--SNIP--]
> > diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
> > index ea779cc8f6..46fe4de947 100644
> > --- a/package/asterisk/asterisk.mk
> > +++ b/package/asterisk/asterisk.mk
> > @@ -117,6 +117,10 @@ ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),y)
> >  ASTERISK_CONF_OPTS += --with-execinfo
> >  else
> >  ASTERISK_CONF_OPTS += --without-execinfo
> > +define ASTERISK_NO_RESINIT
> > +	sed -i -e '/AC_DEFINE(\[HAVE_RES_NINIT\]/d' $(@D)/configure.ac
> > +endef
> 
>  Meh, I'm dead against such sed-patching, and I'm also against conditional
> "patching" of a package.

Agreed.

>  Is it htat much of a problem to extend the autoconf test with a call to
> res_nsearch?

It should not, no. It should be possible to change (in master), configure.ac
line 1391, from:

    [int foo = res_ninit(NULL);]

... to something like:

    [
        int foo;
        foo = res_ninit(NULL);
        foo = res_nsearch(NULL, NULL, 0, 0, NULL, 0);
    ]

... and potentially adding all such functions.

Since this is an AC_LINK_IFELSE(), we don't care what values we pas to
the the functions, as long as they have the proper types.

Regards,
Yann E. MORIN.

>  Regards,
>  Arnout
> 
> > +ASTERISK_POST_PATCH_HOOKS += ASTERISK_NO_RESINIT
> >  endif
> >  
> >  ifeq ($(BR2_PACKAGE_LIBGSM),y)
> > 
> 
> -- 
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
