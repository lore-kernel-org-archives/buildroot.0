From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 19 Nov 2015 22:09:37 +0100
Subject: [Buildroot] [PATCH v1] sdl: overwrite libpth autodetection
In-Reply-To: <20151119210559.GR2203@tarshish>
References: <1447966425-3951-1-git-send-email-ps.report@gmx.net>
 <20151119210559.GR2203@tarshish>
Message-ID: <20151119220937.7d378b47@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Baruch,

On Thu, 19 Nov 2015 23:05:59 +0200, Baruch Siach <baruch@tkos.co.il> wrote:

> Hi Peter,
> 
> On Thu, Nov 19, 2015 at 09:53:45PM +0100, Peter Seiderer wrote:
> > The sdl libpth autodetection gets confused in case a host
> > version is detected. Overwrite libpth autodection for the
> > target  build dependent on BR2_PACKAGE_LIBPTHSEM.
> > 
> > Fixes [1]:
> > 
> > checking for pthreads... no
> > checking for pth-config... /usr/bin/pth-config
> > checking pth... yes
> > [...]
> > ./src/SDL.c:33:17: fatal error: pth.h: No such file or directory
> >  #include <pth.h>
> > 
> > [1] http://autobuild.buildroot.net/results/733/73330e51b3c099d179004db0b9522ac13358b8f7
> > 
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> > ---
> >  package/sdl/sdl.mk | 7 +++++++
> >  1 file changed, 7 insertions(+)
> > 
> > diff --git a/package/sdl/sdl.mk b/package/sdl/sdl.mk
> > index 78eb4dd..3e3496c 100644
> > --- a/package/sdl/sdl.mk
> > +++ b/package/sdl/sdl.mk
> > @@ -58,6 +58,13 @@ ifneq ($(BR2_USE_MMU),y)
> >  SDL_CONF_OPTS += --enable-dga=no
> >  endif
> >  
> > +# overwrite autodection (prevents confusion with host libpth version)
> > +ifeq ($(BR2_PACKAGE_LIBPTHSEM),y)
> 
> Should probably also add 'SDL_DEPENDENCIES += libpthsem'. 

Ups..., yes your are right..., will send a v2 patch version...

Thanks for review...

Regards,
Peter

> 
> > +SDL_CONF_OPTS +=  --enable-pth
> > +else
> > +SDL_CONF_OPTS +=  --disable-pth
> > +endif
> > +
> >  ifeq ($(BR2_PACKAGE_TSLIB),y)
> >  SDL_DEPENDENCIES += tslib
> >  endif
> 
> baruch
> 
