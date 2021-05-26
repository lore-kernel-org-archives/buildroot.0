From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 26 May 2021 16:28:46 +0200
Subject: [Buildroot] [PATCHv3 04/15] package/flare-engine: update
 explicit setting of CMAKE_BUILD_TYPE
In-Reply-To: <e58f9d8c-21bc-5450-47a6-f6e4b959691b@mind.be>
References: <20210525122750.5022-1-patrickdepinguin@gmail.com>
 <20210525122750.5022-5-patrickdepinguin@gmail.com>
 <e58f9d8c-21bc-5450-47a6-f6e4b959691b@mind.be>
Message-ID: <CAAXf6LWH8ryc64FFt9zoCtnjqxqENMv=FhcGopYsi3HP_cU0Rw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

El mar, 25 may 2021 a las 22:51, Arnout Vandecappelle
(<arnout@mind.be>) escribi?:
>
>
>
> On 25/05/2021 14:27, Thomas De Schampheleire wrote:
> > From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> >
> > The flare-engine package forces CMAKE_BUILD_TYPE=RelWithDebInfo in case
> > Buildroot would normally set CMAKE_BUILD_TYPE=Debug. Previously, this would
> > happen if BR2_ENABLE_DEBUG is set, but now we should check
> > BR2_ENABLE_RUNTIME_DEBUG instead.
> >
> > Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> > ---
> >  package/flare-engine/flare-engine.mk | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/package/flare-engine/flare-engine.mk b/package/flare-engine/flare-engine.mk
> > index e2f3eefa28..503eb0825f 100644
> > --- a/package/flare-engine/flare-engine.mk
> > +++ b/package/flare-engine/flare-engine.mk
> > @@ -15,7 +15,7 @@ FLARE_ENGINE_DEPENDENCIES += sdl2 sdl2_image sdl2_mixer sdl2_ttf
> >  FLARE_ENGINE_CONF_OPTS += -DBINDIR=bin -DDATADIR=share/flare
> >
> >  # Don't use the default Debug type as it adds -pg (gprof)
>
>  Debug type is no longer default :-)
>
> > -ifeq ($(BR2_ENABLE_DEBUG),y)
> > +ifeq ($(BR2_ENABLE_RUNTIME_DEBUG),y)
> >  FLARE_ENGINE_CONF_OPTS += -DCMAKE_BUILD_TYPE=RelWithDebInfo
>
>  Since CMAKE_BUILD_TYPE is only used by flare-engine to set -O2 -g flags, maybe
> it would be better/cleaner to just unconditionally set build type to Release?
>

I was checking the situation with BR2_ENABLE_DEBUG=y and see that the
flags of Buildroot do not survive. E.g. compilation commands are:

... -Os -g2 -D_FORTIFY_SOURCE=1 -O2 -g0 ...

The '-O2 -g0' are from the 'Release' build type, set by flare-engine
itself, and '-Os -g2' is what Buildroot sets.

So it means that in the current state of things, this patch would
actually remove debugging symbols when requested, and so would using
'Release' unconditionally.
The pkg-cmake.mk intends to pass its flags to each cmake package and
they should survive. In flare-engine this principle is violated.
So unless there is a better way to fix that, we may actually need to
keep the existing check on BR2_ENABLE_DEBUG and set RelWithDebInfo in
that case.

/Thomas
