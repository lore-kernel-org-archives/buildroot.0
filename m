From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 29 Mar 2020 22:42:51 +0200
Subject: [Buildroot] [PATCH v3 7/7] package/gupnp-dlna: add optional
 dependency for gobject-introspection
In-Reply-To: <20200327183000.1005676-7-aduskett@gmail.com>
References: <20200327183000.1005676-1-aduskett@gmail.com>
 <20200327183000.1005676-7-aduskett@gmail.com>
Message-ID: <20200329204251.GP22325@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adam, All,

Bringing Thomas in the loop: I have a question for you...

Adam, there is also a question for you...

On 2020-03-27 11:30 -0700, aduskett at gmail.com spake thusly:
> From: Adam Duskett <Aduskett@gmail.com>
> 
> If gobject-introspection is selected, explicitly set --enable-introspection in
> the configure options and add a dependency for both gobject-introspection and
> host-vala.
> 
> Host-vala is necessary because the introspection includes vala bindings files
> with no way to explicitly disable them.

Adam, this one is for you: what good are vala bindings for? Why do we
care in Buildroot, Do we have a package that may use them?

> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---
>  package/gupnp-dlna/gupnp-dlna.mk | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/package/gupnp-dlna/gupnp-dlna.mk b/package/gupnp-dlna/gupnp-dlna.mk
> index 85d30b7cd2..845667ca53 100644
> --- a/package/gupnp-dlna/gupnp-dlna.mk
> +++ b/package/gupnp-dlna/gupnp-dlna.mk
> @@ -15,15 +15,21 @@ GUPNP_DLNA_LICENSE_FILES = COPYING
>  GUPNP_DLNA_INSTALL_STAGING = YES
>  GUPNP_DLNA_DEPENDENCIES = host-pkgconf libglib2 libxml2
>  
> -GUPNP_DLNA_CONF_OPTS = \
> -	--disable-introspection \
> -	--disable-legacy-gstreamer-metadata-backend
> +GUPNP_DLNA_CONF_OPTS = --disable-legacy-gstreamer-metadata-backend
>  
>  ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE),y)
>  GUPNP_DLNA_CONF_OPTS += --enable-gstreamer-metadata-backend
>  GUPNP_DLNA_DEPENDENCIES += gstreamer1 gst1-plugins-base
> +# Gobject-introspection requires gstreamer .gir files.
> +# Vala bindings are created with the .gir files.
> +ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
> +GUPNP_DLNA_CONF_OPTS += --enable-introspection
> +GUPNP_DLNA_DEPENDENCIES += host-vala gobject-introspection
> +endif

So, vala is _not_ needed to build with introspection.

However, when building with introspection, vala bindings _can_ be
generated if the needed tools are present. But this is totally optional.

However, vala is a host-only package, that has no entry on the menuconfig
(because it is just a tool akin to bison, flex et al.).

So, we have no way to express automatically whether vala bindings should
be enabled.

However, it might be possible that an earlier package has brought
host-vala. So we may or may not have host-vala built by the time
gupnp-dlna is built.

As such, we have three options:

1. Forcibly bring a dependency ti host-vala and build vala bindings,
   like Adam did;

2. Add an option to gupnp-dlna to build vala bindings;

3. Add a vala/Config.in/host to manually enable vala, and thus
   automatically build the vala bindings.

I am basically OK with point 1, but I'd like a second pair of eyes...

Regards,
Yann E. MORIN.

>  else
> -GUPNP_DLNA_CONF_OPTS += --disable-gstreamer-metadata-backend
> +GUPNP_DLNA_CONF_OPTS += \
> +	--disable-gstreamer-metadata-backend \
> +	--disable-introspection
>  endif
>  
>  $(eval $(autotools-package))
> -- 
> 2.25.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
