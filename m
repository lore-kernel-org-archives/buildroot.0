From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 21 Apr 2016 22:04:55 +0200
Subject: [Buildroot] [PATCH 2/2] mpv: new package
In-Reply-To: <1461246857-5634-2-git-send-email-gustavo@zacarias.com.ar>
References: <1461246857-5634-1-git-send-email-gustavo@zacarias.com.ar>
 <1461246857-5634-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <57193267.7050706@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/21/16 15:54, Gustavo Zacarias wrote:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>   package/Config.in                                  |   1 +
>   ...ript-don-t-check-for-fork-on-POSIX-checks.patch |  31 +++
>   package/mpv/Config.in                              |  15 ++
>   package/mpv/mpv.hash                               |   3 +
>   package/mpv/mpv.mk                                 | 255 +++++++++++++++++++++
>   5 files changed, 305 insertions(+)
>   create mode 100644 package/mpv/0001-wscript-don-t-check-for-fork-on-POSIX-checks.patch
>   create mode 100644 package/mpv/Config.in
>   create mode 100644 package/mpv/mpv.hash
>   create mode 100644 package/mpv/mpv.mk
>
[snip]
> diff --git a/package/mpv/Config.in b/package/mpv/Config.in
> new file mode 100644
> index 0000000..87644cb
> --- /dev/null
> +++ b/package/mpv/Config.in
> @@ -0,0 +1,15 @@
> +config BR2_PACKAGE_MPV
> +	bool "mpv"
> +	depends on BR2_TOOLCHAIN_HAS_THREADS

	depends on !BR2_nios2 # ffmpeg

> +	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
> +	select BR2_PACKAGE_FFMPEG
> +	select BR2_PACKAGE_FFMPEG_SWSCALE
> +	select BR2_PACKAGE_ZLIB
> +	help
> +	  mpv is a fork of mplayer2 and MPlayer. It shares some features
> +	  with the former projects while introducing many more.
> +
> +	  https://mpv.io/
> +
> +comment "mpv needs a toolchain w/ threads"
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS

	depends on !BR2_nios2

> diff --git a/package/mpv/mpv.hash b/package/mpv/mpv.hash
> new file mode 100644
> index 0000000..da51f3a
> --- /dev/null
> +++ b/package/mpv/mpv.hash
> @@ -0,0 +1,3 @@
> +# Locally calculated
> +sha256	602cd2b0f5fc7e43473234fbb96e3f7bbb6418f15eb8fa720d9433cce31eba6e	v0.17.0.tar.gz
> +sha256	01bf2beab2106d1558800c8709bc2c8e496d3da4a2ca343fe091f22fca60c98b	waf-1.8.12
> diff --git a/package/mpv/mpv.mk b/package/mpv/mpv.mk
> new file mode 100644
> index 0000000..0032eb5
> --- /dev/null
> +++ b/package/mpv/mpv.mk
> @@ -0,0 +1,255 @@
> +################################################################################
> +#
> +# mpv
> +#
> +################################################################################
> +
> +MPV_VERSION = 0.17.0
> +MPV_WAF_VERSION = 1.8.12
> +MPV_SITE = https://github.com/mpv-player/mpv/archive
> +MPV_SOURCE = v$(MPV_VERSION).tar.gz
> +MPV_EXTRA_DOWNLOADS = https://waf.io/waf-$(MPV_WAF_VERSION)

  Weird that an uploaded tarball doesn't include waf...

  It may make sense to create a host-waf package that does downloads the 
prebuilt self-extractor. This would allow us to remove the dependency on 
host-python for all the packages that use waf, because current waf supports 
python 2.5-3.5, which is plenty for us I think.


  Otherwise looks good to me.

  Regards,
  Arnout

> +MPV_DEPENDENCIES = \
> +	host-pkgconf ffmpeg zlib \
> +	$(if $(BR2_PACKAGE_LIBICONV),libiconv)
> +MPV_LICENSE = GPLv2+
> +MPV_LICENSE_FILES = LICENSE

[snip]


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
