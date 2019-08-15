From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 16 Aug 2019 00:02:32 +0200
Subject: [Buildroot] [PATCH 1/1] package/gstreamer1/gst1-plugins-bad:
 fix opengl dependency
In-Reply-To: <20190807215804.100437-1-james.hilliard1@gmail.com>
References: <20190807215804.100437-1-james.hilliard1@gmail.com>
Message-ID: <20190816000232.6c7f88b8@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

James, Adrian, Adam,

On Wed,  7 Aug 2019 15:58:04 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Fixes:
> WPEThreadedView.h:24:10: fatal error: gst/gl/gl.h: No such file or directory
>  #include <gst/gl/gl.h>
>           ^~~~~~~~~~~~~
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/gstreamer1/gst1-plugins-bad/Config.in | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

I must say I'm a bit confused by the GStreamer OpenGL options, and this
particular patch. See below.

> diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
> index f00f3edb7c..79acd83a63 100644
> --- a/package/gstreamer1/gst1-plugins-bad/Config.in
> +++ b/package/gstreamer1/gst1-plugins-bad/Config.in
> @@ -595,11 +595,11 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WPE
>  	bool "wpe"
>  	default y
>  	depends on BR2_PACKAGE_WPEWEBKIT
> -	depends on BR2_PACKAGE_GST1_PLUGINS_BASE_HAS_LIB_OPENGL
> +	depends on BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_OPENGL

So with this patch in place, it is no longer possible to select the wpe
plugin if you have OpenGL ES, you really need full OpenGL, making the
WPE plugin unselectable on most embedded platforms, that often only
provide OpenGL ES, and not full OpenGL ? Is that really the case ?

Also, I'm confused by the semantic of
BR2_PACKAGE_GST1_PLUGINS_BASE_HAS_LIB_OPENGL. With this patch +
http://patchwork.ozlabs.org/patch/1143636/, it's essentially going to
be used in only one remaining place:
BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_GL. And it is exactly equal to
BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_HAS_WINDOW &&
BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL.

The naming is very confusing, and there are not many comments to
explain what's going on. Can we try to clarify all of this ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
