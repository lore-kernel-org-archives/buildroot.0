From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 18 Jul 2021 09:55:15 +0200
Subject: [Buildroot] [PATCH 1/1] package/libmodsecurity: fix build with
 libmaxminddb
In-Reply-To: <20210717203343.GX12203@scaer>
References: <20210716172016.207663-1-fontaine.fabrice@gmail.com>
 <20210717091140.GI12203@scaer>
 <CAPi7W80_mm5p24UOGj9mhZYYU7eHtadzsVGrrBVScCWoehTAeQ@mail.gmail.com>
 <20210717203343.GX12203@scaer>
Message-ID: <CAPi7W81riHMDFyu22nud+QCgjCgGY6ZAtKzSs+d1PGhPZsk+fQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Yann,

Le sam. 17 juil. 2021 ? 22:33, Yann E. MORIN <yann.morin.1998@free.fr> a ?crit :
>
> Fabrice, All,
>
> On 2021-07-17 21:33 +0200, Fabrice Fontaine spake thusly:
> > Le sam. 17 juil. 2021 ? 11:11, Yann E. MORIN <yann.morin.1998@free.fr> a ?crit :
> > > On 2021-07-16 19:20 +0200, Fabrice Fontaine spake thusly:
> > > > Build with libmaxminddb is broken since bump to version 3.0.5 in commit
> > > > 464d0be380c84ac7c3f1684e49153c3868280d7e because of
> > > > https://github.com/SpiderLabs/ModSecurity/commit/785958f9b5089b918c7d054cbcc2fe4a3c7b3788
> > > >
> > > > So revert this commit until upstream answer to comment to
> > > > https://github.com/SpiderLabs/ModSecurity/issues/2131
> > > >
> > > > Fixes:
> > > >  - http://autobuild.buildroot.org/results/4c639fd967faa06f8ae362bacd38f3409c47267c
> > > >
> > > > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > > I was about to just push this, but the autoreconf spews out a lot of
> > > warning for out-of-tree builds:
> > >     >>> libmodsecurity 3.0.5 Autoreconfiguring
> > >     fatal: not a git repository (or any of the parent directories): .git
> [--SNIP--]
> > I wasn't able to reproduce this issue with in-tree build:
>
> Not surprising, because it then uses the git tree of Buildroot. And that
> issue would also happen with a release tarball of Buildroot, as there is
> no git tree there either...
>
> [--SNIP--]
> > I assume that those warnings because "git log" is used in configure.ac
> > to retrieve MSC_GIT_HASH  and SECLANG_TEST_VERSION
>
>   - MSC_GIT_HASH is used nowhere
>
>   - LIBINJECTION_VERSION is onle used to report the version at the end
>     of configure
>
>   - SECLANG_TEST_VERSION ditto
>
>   - msc_version_git is used once, to set MSC_GIT_VERSION
>
>   - MSC_GIT_VERSION is AC_SUBSTituted, but is only ever used to report
>     the version at the end of configure.
>
> > but this should
> > have no effect on libmodsecurity behavior.
>
> Still, this is very unclean to have those warnings... :-(
Agreed, but then what would be the best option?
 - Remove autoreconf and patch directly the configure file?
 - Set LIBMODSECURITY_GIT_SUBMODULE to YES and retrieve the full
libmodsecurity git tree?
>
>     diff --git a/package/libmodsecurity/libmodsecurity.mk b/package/libmodsecurity/libmodsecurity.mk
>     index b2637257b6..10338dad7c 100644
>     --- a/package/libmodsecurity/libmodsecurity.mk
>     +++ b/package/libmodsecurity/libmodsecurity.mk
>     @@ -14,6 +14,24 @@ LIBMODSECURITY_CPE_ID_VENDOR = trustwave
>      LIBMODSECURITY_CPE_ID_PRODUCT = modsecurity
>
>      LIBMODSECURITY_DEPENDENCIES = pcre
>     +
>     +# configure.ac will call git to get various version strings, from
>     +# libmodsecurity itself, but also from bundled dependencies, just
>     +# for the sake of siplaying them at the end of configure.
>     +# Fake a git that returns the version for libmodescurity, to quiesce
>     +# warnings...
>     +define LIBMODSECURITY_FAKE_GIT
>     +   $(Q)mkdir -p $(@D)/.buildroot
>     +   $(Q)printf '#!/usr/bin/env sh\necho "$(LIBMODSECURITY_VERSION)"\n' \
>     +           >$(@D)/.buildroot/git
>     +   @(Q)chmod 755 $(@D)/.buildroot/git
>     +endef
>     +LIBMODSECURITY_POST_EXTRACT_HOOKS += LIBMODSECURITY_FAKE_GIT
>     +
>     +# 0001-Revert-Fix-maxminddb-link-on-FreeBSD.patch
>     +LIBMODSECURITY_AUTORECONF = YES
>     +LIBMODSECURITY_AUTORECONF_ENV = PATH="$(@D)/.buildroot:$(BR_PATH)"
>     +
>      LIBMODSECURITY_CONF_OPTS = \
>         --with-pcre="$(STAGING_DIR)/usr/bin/pcre-config" \
>         --disable-examples \
>
> Regards,
> Yann E. MORIN.
>
> > > Regards,
> > > Yann E. MORIN.
> > >
> > > > ---
> > > >  ...Revert-Fix-maxminddb-link-on-FreeBSD.patch | 28 +++++++++++++++++++
> > > >  package/libmodsecurity/libmodsecurity.mk      |  2 ++
> > > >  2 files changed, 30 insertions(+)
> > > >  create mode 100644 package/libmodsecurity/0001-Revert-Fix-maxminddb-link-on-FreeBSD.patch
> > > >
> > > > diff --git a/package/libmodsecurity/0001-Revert-Fix-maxminddb-link-on-FreeBSD.patch b/package/libmodsecurity/0001-Revert-Fix-maxminddb-link-on-FreeBSD.patch
> > > > new file mode 100644
> > > > index 0000000000..9608e3d935
> > > > --- /dev/null
> > > > +++ b/package/libmodsecurity/0001-Revert-Fix-maxminddb-link-on-FreeBSD.patch
> > > > @@ -0,0 +1,28 @@
> > > > +From 6737dc133cb4811a000c02b4e0a92b72f0b220ee Mon Sep 17 00:00:00 2001
> > > > +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > > > +Date: Fri, 16 Jul 2021 19:12:51 +0200
> > > > +Subject: [PATCH] Revert "Fix maxminddb link on FreeBSD"
> > > > +
> > > > +This reverts commit 785958f9b5089b918c7d054cbcc2fe4a3c7b3788.
> > > > +
> > > > +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > > > +---
> > > > + build/libmaxmind.m4 | 2 +-
> > > > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > > > +
> > > > +diff --git a/build/libmaxmind.m4 b/build/libmaxmind.m4
> > > > +index 656fc250..02820b5a 100644
> > > > +--- a/build/libmaxmind.m4
> > > > ++++ b/build/libmaxmind.m4
> > > > +@@ -10,7 +10,7 @@ dnl  MAXMIND_VERSION
> > > > + AC_DEFUN([PROG_MAXMIND], [
> > > > +
> > > > + # Possible names for the maxmind library/package (pkg-config)
> > > > +-MAXMIND_POSSIBLE_LIB_NAMES="maxminddb maxmind"
> > > > ++MAXMIND_POSSIBLE_LIB_NAMES="libmaxminddb maxminddb maxmind"
> > > > +
> > > > + # Possible extensions for the library
> > > > + MAXMIND_POSSIBLE_EXTENSIONS="so la sl dll dylib"
> > > > +--
> > > > +2.30.2
> > > > +
> > > > diff --git a/package/libmodsecurity/libmodsecurity.mk b/package/libmodsecurity/libmodsecurity.mk
> > > > index b2637257b6..66e7e522a1 100644
> > > > --- a/package/libmodsecurity/libmodsecurity.mk
> > > > +++ b/package/libmodsecurity/libmodsecurity.mk
> > > > @@ -12,6 +12,8 @@ LIBMODSECURITY_LICENSE = Apache-2.0
> > > >  LIBMODSECURITY_LICENSE_FILES = LICENSE
> > > >  LIBMODSECURITY_CPE_ID_VENDOR = trustwave
> > > >  LIBMODSECURITY_CPE_ID_PRODUCT = modsecurity
> > > > +# We're patching build/libmaxmind.m4
> > > > +LIBMODSECURITY_AUTORECONF = YES
> > > >
> > > >  LIBMODSECURITY_DEPENDENCIES = pcre
> > > >  LIBMODSECURITY_CONF_OPTS = \
> > > > --
> > > > 2.30.2
> > > >
> > > > _______________________________________________
> > > > buildroot mailing list
> > > > buildroot at busybox.net
> > > > http://lists.busybox.net/mailman/listinfo/buildroot
> > >
> > > --
> > > .-----------------.--------------------.------------------.--------------------.
> > > |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> > > | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> > > | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> > > | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> > > '------------------------------^-------^------------------^--------------------'
> > Best Regards,
> >
> > Fabrice
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
Best Regards,

Fabrice
