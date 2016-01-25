From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 25 Jan 2016 19:52:38 +0100
Subject: [Buildroot] [PATCH 07/21] pulseaudio: remove
 BR2_ARCH_HAS_ATOMICS dependency
In-Reply-To: <1453676887-31236-8-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1453676887-31236-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1453676887-31236-8-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20160125185238.GH3386@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2016-01-25 00:07 +0100, Thomas Petazzoni spake thusly:
> pulseaudio is able to either use the atomic __sync builtins from the
> compiler, or to rely on libatomic_ops for atomic operations. However,
> since it anyway selects json-c which requires the __sync built-ins, it
> means using libatomic_ops is useless: even if you use libatomic_ops
> for pulseaudio, you'd still get a link error in pulseaudio due to the
> missing __sync built-in for the json-c library.
> 
> Also, since pulseaudio now inherits the BR2_TOOLCHAIN_HAS_SYNC_4 from
> json-c, which matches the __sync built-in from pulseaudio, this
> commit:
> 
>  - Drops the BR2_ARCH_HAS_ATOMICS dependency
>  - Forces pulseaudio to not detect libatomic_ops
>  - Propagates the removal of BR2_ARCH_HAS_ATOMICS dependency to
>    pulseaudio's reverse dependencies.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
[--SNIP--]
> diff --git a/package/gstreamer/gst-plugins-good/Config.in b/package/gstreamer/gst-plugins-good/Config.in
> index c2ec5b0..36ab6cb 100644
> --- a/package/gstreamer/gst-plugins-good/Config.in
> +++ b/package/gstreamer/gst-plugins-good/Config.in
> @@ -204,7 +204,6 @@ config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_OSS4
>  config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_PULSE
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # pulseaudio
>  	depends on BR2_USE_MMU # pulseaudio
> -	depends on BR2_ARCH_HAS_ATOMICS # pulseaudio
>  	depends on !BR2_STATIC_LIBS # pulseaudio
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pulseaudio -> json-c
>  	select BR2_PACKAGE_PULSEAUDIO
> @@ -212,7 +211,7 @@ config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_PULSE
>  
>  comment "pulseaudio support needs a toolchain w/ threads, dynamic library"
>  	depends on BR2_USE_MMU
> -	depends on BR2_ARCH_HAS_ATOMICS
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4

In retrospect, I think this dependency should be added in the previous
patch.

Yes, BR2_ARCH_HAS_ATOMICS is a superset of BR2_TOOLCHAIN_HAS_SYNC_4,
still it would be more logical to add it at the time the depednency on
_SYNC_4 is added.

Ditto for all comments, of course.

[--SNIP--]
> diff --git a/package/pulseaudio/pulseaudio.mk b/package/pulseaudio/pulseaudio.mk
> index a59a6c5..3976093 100644
> --- a/package/pulseaudio/pulseaudio.mk
> +++ b/package/pulseaudio/pulseaudio.mk
> @@ -15,9 +15,14 @@ PULSEAUDIO_CONF_OPTS = \
>  	--disable-legacy-database-entry-format \
>  	--disable-manpages
>  
> +# Make sure we don't detect libatomic_ops. Indeed, since pulseaudio
> +# requires json-c, which needs 4 bytes __sync builtins, there should
> +# be no need for pulseaudio to rely on libatomic_ops.
> +PULSE_AUDIO_CONF_ENV += \
> +	ac_cv_header_atomic_ops_h=no

What happens if pulseaudio detects libatomic_ops? Is it "bad" or just
merely "harmless"?

Regards,
Yann E. MORIN.

>  PULSEAUDIO_DEPENDENCIES = \
>  	host-pkgconf libtool json-c libsndfile speex host-intltool \
> -	$(if $(BR2_PACKAGE_LIBATOMIC_OPS),libatomic_ops) \
>  	$(if $(BR2_PACKAGE_LIBSAMPLERATE),libsamplerate) \
>  	$(if $(BR2_PACKAGE_ALSA_LIB),alsa-lib) \
>  	$(if $(BR2_PACKAGE_LIBGLIB2),libglib2) \
> -- 
> 2.6.4
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
