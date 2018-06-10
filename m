From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 10 Jun 2018 20:25:44 +0300
Subject: [Buildroot] [PATCH] libusb: add an option to compile examples
In-Reply-To: <20180610163620.k7mtdvg3bin7crad@archlinux>
References: <20180610140316.7125-1-gael.portay@savoirfairelinux.com>
 <20180610143529.xpleqn3dg5gmufpd@sapphire.tkos.co.il>
 <20180610163620.k7mtdvg3bin7crad@archlinux>
Message-ID: <20180610172544.zcw4dsa4ngzgpsv2@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Ga?l,

On Sun, Jun 10, 2018 at 12:36:20PM -0400, Ga?l PORTAY wrote:
> On Sun, Jun 10, 2018 at 05:35:29PM +0300, Baruch Siach wrote:
> > > diff --git a/package/libusb/libusb.mk b/package/libusb/libusb.mk
> > > index aee3622f8d..89ec91bb42 100644
> > > --- a/package/libusb/libusb.mk
> > > +++ b/package/libusb/libusb.mk
> > > @@ -25,5 +25,16 @@ else
> > >  LIBUSB_CONF_OPTS += --disable-udev
> > >  endif
> > >  
> > > +ifeq ($(BR2_PACKAGE_LIBUSB_EXAMPLES),y)
> > > +LIBUSB_CONF_OPTS += --enable-examples-build
> > > +define LIBUSB_INSTALL_TARGET_EXAMPLES
> > > +	for example in listdevs xusb fxload hotplugtest testlibusb dpfp dpfp_threaded sam3u_benchmark ; do \
> > > +		[ -x $(@D)/examples/$${example} ] || continue; \
> > 
> > Why is this file presence check needed?
> 
> Because, some of the examples are compiled under HAVE_xxx condition.
> 
> See the extract of examples/Makefile.am below.
> 
> 	noinst_PROGRAMS = listdevs xusb fxload hotplugtest testlibusb
> 	
> 	if HAVE_SIGACTION
> 	noinst_PROGRAMS += dpfp
> 	
> 	if THREADS_POSIX
> 	dpfp_threaded_CFLAGS = $(AM_CFLAGS)
> 	noinst_PROGRAMS += dpfp_threaded
> 	endif
> 	
> 	sam3u_benchmark_SOURCES = sam3u_benchmark.c
> 	noinst_PROGRAMS += sam3u_benchmark
> 	endif

All Buildroot libcs support sigaction. Also, libusb depends on threads 
support, so THREADS_POSIX is always true in Buildroot.

So I think this check is not needed.

baruch

> > > +		cp -dpfr $(@D)/examples/$${example} $(TARGET_DIR)/usr/bin; \
> > > +	done
> > > +endef
> > > +LIBUSB_POST_INSTALL_TARGET_HOOKS += LIBUSB_INSTALL_TARGET_EXAMPLES
> > > +endif
> > > +
> > >  $(eval $(autotools-package))
> > >  $(eval $(host-autotools-package))

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
