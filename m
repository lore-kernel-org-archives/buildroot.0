From: Adrian Perez de Castro <aperez@igalia.com>
Date: Thu, 8 Aug 2019 14:51:13 +0300
Subject: [Buildroot] [PATCH 1/1] package/gstreamer1: gl enabled when
 either GL or GLES2 is present
In-Reply-To: <20190808113631.21408-1-cturner@igalia.com>
References: <20190808113631.21408-1-cturner@igalia.com>
Message-ID: <20190808145113.GB28499@momiji>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Charlie,

Thanks for the quick update, patch looks all good to me ?

On Thu,  8 Aug 2019 12:36:31 +0100, Charlie Turner <cturner@igalia.com> wrote:
> When building gst1-plugins-base with GL support on the rpi3 (which
> supports only GLES2, not full desktop GL), GStreamer was being asked to
> disable its GL support completely. This isn't correct since it can be
> used with either GL or GLES2.
> 
> Signed-off-by: Charlie Turner <cturner@igalia.com>

Reviewed-By: Adrian Perez de Castro <aperez@igalia.com>

> ---
>  .../gstreamer1/gst1-plugins-base/gst1-plugins-base.mk    | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
> index 66c136c36c..e80b301b82 100644
> --- a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
> +++ b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
> @@ -38,12 +38,15 @@ else
>  GST1_PLUGINS_BASE_CONF_OPTS += -Dorc=disabled
>  endif
>  
> +ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_OPENGL)$(BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_GLES2),)
> +GST1_PLUGINS_BASE_CONF_OPTS += -Dgl=disabled
> +else
> +GST1_PLUGINS_BASE_CONF_OPTS += -Dgl=enabled
> +endif
> +
>  ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_OPENGL),y)
>  GST1_PLUGINS_BASE_GL_API_LIST = opengl
> -GST1_PLUGINS_BASE_CONF_OPTS += -Dgl=enabled
>  GST1_PLUGINS_BASE_DEPENDENCIES += libgl libglu
> -else
> -GST1_PLUGINS_BASE_CONF_OPTS += -Dgl=disabled
>  endif
>  
>  ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_GLES2),y)
> -- 
> 2.17.1

Cheers,
?Adri?n
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190808/96db39d2/attachment.asc>
