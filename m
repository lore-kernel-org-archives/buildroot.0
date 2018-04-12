From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 12 Apr 2018 20:45:11 +0200
Subject: [Buildroot] [PATCH v2 5/6] zstd: add libzstd support
In-Reply-To: <20180411212420.GG2328@scaer>
References: <20180409200429.22650-1-ps.report@gmx.net>
 <20180409200429.22650-5-ps.report@gmx.net>
 <20180411212420.GG2328@scaer>
Message-ID: <20180412204511.48fd9fcc@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yann,

On Wed, 11 Apr 2018 23:24:20 +0200, "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Peter, All,
> 
> I think the commit title should rather be something like:
> 
>     zstd: build and install the library

Mhh, a matter of taste ;-)

> 
> Have you tried building it in:
>   - a shared-only library configuration (the default for Buildroot),
>   - a static-only configuration,
>   - a dual shared+static configuration?

Not yet....

> 
> And of course, checked that the corresponding libs are installed?

Good point, looking at the zstd-v1.3.3/lib/Makefile there are
separate build targets for the shared/static libs but the
install target builds/installs both...

Will fix it on the next patch iteration...

Regards,
Peter

> 
> Regards,
> Yann E. MORIN.
> 
> On 2018-04-09 22:04 +0200, Peter Seiderer spake thusly:
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> > ---
> > Changes v1 -> v2:
> >   - split off target libzstd support (suggested by Yann E. MORIN)
> > ---
> >  package/zstd/zstd.mk | 10 +++++++++-
> >  1 file changed, 9 insertions(+), 1 deletion(-)
> > 
> > diff --git a/package/zstd/zstd.mk b/package/zstd/zstd.mk
> > index 1b76b0164c..cccec3a313 100644
> > --- a/package/zstd/zstd.mk
> > +++ b/package/zstd/zstd.mk
> > @@ -6,6 +6,7 @@
> >  
> >  ZSTD_VERSION = v1.3.3
> >  ZSTD_SITE = $(call github,facebook,zstd,$(ZSTD_VERSION))
> > +ZSTD_INSTALL_STAGING = YES
> >  ZSTD_LICENSE = BSD-3-Clause or GPL-2.0
> >  ZSTD_LICENSE_FILES = LICENSE COPYING
> >  
> > @@ -38,10 +39,17 @@ endif
> >  
> >  define ZSTD_BUILD_CMDS
> >  	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(ZSTD_OPTS) \
> > -		-C $(@D) zstd
> > +		-C $(@D) lib zstd
> > +endef
> > +
> > +define ZSTD_INSTALL_STAGING_CMDS
> > +	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(ZSTD_OPTS) \
> > +		DESTDIR=$(STAGING_DIR) PREFIX=/usr -C $(@D)/lib install
> >  endef
> >  
> >  define ZSTD_INSTALL_TARGET_CMDS
> > +	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(ZSTD_OPTS) \
> > +		DESTDIR=$(TARGET_DIR) PREFIX=/usr -C $(@D)/lib install
> >  	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(ZSTD_OPTS) \
> >  		DESTDIR=$(TARGET_DIR) PREFIX=/usr -C $(@D)/programs install
> >  endef
> > -- 
> > 2.16.3
> >   
> 
