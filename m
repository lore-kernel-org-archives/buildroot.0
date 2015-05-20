From: Gergely Imreh <imrehg@gmail.com>
Date: Wed, 20 May 2015 13:02:19 +0800
Subject: [Buildroot] [PATCH] package/freerdp: fix build with gstreamer
	support
In-Reply-To: <1432074933-4039-1-git-send-email-s.martin49@gmail.com>
References: <1432074933-4039-1-git-send-email-s.martin49@gmail.com>
Message-ID: <CAJ3iQco3DSmn3gxF_YnEwKyUX6tM9s_yKjJ-YZck8JSt-SzLDA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 20 May 2015 at 06:35, Samuel Martin <s.martin49@gmail.com> wrote:
> FreeRDP with gstreamer support enabled needs gstreamer and gst-plugins-base
> with gstapp.
>
> Fixes:
>   http://autobuild.buildroot.net/results/937/9373d4238bc3f027e571581bd3531018c4faed91/
>   http://autobuild.buildroot.org/results/f77/f77a2c9eea7973b54a22e12ab33ee8964adaddfd/
>
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>

Tested-by: Gergely Imreh <imrehg@gmail.com>
 by running `make freerdp` reproducing the autobuild fails and
successful building with this patch

> ---
>  package/freerdp/Config.in  | 2 ++
>  package/freerdp/freerdp.mk | 3 ++-
>  2 files changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/package/freerdp/Config.in b/package/freerdp/Config.in
> index 2e879b4..f7d6550 100644
> --- a/package/freerdp/Config.in
> +++ b/package/freerdp/Config.in
> @@ -5,6 +5,8 @@ config BR2_PACKAGE_FREERDP
>         depends on BR2_TOOLCHAIN_HAS_THREADS
>         select BR2_PACKAGE_OPENSSL
>         select BR2_PACKAGE_ZLIB
> +       select BR2_PACKAGE_GST_PLUGINS_BASE if BR2_PACKAGE_GSTREAMER
> +       select BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_APP if BR2_PACKAGE_GSTREAMER
>         help
>           FreeRDP is a free implementation of the Remote Desktop
>           Protocol (RDP), released under the Apache license
> diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
> index c7c933e..0d10ef8 100644
> --- a/package/freerdp/freerdp.mk
> +++ b/package/freerdp/freerdp.mk
> @@ -17,7 +17,8 @@ FREERDP_CONF_OPTS = -DWITH_MANPAGES=OFF -Wno-dev
>
>  ifeq ($(BR2_PACKAGE_GSTREAMER),y)
>  FREERDP_CONF_OPTS += -DWITH_GSTREAMER=ON
> -FREERDP_DEPENDENCIES += gstreamer
> +# freerdp needs gstinterface and gstapp from gst-plugins-base
> +FREERDP_DEPENDENCIES += gstreamer gst-plugins-base
>  else
>  FREERDP_CONF_OPTS += -DWITH_GSTREAMER=OFF
>  endif
> --
> 2.4.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
