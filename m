From: Petr Vorel <petr.vorel@gmail.com>
Date: Tue, 27 Mar 2018 09:56:33 +0200
Subject: [Buildroot] [PATCH v1 1/2] gnutls: needs C++ support
In-Reply-To: <20180321202312.23021-1-ps.report@gmx.net>
References: <20180321202312.23021-1-ps.report@gmx.net>
Message-ID: <20180327075631.GE30827@x230>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

> Fixes Bug 10846 ([1]):

>   checking how to run the C++ preprocessor... cpp
>   configure: error: in `.../build/gnutls-3.5.17':
>   configure: error: C++ preprocessor "cpp" fails sanity check
>   See `config.log' for more details

> [1] https://bugs.busybox.net/show_bug.cgi?id=10846

> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/connman/Config.in         | 5 +++--
>  package/gnutls/Config.in          | 6 ++++--
>  package/libmicrohttpd/Config.in   | 6 ++++--
>  package/libsoup/Config.in         | 5 +++--
>  package/network-manager/Config.in | 6 ++++--
>  package/samba4/Config.in          | 4 ++++
>  package/taskd/Config.in           | 2 +-
>  package/vpnc/Config.in            | 6 ++++--
>  package/webkitgtk/Config.in       | 5 +++--
>  9 files changed, 30 insertions(+), 15 deletions(-)

> diff --git a/package/connman/Config.in b/package/connman/Config.in
> index 253c604e88..309a49829a 100644
> --- a/package/connman/Config.in
> +++ b/package/connman/Config.in
> @@ -34,14 +34,15 @@ config BR2_PACKAGE_CONNMAN_WIFI
>  config BR2_PACKAGE_CONNMAN_WISPR
>  	bool "enable WISPr support"
>  	depends on !BR2_STATIC_LIBS # gnutls
> +	depends on BR2_INSTALL_LIBSTDCPP # gnutls
>  	select BR2_PACKAGE_GNUTLS
>  	help
>  	  Enable support for Wireless Internet Service Provider
>  	  roaming (WISPr). A RADIUS server is used to authenticate the
>  	  subscriber's credentials.

> -comment "connman WISPr needs a toolchain w/ dynamic library"
> -	depends on BR2_STATIC_LIBS
> +comment "connman WISPr needs a toolchain w/ C++, dynamic library"
> +	depends on BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP

>  config BR2_PACKAGE_CONNMAN_BLUETOOTH
>  	bool "enable Bluetooth support"
> diff --git a/package/gnutls/Config.in b/package/gnutls/Config.in
> index 176951a385..8663788e94 100644
> --- a/package/gnutls/Config.in
> +++ b/package/gnutls/Config.in
> @@ -3,6 +3,7 @@ config BR2_PACKAGE_GNUTLS
>  	# https://gitlab.com/gnutls/gnutls/issues/203
>  	depends on !BR2_STATIC_LIBS
>  	depends on BR2_USE_WCHAR
> +	depends on BR2_INSTALL_LIBSTDCPP
>  	select BR2_PACKAGE_LIBTASN1
>  	select BR2_PACKAGE_LIBUNISTRING
>  	select BR2_PACKAGE_NETTLE
> @@ -25,5 +26,6 @@ config BR2_PACKAGE_GNUTLS_TOOLS

>  endif

> -comment "gnutls needs a toolchain w/ wchar, dynamic library"
> -	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS
> +comment "gnutls needs a toolchain w/ wchar, C++, dynamic library"
> +	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS  || \
> +		!BR2_INSTALL_LIBSTDCPP
> diff --git a/package/libmicrohttpd/Config.in b/package/libmicrohttpd/Config.in
> index 7f3c9bb8fd..9f074fb567 100644
> --- a/package/libmicrohttpd/Config.in
> +++ b/package/libmicrohttpd/Config.in
> @@ -13,12 +13,14 @@ config BR2_PACKAGE_LIBMICROHTTPD_SSL
>  	bool "https support"
>  	depends on !BR2_STATIC_LIBS # gnutls
>  	depends on BR2_USE_WCHAR
> +	depends on BR2_INSTALL_LIBSTDCPP # gnutls
>  	select BR2_PACKAGE_GNUTLS
>  	help
>  	  Enable HTTPS (SSL) support.

> -comment "libmicrohttpd https support needs a toolchain w/ wchar, dynamic library"
> -	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS
> +comment "libmicrohttpd https support needs a toolchain w/ wchar, C++, dynamic library"
> +	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS  || \
> +		!BR2_INSTALL_LIBSTDCPP

>  endif

> diff --git a/package/libsoup/Config.in b/package/libsoup/Config.in
> index 236d3c428a..70f7d28b6d 100644
> --- a/package/libsoup/Config.in
> +++ b/package/libsoup/Config.in
> @@ -23,13 +23,14 @@ config BR2_PACKAGE_LIBSOUP_GNOME
>  config BR2_PACKAGE_LIBSOUP_SSL
>  	bool "https support"
>  	depends on !BR2_STATIC_LIBS # gnutls
> +	depends on BR2_INSTALL_LIBSTDCPP # gnutls
>  	select BR2_PACKAGE_GLIB_NETWORKING
>  	select BR2_PACKAGE_GNUTLS
>  	help
>  	  Enable HTTPS (SSL) support.

> -comment "libsoup https support needs a toolchain w/ dynamic library"
> -	depends on BR2_STATIC_LIBS
> +comment "libsoup https support needs a toolchain w/ C++, dynamic library"
> +	depends on BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP

>  endif

> diff --git a/package/network-manager/Config.in b/package/network-manager/Config.in
> index 72658c1278..f480ca2d40 100644
> --- a/package/network-manager/Config.in
> +++ b/package/network-manager/Config.in
> @@ -2,6 +2,7 @@ config BR2_PACKAGE_NETWORK_MANAGER
>  	bool "networkmanager"
>  	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt
>  	depends on !BR2_STATIC_LIBS # gnutls
> +	depends on BR2_INSTALL_LIBSTDCPP # gnutls
>  	depends on BR2_USE_MMU # dbus
>  	depends on BR2_PACKAGE_HAS_UDEV
>  	# Tested with 3.2, but may even work with earlier versions
> @@ -64,8 +65,9 @@ config BR2_PACKAGE_NETWORK_MANAGER_OVS

>  endif

> -comment "NetworkManager needs udev /dev management and a glibc toolchain w/ headers >= 3.7, dynamic library"
> +comment "NetworkManager needs udev /dev management and a glibc toolchain w/ headers >= 3.7, C++, dynamic library"
>  	depends on BR2_USE_MMU
>  	depends on !BR2_PACKAGE_HAS_UDEV || \
>  		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7 || \
> -		!BR2_TOOLCHAIN_USES_GLIBC || BR2_STATIC_LIBS
> +		!BR2_TOOLCHAIN_USES_GLIBC || BR2_STATIC_LIBS  || \
> +		!BR2_INSTALL_LIBSTDCPP
> diff --git a/package/samba4/Config.in b/package/samba4/Config.in
> index 298fdc6608..b2d4379c0d 100644
> --- a/package/samba4/Config.in
> +++ b/package/samba4/Config.in
> @@ -29,10 +29,14 @@ if BR2_PACKAGE_SAMBA4

>  config BR2_PACKAGE_SAMBA4_AD_DC
>  	bool "AD DC"
> +	depends on BR2_INSTALL_LIBSTDCPP
>  	select BR2_PACKAGE_GNUTLS
>  	help
>  	  Enable Active Directory Domain Controller functionality.

> +comment "samba4 AD DC support needs a toolchain w/ C++"
> +	depends on !BR2_INSTALL_LIBSTDCPP
> +
>  config BR2_PACKAGE_SAMBA4_ADS
>  	bool "ADS"
>  	select BR2_PACKAGE_OPENLDAP
> diff --git a/package/taskd/Config.in b/package/taskd/Config.in
> index 19d123fb59..e4a1dfab4f 100644
> --- a/package/taskd/Config.in
> +++ b/package/taskd/Config.in
> @@ -3,7 +3,7 @@ config BR2_PACKAGE_TASKD
>  	depends on !BR2_STATIC_LIBS # gnutls
>  	depends on BR2_USE_WCHAR # gnutls
>  	depends on BR2_USE_MMU # fork()
> -	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_INSTALL_LIBSTDCPP # gnutls
>  	select BR2_PACKAGE_GNUTLS
>  	select BR2_PACKAGE_UTIL_LINUX
>  	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
> diff --git a/package/vpnc/Config.in b/package/vpnc/Config.in
> index 6455b0d87a..738413961c 100644
> --- a/package/vpnc/Config.in
> +++ b/package/vpnc/Config.in
> @@ -4,6 +4,7 @@ config BR2_PACKAGE_VPNC
>  	depends on !BR2_STATIC_LIBS # gnutls
>  	depends on BR2_USE_MMU # fork()
>  	depends on BR2_USE_WCHAR # gnutls
> +	depends on BR2_INSTALL_LIBSTDCPP # gnutls
>  	select BR2_PACKAGE_LIBGCRYPT
>  	select BR2_PACKAGE_LIBGPG_ERROR
>  	select BR2_PACKAGE_GNUTLS
> @@ -16,6 +17,7 @@ config BR2_PACKAGE_VPNC

>  	  http://www.unix-ag.uni-kl.de/~massar/vpnc

> -comment "vpnc needs a toolchain w/ wchar, dynamic library"
> +comment "vpnc needs a toolchain w/ wchar, C++, dynamic library"
>  	depends on BR2_USE_MMU
> -	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS
> +	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS || \
> +		!BR2_INSTALL_LIBSTDCPP
> diff --git a/package/webkitgtk/Config.in b/package/webkitgtk/Config.in
> index 31794ed2a4..10bd55ebb9 100644
> --- a/package/webkitgtk/Config.in
> +++ b/package/webkitgtk/Config.in
> @@ -56,13 +56,14 @@ if BR2_PACKAGE_WEBKITGTK
>  config BR2_PACKAGE_WEBKITGTK_HTTPS
>  	bool "HTTPS support"
>  	depends on !BR2_STATIC_LIBS # gnutls -> libsoup
> +	depends on BR2_INSTALL_LIBSTDCPP # gnutls -> libsoup
>  	select BR2_PACKAGE_CA_CERTIFICATES # runtime
>  	select BR2_PACKAGE_LIBSOUP_SSL
>  	help
>  	  Enable HTTPS protocol support.

> -comment "webkitgtk https support needs a toolchain w/ dynamic library"
> -	depends on BR2_STATIC_LIBS
> +comment "webkitgtk https support needs a toolchain w/ C++, dynamic library"
> +	depends on BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP

>  config BR2_PACKAGE_WEBKITGTK_MULTIMEDIA
>  	bool "multimedia support"

The only thing I can know and can confirm on this issue is that Connman and NetworkManager
depend on GnuTLS (NetworkManager can use NSS, but that IMHO not in buildroot).

Looking at GnuTLS it looks like it includes <cstdlib>, hence really depends on C++
toolchain.


Kind regards,
Petr
