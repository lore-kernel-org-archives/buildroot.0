From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 18 Jul 2021 11:25:17 +0200
Subject: [Buildroot] [PATCH 1/1] package/libmodsecurity: fix build with
 libmaxminddb
In-Reply-To: <CAPi7W80Co6=hRO5p68v8+viKbW_CkFYo40ASPh=Fq+zq52d8aw@mail.gmail.com>
References: <20210716172016.207663-1-fontaine.fabrice@gmail.com>
 <20210717091140.GI12203@scaer>
 <CAPi7W80_mm5p24UOGj9mhZYYU7eHtadzsVGrrBVScCWoehTAeQ@mail.gmail.com>
 <20210717203343.GX12203@scaer>
 <CAPi7W81riHMDFyu22nud+QCgjCgGY6ZAtKzSs+d1PGhPZsk+fQ@mail.gmail.com>
 <20210718080847.GC12203@scaer>
 <CAPi7W80Co6=hRO5p68v8+viKbW_CkFYo40ASPh=Fq+zq52d8aw@mail.gmail.com>
Message-ID: <20210718092517.GD12203@scaer>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Fabrice, All,

On 2021-07-18 10:33 +0200, Fabrice Fontaine spake thusly:
> Le dim. 18 juil. 2021 ? 10:08, Yann E. MORIN <yann.morin.1998@free.fr> a ?crit :
[--SNIP--]
> > > >     diff --git a/package/libmodsecurity/libmodsecurity.mk b/package/libmodsecurity/libmodsecurity.mk
> > > >     index b2637257b6..10338dad7c 100644
> > > >     --- a/package/libmodsecurity/libmodsecurity.mk
> > > >     +++ b/package/libmodsecurity/libmodsecurity.mk
> > > >     @@ -14,6 +14,24 @@ LIBMODSECURITY_CPE_ID_VENDOR = trustwave
> > > >      LIBMODSECURITY_CPE_ID_PRODUCT = modsecurity
> > > >
> > > >      LIBMODSECURITY_DEPENDENCIES = pcre
> > > >     +
> > > >     +# configure.ac will call git to get various version strings, from
> > > >     +# libmodsecurity itself, but also from bundled dependencies, just
> > > >     +# for the sake of siplaying them at the end of configure.
> > > >     +# Fake a git that returns the version for libmodescurity, to quiesce
> > > >     +# warnings...
> > > >     +define LIBMODSECURITY_FAKE_GIT
> > > >     +   $(Q)mkdir -p $(@D)/.buildroot
> > > >     +   $(Q)printf '#!/usr/bin/env sh\necho "$(LIBMODSECURITY_VERSION)"\n' \
> > > >     +           >$(@D)/.buildroot/git
> > > >     +   @(Q)chmod 755 $(@D)/.buildroot/git
> > > >     +endef
> > > >     +LIBMODSECURITY_POST_EXTRACT_HOOKS += LIBMODSECURITY_FAKE_GIT
> > > >     +
> > > >     +# 0001-Revert-Fix-maxminddb-link-on-FreeBSD.patch
> > > >     +LIBMODSECURITY_AUTORECONF = YES
> > > >     +LIBMODSECURITY_AUTORECONF_ENV = PATH="$(@D)/.buildroot:$(BR_PATH)"

Becarefull here: BR_PATH is already quoted:

    Makefile:478:BR_PATH = "$(HOST_DIR)/bin:$(HOST_DIR)/sbin:$(PATH)"

How do other packages do? Hmm... It sems they usually do not quote
anything, e.g.:

    package/nodejs/nodejs.mk:91:            PATH=$(@D)/bin:$(BR_PATH)
    package/qt5/qt5webkit/qt5webkit.mk:33:QT5WEBKIT_CONF_ENV = PATH=$(@D)/host-bin:$(BR_PATH)

So, no quoting...

However, wireshark got it wrong:

    package/wireshark/wireshark.mk:24:      PATH="$(@D)/bin:$(BR_PATH)"

Regards,
Yann E. MORIN.

> > > >     +
> > > >      LIBMODSECURITY_CONF_OPTS = \
> > > >         --with-pcre="$(STAGING_DIR)/usr/bin/pcre-config" \
> > > >         --disable-examples \
> >
> > Regards,
> > Yann E. MORIN.
> >
> > --
> > .-----------------.--------------------.------------------.--------------------.
> > |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> > | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> > | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> > | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> > '------------------------------^-------^------------------^--------------------'
> Best Regards,
> 
> Fabrice

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
