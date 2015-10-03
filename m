From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 3 Oct 2015 21:49:34 +0100
Subject: [Buildroot] [PATCH v2 2/4] blackfin: 2012R2 toolchain is gone,
 remove kludges
In-Reply-To: <1443901828-11390-2-git-send-email-maxime.hadjinlian@gmail.com>
References: <1443901828-11390-1-git-send-email-maxime.hadjinlian@gmail.com>
 <1443901828-11390-2-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <56103F5E.50500@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03-10-15 20:50, Maxime Hadjinlian wrote:
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

> ---
> v1 -> v2:
>     - Remove comments for libtirpc
> ---
>  package/dhcpcd/Config.in   | 2 --
>  package/glog/Config.in     | 2 --
>  package/libtirpc/Config.in | 7 -------
>  package/openpgm/Config.in  | 1 -
>  package/rpcbind/Config.in  | 4 ----
>  package/zeromq/Config.in   | 1 -
>  package/zyre/Config.in     | 4 ----
>  7 files changed, 21 deletions(-)
> 
> diff --git a/package/dhcpcd/Config.in b/package/dhcpcd/Config.in
> index 88f2e48..ece08d2 100644
> --- a/package/dhcpcd/Config.in
> +++ b/package/dhcpcd/Config.in
> @@ -3,8 +3,6 @@ comment "dhcpcd needs a toolchain w/ headers >= 3.1"
>  
>  config BR2_PACKAGE_DHCPCD
>  	bool "dhcpcd"
> -	# No support for AI_ADDRCONFIG
> -	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2
>  	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_1 # sa_family_t in linux/socket.h
>  	help
>  	  An RFC2131 compliant DHCP client
> diff --git a/package/glog/Config.in b/package/glog/Config.in
> index 3f54020..1c48ed9 100644
> --- a/package/glog/Config.in
> +++ b/package/glog/Config.in
> @@ -6,7 +6,6 @@ config BR2_PACKAGE_GLOG
>  	# build issues with these external toolchains
>  	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2014R1
>  	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2013R1
> -	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2
>  	help
>  	  C++ implementation of the Google logging module
>  
> @@ -15,6 +14,5 @@ config BR2_PACKAGE_GLOG
>  comment "glog needs a toolchain w/ C++, threads, dynamic library"
>  	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2014R1
>  	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2013R1
> -	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2
>  	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
>  		BR2_STATIC_LIBS
> diff --git a/package/libtirpc/Config.in b/package/libtirpc/Config.in
> index a8e6dd3..2e9c939 100644
> --- a/package/libtirpc/Config.in
> +++ b/package/libtirpc/Config.in
> @@ -1,11 +1,5 @@
>  config BR2_PACKAGE_LIBTIRPC
>  	bool "libtirpc"
> -	# uClibc toolchains provided by ADI don't have AI_ADDRCONFIG
> -	# support. Note that since they provide native RPC support, we
> -	# don't need to propagate this dependency to reverse
> -	# dependencies of libtirpc for which native RPC support can be
> -	# used instead of libtirpc.
> -	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	help
>  	  Libtirpc is a port of Sun's Transport-Independent RPC
> @@ -14,5 +8,4 @@ config BR2_PACKAGE_LIBTIRPC
>  	  http://sourceforge.net/projects/libtirpc/
>  
>  comment "libtirpc needs a toolchain w/ threads"
> -	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2
>  	depends on !BR2_TOOLCHAIN_HAS_THREADS
> diff --git a/package/openpgm/Config.in b/package/openpgm/Config.in
> index cef5ed4..3e90422 100644
> --- a/package/openpgm/Config.in
> +++ b/package/openpgm/Config.in
> @@ -3,7 +3,6 @@ config BR2_PACKAGE_OPENPGM
>  	# The following toolchains lack required compiler intrinsics
>  	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2014R1
>  	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2013R1
> -	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	depends on BR2_USE_WCHAR
>  	help
> diff --git a/package/rpcbind/Config.in b/package/rpcbind/Config.in
> index 2a79bdc..9ff64a5 100644
> --- a/package/rpcbind/Config.in
> +++ b/package/rpcbind/Config.in
> @@ -4,9 +4,6 @@ config BR2_PACKAGE_RPCBIND
>  	# implementation of toolchains.
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # libtirpc
>  	select BR2_PACKAGE_LIBTIRPC
> -	# uClibc toolchains provided by ADI don't have AI_ADDRCONFIG
> -	# support, needed for libtirpc
> -	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2
>  	# fork()
>  	depends on BR2_USE_MMU
>  	help
> @@ -14,6 +11,5 @@ config BR2_PACKAGE_RPCBIND
>  	  into universal addresses.
>  
>  comment "rpcbind needs a toolchain w/ threads"
> -	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2
>  	depends on !BR2_TOOLCHAIN_HAS_THREADS
>  	depends on BR2_USE_MMU
> diff --git a/package/zeromq/Config.in b/package/zeromq/Config.in
> index 9277653..aa5c1a8 100644
> --- a/package/zeromq/Config.in
> +++ b/package/zeromq/Config.in
> @@ -31,7 +31,6 @@ config BR2_PACKAGE_ZEROMQ_PGM
>  	bool "PGM/EPGM support"
>  	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2014R1 # openpgm
>  	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2013R1 # openpgm
> -	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2 # openpgm
>  	select BR2_PACKAGE_OPENPGM
>  	help
>  	  Add support for Pragmatic General Multicast protocol (RFC 3208)
> diff --git a/package/zyre/Config.in b/package/zyre/Config.in
> index 95cbf95..a6aef60 100644
> --- a/package/zyre/Config.in
> +++ b/package/zyre/Config.in
> @@ -4,9 +4,6 @@ config BR2_PACKAGE_ZYRE
>  	depends on BR2_USE_WCHAR # zeromq
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # zeromq
>  	depends on BR2_USE_MMU # czmq
> -	# uClibc toolchains provided by ADI don't have AI_ADDRCONFIG
> -	# support, needed by czmq
> -	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2
>  	select BR2_PACKAGE_CZMQ
>  	select BR2_PACKAGE_ZEROMQ
>  	help
> @@ -17,6 +14,5 @@ config BR2_PACKAGE_ZYRE
>  
>  comment "zyre needs a toolchain w/ C++, wchar, threads"
>  	depends on BR2_USE_MMU
> -	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2
>  	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_USE_WCHAR && \
>  		BR2_TOOLCHAIN_HAS_THREADS)
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
