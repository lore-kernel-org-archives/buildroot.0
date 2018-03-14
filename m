From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 14 Mar 2018 19:05:15 +0100
Subject: [Buildroot] [PATCH v4 2/4] gstreamer1 packages: explicitly
 disable introspection
In-Reply-To: <20180314172451.22455-3-aduskett@gmail.com>
References: <20180314172451.22455-1-aduskett@gmail.com>
 <20180314172451.22455-3-aduskett@gmail.com>
Message-ID: <20180314180515.GB24940@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adam, All,

On 2018-03-14 13:24 -0400, Adam Duskett spake thusly:
> To get gstreamer ready for introspection, we must first explicitly
> disable gstreamer1, plugins base and plugins bad from using introspection.
> If not, when gobject-introspection is compiled, these packages will fail to
> build because the _GIR_EXTRA_LIBS_PATH variable is not set.
> 
> The other gstreamer1 packages do not need the _GIR_EXTRA_LIBS_PATH variable to
> be set.
> 
> Signed-off-by: Adam Duskett <aduskett@gmail.com>
> ---
> Changes v1 -> v4:
>   - Add patch to series.
>   - Change TARGET_MAKE_ENV += GIR_EXTRA_LIBS_PATH to
>     PACKAGE_GIR_EXTRA_LIBS_PATH.
> 
>  package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk   | 3 ++-
>  package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk | 3 ++-
>  package/gstreamer1/gstreamer1/gstreamer1.mk               | 1 +
>  3 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
> index 83cb94be81..595e62072c 100644
> --- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
> +++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
> @@ -21,7 +21,8 @@ GST1_PLUGINS_BAD_CONF_OPTS = \
>  	--disable-winks \
>  	--disable-android_media \
>  	--disable-apple_media \
> -	--disable-acm
> +	--disable-acm \
> +	--enable-introspection=no

Please explain, in the commit log, why you use --enable-introspection=no
rather than --disable-introspection.

Regards,
Yann E. MORIN.

>  # Options which require currently unpackaged libraries
>  GST1_PLUGINS_BAD_CONF_OPTS += \
> diff --git a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
> index 10361ee3c6..f492c4a175 100644
> --- a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
> +++ b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
> @@ -14,7 +14,8 @@ GST1_PLUGINS_BASE_LICENSE = LGPL-2.0+, LGPL-2.1+
>  # gio_unix_2_0 is only used for tests
>  GST1_PLUGINS_BASE_CONF_OPTS = \
>  	--disable-examples \
> -	--disable-valgrind
> +	--disable-valgrind \
> +	--enable-introspection=no
>  
>  # Options which require currently unpackaged libraries
>  GST1_PLUGINS_BASE_CONF_OPTS += \
> diff --git a/package/gstreamer1/gstreamer1/gstreamer1.mk b/package/gstreamer1/gstreamer1/gstreamer1.mk
> index ea9f29a4f3..25a799240d 100644
> --- a/package/gstreamer1/gstreamer1/gstreamer1.mk
> +++ b/package/gstreamer1/gstreamer1/gstreamer1.mk
> @@ -17,6 +17,7 @@ GSTREAMER1_CONF_OPTS = \
>  	--disable-failing-tests \
>  	--disable-valgrind \
>  	--disable-benchmarks \
> +	--enable-introspection=no \
>  	$(if $(BR2_PACKAGE_GSTREAMER1_CHECK),,--disable-check) \
>  	$(if $(BR2_PACKAGE_GSTREAMER1_TRACE),,--disable-trace) \
>  	$(if $(BR2_PACKAGE_GSTREAMER1_PARSE),,--disable-parse) \
> -- 
> 2.14.3
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
