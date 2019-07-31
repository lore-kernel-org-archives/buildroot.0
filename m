From: Charles Turner <cturner@igalia.com>
Date: Wed, 31 Jul 2019 07:18:19 +0100
Subject: [Buildroot] [PATCH 1/1] package/gstreamer1: gl enabled when
 either GL or GLES2 is present
In-Reply-To: <20190725114225.4893-1-cturner@igalia.com>
References: <20190725114225.4893-1-cturner@igalia.com>
Message-ID: <813e2163aadb967498f3f9296517b3db6d7ba38a.camel@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ping

On Thu, 2019-07-25 at 12:42 +0100, Charlie Turner wrote:
> When building gst1-plugins-base with GL support on the rpi3 (which
> supports only GLES2, not full desktop GL), GStreamer was being asked
> to
> disable its GL support completely. This isn't correct since it can be
> used with either GL or GLES2.
> 
> Signed-off-by: Charlie Turner <cturner@igalia.com>
> ---
>  .../gstreamer1/gst1-plugins-base/gst1-plugins-base.mk    | 9
> +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/package/gstreamer1/gst1-plugins-base/gst1-plugins-
> base.mk b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
> index 66c136c36c..b572c0e992 100644
> --- a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
> +++ b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
> @@ -39,13 +39,18 @@ GST1_PLUGINS_BASE_CONF_OPTS += -Dorc=disabled
>  endif
>  
>  ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_OPENGL),y)
> -GST1_PLUGINS_BASE_GL_API_LIST = opengl
>  GST1_PLUGINS_BASE_CONF_OPTS += -Dgl=enabled
> -GST1_PLUGINS_BASE_DEPENDENCIES += libgl libglu
> +else ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_GLES2),y)
> +GST1_PLUGINS_BASE_CONF_OPTS += -Dgl=enabled
>  else
>  GST1_PLUGINS_BASE_CONF_OPTS += -Dgl=disabled
>  endif
>  
> +ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_OPENGL),y)
> +GST1_PLUGINS_BASE_GL_API_LIST = opengl
> +GST1_PLUGINS_BASE_DEPENDENCIES += libgl libglu
> +endif
> +
>  ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_GLES2),y)
>  GST1_PLUGINS_BASE_GL_API_LIST += gles2
>  GST1_PLUGINS_BASE_DEPENDENCIES += libgles
