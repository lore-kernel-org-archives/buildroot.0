From: Adrian Perez de Castro <aperez@igalia.com>
Date: Thu, 8 Aug 2019 13:11:03 +0300
Subject: [Buildroot] [PATCH 1/1] package/gstreamer1: gl enabled when
 either GL or GLES2 is present
In-Reply-To: <20190725114225.4893-1-cturner@igalia.com>
References: <20190725114225.4893-1-cturner@igalia.com>
Message-ID: <20190808131103.GC8211@momiji>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello!

On Thu, 25 Jul 2019 12:42:25 +0100, Charlie Turner <cturner@igalia.com> wrote:
> When building gst1-plugins-base with GL support on the rpi3 (which
> supports only GLES2, not full desktop GL), GStreamer was being asked to
> disable its GL support completely. This isn't correct since it can be
> used with either GL or GLES2.

Precisely yesterday we were having a discussion in the #buildroot IRC channel
about how it should be possible to build the GStreamer GL support with APIs
other than desktop OpenGL. This will also enable using it in systems with
EGL+GLES2 support for which GStreamer has support (Vivante, Wayland, etc.),
as I can see from the corresponding ?meson.build? file:

 https://gitlab.freedesktop.org/gstreamer/gst-plugins-base/blob/master/gst-libs/gst/gl/meson.build#L228

All in all, your patch looks good to me (thanks, and sorry that it has been
sitting without a review for so long!), and I just have a comment below
asking for a small simplification?please take a look.

> Signed-off-by: Charlie Turner <cturner@igalia.com>

Reviewed-by: Adrian Perez de Castro <aperez@igalia.com>

> ---
>  .../gstreamer1/gst1-plugins-base/gst1-plugins-base.mk    | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
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

I would probably do the check for both _OPENGL_OPENGL and _OPENGL_GLES2
in a single line, like this:

  ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_OPENGL)$(BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_GLES2),)
  GST1_PLUGINS_BASE_CONF_OPTS += -Dgl=disabled
  else
  GST1_PLUGINS_BASE_CONF_OPTS += -Dgl=enabled
  endif

(Options which are disabled expand to the empty string, so if both are empty
the comparison with the empty string succeeds and we pass -Dgl=disabled to
Meson.)

> +ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_OPENGL),y)
> +GST1_PLUGINS_BASE_GL_API_LIST = opengl
> +GST1_PLUGINS_BASE_DEPENDENCIES += libgl libglu
> +endif
> +
>  ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_GLES2),y)
>  GST1_PLUGINS_BASE_GL_API_LIST += gles2
>  GST1_PLUGINS_BASE_DEPENDENCIES += libgles
> -- 
> 2.17.1

Cheers,
-Adrian
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190808/10b2685e/attachment.asc>
