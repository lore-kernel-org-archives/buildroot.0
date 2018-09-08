From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 8 Sep 2018 23:23:31 +0200
Subject: [Buildroot] [PATCH/next v3 3/7] package/gstreamer1/gst1-libav:
 Fix build with FFmpeg 4.0
In-Reply-To: <20180825073118.14980-3-bernd.kuhls@t-online.de>
References: <20180825073118.14980-1-bernd.kuhls@t-online.de>
 <20180825073118.14980-3-bernd.kuhls@t-online.de>
Message-ID: <20180908232331.0a5a634b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Bernd,

On Sat, 25 Aug 2018 09:31:14 +0200, Bernd Kuhls wrote:

> diff --git a/package/gstreamer1/gst1-libav/0001-Fix-build-with-ffmpeg-4.0.patch b/package/gstreamer1/gst1-libav/0001-Fix-build-with-ffmpeg-4.0.patch
> new file mode 100644
> index 0000000000..2d750e2345
> --- /dev/null
> +++ b/package/gstreamer1/gst1-libav/0001-Fix-build-with-ffmpeg-4.0.patch
> @@ -0,0 +1,676 @@
> +From 257963d93ce6a8ce08c3f3771e3a1b7ebb71dc2e Mon Sep 17 00:00:00 2001
> +From: Ulenrich <eulenreich@gmx.de>
> +Date: Thu, 16 Aug 2018 22:43:18 +0200
> +Subject: [PATCH] Fix build with ffmpeg 4.0
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Instead of using the ffmpeg copy included by this package we use a patch
> +from the Gentoo bug tracker to fix the build with ffmpeg 4.0.
> +
> +Upstream included support for ffmpeg 4.0 in the upcoming 1.16.x release
> +of gstreamer:
> +https://bugzilla.gnome.org/show_bug.cgi?id=792900
> +
> +NEWS mentions that the fixes "won?t be backported to the 1.14 branch as
> +it is rather intrusive":
> +https://github.com/GStreamer/gst-libav/commit/8886a016fce625e1c25a4902be4021196a6784a2#diff-ff4e2dc4962dc25a1512353299992c8dR1400
> +
> +Downloaded from https://bugs.gentoo.org/654628#c11

I am a bit worried about this patch, see below.

> +-  params.padding = FF_INPUT_BUFFER_PADDING_SIZE;
> ++  params.padding = AV_INPUT_BUFFER_PADDING_SIZE;

Is AV_INPUT_BUFFER_PADDING_SIZE defined in ffmpeg 3.x that we
currently have ? If not, then this change is going to break the build.

In other packages, what is done is:

++#ifndef AV_INPUT_BUFFER_PADDING_SIZE
++#define AV_INPUT_BUFFER_PADDING_SIZE FF_INPUT_BUFFER_PADDING_SIZE
++#endif

Which to me, implies that AV_INPUT_BUFFER_PADDING_SIZE is not defined
in older versions of ffmpeg.

> ++#if 0
> +   pspec = g_param_spec_float ("rc-qsquish", "Ratecontrol Limiting Method",
> +       "0 means limit by clipping, otherwise use nice continuous function",
> +       0, 99.0f, 1.0f, G_PARAM_READWRITE | G_PARAM_STATIC_STRINGS);
> +   gst_ffmpeg_add_pspec (pspec, config.rc_qsquish, FALSE, mpeg, NULL);
> ++#endif

Is it OK to just remove all this code ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
