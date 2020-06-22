From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 22 Jun 2020 22:36:26 +0200
Subject: [Buildroot] [PATCH v2] package/irrlicht: fix libraries linking
In-Reply-To: <46d65bc1-310b-c21a-22e7-11df0ef164b7@grinn-global.com>
References: <20200622184515.312030-1-b.bilas@grinn-global.com>
 <20200622212642.1be946f3@windsurf.home>
 <46d65bc1-310b-c21a-22e7-11df0ef164b7@grinn-global.com>
Message-ID: <20200622223626.78bc07e1@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 22 Jun 2020 22:23:35 +0200
Bartosz Bilas <b.bilas@grinn-global.com> wrote:

> >> +-sharedlib: LDFLAGS += -L/usr/X11R6/lib$(LIBSELECT) -lGL -lXxf86vm
> >> ++sharedlib: override LDFLAGS += -L/usr/X11R6/lib$(LIBSELECT) -lGL -lXxf86vm  
> > Why here are you changing the LDFLAGS to override LDFLAGS.
> >
> >  
> >> +diff --git a/source/Irrlicht/Makefile b/source/Irrlicht/Makefile
> >> +index fed6c7e..b323237 100644
> >> +--- a/source/Irrlicht/Makefile
> >> ++++ b/source/Irrlicht/Makefile
> >> +@@ -88,8 +88,7 @@ STATIC_LIB = libIrrlicht.a
> >> + LIB_PATH = ../../lib/$(SYSTEM)
> >> + INSTALL_DIR = /usr/local/lib
> >> + sharedlib install: SHARED_LIB = libIrrlicht.so
> >> +-sharedlib: override LDFLAGS += -L/usr/X11R6/lib$(LIBSELECT) -lGL -lXxf86vm
> >> +-staticlib sharedlib: CXXINCS += -I/usr/X11R6/include
> >> ++sharedlib: override LDFLAGS += -lGL -lXxf86vm  
> > And here you drop entirely the -L argument ?  
> Due to the fact that it points to the host system libraries. This -L 
> argument is set correctly within package makefile.

Yes, of course. My question is why do you have two patches? They touch
exactly the same line, simply do the change in two steps instead of
one. Am I missing something here ?


> >> +# set correct path for libraries linking
> >> +IRRLICHT_CONF_OPTS += LDFLAGS="$(TARGET_LDFLAGS) -L$(STAGING_DIR)/usr/lib"  
> > This should not be necessary, STAGING_DIR/usr/lib is already the
> > default search path for libraries in the Buildroot cross-compiler.
> > Could you test without this ?  
> It seems to work quite well without this line.

Yes, as I said, -L$(STAGING_DIR)/usr/lib is useless.

> >  
> >>   # Irrlicht fail to detect properly the NEON support on aarch64 or ARM with NEON FPU support.
> >>   # While linking an application with libIrrlicht.so, we get an undefined reference to
> >>   # png_init_filter_functions_neon.
> >>   # Some files are missing in the libpng bundled in Irrlicht, in particular arm/arm_init.c,
> >>   # so disable NEON support completely.
> >> -IRRLICHT_CONF_OPTS += CPPFLAGS="$(TARGET_CPPFLAGS) -DPNG_ARM_NEON_OPT=0"
> >> +IRRLICHT_CONF_OPTS += CPPFLAGS="$(TARGET_CPPFLAGS) -DPNG_ARM_NEON_OPT=0 -I$(STAGING_DIR)/usr/include/X11"  
> > It is a bit weird to have this below the NEON related comment.
> >
> > Can we change that to:
> >
> > IRRLICHT_CPPFLAGS = $(TARGET_CPPFLAGS)
> >
> > # blabla about NEON
> > IRRLICHT_CPPFLAGS += -DPNG_ARM_NEON_OPT=0
> >
> > # blabla about X11 includes
> > IRRLICHT_CPPFLAGS += -I$(STAGING_DIR)/usr/include
> >
> > IRRLICHT_CONF_OPTS += CPPFLAGS="$(IRRLICHT_CPPFLAGS)"  
> Good hint, I was thinking about a bit different approach but it wasn't 
> working as I expected therefore I did it as it's above.

So I guess you'll rework accordingly? If needed, you can also have a
preparation patch that reworks this IRRLICHT_CPPFLAGS thing for the
NEON stuff, and then another patch that fixes the library linking issue.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
