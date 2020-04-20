From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 20 Apr 2020 07:16:23 +0200
Subject: [Buildroot] [PATCH v3,
 3/6] package/collectd: add DPDK_TELEMETRY option
In-Reply-To: <20200419211456.GD5035@scaer>
References: <20200415063008.2237470-1-fontaine.fabrice@gmail.com>
 <20200415063008.2237470-3-fontaine.fabrice@gmail.com>
 <20200419211456.GD5035@scaer>
Message-ID: <20200420071623.307504f7@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 19 Apr 2020 23:14:56 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> > @@ -186,6 +188,9 @@ COLLECTD_DEPENDENCIES = \
> >  ifeq ($(BR2_PACKAGE_GRPC),y)
> >  COLLECTD_CONF_OPTS += --with-libgrpc++=$(STAGING_DIR)/usr
> >  endif
> > +ifeq ($(BR2_PACKAGE_JANSSON),y)
> > +COLLECTD_CONF_OPTS += --with-libjansson=$(STAGING_DIR)/usr
> > +endif  
> 
> This code is bugging me: it decorelates the --enable/disable options,
> the dependencies and the --with option.
> 
> With this patch, this means that is jansoon is enabled, but DPDK
> telemetry is not, then we still pass --with-libjansson.

If libjansson is only detected/used when --enable-dpdk-telemetry is
passed, then I agree with you.

> I think the $(if blabla,--enable-bla,--disable-bla) construct should be
> limited to thos options that do not require a dependency or another
> --with option. If it does, then we should revert to using the
> traditional conditional block:

I agree that I don't like how collectd.mk is written today. I very much
prefer each option to be handled in one place, like you illustrated
below, rather than handling separately the <pkg>_DEPENDENCIES part and
the <pkg>_CONF_OPTS part.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
