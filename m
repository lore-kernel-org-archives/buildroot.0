From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 4 Jun 2020 23:23:00 +0200
Subject: [Buildroot] [PATCH v2] package/gstreamer1/gst1-plugins-good:
 Select GUDEV if available
In-Reply-To: <20200601164321.12806-1-ezequiel@vanguardiasur.com.ar>
References: <20200601164321.12806-1-ezequiel@vanguardiasur.com.ar>
Message-ID: <20200604212300.GJ13972@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ezequiel, Nicolas, All,

On 2020-06-01 13:43 -0300, Ezequiel Garcia spake thusly:
> From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> 
> Using udev for probes (such as Video4Linux2 devices probes)
> and device monitor greatly improves load time and monitoring performance.
> 
> It also enables hotplug monitoring for cameras.
> 
> Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> ---
> v2:
> * Enable/disable v4l2-gudev explicitly
> 
>  package/gstreamer1/gst1-plugins-good/Config.in           | 1 +
>  .../gstreamer1/gst1-plugins-good/gst1-plugins-good.mk    | 9 +++++++++
>  2 files changed, 10 insertions(+)
> 
> diff --git a/package/gstreamer1/gst1-plugins-good/Config.in b/package/gstreamer1/gst1-plugins-good/Config.in
> index 20aebc473e89..be77f5a82e3d 100644
> --- a/package/gstreamer1/gst1-plugins-good/Config.in
> +++ b/package/gstreamer1/gst1-plugins-good/Config.in
> @@ -295,6 +295,7 @@ config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_SHOUT2
>  config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_V4L2
>  	bool "v4l2"
>  	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 # multi planar api
> +	select BR2_PACKAGE_LIBGUDEV if BR2_PACKAGE_HAS_UDEV

So there is still something that evades my understanding: gudev is
selected only when V4L2 is enabled.

However...

>  	help
>  	  elements for Video 4 Linux
>  
> diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
> index 223af9850897..bd4bdcbc1ff1 100644
> --- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
> +++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
> @@ -40,6 +40,10 @@ else
>  GST1_PLUGINS_GOOD_CONF_OPTS += -Djack=disabled
>  endif
>  
> +ifeq ($(BR2_PACKAGE_LIBGUDEV),y)
> +GST1_PLUGINS_GOOD_DEPENDENCIES += libgudev
> +endif

The dependency is added glbally.

So we end up with this truth table:

      gudev | v4l2 plugin | dependency
    --------+-------------+------------
        n   |      n      |     n
        Y   |      n      |     Y
        Y   |      Y      |     Y

(the fourth case is not possible, as the v4l2 plugin select gudev)

Is that what you expect?

From the commit log, it looks like v4l2 is only one case amongst many:
"Using udev for probes (such as Video4Linux2 devices probes)".

So, I would have expected the select to be on the main
gst1-plugins0-good symbol:

    menuconfig BR2_PACKAGE_GST1_PLUGINS_GOOD
        bool "gst1-plugins-good"
        select BR2_PACKAGE_LIBGUDEV if BR2_PACKAGE_HAS_UDEV

Regards,
Yann E. MORIN.

>  ifeq ($(BR2_PACKAGE_LIBV4L),y)
>  GST1_PLUGINS_GOOD_CONF_OPTS += -Dv4l2-libv4l2=enabled
>  GST1_PLUGINS_GOOD_DEPENDENCIES += libv4l
> @@ -355,6 +359,11 @@ endif
>  
>  ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_V4L2),y)
>  GST1_PLUGINS_GOOD_CONF_OPTS += -Dv4l2=enabled
> +ifeq ($(BR2_PACKAGE_LIBGUDEV),y)
> +GST1_PLUGINS_GOOD_CONF_OPTS += -Dv4l2-gudev=enabled
> +else
> +GST1_PLUGINS_GOOD_CONF_OPTS += -Dv4l2-gudev=disabled
> +endif
>  else
>  GST1_PLUGINS_GOOD_CONF_OPTS += -Dv4l2=disabled
>  endif
> -- 
> 2.26.0.rc2
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
