From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Wed, 15 Feb 2017 15:06:02 +0100
Subject: [Buildroot] [PATCH v2] package/mpd: add choice between version
	0.19 and 0.20
In-Reply-To: <20170215093331.31040-1-joerg.krause@embedded.rocks>
References: <20170215093331.31040-1-joerg.krause@embedded.rocks>
Message-ID: <1487167562.19185.7.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Wed, 2017-02-15 at 10:33 +0100, J?rg Krause wrote:
> MPD version 0.20 being affected by GCC PR libstdc++/64735 means no
> mpd package
> available in Buildroot for the architectures NIOSII, ARMv4, ARMv5 and
> SPARCv8
> until GCC 7 is released.
> 
> As the next Buildroot release is in 2017.02, which is before GCC 7 is
> expected
> to be finished we add hidden config symbols to select the version
> branch to use.
> 
> Note, that we bumped the version from 0.19 to 0.20 quite recently
> within the
> current Buildroot release cycle. This way we can keep the support for
> mpd on
> the affected architectures, like ARMv5, until GCC 7 is out.
> 
> Note, that version 0.19 requires libglib2.
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
> Changes v2:
> ?* add missing hash for version 0.19.21
> ?* remove of visible options (suggested by Thomas)
> ---
> ?package/mpd/Config.in | 26 +++++++++++++++++++++-----
> ?package/mpd/mpd.hash??|??1 +
> ?package/mpd/mpd.mk????| 10 +++++++++-
> ?3 files changed, 31 insertions(+), 6 deletions(-)
> 
> diff --git a/package/mpd/Config.in b/package/mpd/Config.in
> index 8a28b4f1a..8eabbbc79 100644
> --- a/package/mpd/Config.in
> +++ b/package/mpd/Config.in
> @@ -4,9 +4,10 @@ menuconfig BR2_PACKAGE_MPD
> ?	depends on BR2_USE_WCHAR # flac
> ?	depends on BR2_TOOLCHAIN_HAS_THREADS
> ?	depends on BR2_USE_MMU # fork
> -	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++14
> -	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735
> ?	depends on BR2_TOOLCHAIN_HAS_ATOMIC
> +	# 0.19.x could be built with GCC 4.6, but for simplicity we
> require
> +	# the same toolchain dependencies for all versions.
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++14
> ?	select BR2_PACKAGE_BOOST
> ?	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
> ?	select BR2_PACKAGE_MPD_TREMOR if !(BR2_PACKAGE_MPD_MAD ||
> BR2_PACKAGE_MPD_MPG123 || BR2_PACKAGE_MPD_VORBIS ||
> BR2_PACKAGE_MPD_WAVPACK || BR2_PACKAGE_MPD_FLAC ||
> BR2_PACKAGE_MPD_MUSEPACK || BR2_PACKAGE_MPD_FFMPEG)
> @@ -20,6 +21,24 @@ menuconfig BR2_PACKAGE_MPD
> ?
> ?if BR2_PACKAGE_MPD
> ?
> +# Hidden config symbols to select the branch 0.20 by default and
> fallback
> +# to branch 0.19 for toolchains affected by GCC bug PR 64735. This
> way we
> +# keep support for mpd on some architectures, like ARMv5, until GCC
> 7 is
> +# released, which will fix this issue.
> +config BR2_PACKAGE_MPD_VERSION_STRING
> +	string
> +	default "0.20" if !BR2_TOOLCHAIN_HAS_GCC_BUG_64735
> +	default "0.19"
> +
> +config BR2_PACKAGE_MPD_VERSION_0_20
> +	bool
> +	default y if BR2_PACKAGE_MPD_VERSION_STRING = "0.20"
> +
> +config BR2_PACKAGE_MPD_VERSION_0_19
> +	bool
> +	default y if BR2_PACKAGE_MPD_VERSION_STRING = "0.19"
> +	select BR2_PACKAGE_LIBGLIB2
> +
> ?comment "Archive plugins"
> ?
> ?config BR2_PACKAGE_MPD_BZIP2
> @@ -320,6 +339,3 @@ comment "mpd needs a toolchain w/ C++, threads,
> wchar, gcc >= 4.9"
> ?	depends on BR2_TOOLCHAIN_HAS_ATOMIC
> ?	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
> ?		!BR2_TOOLCHAIN_HAS_THREADS ||
> !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
> -
> -comment "mpd needs a toolchain not affected by GCC bug 64735"
> -	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
> diff --git a/package/mpd/mpd.hash b/package/mpd/mpd.hash
> index ee46f3cc5..ecd78e97c 100644
> --- a/package/mpd/mpd.hash
> +++ b/package/mpd/mpd.hash
> @@ -1,2 +1,3 @@
> ?# Locally calculated after checking pgp signature
> ?sha256??712b25351c12616630c580204e1c3dcba3ae2993a56cff1c346c87e334d6
> 9728??mpd-0.20.4.tar.xz
> +sha256??8305b8bc026f4b6bde28b8dd09bfdddbe5590acf36358eed4d083a396e30
> 1730??mpd-0.19.21.tar.xz
> diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
> index 0efc8685f..74f966c9f 100644
> --- a/package/mpd/mpd.mk
> +++ b/package/mpd/mpd.mk
> @@ -4,8 +4,12 @@
> ?#
> ?####################################################################
> ############
> ?
> -MPD_VERSION_MAJOR = 0.20
> +MPD_VERSION_MAJOR = $(BR2_PACKAGE_MPD_VERSION_STRING)
> +ifeq ($(BR2_PACKAGE_MPD_VERSION_0_20),y)
> ?MPD_VERSION = $(MPD_VERSION_MAJOR).4
> +else
> +MPD_VERSION = $(MPD_VERSION_MAJOR).21
> +endif
> ?MPD_SOURCE = mpd-$(MPD_VERSION).tar.xz
> ?MPD_SITE = http://www.musicpd.org/download/mpd/$(MPD_VERSION_MAJOR)
> ?MPD_DEPENDENCIES = host-pkgconf boost
> @@ -13,6 +17,10 @@ MPD_LICENSE = GPLv2+
> ?MPD_LICENSE_FILES = COPYING
> ?MPD_AUTORECONF = YES
> ?
> +ifeq ($(BR2_MPD_VERSION_0_19),y)
> +MPD_DEPENDENCIES += libglib2
> +endif
> +
> ?# Some options need an explicit --disable or --enable
> ?
> ?# Zeroconf support depends on libdns_sd from avahi.

Note that this patch is targeted for the master branch.

Thanks!

J?rg
