From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 18 Jul 2021 10:08:47 +0200
Subject: [Buildroot] [PATCH 1/1] package/libmodsecurity: fix build with
 libmaxminddb
In-Reply-To: <CAPi7W81riHMDFyu22nud+QCgjCgGY6ZAtKzSs+d1PGhPZsk+fQ@mail.gmail.com>
References: <20210716172016.207663-1-fontaine.fabrice@gmail.com>
 <20210717091140.GI12203@scaer>
 <CAPi7W80_mm5p24UOGj9mhZYYU7eHtadzsVGrrBVScCWoehTAeQ@mail.gmail.com>
 <20210717203343.GX12203@scaer>
 <CAPi7W81riHMDFyu22nud+QCgjCgGY6ZAtKzSs+d1PGhPZsk+fQ@mail.gmail.com>
Message-ID: <20210718080847.GC12203@scaer>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Fabrice, All,

On 2021-07-18 09:55 +0200, Fabrice Fontaine spake thusly:
> Le sam. 17 juil. 2021 ? 22:33, Yann E. MORIN <yann.morin.1998@free.fr> a ?crit :
> > On 2021-07-17 21:33 +0200, Fabrice Fontaine spake thusly:
> > > Le sam. 17 juil. 2021 ? 11:11, Yann E. MORIN <yann.morin.1998@free.fr> a ?crit :
> > > > On 2021-07-16 19:20 +0200, Fabrice Fontaine spake thusly:
> > > > > Build with libmaxminddb is broken since bump to version 3.0.5 in commit
> > > > > 464d0be380c84ac7c3f1684e49153c3868280d7e because of
> > > > > https://github.com/SpiderLabs/ModSecurity/commit/785958f9b5089b918c7d054cbcc2fe4a3c7b3788
> > > > >
> > > > > So revert this commit until upstream answer to comment to
> > > > > https://github.com/SpiderLabs/ModSecurity/issues/2131
> > > > >
> > > > > Fixes:
> > > > >  - http://autobuild.buildroot.org/results/4c639fd967faa06f8ae362bacd38f3409c47267c
> > > > >
> > > > > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > > > I was about to just push this, but the autoreconf spews out a lot of
> > > > warning for out-of-tree builds:
[--SNIP--]
> > Still, this is very unclean to have those warnings... :-(
> Agreed, but then what would be the best option?
>  - Remove autoreconf and patch directly the configure file?
>  - Set LIBMODSECURITY_GIT_SUBMODULE to YES and retrieve the full

Well, with the little patch I proposed below, this provides a fake 'git'
that just prints the libmodsecurity version string, which should be just
enough to pass the autoreconf step, no?

> >     diff --git a/package/libmodsecurity/libmodsecurity.mk b/package/libmodsecurity/libmodsecurity.mk
> >     index b2637257b6..10338dad7c 100644
> >     --- a/package/libmodsecurity/libmodsecurity.mk
> >     +++ b/package/libmodsecurity/libmodsecurity.mk
> >     @@ -14,6 +14,24 @@ LIBMODSECURITY_CPE_ID_VENDOR = trustwave
> >      LIBMODSECURITY_CPE_ID_PRODUCT = modsecurity
> >
> >      LIBMODSECURITY_DEPENDENCIES = pcre
> >     +
> >     +# configure.ac will call git to get various version strings, from
> >     +# libmodsecurity itself, but also from bundled dependencies, just
> >     +# for the sake of siplaying them at the end of configure.
> >     +# Fake a git that returns the version for libmodescurity, to quiesce
> >     +# warnings...
> >     +define LIBMODSECURITY_FAKE_GIT
> >     +   $(Q)mkdir -p $(@D)/.buildroot
> >     +   $(Q)printf '#!/usr/bin/env sh\necho "$(LIBMODSECURITY_VERSION)"\n' \
> >     +           >$(@D)/.buildroot/git
> >     +   @(Q)chmod 755 $(@D)/.buildroot/git
> >     +endef
> >     +LIBMODSECURITY_POST_EXTRACT_HOOKS += LIBMODSECURITY_FAKE_GIT
> >     +
> >     +# 0001-Revert-Fix-maxminddb-link-on-FreeBSD.patch
> >     +LIBMODSECURITY_AUTORECONF = YES
> >     +LIBMODSECURITY_AUTORECONF_ENV = PATH="$(@D)/.buildroot:$(BR_PATH)"
> >     +
> >      LIBMODSECURITY_CONF_OPTS = \
> >         --with-pcre="$(STAGING_DIR)/usr/bin/pcre-config" \
> >         --disable-examples \

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
