From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 28 Jan 2020 10:20:57 +0100
Subject: [Buildroot] [PATCH 1/1] package/nodejs: use system-icu for
 host-nodejs when available
In-Reply-To: <20200126162659.GR32369@scaer>
References: <20200126075848.66484-1-james.hilliard1@gmail.com>
 <20200126162659.GR32369@scaer>
Message-ID: <20200128102057.6c5cda1f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 26 Jan 2020 17:26:59 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> James, All,
> 
> On 2020-01-26 00:58 -0700, James Hilliard spake thusly:
> > Fixes:
> >  - http://autobuild.buildroot.net/results/1ef947553ec762dba6a6202b1cfc84ceed75dbb2/  
> 
> Pointing to an autobuild failure is nice, but you really need to provide
> a bit more context and explanations on what you are doing here...
> 
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >  package/nodejs/nodejs.mk | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
> > index e6eb73d576..abc868c364 100644
> > --- a/package/nodejs/nodejs.mk
> > +++ b/package/nodejs/nodejs.mk
> > @@ -65,7 +65,7 @@ define HOST_NODEJS_CONFIGURE_CMDS
> >  		--shared-openssl-libpath=$(HOST_DIR)/lib \
> >  		--shared-zlib \
> >  		--no-cross-compiling \
> > -		--with-intl=small-icu \
> > +		--with-intl=$(if $(BR2_PACKAGE_ICU),system-icu,small-icu) \  
> 
> We already have a conditional block about icu, lines 35-40.
> 
> >  	)
> >  endef
> >  
> > @@ -80,6 +80,7 @@ define HOST_NODEJS_BUILD_CMDS
> >  	$(HOST_MAKE_ENV) PYTHON=$(HOST_DIR)/bin/python2 \
> >  		$(MAKE) -C $(@D) \
> >  		$(HOST_CONFIGURE_OPTS) \
> > +		$(if $(BR2_PACKAGE_ICU),CXXFLAGS.target="-DU_DISABLE_RENAMING=1") \  
> 
> Why do you need to account for a target package when building the host
> variant of nodejs? If this is needed, then explain it in the commit log.
> 
> Then, the way we usually pass such options is to append to the existing
> CXXFLAGS. With the above comment, that would probably yield something
> like (e.g. for target, ditto for host):
> 
>     NODEJS_CXXFLAGS = $(TARGET_CXXFLAGS)
> 
>     ifeq ($(BR2_PACKAGE_ICU),y)
>     NODEJS_DEPENDENCIES += icu
>     NODEJS_CONF_OPTS += --with-intl=system-icu
>     NODEJS_CXXFLAGS += -DU_DISABLE_RENAMING=1
>     else
>     NODEJS_CONF_OPTS += --with-intl=small-icu
>     endif

I think you're missing the fact that James is tweaking
HOST_NODEJS_CONF_OPTS, depending on the value of BR2_PACKAGE_ICU, which
looks very wrong.

The issue is apparently that when host-icu has been built, the
host-nodejs internal small-icu causes a build failure. However, while
BR2_PACKAGE_ICU=y implies that host-icu will be built, host-icu can
potentially be built even with BR2_PACKAGE_ICU is disabled. It is not
the case today in Buildroot, because host-icu is only in the build
dependencies of the target icu package, but relying on this assumption
seems wrong.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
