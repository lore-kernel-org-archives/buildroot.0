From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 10 Feb 2014 13:53:18 +0100
Subject: [Buildroot] [PATCH v2] libtorrent: disable on ARC arch
In-Reply-To: <1392035982-26386-1-git-send-email-anton.kolesov@synopsys.com>
References: <20140210131734.15cad107@skate>
 <1392035982-26386-1-git-send-email-anton.kolesov@synopsys.com>
Message-ID: <20140210135318.4fc79cae@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Anton Kolesov,

On Mon, 10 Feb 2014 16:39:42 +0400, Anton Kolesov wrote:
> Is that better?

This "Is that better?" shouldn't be part of the commit log. Instead, it
should be below the "---" sign.

> 
> Libtorrent has dependencies on atomic operations. However ARC GCC doesn't
> implement those at the moment so package should be disabled. Rtorrent
> depends on libtorrent.
> 
> This fixes:
> http://autobuild.buildroot.net/results/51414e22c8ea47c38df20d864526a370c5a895d7/
> 
> Signed-off-by: Anton Kolesov <anton.kolesov@synopsys.com>
> ---
>  package/libtorrent/Config.in | 3 +++
>  package/rtorrent/Config.in   | 1 +
>  2 files changed, 4 insertions(+)
> 
> diff --git a/package/libtorrent/Config.in b/package/libtorrent/Config.in
> index a7e358d..a21bf95 100644
> --- a/package/libtorrent/Config.in
> +++ b/package/libtorrent/Config.in
> @@ -2,6 +2,8 @@ config BR2_PACKAGE_LIBTORRENT
>  	bool "libtorrent"
>  	depends on BR2_INSTALL_LIBSTDCPP
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	# ARC GCC doesn't support atomic instructions required by this lib
> +	depends on !BR2_arc
>  	select BR2_PACKAGE_LIBSIGC
>  	help
>  	  BitTorrent library written in C++ for *nix
> @@ -10,3 +12,4 @@ config BR2_PACKAGE_LIBTORRENT
>  
>  comment "libtorrent needs a toolchain w/ C++, threads"
>  	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
> +	depends on !BR2_arc
> diff --git a/package/rtorrent/Config.in b/package/rtorrent/Config.in
> index 0f39a92..f2dc47b 100644
> --- a/package/rtorrent/Config.in
> +++ b/package/rtorrent/Config.in
> @@ -17,3 +17,4 @@ config BR2_PACKAGE_RTORRENT
>  comment "rtorrent needs a toolchain w/ C++, threads, wchar"
>  	depends on BR2_USE_MMU
>  	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS)
> +	depends on !BR2_arc

It should also be propagated as a dependency of the
BR2_PACKAGE_RTORRENT option itself, so that this package cannot be
selected on ARC.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
