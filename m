From: daggs <daggs@gmx.com>
Date: Sat, 5 Nov 2016 19:41:29 +0100
Subject: [Buildroot] [PATCH v6] kodi: allow enablement of libamcodec as
 codec if selected
In-Reply-To: <20161105171203.216e4ffc@free-electrons.com>
References: <20161105154042.11063-1-daggs@gmx.com>,
 <20161105171203.216e4ffc@free-electrons.com>
Message-ID: <trinity-39dbbb94-96f6-4547-928c-efced279c2f9-1478371289227@3capp-mailcom-bs15>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Greetings,

> Sent: Saturday, November 05, 2016 at 6:12 PM
> From: "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>
> To: "Dagg Stompler" <daggs@gmx.com>
> Cc: buildroot at buildroot.org
> Subject: Re: [Buildroot] [PATCH v6] kodi: allow enablement of libamcodec as codec if selected
>
> Hello,
> 
> On Sat,  5 Nov 2016 17:40:42 +0200, Dagg Stompler wrote:
> 
> > diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
> > index e0361da..4682d3f 100644
> > --- a/package/kodi/kodi.mk
> > +++ b/package/kodi/kodi.mk
> > @@ -113,6 +113,12 @@ KODI_DEPENDENCIES += imx-vpuwrap
> >  KODI_CONF_OPTS += --enable-codec=imxvpu
> >  endif
> >  
> > +ifeq ($(BR2_PACKAGE_LIBAMCODEC),y)
> > +KODI_DEPENDENCIES += libamcodec
> > +KODI_CONF_OPTS += --enable-codec=amcodec
> > +KODI_CONF_ENV += INCLUDES="-I$(STAGING_DIR)/usr/include/amcodec"
> > +endif
> 
> This is not good for two reasons:
> 
>  1. Because the Kodi Makefile for amcodec currently does
>     -I$(prefix)/include, which will be detected by our paranoid wrapper
>     as a bogus path because -I/usr/include is incorrect when
>     cross-compiling.
> 
>  2. Because there are now two conditions that pass a INCLUDES= value in
>     KODI_CONF_ENV, overwriting each other. Even if in practice they are
>     mutually exclusive (you won't build amcodec support and RPi support
>     in the same build), it is still dangerous.
> 
> Both of those problems were fixed by my proposal in your reply to your
> PATCHv5, but for some reason you decided to not follow this proposal.
I've misread your comments, will reevaluate.


> 
> Best regards,
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
