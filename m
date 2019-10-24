From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 23 Oct 2019 19:02:41 -0500
Subject: [Buildroot] [PATCH] package/jitterentropy-library: fix build
 failure due to missing -fPIC
In-Reply-To: <831e0090-8e52-9c2c-6d06-4557d21fde79@mind.be>
References: <20191023110605.23836-1-giulio.benetti@benettiengineering.com>
 <831e0090-8e52-9c2c-6d06-4557d21fde79@mind.be>
Message-ID: <CANQCQpaHGRY_tyTVCEtEdVqGqjHPOcXW9P3hB6VcroTrFgsv=g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Oct 23, 2019 at 4:56 PM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
>
> On 23/10/2019 13:06, Giulio Benetti wrote:
> > jitterentropy-library needs -fPIC flag to build so add it when building.
> >
> > Fixes:
> > http://autobuild.buildroot.net/results/505/5059207ec9ab0b502717626cc84956dafd0c3c32/
> >
> > Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> > ---
> >  package/jitterentropy-library/jitterentropy-library.mk | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/package/jitterentropy-library/jitterentropy-library.mk b/package/jitterentropy-library/jitterentropy-library.mk
> > index 4e791e19dd..b8db1ccb80 100644
> > --- a/package/jitterentropy-library/jitterentropy-library.mk
> > +++ b/package/jitterentropy-library/jitterentropy-library.mk
> > @@ -10,8 +10,11 @@ JITTERENTROPY_LIBRARY_LICENSE = GPL-2.0 or BSD-3-Clause
> >  JITTERENTROPY_LIBRARY_LICENSE_FILES = COPYING COPYING.bsd COPYING.gplv2
> >  JITTERENTROPY_LIBRARY_INSTALL_STAGING = YES
> >
> > +JITTERENTROPY_LIBRARY_CFLAGS = $(TARGET_CFLAGS)
> > +JITTERENTROPY_LIBRARY_CFLAGS += -fPIC
>
>  This is not good. Options like fPIC should be added by the package build system
> itself.

Upstream was really receptive to other changes.  Giulio, do you want
to submit it?  If not I can.

>
> > +
> >  define JITTERENTROPY_LIBRARY_BUILD_CMDS
> > -     $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS)
> > +     $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) CFLAGS="$(JITTERENTROPY_LIBRARY_CFLAGS)"
>
>  And here we see the actual issue: TARGET_CONFIGURE_OPTS should be passed in the
> environment instead of as arguments, so the Makefile can add its stuff to it.
>
>  Hm, but maybe there are indeed good reasons to override the CFLAGS, because the
> fstack-protector-all requires support from the toolchain. On the other hand, we
> probably *do* want to keep the -O0 and -fwrapv flags...
>
>  Also, I notice now that it always builds both a static and a shared library,
> even on BR2_STATIC_LIBS. That will probably trigger a different build failure...
>

I'll take a look at some other packages to see how we didi this.
Right not upstream isn't setup to break the two apart.

Regards,
Matt
