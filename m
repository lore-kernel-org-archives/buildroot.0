From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 6 Nov 2017 07:30:03 +0200
Subject: [Buildroot] [PATCH] ethtool: Allow enabling/disabling pretty
 printing
In-Reply-To: <20171106012906.22000-1-f.fainelli@gmail.com>
References: <20171106012906.22000-1-f.fainelli@gmail.com>
Message-ID: <20171106053002.br4zv6aq3hvjc4q7@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Florian,

On Sun, Nov 05, 2017 at 05:29:06PM -0800, Florian Fainelli wrote:
> Ethtool has a configure script option allowing the enabling or disabling of
> pretty printing for drivers, SFP modules etc which can save a significant
> amount of bytes on the root filesystem. Allow selecting that, and turn it on by
> default (like ethtool's configure script).

Have you measured the impact on the target size?

A test build I ran here (ARM Cortex-A9, musl) showed a significant reduction 
of the (stripped) binary size from 233124 to 60408.

baruch

> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> ---
>  package/ethtool/Config.in  | 10 ++++++++++
>  package/ethtool/ethtool.mk |  2 ++
>  2 files changed, 12 insertions(+)
> 
> diff --git a/package/ethtool/Config.in b/package/ethtool/Config.in
> index 09704979e864..77795a838971 100644
> --- a/package/ethtool/Config.in
> +++ b/package/ethtool/Config.in
> @@ -5,3 +5,13 @@ config BR2_PACKAGE_ETHTOOL
>  	  ethernet-based network interface.
>  
>  	  https://www.kernel.org/pub/software/network/ethtool/
> +
> +if BR2_PACKAGE_ETHTOOL
> +
> +	config BR2_PACKAGE_ETHTOOL_PRETTY_PRINT
> +		bool "enable pretty printing"
> +		default y
> +		help
> +		  Enables ethtool's pretty printing for drivers
> +		  and SFP modules.
> +endif
> diff --git a/package/ethtool/ethtool.mk b/package/ethtool/ethtool.mk
> index 991df499a8fd..d8ebba5fae05 100644
> --- a/package/ethtool/ethtool.mk
> +++ b/package/ethtool/ethtool.mk
> @@ -9,5 +9,7 @@ ETHTOOL_SOURCE = ethtool-$(ETHTOOL_VERSION).tar.xz
>  ETHTOOL_SITE = $(BR2_KERNEL_MIRROR)/software/network/ethtool
>  ETHTOOL_LICENSE = GPL-2.0
>  ETHTOOL_LICENSE_FILES = COPYING
> +ETHTOOL_CONF_OPTS = \
> +	$(if $(BR2_PACKAGE_ETHTOOL_PRETTY_PRINT),--enable-pretty-dump,--disable-pretty-dump)

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
