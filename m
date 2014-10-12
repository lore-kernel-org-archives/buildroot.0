From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Sun, 12 Oct 2014 11:06:23 +0200
Subject: [Buildroot] [PATCH v2 1/1] gst-ffmpeg: add option for LGPL build
In-Reply-To: <1390096790-1864-1-git-send-email-danomimanchego123@gmail.com>
References: <1390096790-1864-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <543A448F.5080400@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Danomi Manchego,

Danomi Manchego wrote:
> Add option to build a LGPL licensed gst-ffmpeg.
>
> Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
>
> ---
>
> v1 -> v2:
>   - Move GST_FFMPEG_CONF_OPT adjustment (introduced by this patch)
>     higher in the file, so that GST_FFMPEG_CONF_EXTRA_OPT lines
>     don't get split.
> ---
>   package/gstreamer/gst-ffmpeg/Config.in     |   13 ++++++++++++-
>   package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk |   11 ++++++++++-
>   2 files changed, 22 insertions(+), 2 deletions(-)
>
> diff --git a/package/gstreamer/gst-ffmpeg/Config.in b/package/gstreamer/gst-ffmpeg/Config.in
> index d879f5e..220f4d7 100644
> --- a/package/gstreamer/gst-ffmpeg/Config.in
> +++ b/package/gstreamer/gst-ffmpeg/Config.in
> @@ -1,4 +1,4 @@
> -config BR2_PACKAGE_GST_FFMPEG
> +menuconfig BR2_PACKAGE_GST_FFMPEG
>   	bool "gst-ffmpeg"
>   	select BR2_PACKAGE_GST_PLUGINS_BASE
>   	depends on BR2_LARGEFILE
> @@ -8,5 +8,16 @@ config BR2_PACKAGE_GST_FFMPEG
>
>   	  http://gstreamer.freedesktop.org/

Not related to your patch, but how about providing a more specific URL
such as http://gstreamer.freedesktop.org/modules/gst-ffmpeg.html?

It would be a separate patch of course.

>
> +if BR2_PACKAGE_GST_FFMPEG
> +
> +config BR2_PACKAGE_GST_FFMPEG_LGPL_BUILD
> +	bool "Build a LGPL licensed gst-ffmpeg"
> +	help
> +	  This removes --enable-gpl and --enable-postproc from the
> +	  ffmpeg configure line, and disables building the postproc
> +	  gstreamer plugin.

I personally prefer positive options. If you enable this options, it
will remove stuff. I suggest you mimic the BR2_PACKAGE_FFMPEG_GPL
option, from the ffmpeg package.

Also unrelated to this patch, but is this package actually using
ffmpeg or libav? All kconfig stuff suggest ffmpeg, but the package
tarball actually contains a copy of the library in a directory named
gst-libs/ext/libav, and the licensing info you add below mention libav.

It's worth adding a separate patch to clarify to the user that:
  - this package uses an internal copy of the library, and
  - which source library it actually is.

> +
> +endif
> +
>   comment "gst-ffmpeg needs a toolchain w/ largefile, IPv6"
>   	depends on !(BR2_LARGEFILE && BR2_INET_IPV6)
> diff --git a/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk b/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk
> index 6534f93..ed2b519 100644
> --- a/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk
> +++ b/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk
> @@ -10,6 +10,15 @@ GST_FFMPEG_SITE = http://gstreamer.freedesktop.org/src/gst-ffmpeg
>   GST_FFMPEG_INSTALL_STAGING = YES
>   GST_FFMPEG_DEPENDENCIES = host-pkgconf gstreamer gst-plugins-base
>
> +ifeq ($(BR2_PACKAGE_GST_FFMPEG_LGPL_BUILD),y)
> +GST_FFMPEG_CONF_OPT += --enable-lgpl

Your patch does not apply anymore to current master because _CONF_OPT
have been renamed to _CONF_OPTS. Care to you rebase and resend?

Otherwise looks good. I did a quick build test and it worked.

-- 
Luca
