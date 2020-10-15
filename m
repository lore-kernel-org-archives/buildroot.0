From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 15 Oct 2020 17:36:51 +0300
Subject: [Buildroot] [PATCH v2 1/1] package/opensc: new package
In-Reply-To: <EoHQ0C-Dvp4Cia0SheSoUxrsbGY8PqLc0VwsEXEVIbzeFmLwuA4h4gQTp7eGKuIqb9TX6g2Apca783OZnilduGGOI99CzvA5jtVnT2DV66E=@protonmail.com>
References: <EoHQ0C-Dvp4Cia0SheSoUxrsbGY8PqLc0VwsEXEVIbzeFmLwuA4h4gQTp7eGKuIqb9TX6g2Apca783OZnilduGGOI99CzvA5jtVnT2DV66E=@protonmail.com>
Message-ID: <87ft6fsgho.fsf@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yair,

On Thu, Oct 15 2020, Yair Ben-Avraham via buildroot wrote:
> Open source smart card tools and middleware.
> OpenSC provides a set of libraries and utilities to work with smart cards. Its
> main focus is on cards that support cryptographic operations, and facilitate
> their use in security applications such as authentication, mail encryption and
> digital signatures. OpenSC implements the standard APIs to smart cards, e.g.
> PKCS#11 API, Windows? Smart Card Minidriver and macOS CryptoTokenKit.
>
> Signed-off-by: Yair Ben-Avraham <yairba@protonmail.com>
> ---
>  package/Config.in          |  1 +
>  package/opensc/Config.in   | 24 ++++++++++++++++++++++++
>  package/opensc/opensc.hash |  3 +++
>  package/opensc/opensc.mk   | 14 ++++++++++++++
>  4 files changed, 42 insertions(+)
>  create mode 100644 package/opensc/Config.in
>  create mode 100644 package/opensc/opensc.hash
>  create mode 100644 package/opensc/opensc.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 09a332e3b9..1a697352c9 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1353,6 +1353,7 @@ menu "Crypto"
>  	source "package/libuecc/Config.in"
>  	source "package/mbedtls/Config.in"
>  	source "package/nettle/Config.in"
> +	source "package/opensc/Config.in"
>  	source "package/openssl/Config.in"
>  	source "package/pkcs11-helper/Config.in"
>  	source "package/rhash/Config.in"
> diff --git a/package/opensc/Config.in b/package/opensc/Config.in
> new file mode 100644
> index 0000000000..596f50aa65
> --- /dev/null
> +++ b/package/opensc/Config.in
> @@ -0,0 +1,24 @@
> +config BR2_PACKAGE_OPENSC
> +	bool "opensc"
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # pcsc-lite, libusb
> +	depends on BR2_USE_MMU # pcsc-lite
> +	depends on BR2_USE_WCHAR # wprintf
> +	depends on !BR2_STATIC_LIBS # pcsc-lite
> +	select BR2_PACKAGE_LIBUSB
> +	select BR2_PACKAGE_PCSC_LITE
> +	help
> +	  Open source smart card tools and middleware.
> +	  OpenSC provides a set of libraries and utilities to work with smart
> +	  cards. Its main focus is on cards that support cryptographic
> +	  operations, and facilitate their use in security applications such as
> +	  authentication, mail encryption and digital signatures. OpenSC
> +	  implements the standard APIs to smart cards, e.g. PKCS#11 API,
> +	  Windows? Smart Card Minidriver and macOS CryptoTokenKit.
> +
> +	  https://github.com/OpenSC/OpenSC
> +
> +comment "opensc needs a toolchain w/ wchar threads, dynamic library"
> +	depends on BR2_USE_MMU
> +	depends on BR2_USE_WCHAR
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
> +		BR2_STATIC_LIBS

We want to show this comment when any one of the dependencies) is not
satisfied (except from MMU). So

	depends on BR2_USE_MMU
	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR \
		|| BR2_STATIC_LIBS

baruch

> diff --git a/package/opensc/opensc.hash b/package/opensc/opensc.hash
> new file mode 100644
> index 0000000000..aceb51e2de
> --- /dev/null
> +++ b/package/opensc/opensc.hash
> @@ -0,0 +1,3 @@
> +# Locally computed:
> +sha256  bbf4b4f4a44463645c90a525e820a8059b2f742a53b7b944f941de3c97ba4863  opensc-0.20.0.tar.gz
> +sha256  a190dc9c8043755d90f8b0a75fa66b9e42d4af4c980bf5ddc633f0124db3cee7  COPYING
> diff --git a/package/opensc/opensc.mk b/package/opensc/opensc.mk
> new file mode 100644
> index 0000000000..8bd6fceece
> --- /dev/null
> +++ b/package/opensc/opensc.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# opensc
> +#
> +################################################################################
> +
> +OPENSC_VERSION = 0.20.0
> +OPENSC_SITE = https://github.com/OpenSC/OpenSC/releases/download/$(OPENSC_VERSION)
> +OPENSC_LICENSE = LGPL-2.1+
> +OPENSC_LICENSE_FILES = COPYING
> +OPENSC_INSTALL_STAGING = YES
> +OPENSC_DEPENDENCIES = libusb pcsc-lite
> +
> +$(eval $(autotools-package))


-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
