From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 19 Feb 2019 23:25:14 +0100
Subject: [Buildroot] [PATCH 3/3] package/webkitgtk: propagate microblaze
 dependency
In-Reply-To: <20190216134530.14717-4-aperez@igalia.com>
References: <20190216134530.14717-1-aperez@igalia.com>
 <20190216134530.14717-4-aperez@igalia.com>
Message-ID: <9ddacf76-1bdc-4b69-06b0-2cf23b57b282@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Adrian,

On 16/02/2019 14:45, Adrian Perez de Castro wrote:
> The woff2 package is disabled for Microblaze, therefore disable
> the support for WOFF2 web fonts in webkitgtk and make it optional.
> Note that the support for other web fonts formats (OTF, TTF, WOFF1)
> will still work normally and only WOFF2 gets disabled.

 This patch conflicts with your series refactoring the webkit packages...

 I think the proper approach is.

1. Patch for webkitgtk to make woff2 an optional dependency (i.e., [1] but
without the refactoring, so duplicate work for the two webkits). To be applied
to master.

2. Patches 1+2 of this series, but squashed (when you add a dependency to a
package, you have to propagate it in the same commit, otherwise it's not
bisectable). For master, obviously.

3-5 The rest of the RFC series, for next.


> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> ---
>  package/webkitgtk/Config.in    |  2 +-
>  package/webkitgtk/webkitgtk.mk | 12 +++++++++---
>  2 files changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/package/webkitgtk/Config.in b/package/webkitgtk/Config.in
> index 8714677b6a..2f466a37d4 100644
> --- a/package/webkitgtk/Config.in
> +++ b/package/webkitgtk/Config.in
> @@ -59,7 +59,7 @@ config BR2_PACKAGE_WEBKITGTK
>  	select BR2_PACKAGE_SQLITE
>  	select BR2_PACKAGE_WEBP
>  	select BR2_PACKAGE_WEBP_DEMUX
> -	select BR2_PACKAGE_WOFF2
> +	select BR2_PACKAGE_WOFF2 if !BR2_microblaze # woff2 -> brotli

 If woff2 is optional, then this should be removed entirely. That is also
missing in [1].

 Regards,
 Arnout


[1] http://patchwork.ozlabs.org/patch/1044194/

>  	select BR2_PACKAGE_XLIB_LIBXCOMPOSITE if BR2_PACKAGE_LIBGTK3_X11
>  	select BR2_PACKAGE_XLIB_LIBXDAMAGE if BR2_PACKAGE_LIBGTK3_X11
>  	select BR2_PACKAGE_XLIB_LIBXRENDER if BR2_PACKAGE_LIBGTK3_X11
> diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
> index c17bbc8028..54159d7f47 100644
> --- a/package/webkitgtk/webkitgtk.mk
> +++ b/package/webkitgtk/webkitgtk.mk
> @@ -14,7 +14,7 @@ WEBKITGTK_LICENSE_FILES = \
>  	Source/WebCore/LICENSE-LGPL-2.1
>  WEBKITGTK_DEPENDENCIES = host-ruby host-python host-gperf \
>  	enchant harfbuzz icu jpeg libgcrypt libgtk3 libsecret libsoup \
> -	libtasn1 libxml2 libxslt sqlite webp woff2
> +	libtasn1 libxml2 libxslt sqlite webp
>  WEBKITGTK_CONF_OPTS = \
>  	-DENABLE_API_TESTS=OFF \
>  	-DENABLE_GEOLOCATION=OFF \
> @@ -24,8 +24,7 @@ WEBKITGTK_CONF_OPTS = \
>  	-DENABLE_SPELLCHECK=ON \
>  	-DPORT=GTK \
>  	-DUSE_LIBNOTIFY=OFF \
> -	-DUSE_LIBHYPHEN=OFF \
> -	-DUSE_WOFF2=ON
> +	-DUSE_LIBHYPHEN=OFF
>  
>  ifeq ($(BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS_JIT),y)
>  WEBKITGTK_CONF_OPTS += -DENABLE_JIT=ON
> @@ -98,4 +97,11 @@ else
>  WEBKITGTK_CONF_OPTS += -DUSE_GSTREAMER_GL=OFF
>  endif
>  
> +ifeq ($(BR2_PACKAGE_WOFF2),y)
> +WEBKITGTK_CONF_OPTS += -DUSE_WOFF2=ON
> +WEBKITGTK_DEPENDENCIES += woff2
> +else
> +WEBKITGTK_CONF_OPTS += -DUSE_WOFF2=OFF
> +endif
> +
>  $(eval $(cmake-package))
> 
