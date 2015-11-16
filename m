From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 16 Nov 2015 07:51:37 +0100
Subject: [Buildroot] [PATCH v1 1/1] gmrender-resurrect: new package
In-Reply-To: <201510191206.t9JC6rK5008730@ms-omx02.plus.so-net.ne.jp>
References: <201510191206.t9JC6rK5008730@ms-omx02.plus.so-net.ne.jp>
Message-ID: <56497CF9.5080801@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 19-10-15 14:06, Hiroshi Kawashima wrote:
> gmrender-resurrect is UPnP (DLNA) renderer based on gstreamer.
> 
> Signed-off-by: Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>

 Some small comments below. With these, you can add my:

  Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

> ---
>  package/Config.in                                  |  1 +
>  package/gmrender-resurrect/Config.in               | 15 +++++++++++++++
>  package/gmrender-resurrect/gmrender-resurrect.hash |  2 ++
>  package/gmrender-resurrect/gmrender-resurrect.mk   | 16 ++++++++++++++++
>  4 files changed, 34 insertions(+)
>  create mode 100644 package/gmrender-resurrect/Config.in
>  create mode 100644 package/gmrender-resurrect/gmrender-resurrect.hash
>  create mode 100644 package/gmrender-resurrect/gmrender-resurrect.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 8e3c64a..0811f4e 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -14,6 +14,7 @@ menu "Audio and video applications"
>  	source "package/ffmpeg/Config.in"
>  	source "package/flac/Config.in"
>  	source "package/flite/Config.in"
> +	source "package/gmrender-resurrect/Config.in"
>  	source "package/gstreamer/Config.in"
>  	source "package/gstreamer1/Config.in"
>  	source "package/jack2/Config.in"
> diff --git a/package/gmrender-resurrect/Config.in b/package/gmrender-resurrect/Config.in
> new file mode 100644
> index 0000000..fc6327c
> --- /dev/null
> +++ b/package/gmrender-resurrect/Config.in
> @@ -0,0 +1,15 @@
> +config BR2_PACKAGE_GMRENDER_RESURRECT
> +	bool "gmrender-resurrect"
> +	depends on BR2_USE_WCHAR # gstreamer1

 This should actually be gstreamer1 -> glib2 (the real cause is glib2). Same for
the ones below.

> +	depends on BR2_TOOLCHAIN_HAS_THREADS # gstreamer1, libupnp
> +	depends on BR2_USE_MMU # gstreamer1
> +	select BR2_PACKAGE_GSTREAMER1
> +	select BR2_PACKAGE_LIBUPNP
> +	help
> +	  UPnP (DLNA) media renderer based on gstreamer

 It could be useful to add:

	  You have to manually enable the GStreamer plugins to actually
	  render the media. This includes the parser and decoder elements
	  as well as an audio and/or video sink.

 In fact, playbin is absolutely required, so I'd also add:

	select BR2_PACKAGE_GST1_PLUGINS_BASE # run-time only

> +
> +	  https://github.com/hzeller/gmrender-resurrect
> +
> +comment "gmrender-resurrect needs a toolchain w/ wchar, threads"
> +	depends on BR2_USE_MMU
> +	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
> diff --git a/package/gmrender-resurrect/gmrender-resurrect.hash b/package/gmrender-resurrect/gmrender-resurrect.hash
> new file mode 100644
> index 0000000..f41447a
> --- /dev/null
> +++ b/package/gmrender-resurrect/gmrender-resurrect.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated
> +sha256 502129ecb097bf23ba011f18a8bf1923951ec2dc6da157f3b376383c5f99b623 gmrender-resurrect-aa3d02cf40321cf78a6ea9019e23a7f6cd091dee.tar.gz
> diff --git a/package/gmrender-resurrect/gmrender-resurrect.mk b/package/gmrender-resurrect/gmrender-resurrect.mk
> new file mode 100644
> index 0000000..18c6e01
> --- /dev/null
> +++ b/package/gmrender-resurrect/gmrender-resurrect.mk
> @@ -0,0 +1,16 @@
> +################################################################################
> +#
> +# gmrender-resurrect
> +#
> +################################################################################
> +
> +GMRENDER_RESURRECT_VERSION = aa3d02cf40321cf78a6ea9019e23a7f6cd091dee
> +GMRENDER_RESURRECT_SITE = $(call github,hzeller,gmrender-resurrect,$(GMRENDER_RESURRECT_VERSION))
> +# Original distribution does not have default configure,
> +# so we need to autoreconf:
> +GMRENDER_RESURRECT_AUTORECONF = YES
> +GMRENDER_RESURRECT_LICENSE = GPLv2+

 Verified.

> +GMRENDER_RESURRECT_LICENSE_FILES = COPYING
> +GMRENDER_RESURRECT_DEPENDENCIES = gstreamer1 libupnp

 There is also a sysvinit start script bundled with the source, so it would make
sense to install that as well. However, it doesn't look like it's usable as is.

 Regards,
 Arnout

> +
> +$(eval $(autotools-package))
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
