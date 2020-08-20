From: Julien Viard de Galbert <julien@vdg.name>
Date: Thu, 20 Aug 2020 08:21:18 +0200
Subject: [Buildroot] [PATCH 1/1] package/dieharder: fix build with gcc 10
In-Reply-To: <20200819213442.GW24264@scaer>
References: <20200819163418.2012787-1-fontaine.fabrice@gmail.com>
 <20200819213442.GW24264@scaer>
Message-ID: <20200820062118.GA32195@vdg.name>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Aug 19, 2020 at 11:34:42PM +0200, Yann E. MORIN wrote:
> Fabrice, All,

Yann, Fabrice, All,
> 
> On 2020-08-19 18:34 +0200, Fabrice Fontaine spake thusly:
> > Disable -fno-common with dieharder, there is more than 100 variables to
> > fix and upstream seems dead.
> > 
> > Fixes:
> >  - http://autobuild.buildroot.org/results/ba70d111cd1f2029a193a88af3b44daf6ef27786
> > 
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> 
> Initially, I was not very happy that we just papered over the problem,
> but this is too daunting to fix, and indeed upstream is not very well
> alive it seems: last release in 2011, no public VCS... It's a bit
> shamefull that we have a security-related package that is so old an
> unmaintained... :-(

As I introduced the package a few years ago, I was wondering if we had a
way to measure the usage of this package and think about removing it.
Then I checked with the guardians of the temple aka debian and found
that the maintainer probably fixed the gcc 10 issue:

| dieharder (3.31.1.2-1) unstable; urgency=medium
|
|   * New upstream minor release accomodating gcc-10 and its treatment of
|     multiple definitions of global variables		(Closes: #957134)
|
|   * Based on new 'upstream' git repo at github.com/eddelbuettel/dieharder
|     which spawned off the salsa.debian.org repo for this package
|
|  -- Dirk Eddelbuettel <edd@debian.org>  Sat, 25 Jul 2020 12:36:49 -0500

This would not be the first time that debian extended the life of
unmaintained upstream.

What do you think ?

Regards,

Julien VdG

> 
> Applied to master, thanks.
> 
> Regards,
> Yann E. MORIN.
> 
> > ---
> >  package/dieharder/dieharder.mk | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/package/dieharder/dieharder.mk b/package/dieharder/dieharder.mk
> > index c3eee64553..cbf28922fd 100644
> > --- a/package/dieharder/dieharder.mk
> > +++ b/package/dieharder/dieharder.mk
> > @@ -36,4 +36,9 @@ endif
> >  # parallel build fail, disable it
> >  DIEHARDER_MAKE = $(MAKE1)
> >  
> > +# Too many fixes needed to build with -fno-common which is default since gcc 10
> > +ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_10),y)
> > +DIEHARDER_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -fcommon"
> > +endif
> > +
> >  $(eval $(autotools-package))
> > -- 
> > 2.27.0
> > 
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
