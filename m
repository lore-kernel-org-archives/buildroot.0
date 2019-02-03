From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 3 Feb 2019 20:28:51 +0100
Subject: [Buildroot] [PATCH 1/1] linux: add option to enable generation
 of DTBs symbols
In-Reply-To: <20190105105909.31359-1-titouan.christophe@railnova.eu>
References: <20190105105909.31359-1-titouan.christophe@railnova.eu>
Message-ID: <348bdec7-1518-74f4-de31-c29878b29e18@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Titouan,

On 05/01/2019 11:59, Titouan Christophe wrote:
> Add an option to compile device trees in Linux with symbol generation
> such that device tree overlays can be loaded on the target system
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
> ---
>  linux/Config.in | 8 ++++++++
>  linux/linux.mk  | 4 ++++
>  2 files changed, 12 insertions(+)
> 
> diff --git a/linux/Config.in b/linux/Config.in
> index 9a4d46e534..6d695be6c3 100644
> --- a/linux/Config.in
> +++ b/linux/Config.in
> @@ -392,6 +392,14 @@ config BR2_LINUX_KERNEL_CUSTOM_DTS_PATH
>  	  You can provide a list of dts paths to copy and
>  	  build, separated by spaces.
>  
> +config BR2_LINUX_KERNEL_DTB_WITH_SYMBOLS
> +	bool "Enable the generation of symbols in the linux device tree"
> +	default n

 We don't put "default n" because that's implicit.

> +	help
> +	  If enabled, pass the "-@" option to the device tree compiler,
> +	  such that symbols in compiled device tree are visible.
> +	  Choose this option to support devicetree overlays
> +
>  endif
>  
>  config BR2_LINUX_KERNEL_INSTALL_TARGET
> diff --git a/linux/linux.mk b/linux/linux.mk
> index 6bf2b88038..59c7268e49 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -381,6 +381,10 @@ ifeq ($(BR2_LINUX_KERNEL_DTS_SUPPORT),y)
>  # reproducibility, we use our owns rather than the host ones.
>  LINUX_DEPENDENCIES += host-bison host-flex
>  
> +ifeq ($(BR2_LINUX_KERNEL_DTB_WITH_SYMBOLS),y)
> +	LINUX_MAKE_ENV += DTC_FLAGS=-@
> +endif

 The other LINUX_MAKE_ENV settings are all the way in the beginning of the file,
so this one should be there as well.

 I've fixed both issues and applied, thanks.

 And this is a patch which I've actually used myself!

 Regards,
 Arnout

> +
>  ifeq ($(BR2_LINUX_KERNEL_DTB_IS_SELF_BUILT),)
>  define LINUX_BUILD_DTB
>  	$(LINUX_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) $(LINUX_DTBS)
> 
