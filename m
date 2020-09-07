From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 7 Sep 2020 22:50:44 +0200
Subject: [Buildroot] [PATCH 1/1] package/easyframes: fix missing
 dependency
In-Reply-To: <20200907202756.1516192-1-horatiu.vultur@microchip.com>
References: <20200907202756.1516192-1-horatiu.vultur@microchip.com>
Message-ID: <20200907225044.0f1860b9@windsurf.hq.k.grp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 7 Sep 2020 22:27:55 +0200
Horatiu Vultur via buildroot <buildroot@busybox.net> wrote:

> Easyframes uses fork when capturing frames in a pcap file, therefore add
> the dependency BR2_USE_MMU.
> 
> Signed-off-by: Horatiu Vultur <horatiu.vultur@microchip.com>
> ---
>  package/easyframes/Config.in | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/easyframes/Config.in b/package/easyframes/Config.in
> index b2c45496b4..b2307fbf59 100644
> --- a/package/easyframes/Config.in
> +++ b/package/easyframes/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_EASYFRAMES
>  	bool "easyframes"
> +	depends on BR2_USE_MMU # fork()
>  	select BR2_PACKAGE_LIBPCAP
>  	help
>  	  This is a small and simple command-line tool for network
> @@ -8,3 +9,6 @@ config BR2_PACKAGE_EASYFRAMES
>  	  received.
>  
>  	  https://github.com/microchip-ung/easyframes
> +
> +comment "easyframe needs a toolchain w/ MMU"
> +	depends on !BR2_USE_MMU

We don't add Config.in comments for the MMU dependency. Indeed, you
cannot change a toolchain to have MMU support: it's a characteristic of
the CPU architecture. If you CPU architecture has no MMU, there's
nothing you can do about it.

So I've dropped the Config.in comment, and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
