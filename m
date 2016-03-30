From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 30 Mar 2016 22:15:06 +0200
Subject: [Buildroot] [PATCH 1/2] gst1-libav: switch to unbundled
In-Reply-To: <1459366600-21925-1-git-send-email-gustavo@zacarias.com.ar>
References: <1459366600-21925-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <56FC33CA.1010502@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/30/16 21:36, Gustavo Zacarias wrote:
> It avoids the crazy in handling all of the ffmpeg options here as well,
> and potentially avoids target code duplication, hence resulting in a
> size reduction.
>
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>   package/gstreamer1/gst1-libav/Config.in     |  2 +
>   package/gstreamer1/gst1-libav/gst1-libav.mk | 79 ++---------------------------
>   2 files changed, 7 insertions(+), 74 deletions(-)
>
> diff --git a/package/gstreamer1/gst1-libav/Config.in b/package/gstreamer1/gst1-libav/Config.in
> index 4f9c2b8..8ef3e89 100644
> --- a/package/gstreamer1/gst1-libav/Config.in
> +++ b/package/gstreamer1/gst1-libav/Config.in
> @@ -1,5 +1,7 @@
>   config BR2_PACKAGE_GST1_LIBAV
>   	bool "gst1-libav"
> +	select BR2_PACKAGE_FFMPEG
> +	select BR2_PACKAGE_FFMPEG_SWSCALE
>   	select BR2_PACKAGE_GST1_PLUGINS_BASE
>   	help
>   	  GStreamer plugin (formerly gst-ffmpeg).

  It would be good to extend the help text with something like:

	  The codecs, muxers, bitstreams and filters to build can be
	  selected in the ffmpeg package.


  Also, it's a bit unfortunate that if ffmpeg is selected automatically, 
BR2_PACKAGE_FFMPEG_FFMPEG will be enabled by default. Well, the binary is pretty 
small compared to all the codecs so it doesn't matter much.

> diff --git a/package/gstreamer1/gst1-libav/gst1-libav.mk b/package/gstreamer1/gst1-libav/gst1-libav.mk
> index 8f892d0..02ac394 100644
> --- a/package/gstreamer1/gst1-libav/gst1-libav.mk
> +++ b/package/gstreamer1/gst1-libav/gst1-libav.mk
> @@ -7,79 +7,10 @@
>   GST1_LIBAV_VERSION = 1.8.0
>   GST1_LIBAV_SOURCE = gst-libav-$(GST1_LIBAV_VERSION).tar.xz
>   GST1_LIBAV_SITE = http://gstreamer.freedesktop.org/src/gst-libav
> -GST1_LIBAV_DEPENDENCIES = host-pkgconf gstreamer1 gst1-plugins-base
> -GST1_LIBAV_CONF_EXTRA_OPTS = --cross-prefix=$(TARGET_CROSS) --target-os=linux
> -
> -ifeq ($(BR2_PACKAGE_ZLIB),y)
> -GST1_LIBAV_CONF_EXTRA_OPTS += --enable-zlib
> -GST1_LIBAV_DEPENDENCIES += zlib
> -else
> -GST1_LIBAV_CONF_EXTRA_OPTS += --disable-zlib
> -endif
> -
> -ifeq ($(BR2_PACKAGE_BZIP2),y)
> -GST1_LIBAV_CONF_EXTRA_OPTS += --enable-bzlib
> -GST1_LIBAV_DEPENDENCIES += bzip2
> -else
> -GST1_LIBAV_CONF_EXTRA_OPTS += --disable-bzlib
> -endif

  ext/libav/Makefile.am contains a condition on HAVE_BZ2, so I think this should 
be kept.

  And while you're at it: there is an optional dependency on xz (HAVE_LZMA) so 
it would be nice to add that too (separate patch).


[Huge snip, yeah!]

> +GST1_LIBAV_CONF_OPTS = --with-system-libav
> +GST1_LIBAV_DEPENDENCIES = \
> +	host-pkgconf ffmpeg gstreamer1 gst1-plugins-base \
> +	$(if $(BR2_PACKAGE_BZIP2),bzip2) \
> +	$(if $(BR2_PACKAGE_XZ),xz)

  Oops, here it is!

  Small nit: I prefer a single dependency per line, it's a bit more verbose but 
easier to read IMHO.


  Since all my comments are actually addressed already:

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

  Regards,
  Arnout

>
>   $(eval $(autotools-package))
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
