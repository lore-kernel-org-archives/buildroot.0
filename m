From: Philipp Wagner <lists@philipp-wagner.com>
Date: Mon, 26 Nov 2018 09:24:15 +0100
Subject: [Buildroot] [PATCH] Make BR2_LINUX_KERNEL_DTB_IS_SELF_BUILT
 public
In-Reply-To: <20181116154501.14961-1-lists@philipp-wagner.com>
References: <20181116154501.14961-1-lists@philipp-wagner.com>
Message-ID: <46700ac7-4fd3-d792-fa76-3566d919ef36@philipp-wagner.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

How can we move forward with this patch?

I also noticed that I missed my signed off tag, adding it in this mail
as well. (Let me know if you prefer the patch to be re-sent.)

Am 16.11.18 um 16:45 schrieb lists at philipp-wagner.com:
> From: Philipp Wagner <philipp.wagner@tum.de>
> 
> Currently the BR2_LINUX_KERNEL_DTB_IS_SELF_BUILT option is only
> available as dependency. This option controls if the Linux build system
> should build the DTB itself, or if buildroot explicitly calls the Linux
> Makefile like "make something.dtb".
> 
> My use case: I want to build an OpenRISC image with a custom device tree
> file. OpenRISC does not support appended DTBs, and I'm not using a
> bootloader, but link everything into a single kernel (vmlinux) image.
> 
> The kernel option CONFIG_OPENRISC_BUILTIN_DTB allows me to specify a dtb
> file, which is typically located in the kernel source tree in
> arch/openrisc/boot/dts/NAME.dts.
> 
> Since my dts file is not part of the upstream kernel, I have two
> options: either patch the kernel to include the DTS file, and then
> specify it using the CONFIG_OPENRISC_BUILTIN_DTB option.
> 
> Or use buildroot's BR2_LINUX_KERNEL_CUSTOM_DTS_PATH config option to
> copy any DTS file to the kernel source tree, and then specify this file
> with CONFIG_OPENRISC_BUILTIN_DTB as before.
> 
> However, the second option also requries the buildroot option
> BR2_LINUX_KERNEL_DTB_IS_SELF_BUILT to be set, otherwise I end up with a
> "make -C kerneldir NAME.dts" call, which doesn't work (no such target
> exists).
> 
> Currently the BR2_LINUX_KERNEL_DTB_IS_SELF_BUILT option exists, but it's
> not visible/available. Simply making it available solves the problem for
> me nicely.

Signed-off-by: Philipp Wagner <mail@philipp-wagner.com>

> ---
>  linux/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/linux/Config.in b/linux/Config.in
> index ecb12d0b16..1f02ee6e3b 100644
> --- a/linux/Config.in
> +++ b/linux/Config.in
> @@ -373,7 +373,7 @@ if BR2_LINUX_KERNEL_DTS_SUPPORT
>  # The variable below address the second case, were you only want
>  # limited actions from buildroot.
>  config BR2_LINUX_KERNEL_DTB_IS_SELF_BUILT
> -	bool
> +	bool "DTB is built by kernel itself"
>  
>  config BR2_LINUX_KERNEL_APPENDED_DTB
>  	bool
> 
