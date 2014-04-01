From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 2 Apr 2014 00:47:40 +0200
Subject: [Buildroot] [PATCH 1/2] package/xbmc-pvr-addons: new package
In-Reply-To: <CAGduivzH4ZF=HPHE3Py84Jwy9fBQLk_XXRccnCB65oxOd8k8hQ@mail.gmail.com>
References: <cover.1395964863.git.yann.morin.1998@free.fr>
 <0d760bbfa34458d432b96c0813654692780fc10e.1395964863.git.yann.morin.1998@free.fr>
 <CAGduivzH4ZF=HPHE3Py84Jwy9fBQLk_XXRccnCB65oxOd8k8hQ@mail.gmail.com>
Message-ID: <20140401224740.GC9670@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Maxime, All,

On 2014-04-02 00:35 +0200, Maxime Hadjinlian spake thusly:
NIP--]
> > diff --git a/package/xbmc-pvr-addons/xbmc-pvr-addons.mk b/package/xbmc-pvr-addons/xbmc-pvr-addons.mk
> > new file mode 100644
> > index 0000000..d19c3c8
> > --- /dev/null
> > +++ b/package/xbmc-pvr-addons/xbmc-pvr-addons.mk
> > @@ -0,0 +1,34 @@
> > +################################################################################
> > +#
> > +# xbmc-pvr-addons
> > +#
> > +################################################################################
> > +
> > +# This cset is on the branch 'frodo'
> Little typo here.

As said on IRC: brain-fart on your side... ;-)

> > +# When XBMC is updated, then this should be updated to the corresponding branch
> > +XBMC_PVR_ADDONS_VERSION = 319351af7f3b546a5a56cdf6492f6ba1aec1cd2f
> > +XBMC_PVR_ADDONS_SITE = $(call github,opdenkamp,xbmc-pvr-addons,$(XBMC_PVR_ADDONS_VERSION))
> > +XBMC_PVR_ADDONS_LICENSE = GPLv3+
> > +XBMC_PVR_ADDONS_LICENSE_FILES = COPYING
> > +
> > +# There's no ./configure in the git tree, we need to generate it
> > +XBMC_PVR_ADDONS_AUTORECONF = YES
> > +
> > +XBMC_PVR_ADDONS_DEPENDENCIES = boost xbmc zlib
> > +# This really is a runtime dependency, but we need XBMC to be isntalled
> Small typo again.

OK.

> > +# first, since we'll install files in XBMC's directories _after_ XBMC has
> > +# installed his own files
> > +XBMC_PVR_ADDONS_DEPENDENCIES += xbmc
> So xbmc is added twice to the dependencies ?

Doh... I forgot to remove it in the first dependency line.

> > +
> > +XBMC_PVR_ADDONS_CONF_OPT = \
> > +       --enable-release \
> > +       --enable-addons-with-dependencies
> > +
> > +ifeq ($(BR2_PACKAGE_MYSQL),y)
> > +XBMC_PVR_ADDONS_CONF_OPT += --enable-mysql
> > +XBMC_PVR_ADDONS_DEPENDENCIES += mysql
> > +else
> > +XBMC_PVR_ADDONS_CONF_OPT += --disable-mysql
> > +endif
> > +
> > +$(eval $(autotools-package))
> > diff --git a/package/xbmc/Config.in b/package/xbmc/Config.in
> > index e078d2f..eb6ef55 100644
> > --- a/package/xbmc/Config.in
> > +++ b/package/xbmc/Config.in
> > @@ -158,4 +158,8 @@ config BR2_PACKAGE_XBMC_WAVPACK
> >           Enable WAV input support.
> >           Select this if you want to play back WV files.
> >
> > -endif
> > +comment "XBMC addons"
> > +
> > +source "package/xbmc-pvr-addons/Config.in"
> > +
> > +endif # BR2_PACKAGE_XBMC
> > --
> > 1.8.3.2
> >
> I haven't yet tried to build this, but I'll be sure to do it and report here.

Thanks, will fix the stuff.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
