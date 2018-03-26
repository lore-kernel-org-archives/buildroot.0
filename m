From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 26 Mar 2018 23:17:01 +0200
Subject: [Buildroot] [PATCH 2/2] package/exim: bump version to 4.90
In-Reply-To: <20180129232524.5fadcbd8@windsurf.lan>
References: <20180127225123.28166-1-bernd.kuhls@t-online.de>
 <20180127225123.28166-2-bernd.kuhls@t-online.de>
 <20180129232524.5fadcbd8@windsurf.lan>
Message-ID: <20180326231701.3ec7d95d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Bernd,

Ping ? If you don't answer the review comments, we can't really move
forward with merging this patch :-/

Thomas

On Mon, 29 Jan 2018 23:25:24 +0100, Thomas Petazzoni wrote:
> Hello,
> 
> On Sat, 27 Jan 2018 23:51:23 +0100, Bernd Kuhls wrote:
> 
> >  ifeq ($(BR2_PACKAGE_OPENSSL),y)
> > -EXIM_DEPENDENCIES += openssl
> > +EXIM_DEPENDENCIES += host-openssl openssl  
> 
> This looks suspicious. Why are you bringing host-openssl when target
> OpenSSL support is enabled ? Is the OpenSSL support in the macro_predef
> program needed for target SSL support to work ? What does OpenSSL
> support in macro_predef actually brings ?
> 
> >  define EXIM_USE_DEFAULT_CONFIG_FILE_OPENSSL
> >  	$(call exim-config-change,SUPPORT_TLS,yes)
> >  	$(call exim-config-change,USE_OPENSSL_PC,openssl)
> > @@ -120,9 +120,17 @@ ifeq ($(BR2_STATIC_LIBS),y)
> >  EXIM_STATIC_FLAGS = LFLAGS="-pthread --static"
> >  endif
> >  
> > +# We need the host version of macro_predef during the build, before
> > +# building it we need to prepare the makefile.
> >  # "The -j (parallel) flag must not be used with make"
> >  # (http://www.exim.org/exim-html-current/doc/html/spec_html/ch04.html)
> >  define EXIM_BUILD_CMDS
> > +	$(TARGET_MAKE_ENV) build=br $(MAKE1) -C $(@D) makefile
> > +	$(HOST_MAKE_ENV) $(MAKE1) -C $(@D)/build-br macro_predef \
> > +		CC=$(HOSTCC) \
> > +		LNCC=$(HOSTCC) \
> > +		CFLAGS="$(HOST_CFLAGS)" \
> > +		LFLAGS="-fPIC $(HOST_LDFLAGS)"  
> 
> Meh, this is not nice. Perhaps we could submit a patch upstream that
> adds support for CC_FOR_BUILD, CFLAGS_FOR_BUILD, LFLAGS_FOR_BUILD, so
> that we don't need a separate build step. This could be useful for
> other projects.
> 
> Best regards,
> 
> Thomas



-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
