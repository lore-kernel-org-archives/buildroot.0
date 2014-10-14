From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 14 Oct 2014 10:40:18 +0200
Subject: [Buildroot] [PATCH 2/2] gst-fsl-plugins: fix plugin loading
In-Reply-To: <1413186949-7006-2-git-send-email-jezz@sysmic.org>
References: <1413186949-7006-1-git-send-email-jezz@sysmic.org>
 <1413186949-7006-2-git-send-email-jezz@sysmic.org>
Message-ID: <20141014084018.GM3730@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

J?r?me, All,

On 2014-10-13 09:55 +0200, J?r?me Pouiller spake thusly:
> Problem was reported :
>   http://lists.busybox.net/pipermail/buildroot/2014-July/101566.html
>   http://lists.busybox.net/pipermail/buildroot/2014-October/107613.html
> 
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
> ---
>  package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk             | 9 +++++++++
>  .../gstreamer/gst-fsl-plugins/ld.so.conf.d-gst-fsl-plugins.conf  | 5 +++++
>  2 files changed, 14 insertions(+)
>  create mode 100644 package/gstreamer/gst-fsl-plugins/ld.so.conf.d-gst-fsl-plugins.conf
> 
> diff --git a/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk b/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk
> index 8d8b8b4..21046fc 100644
> --- a/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk
> +++ b/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk
> @@ -40,4 +40,13 @@ endef
>  
>  GST_FSL_PLUGINS_POST_PATCH_HOOKS += GST_FSL_PLUGINS_PATCH_M4
>  
> +define GST_FSL_PLUGINS_FIX_LD_PATH
> +	$(INSTALL) -d $(TARGET_DIR)/etc/ld.so.conf.d
> +	$(INSTALL) -m 644 \
> +		package/gstreamer/gst-fsl-plugins/ld.so.conf.d-gst-fsl-plugins.conf \
> +		$(TARGET_DIR)/etc/ld.so.conf.d

I'd prefer you do it in one command:

    $(INSTALL) -D -m 0644 \
        package/gstreamer/gst-fsl-plugins/ld.so.conf.d-gst-fsl-plugins.conf \
        $(TARGET_DIR)/etc/ld.so.conf.d/gst-fsl-plugins.conf

That way, the directory is created in case it is missing.
Also, the name of the install file is shorter and more meaningful.

Regards,
Yann E. MORIN.

> +endef
> +
> +GST_FSL_PLUGINS_POST_INSTALL_TARGET_HOOKS += GST_FSL_PLUGINS_FIX_LD_PATH
> +
>  $(eval $(autotools-package))
> diff --git a/package/gstreamer/gst-fsl-plugins/ld.so.conf.d-gst-fsl-plugins.conf b/package/gstreamer/gst-fsl-plugins/ld.so.conf.d-gst-fsl-plugins.conf
> new file mode 100644
> index 0000000..325fbf1
> --- /dev/null
> +++ b/package/gstreamer/gst-fsl-plugins/ld.so.conf.d-gst-fsl-plugins.conf
> @@ -0,0 +1,5 @@
> +# cf. https://community.freescale.com/thread/300387
> +/usr/lib/imx-mm/audio-codec
> +/usr/lib/imx-mm/video-codec
> +/usr/lib/imx-mm/parser
> +
> -- 
> 1.9.1
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
