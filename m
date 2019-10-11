From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 12 Oct 2019 00:04:03 +0200
Subject: [Buildroot] [PATCH 1/1] package/gstreamer1: gl enabled when
 either GL or GLES2 is present
In-Reply-To: <20190808113631.21408-1-cturner@igalia.com>
References: <20190808113631.21408-1-cturner@igalia.com>
Message-ID: <a2716dca-9a75-9c12-3b1a-ee3535d59cab@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Charlie,

On 08/08/2019 13:36, Charlie Turner wrote:
> When building gst1-plugins-base with GL support on the rpi3 (which
> supports only GLES2, not full desktop GL), GStreamer was being asked to
> disable its GL support completely. This isn't correct since it can be
> used with either GL or GLES2.
> 
> Signed-off-by: Charlie Turner <cturner@igalia.com>

 I *finally* applied to master, thanks.

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

 Instead of this, I refactored it using the
BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_HAS_API option, which is selected by
those two. It has exactly the same effect and is much easer to read.

> +GST1_PLUGINS_BASE_CONF_OPTS += -Dgl=disabled
> +else
> +GST1_PLUGINS_BASE_CONF_OPTS += -Dgl=enabled
> +endif
> +
>  ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_OPENGL),y)

... and I also moved these two conditions under the _API condition, so it's
clear that it all belongs together.

 Regards,
 Arnout

>  GST1_PLUGINS_BASE_GL_API_LIST = opengl
> -GST1_PLUGINS_BASE_CONF_OPTS += -Dgl=enabled
>  GST1_PLUGINS_BASE_DEPENDENCIES += libgl libglu
> -else
> -GST1_PLUGINS_BASE_CONF_OPTS += -Dgl=disabled
>  endif
>  
>  ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_GLES2),y)
> 
