From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 Jan 2016 22:56:56 +0100
Subject: [Buildroot] [PATCH 07/21] pulseaudio: remove
 BR2_ARCH_HAS_ATOMICS dependency
In-Reply-To: <20160125185238.GH3386@free.fr>
References: <1453676887-31236-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1453676887-31236-8-git-send-email-thomas.petazzoni@free-electrons.com>
 <20160125185238.GH3386@free.fr>
Message-ID: <20160127225656.5c8afda9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Mon, 25 Jan 2016 19:52:38 +0100, Yann E. MORIN wrote:

> >  config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_PULSE
> >  	depends on BR2_TOOLCHAIN_HAS_THREADS # pulseaudio
> >  	depends on BR2_USE_MMU # pulseaudio
> > -	depends on BR2_ARCH_HAS_ATOMICS # pulseaudio
> >  	depends on !BR2_STATIC_LIBS # pulseaudio
> >  	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pulseaudio -> json-c
> >  	select BR2_PACKAGE_PULSEAUDIO
> > @@ -212,7 +211,7 @@ config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_PULSE
> >  
> >  comment "pulseaudio support needs a toolchain w/ threads, dynamic library"
> >  	depends on BR2_USE_MMU
> > -	depends on BR2_ARCH_HAS_ATOMICS
> > +	depends on BR2_TOOLCHAIN_HAS_SYNC_4
> 
> In retrospect, I think this dependency should be added in the previous
> patch.
> 
> Yes, BR2_ARCH_HAS_ATOMICS is a superset of BR2_TOOLCHAIN_HAS_SYNC_4,
> still it would be more logical to add it at the time the depednency on
> _SYNC_4 is added.
> 
> Ditto for all comments, of course.

I intentionally kept the json-c and pulseaudio patches separate. The
json-c patch only adds the additional BR2_TOOLCHAIN_HAS_SYNC_4
dependency to json-c and all its reverse dependencies, keeping the
BR2_ARCH_HAS_ATOMICS when they existed.

This patch then removes the BR2_ARCH_HAS_ATOMICS where they are no
longer needed.

I think it remains bisectable, and allows to kept the patches somewhat
saner in size than the cairo one.

> > +# Make sure we don't detect libatomic_ops. Indeed, since pulseaudio
> > +# requires json-c, which needs 4 bytes __sync builtins, there should
> > +# be no need for pulseaudio to rely on libatomic_ops.
> > +PULSE_AUDIO_CONF_ENV += \
> > +	ac_cv_header_atomic_ops_h=no
> 
> What happens if pulseaudio detects libatomic_ops? Is it "bad" or just
> merely "harmless"?

I don't think it's bad, but since it's not needed (as explained in the
comment), I prefer to be sure that it doesn't get detected/used if
libatomic_ops happens to be built before.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
