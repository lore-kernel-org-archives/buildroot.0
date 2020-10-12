From: Bilal Wasim <bilalwasim676@gmail.com>
Date: Mon, 12 Oct 2020 20:35:34 +0500
Subject: [Buildroot] [PATCH 1/2] {linux, linux-headers}: add version 5.9
In-Reply-To: <20201012083317.11732-1-michael@walle.cc>
References: <20201012083317.11732-1-michael@walle.cc>
Message-ID: <20201012203534.0d0ec8b7@a-VirtualBox>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 12 Oct 2020 10:33:16 +0200
Michael Walle <michael@walle.cc> wrote:

> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
>  linux/Config.in                                     |  4 ++--
>  linux/linux.hash                                    |  1 +
>  package/linux-headers/Config.in.host                | 13
> +++++++++++-- toolchain/Config.in                                 |
> 5 +++++ .../toolchain-external-custom/Config.in.options     |  6
> +++++- 5 files changed, 24 insertions(+), 5 deletions(-)
> 
> diff --git a/linux/Config.in b/linux/Config.in
> index 309abb9fc6..6d9d0af067 100644
> --- a/linux/Config.in
> +++ b/linux/Config.in
> @@ -28,7 +28,7 @@ choice
>  	prompt "Kernel version"
>  
>  config BR2_LINUX_KERNEL_LATEST_VERSION
> -	bool "Latest version (5.8)"
> +	bool "Latest version (5.9)"
>  
>  config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
>  	bool "Latest CIP SLTS version (4.19.132-cip30)"
> @@ -125,7 +125,7 @@ endif
>  
>  config BR2_LINUX_KERNEL_VERSION
>  	string
> -	default "5.8.14" if BR2_LINUX_KERNEL_LATEST_VERSION
> +	default "5.9" if BR2_LINUX_KERNEL_LATEST_VERSION
>  	default "4.19.132-cip30" if
> BR2_LINUX_KERNEL_LATEST_CIP_VERSION default "4.19.132-cip30-rt12" if
> BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION default
> BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \ diff --git a/linux/linux.hash
> b/linux/linux.hash index ccb8d7fa4c..4b76398c5d 100644
> --- a/linux/linux.hash
> +++ b/linux/linux.hash
> @@ -1,4 +1,5 @@
>  # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
> +sha256
> 3239a4ee1250bf2048be988cc8cb46c487b2c8a0de5b1b032d38394d5c6b1a06
> linux-5.9.tar.xz sha256
> ee767991808d234ad9acd17f0ba94ba7979d30c528876bee6fba337ea540f0af
> linux-5.8.14.tar.xz sha256
> c0b3d8085c5ba235df38b00b740e053659709e8a5ca21957a239f6bc22c45007
> linux-5.4.70.tar.xz # From
> https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc diff
> --git a/package/linux-headers/Config.in.host
> b/package/linux-headers/Config.in.host index dacd3f86ea..16af0449a5
> 100644 --- a/package/linux-headers/Config.in.host +++
> b/package/linux-headers/Config.in.host @@ -6,7 +6,7 @@ config
> BR2_PACKAGE_HOST_LINUX_HEADERS choice prompt "Kernel Headers" default
> BR2_KERNEL_HEADERS_AS_KERNEL if BR2_LINUX_KERNEL
> -	default BR2_KERNEL_HEADERS_5_8
> +	default BR2_KERNEL_HEADERS_5_9
>  	help
>  	  Select the kernel version to get headers from.
>  
> @@ -57,6 +57,10 @@ config BR2_KERNEL_HEADERS_5_4
>  config BR2_KERNEL_HEADERS_5_8
>  	bool "Linux 5.8.x kernel headers"
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_8
> +
> +config BR2_KERNEL_HEADERS_5_9
> +	bool "Linux 5.9.x kernel headers"
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_9
>  	select BR2_KERNEL_HEADERS_LATEST
>  
>  config BR2_KERNEL_HEADERS_VERSION
> @@ -131,8 +135,12 @@ choice
>  	  If your kernel headers are more recent than the latest
> version in the choice, then select the latest version.
>  
> +config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_9
> +	bool "5.9.x or later"
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_9
> +
>  config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_8
> -	bool "5.8.x or later"
> +	bool "5.8.x"
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_8
>  
>  config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_7
> @@ -344,6 +352,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
>  	default "4.19.150"	if BR2_KERNEL_HEADERS_4_19
>  	default "5.4.70"	if BR2_KERNEL_HEADERS_5_4
>  	default "5.8.14"	if BR2_KERNEL_HEADERS_5_8
> +	default "5.9"		if BR2_KERNEL_HEADERS_5_9
>  	default BR2_DEFAULT_KERNEL_VERSION if
> BR2_KERNEL_HEADERS_VERSION default "custom"	if
> BR2_KERNEL_HEADERS_CUSTOM_TARBALL default
> BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \ diff --git
> a/toolchain/Config.in b/toolchain/Config.in index
> 6e2befed20..db2ab0f059 100644 --- a/toolchain/Config.in
> +++ b/toolchain/Config.in
> @@ -484,6 +484,10 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_7
>  config BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_8
>  	bool
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_7
> +
> +config BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_9
> +	bool
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_8
>  	select BR2_TOOLCHAIN_HEADERS_LATEST
>  
>  # This should be selected by the latest version, above, to indicate
> that @@ -497,6 +501,7 @@ config BR2_TOOLCHAIN_HEADERS_LATEST
>  # stops affecting a value on the first matching default.
>  config BR2_TOOLCHAIN_HEADERS_AT_LEAST
>  	string
> +	default "5.9"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_9
>  	default "5.8"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_8
>  	default "5.7"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_7
>  	default "5.6"  if BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_6
> diff --git
> a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
> b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
> index d69db68a23..f7aa5454e3 100644 ---
> a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
> +++
> b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
> @@ -119,8 +119,12 @@ choice If your toolchain uses headers newer than
> the latest version in the choice, then select the latest version.
> +config BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_9
> +	bool "5.9.x or later"
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_9
> +
>  config BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_8
> -	bool "5.8.x or later"
> +	bool "5.8.x"
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_8
>  
>  config BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_7

Tested with Chromebook Elm..

Tested-by: Bilal Wasim <bilal.wasim@imgtec.com>

Thanks,
Bilal
