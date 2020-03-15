From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 15 Mar 2020 18:39:32 +0100
Subject: [Buildroot] [PATCH 4/5] package/gupnp-dlna: add optional
 dependency for gobject-introspection
In-Reply-To: <20200315172459.881615-4-aduskett@gmail.com>
References: <20200315172459.881615-1-aduskett@gmail.com>
 <20200315172459.881615-4-aduskett@gmail.com>
Message-ID: <CAPi7W83qicTYKKCZ0tZe0h-6pH8cnxTUoKKOwNjwfRzx6zwXsQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Adam,

Le dim. 15 mars 2020 ? 18:25, <aduskett@gmail.com> a ?crit :
>
> From: Adam Duskett <Aduskett@gmail.com>
>
> If gobject-introspection is selected, explicitly set --enable-introspection in
> the configure options and add a dependency for gobject-introspection.
>
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---
>  package/gupnp-dlna/gupnp-dlna.mk | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/package/gupnp-dlna/gupnp-dlna.mk b/package/gupnp-dlna/gupnp-dlna.mk
> index 85d30b7cd2..6ce20c15fd 100644
> --- a/package/gupnp-dlna/gupnp-dlna.mk
> +++ b/package/gupnp-dlna/gupnp-dlna.mk
> @@ -16,9 +16,15 @@ GUPNP_DLNA_INSTALL_STAGING = YES
>  GUPNP_DLNA_DEPENDENCIES = host-pkgconf libglib2 libxml2
>
>  GUPNP_DLNA_CONF_OPTS = \
> -       --disable-introspection \
>         --disable-legacy-gstreamer-metadata-backend
>
> +ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
> +GUPNP_DLNA_CONF_OPTS += --enable-introspection
> +GUPNP_DLNA_DEPENDENCIES += gobject-introspection
> +else
> +GUPNP_DLNA_CONF_OPTS += --disable-introspection
> +endif
I tried to enable introspection on gupnp-dlna and it fails due to
missing Gst-1.0.gir which is provided by gstreamer1 under the
following condition:
build_gir = gir.found() and not meson.is_cross_build()

So, before enabling introspection on gupnp-dlna, gstreamer1's
meson.build will have to be patched .
I tried to do that but I got a build failure.
> +
>  ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE),y)
>  GUPNP_DLNA_CONF_OPTS += --enable-gstreamer-metadata-backend
>  GUPNP_DLNA_DEPENDENCIES += gstreamer1 gst1-plugins-base
> --
> 2.24.1
>
Best Regards,

Fabrice
