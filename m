From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 16 Oct 2015 16:50:23 +0200
Subject: [Buildroot] [PATCH v1 1/1] gmediarender: new package
In-Reply-To: <201510161254.t9GCsftH031466@ms-omx02.plus.so-net.ne.jp>
References: <201510161254.t9GCsftH031466@ms-omx02.plus.so-net.ne.jp>
Message-ID: <20151016165023.2765d196@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for this new contribution! It looks pretty good, but as usual I
have some comments/questions.

First, can you fix your e-mail client or git send-email configuration
so that your "From:" is:

	Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>

instead of just:

	kei-k at ca2.so-net.ne.jp

The From: field is used to indicate the author of the patch in the Git
history, so it's nicer when there's a full name rather than just the
e-mail address.

On Fri, 16 Oct 2015 21:54:41 +0900, kei-k at ca2.so-net.ne.jp wrote:

> diff --git a/package/Config.in b/package/Config.in
> index 8e3c64a..396d757 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -14,6 +14,7 @@ menu "Audio and video applications"
>  	source "package/ffmpeg/Config.in"
>  	source "package/flac/Config.in"
>  	source "package/flite/Config.in"
> +	source "package/gmediarender/Config.in"
>  	source "package/gstreamer/Config.in"
>  	source "package/gstreamer1/Config.in"
>  	source "package/jack2/Config.in"
> diff --git a/package/gmediarender/Config.in b/package/gmediarender/Config.in
> new file mode 100644
> index 0000000..d2cd9d7
> --- /dev/null
> +++ b/package/gmediarender/Config.in
> @@ -0,0 +1,15 @@
> +config BR2_PACKAGE_GMEDIARENDER
> +	bool "gmediarender"
> +	depends on BR2_USE_WCHAR # gstreamer
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # gstreamer, libupnp
> +	depends on BR2_USE_MMU # gstreamer
> +	select BR2_PACKAGE_GSTREAMER

So it really only supports GStreamer 0.10.x (which is deprecated) and
not GStreamer 1.x ?

> +	select BR2_PACKAGE_LIBUPNP
> +	help
> +	  UPnP (DLNA) media renderer based on gstreamer
> +
> +	  http://gmrender.nongnu.org/
> +
> +comment "gmediarender needs a toolchain w/ wchar, threads"
> +	depends on BR2_USE_MMU
> +	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
> diff --git a/package/gmediarender/gmediarender.hash b/package/gmediarender/gmediarender.hash
> new file mode 100644
> index 0000000..f181770
> --- /dev/null
> +++ b/package/gmediarender/gmediarender.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated
> +sha256 85d3251ce3095394d389b56f8b47e7f79e906022e51ce92a4cf822ee2a5fee2c  gmediarender-0.0.6.tar.bz2
> diff --git a/package/gmediarender/gmediarender.mk b/package/gmediarender/gmediarender.mk
> new file mode 100644
> index 0000000..e383786
> --- /dev/null
> +++ b/package/gmediarender/gmediarender.mk
> @@ -0,0 +1,16 @@
> +################################################################################
> +#
> +# gmediarender
> +#
> +################################################################################
> +
> +GMEDIARENDER_VERSION = 0.0.6
> +GMEDIARENDER_SOURCE = gmediarender-$(GMEDIARENDER_VERSION).tar.bz2
> +GMEDIARENDER_SITE = http://savannah.nongnu.org/download/gmrender
> +GMEDIARENDER_AUTORECONF = YES

Can you add a justification for the AUTORECONF = YES here (in a comment
above the line) ?

> +GMEDIARENDER_LICENSE = GPLv2

License is actually GPLv2+.

> +GMEDIARENDER_LICENSE_FILES = COPYING
> +GMEDIARENDER_DEPENDENCIES = gstreamer libupnp
> +GMEDIARENDER_CONF_OPTS = --with-libupnp=$(STAGING_DIR)/usr LIBS="-lixml"

Which package provides the ixml library ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
