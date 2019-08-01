From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 1 Aug 2019 16:11:30 +0200
Subject: [Buildroot] [PATCH] Make BR2_LINUX_KERNEL_DTB_IS_SELF_BUILT
 public
In-Reply-To: <20181116154501.14961-1-lists@philipp-wagner.com>
References: <20181116154501.14961-1-lists@philipp-wagner.com>
Message-ID: <dd17283f-a3f1-392b-cec0-ad2449adc1af@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Philipp,

On 16/11/2018 16:45, lists at philipp-wagner.com wrote:
> From: Philipp Wagner <philipp.wagner@tum.de>
> 
> Currently the BR2_LINUX_KERNEL_DTB_IS_SELF_BUILT option is only
> available as dependency. This option controls if the Linux build system
> should build the DTB itself, or if buildroot explicitly calls the Linux
> Makefile like "make something.dtb".
> 
> My use case: I want to build an OpenRISC image with a custom device tree

 Please don't use first-person language in the commit message. Use something
more neutral, e.g. "A typical use case" instead of "My use case".

 I was too lazy to change this though, so it's just for the future :-)

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

 If it is a public option, it must have a help text. So I've added one and
applied to master, thanks.

 Sorry it took so long.

 Regards,
 Arnout

>  
>  config BR2_LINUX_KERNEL_APPENDED_DTB
>  	bool
> 
