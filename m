From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 27 Aug 2020 10:57:09 +0200
Subject: [Buildroot] [PATCH 1/1] add dependency on Linux headers >= 3.14
In-Reply-To: <20200827084954.15932-1-jugurtha.belkalem@smile.fr>
References: <20200827084954.15932-1-jugurtha.belkalem@smile.fr>
Message-ID: <20200827105709.67adf853@windsurf.hq.k.grp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

The commit title lacks the "package/iptraf-ng:" prefix.

On Thu, 27 Aug 2020 10:49:54 +0200
Jugurtha BELKALEM <jugurtha.belkalem@smile.fr> wrote:

> Iptraf-ng is compatible with Linux 3.14 as the last
> introduced various packet types like : PACKET_KERNEL and PACKET_USERSPACE[1].

I think the wording is not very clear. What about:

"iptraf-ng uses a number of definitions (PACKET_KERNEL,
PACKET_USERSPACE) provided by the Linux kernel headers, which were
introduced in Linux 3.14, so we need to add a dependency on
BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14"

> 
> [1] https://elixir.bootlin.com/linux/v3.14-rc1/source/include/uapi/linux/if_packet.h

Please add:

"""
Fixes:

  http://autobuild.buildroot.org/some reference to an autobuilder failure
"""

> diff --git a/package/iptraf-ng/Config.in b/package/iptraf-ng/Config.in
> index f240daf93d..18bd43add9 100644
> --- a/package/iptraf-ng/Config.in
> +++ b/package/iptraf-ng/Config.in
> @@ -1,6 +1,7 @@
>  config BR2_PACKAGE_IPTRAF_NG
>  	bool "iptraf-ng"
>  	depends on BR2_USE_MMU # fork()
> +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14
>  	select BR2_PACKAGE_NCURSES
>  	help
>  	  IPTraf-ng is a console-based network monitoring program for
> @@ -10,3 +11,6 @@ config BR2_PACKAGE_IPTRAF_NG
>  
>  	  IPTraf-ng is a fork of original IPTraf v3.0.0
>  	  (http://iptraf.seul.org).
> +
> +comment "iptraf-ng needs headers >= 3.14"

comment "iptraf-ng needs a toolchain w/ kernel headers >= 3.14"

> +	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14

you need:

	depends on BR2_USE_MMU

so that the comment doesn't show up when MMU support is not available.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
