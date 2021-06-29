From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 29 Jun 2021 21:23:34 +0200
Subject: [Buildroot] [PATCH 1/2] {linux, linux-headers}: add version 5.13
In-Reply-To: <20210628110943.13930-1-michael@walle.cc>
References: <20210628110943.13930-1-michael@walle.cc>
Message-ID: <20210629192334.GH2829@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Michael, All,

On 2021-06-28 13:09 +0200, Michael Walle spake thusly:
> Signed-off-by: Michael Walle <michael@walle.cc>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  linux/Config.in                                     |  4 ++--
>  linux/linux.hash                                    |  1 +
>  package/linux-headers/Config.in.host                | 13 +++++++++++--
>  toolchain/Config.in                                 |  5 +++++
>  .../toolchain-external-custom/Config.in.options     |  6 +++++-
>  5 files changed, 24 insertions(+), 5 deletions(-)
> 
> diff --git a/linux/Config.in b/linux/Config.in
> index 035699663c..0c3cf5db5f 100644
> --- a/linux/Config.in
> +++ b/linux/Config.in
> @@ -28,7 +28,7 @@ choice
>  	prompt "Kernel version"
>  
>  config BR2_LINUX_KERNEL_LATEST_VERSION
> -	bool "Latest version (5.12)"
> +	bool "Latest version (5.13)"
>  
>  config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
>  	bool "Latest CIP SLTS version (4.19.182-cip45)"
> @@ -125,7 +125,7 @@ endif
>  
>  config BR2_LINUX_KERNEL_VERSION
>  	string
> -	default "5.12.10" if BR2_LINUX_KERNEL_LATEST_VERSION
> +	default "5.13" if BR2_LINUX_KERNEL_LATEST_VERSION
>  	default "4.19.182-cip45" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
>  	default "4.19.165-cip41-rt18" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
>  	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
> diff --git a/linux/linux.hash b/linux/linux.hash
> index d7493545ef..ddd680a2d5 100644
> --- a/linux/linux.hash
> +++ b/linux/linux.hash
> @@ -1,4 +1,5 @@
>  # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
> +sha256  3f6baa97f37518439f51df2e4f3d65a822ca5ff016aa8e60d2cc53b95a6c89d9  linux-5.13.tar.xz
>  sha256  c8d499fc53ed14838994ec2f51591ae40d64cce68559cd897be8acbeeee7630f  linux-5.12.10.tar.xz
>  sha256  11027c6114eb916edbcc37897226fb6263b2931911d2d5093550473ce1a57600  linux-5.11.22.tar.xz
>  sha256  83b81e433ba2f8ee143064fb163699ee857e26dd789006bc1e9edf1ccd0bd403  linux-5.10.43.tar.xz
> diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
> index 8eb12c545c..33e3ee3b58 100644
> --- a/package/linux-headers/Config.in.host
> +++ b/package/linux-headers/Config.in.host
> @@ -6,7 +6,7 @@ config BR2_PACKAGE_HOST_LINUX_HEADERS
>  choice
>  	prompt "Kernel Headers"
>  	default BR2_KERNEL_HEADERS_AS_KERNEL if BR2_LINUX_KERNEL
> -	default BR2_KERNEL_HEADERS_5_12
> +	default BR2_KERNEL_HEADERS_5_13
>  	help
>  	  Select the kernel version to get headers from.
>  
> @@ -65,6 +65,10 @@ config BR2_KERNEL_HEADERS_5_11
>  config BR2_KERNEL_HEADERS_5_12
>  	bool "Linux 5.12.x kernel headers"
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_12
> +
> +config BR2_KERNEL_HEADERS_5_13
> +	bool "Linux 5.13.x kernel headers"
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_13
>  	select BR2_KERNEL_HEADERS_LATEST
>  
>  config BR2_KERNEL_HEADERS_VERSION
> @@ -139,8 +143,12 @@ choice
>  	  If your kernel headers are more recent than the latest version
>  	  in the choice, then select the latest version.
>  
> +config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_13
> +	bool "5.13.x or later"
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_13
> +
>  config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_12
> -	bool "5.12.x or later"
> +	bool "5.12.x"
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_12
>  
>  config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_11
> @@ -370,6 +378,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
>  	default "5.10.43"	if BR2_KERNEL_HEADERS_5_10
>  	default "5.11.22"	if BR2_KERNEL_HEADERS_5_11
>  	default "5.12.10"	if BR2_KERNEL_HEADERS_5_12
> +	default "5.13"		if BR2_KERNEL_HEADERS_5_13
>  	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
>  	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
>  	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
> diff --git a/toolchain/Config.in b/toolchain/Config.in
> index fe327b9f46..03375e0c52 100644
> --- a/toolchain/Config.in
> +++ b/toolchain/Config.in
> @@ -510,6 +510,10 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_11
>  config BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_12
>  	bool
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_11
> +
> +config BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_13
> +	bool
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_12
>  	select BR2_TOOLCHAIN_HEADERS_LATEST
>  
>  # This should be selected by the latest version, above, to indicate that
> @@ -523,6 +527,7 @@ config BR2_TOOLCHAIN_HEADERS_LATEST
>  # stops affecting a value on the first matching default.
>  config BR2_TOOLCHAIN_HEADERS_AT_LEAST
>  	string
> +	default "5.13" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_13
>  	default "5.12" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_12
>  	default "5.11" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_11
>  	default "5.10" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
> diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
> index 4a3345e4a5..bc4561f3f7 100644
> --- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
> +++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
> @@ -123,8 +123,12 @@ choice
>  	  If your toolchain uses headers newer than the latest version
>  	  in the choice, then select the latest version.
>  
> +config BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_13
> +	bool "5.13.x or later"
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_13
> +
>  config BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_12
> -	bool "5.12.x or later"
> +	bool "5.12.x"
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_12
>  
>  config BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_11
> -- 
> 2.20.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
