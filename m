From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 14 Dec 2020 22:53:57 +0100
Subject: [Buildroot] [PATCH 1/2] {linux, linux-headers}: add version 5.10
In-Reply-To: <20201214093724.1129-1-michael@walle.cc>
References: <20201214093724.1129-1-michael@walle.cc>
Message-ID: <f8af6308-d84a-df47-4aa1-3f65009cc296@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Michael,

Le 14/12/2020 ? 10:37, Michael Walle a ?crit?:
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
>  linux/Config.in                                     |  4 ++--
>  linux/linux.hash                                    |  1 +
>  package/linux-headers/Config.in.host                | 13 +++++++++++--
>  toolchain/Config.in                                 |  5 +++++
>  .../toolchain-external-custom/Config.in.options     |  6 +++++-
>  5 files changed, 24 insertions(+), 5 deletions(-)
> 
> diff --git a/linux/Config.in b/linux/Config.in
> index 8b753e6c10..fd6174747e 100644
> --- a/linux/Config.in
> +++ b/linux/Config.in
> @@ -28,7 +28,7 @@ choice
>  	prompt "Kernel version"
>  
>  config BR2_LINUX_KERNEL_LATEST_VERSION
> -	bool "Latest version (5.9)"
> +	bool "Latest version (5.10)"


Bumping the kernel version this time requires to take into account cpu variant
removed in this release. AFAIK PowerPC 601 has been removed [1].

For the PowerPC 40x will likely be removed for 5.11 [2].

Since we don't have any defconfig using BR2_powerpc_601, we can probably remove it.

[1]
https://www.phoronix.com/scan.php?page=news_item&px=Linux-5.10-Dropping-PowerPC-601
[2]
https://www.phoronix.com/scan.php?page=news_item&px=PowerPC-40x-400-Linux-Removal

Best regards,
Romain

>  
>  config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
>  	bool "Latest CIP SLTS version (4.19.152-cip37)"
> @@ -125,7 +125,7 @@ endif
>  
>  config BR2_LINUX_KERNEL_VERSION
>  	string
> -	default "5.9.11" if BR2_LINUX_KERNEL_LATEST_VERSION
> +	default "5.10" if BR2_LINUX_KERNEL_LATEST_VERSION
>  	default "4.19.152-cip37" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
>  	default "4.19.152-cip37-rt16" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
>  	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
> diff --git a/linux/linux.hash b/linux/linux.hash
> index 00bbf3d1cb..8d17cd8efa 100644
> --- a/linux/linux.hash
> +++ b/linux/linux.hash
> @@ -1,4 +1,5 @@
>  # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
> +sha256  dcdf99e43e98330d925016985bfbc7b83c66d367b714b2de0cbbfcbf83d8ca43  linux-5.10.tar.xz
>  sha256  5eb20a65a410669928f94b3975872e493fa6d0fe441c6a78b7564affa2a5d260  linux-5.9.11.tar.xz
>  sha256  4ab4a3f694b7b4cfbe78871eab34c8039ad33692144c45c669827a594da85534  linux-5.8.18.tar.xz
>  sha256  49da425c1f3c530fd3ff31d85a0461f6b6dc6e459f7faf3eee23e49a98ce64c7  linux-5.4.80.tar.xz
> diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
> index 2dc2457e28..20c1ce9f84 100644
> --- a/package/linux-headers/Config.in.host
> +++ b/package/linux-headers/Config.in.host
> @@ -6,7 +6,7 @@ config BR2_PACKAGE_HOST_LINUX_HEADERS
>  choice
>  	prompt "Kernel Headers"
>  	default BR2_KERNEL_HEADERS_AS_KERNEL if BR2_LINUX_KERNEL
> -	default BR2_KERNEL_HEADERS_5_9
> +	default BR2_KERNEL_HEADERS_5_10
>  	help
>  	  Select the kernel version to get headers from.
>  
> @@ -61,6 +61,10 @@ config BR2_KERNEL_HEADERS_5_8
>  config BR2_KERNEL_HEADERS_5_9
>  	bool "Linux 5.9.x kernel headers"
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_9
> +
> +config BR2_KERNEL_HEADERS_5_10
> +	bool "Linux 5.10.x kernel headers"
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
>  	select BR2_KERNEL_HEADERS_LATEST
>  
>  config BR2_KERNEL_HEADERS_VERSION
> @@ -135,8 +139,12 @@ choice
>  	  If your kernel headers are more recent than the latest version
>  	  in the choice, then select the latest version.
>  
> +config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10
> +	bool "5.10.x or later"
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
> +
>  config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_9
> -	bool "5.9.x or later"
> +	bool "5.9.x"
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_9
>  
>  config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_8
> @@ -353,6 +361,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
>  	default "5.4.80"	if BR2_KERNEL_HEADERS_5_4
>  	default "5.8.18"	if BR2_KERNEL_HEADERS_5_8
>  	default "5.9.11"	if BR2_KERNEL_HEADERS_5_9
> +	default "5.10"		if BR2_KERNEL_HEADERS_5_10
>  	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
>  	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
>  	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
> diff --git a/toolchain/Config.in b/toolchain/Config.in
> index db2ab0f059..395c8e36b8 100644
> --- a/toolchain/Config.in
> +++ b/toolchain/Config.in
> @@ -488,6 +488,10 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_8
>  config BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_9
>  	bool
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_8
> +
> +config BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
> +	bool
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_9
>  	select BR2_TOOLCHAIN_HEADERS_LATEST
>  
>  # This should be selected by the latest version, above, to indicate that
> @@ -501,6 +505,7 @@ config BR2_TOOLCHAIN_HEADERS_LATEST
>  # stops affecting a value on the first matching default.
>  config BR2_TOOLCHAIN_HEADERS_AT_LEAST
>  	string
> +	default "5.10" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
>  	default "5.9"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_9
>  	default "5.8"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_8
>  	default "5.7"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_7
> diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
> index f7aa5454e3..992fd2c150 100644
> --- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
> +++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
> @@ -119,8 +119,12 @@ choice
>  	  If your toolchain uses headers newer than the latest version
>  	  in the choice, then select the latest version.
>  
> +config BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_10
> +	bool "5.10.x or later"
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
> +
>  config BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_9
> -	bool "5.9.x or later"
> +	bool "5.9.x"
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_9
>  
>  config BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_8
> 
