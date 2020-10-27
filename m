From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 27 Oct 2020 09:38:46 +0100
Subject: [Buildroot] package/gst-omx: fix gstomx.conf installation for
 raspberry
In-Reply-To: <AM0PR04MB40834541F92A0945F62F8F55FB190@AM0PR04MB4083.eurprd04.prod.outlook.com>
References: <AM0PR04MB40834541F92A0945F62F8F55FB190@AM0PR04MB4083.eurprd04.prod.outlook.com>
Message-ID: <trinity-99e2a04c-6aa2-41cf-8dab-8da9d32faed5-1603787926739@3c-app-gmx-bap33>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Augustin,

> Gesendet: Montag, 26. Oktober 2020 um 22:31 Uhr
> Von: "Augustin Thiercelin" <augustin.thiercelin@outlook.com>
> An: buildroot at buildroot.org
> Betreff: [Buildroot] (no subject)
>
>  From 0f755639dc7a297ff6c656d29d541b5ad2b8f7dc Mon Sep 17 00:00:00 2001
> From: Augustin Thiercelin <augustin.thiercelin@outlook.com>
> Date: Mon, 26 Oct 2020 20:59:10 +0100
> Subject: [PATCH 1/1] package/gst-omx: fix gstomx.conf installation for
>   raspberry
>
> The commit 7e6f4e5 introduces a new bug when building the gst-omx package
> for the raspberry.
>
> GST_OMX_VARIANT variable in gst-omx.mk was shadowed to 'generic' after being
> set well for raspberry. It results having the gstomx.conf not being
> installed,
> and thus having gst-omx installed but none of its features available.
>

My fault..., thanks for spotting it and providing a patch...

> Signed-off-by: Augustin Thiercelin <augustin.thiercelin@outlook.com>
> ---
>   package/gstreamer1/gst-omx/gst-omx.mk | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/package/gstreamer1/gst-omx/gst-omx.mk
> b/package/gstreamer1/gst-omx/gst-omx.mk
> index cdd0e86b04..01c3ef941b 100644
> --- a/package/gstreamer1/gst-omx/gst-omx.mk
> +++ b/package/gstreamer1/gst-omx/gst-omx.mk
> @@ -17,10 +17,11 @@ GST_OMX_CONF_OPTS = \
>   	-Dtools=disabled \
>   	-Ddoc=disabled
>
> +GST_OMX_VARIANT = generic
> +
>   ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
>   GST_OMX_VARIANT = rpi
>   GST_OMX_CONF_OPTS += -Dheader_path=$(STAGING_DIR)/usr/include/IL
> -GST_OMX_VARIANT = generic
>   endif

Would prefere:

--- a/package/gstreamer1/gst-omx/gst-omx.mk
+++ b/package/gstreamer1/gst-omx/gst-omx.mk
@@ -20,6 +20,7 @@ GST_OMX_CONF_OPTS = \
 ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
 GST_OMX_VARIANT = rpi
 GST_OMX_CONF_OPTS += -Dheader_path=$(STAGING_DIR)/usr/include/IL
+else
 GST_OMX_VARIANT = generic
 endif


Mind to re-spin the patch with this change (by the way your patch seems
to be mangled e.g. e-mail missing subject line, try to use git send-email)?

Regards,
Peter


>
>   GST_OMX_CONF_OPTS += -Dtarget=$(GST_OMX_VARIANT)
> --
> 2.29.0
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
