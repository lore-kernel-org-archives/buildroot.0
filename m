From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Apr 2015 12:33:46 +0200
Subject: [Buildroot] [PATCH 1/1] Support for the Lamobo R1 a.k.a.
 BananaPi-R1 router board
In-Reply-To: <1426530919-27935-2-git-send-email-a.weiler@aldea.de>
References: <1426530919-27935-1-git-send-email-a.weiler@aldea.de>
 <1426530919-27935-2-git-send-email-a.weiler@aldea.de>
Message-ID: <20150406123346.3bfcae3f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Adrian Weiler,

On Mon, 16 Mar 2015 19:35:19 +0100, Adrian Weiler wrote:
> Signed-off-by: Adrian Weiler <a.weiler@aldea.de>
> ---
>  board/bananapi/r1/busybox.config                   | 1054 ++++
>  board/bananapi/r1/fs-overlay/etc/dnsmasq.conf      |  623 ++
>  board/bananapi/r1/fs-overlay/etc/hostapd.conf      |   18 +
>  board/bananapi/r1/fs-overlay/etc/init.d/S02led     |   32 +
>  board/bananapi/r1/fs-overlay/etc/network/eth0.up   |   19 +
>  .../bananapi/r1/fs-overlay/etc/network/interfaces  |   10 +
>  board/bananapi/r1/fs-overlay/etc/network/wlan0.up  |    9 +
>  board/bananapi/r1/fs-overlay/root/.ssh/.empty      |    0
>  board/bananapi/r1/linux-3.19.1.config              |  263 +
>  .../r1/patches/linux/linux-3.19-001-lamobo.patch   | 6004 ++++++++++++++++++++
>  board/bananapi/r1/patches/package/.empty           |    0
>  board/bananapi/r1/post-image.sh                    |  108 +
>  board/bananapi/r1/uEnv.txt                         |    6 +
>  boot/uboot/uboot-001-bananapi.patch                |   50 +
>  configs/lamobo_r1_defconfig                        |   62 +
>  package/Config.in                                  |    1 +
>  package/swconfig/001-no-uci.patch                  |  236 +
>  package/swconfig/Config.in                         |   11 +
>  package/swconfig/swconfig.mk                       |   24 +
>  19 files changed, 8530 insertions(+)

Thanks for this patch. However, it unfortunately doesn't match the type
of minimal defconfig that we currently accept in Buildroot. Our
defconfig are meant to generate a minimal system, that boots up to a
Busybox shell prompt. All the rest should be left to user's
customization.

> diff --git a/board/bananapi/r1/busybox.config b/board/bananapi/r1/busybox.config
> new file mode 100644
> index 0000000..a0846ae
> --- /dev/null
> +++ b/board/bananapi/r1/busybox.config

Why do you have a custom Busybox configuration? Isn't the default one
sufficient for your needs?


> diff --git a/board/bananapi/r1/fs-overlay/etc/dnsmasq.conf b/board/bananapi/r1/fs-overlay/etc/dnsmasq.conf
> new file mode 100644
> index 0000000..9748ddb
> --- /dev/null
> +++ b/board/bananapi/r1/fs-overlay/etc/dnsmasq.conf

What if I don't want to use dnsmasq on this platform? If you want to
turn the BananaPi-R1 into a proper router, then we could have two
separate defconfig files:

	lamobo_r1_defconfig		-> really minimal	
	lamobo_r1_router_defconfig	-> a router-like config

Also, maybe we can make this config file more minimal by only
keeping the non-commented lines?


> diff --git a/board/bananapi/r1/fs-overlay/root/.ssh/.empty b/board/bananapi/r1/fs-overlay/root/.ssh/.empty
> new file mode 100644
> index 0000000..e69de29

Why ?

> diff --git a/board/bananapi/r1/patches/linux/linux-3.19-001-lamobo.patch b/board/bananapi/r1/patches/linux/linux-3.19-001-lamobo.patch

This patch is really *huge*. Unlike OpenWRT, we clearly do not want to
have large kernel patches to maintain in Buildroot. Having a patch
adding a Device Tree, or fixing minor stuff is OK. Having a patch
adding an entire subsystem + drivers is not OK.

So either find a way of downloading this patch, or make Buildroot point
to a Git tree where a complete Git tree of the kernel can be found, or
work with the upstream kernel to get this stuff merged.


> diff --git a/package/swconfig/Config.in b/package/swconfig/Config.in
> new file mode 100644
> index 0000000..8817c3f
> --- /dev/null
> +++ b/package/swconfig/Config.in
> @@ -0,0 +1,11 @@
> +config BR2_PACKAGE_SWCONFIG
> +	bool "swconfig"
> +#	depends on BR2_PACKAGE_LIBNL
> +	select BR2_PACKAGE_LIBNL
> +	help
> +	  Configuration utility for the B53 switch on the Bananapi R1 router board
> +
> +	  http://openwrt.org
> +
> +#comment "swconfig needs libnl"
> +#	depends on !BR2_PACKAGE_LIBNL 

If I understand correctly, this utility is only useful in combination
with the OpenWRT-specific switch configuration subsystem that was added
by your patch. Since this subsystem is not in the mainline kernel, I'm
really unsure we want to have the corresponding userspace utilities in
Buildroot.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
