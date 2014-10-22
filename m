From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 22 Oct 2014 19:10:29 +0200
Subject: [Buildroot] [PATCH v2 1/2] libupnpp: new package
In-Reply-To: <1413922320-15110-1-git-send-email-jkrause@posteo.de>
References: <1413922320-15110-1-git-send-email-jkrause@posteo.de>
Message-ID: <5447E505.10406@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 21/10/14 22:11, J?rg Krause wrote:
> Signed-off-by: J?rg Krause <jkrause@posteo.de>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

> ---
> Changes v1 -> v2:
>   - Fix package name in comment section
> ---
>  package/Config.in            |  1 +
>  package/libupnpp/Config.in   | 20 ++++++++++++++++++++
>  package/libupnpp/libupnpp.mk | 14 ++++++++++++++
>  3 files changed, 35 insertions(+)
>  create mode 100644 package/libupnpp/Config.in
>  create mode 100644 package/libupnpp/libupnpp.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 89b46dc..4626f00 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -816,6 +816,7 @@ menu "Networking"
>  	source "package/libtirpc/Config.in"
>  	source "package/libtorrent/Config.in"
>  	source "package/libupnp/Config.in"
> +	source "package/libupnpp/Config.in"
>  	source "package/libvncserver/Config.in"
>  	source "package/libwebsockets/Config.in"
>  	source "package/neon/Config.in"
> diff --git a/package/libupnpp/Config.in b/package/libupnpp/Config.in
> new file mode 100644
> index 0000000..795998b
> --- /dev/null
> +++ b/package/libupnpp/Config.in
> @@ -0,0 +1,20 @@
> +config BR2_PACKAGE_LIBUPNPP
> +	bool "libupnpp"
> +	select BR2_PACKAGE_EXPAT
> +	select BR2_PACKAGE_LIBCURL
> +	select BR2_PACKAGE_LIBUPNP
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_LARGEFILE # libupnp
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # libupnp
> +	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2014R1 # Too old gcc
> +	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2013R1 # Ditto
> +	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2 # Ditto
> +	help
> +	  The libupnpp C++ library wraps libupnp for easier use by upmpdcli and
> +	  upplay.
> +
> +	  http://www.lesbonscomptes.com/upmpdcli/
> +
> +comment "libupnpp needs a toolchain w/ C++, largefile, threads"
> +	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_LARGEFILE || \
> +		!BR2_TOOLCHAIN_HAS_THREADS
> diff --git a/package/libupnpp/libupnpp.mk b/package/libupnpp/libupnpp.mk
> new file mode 100644
> index 0000000..d46de14
> --- /dev/null
> +++ b/package/libupnpp/libupnpp.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# libupnpp
> +#
> +################################################################################
> +
> +LIBUPNPP_VERSION = 0.8.5
> +LIBUPNPP_SITE = http://www.lesbonscomptes.com/upmpdcli/downloads
> +LIBUPNPP_LICENSE = GPLv2+
> +LIBUPNPP_LICENSE_FILES = COPYING
> +LIBUPNPP_INSTALL_STAGING = YES
> +LIBUPNPP_DEPENDENCIES = expat libcurl libupnp
> +
> +$(eval $(autotools-package))
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
