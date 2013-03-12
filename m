From: Daniel Price <daniel.price@gmail.com>
Date: Tue, 12 Mar 2013 01:39:20 -0700
Subject: [Buildroot] [PATCH] [RFC] Add a LOADADDR= option when building
	uImage
In-Reply-To: <1362998134-4614-1-git-send-email-julien.boibessot@free.fr>
References: <1362998134-4614-1-git-send-email-julien.boibessot@free.fr>
Message-ID: <CAKduhStbK-9P4GhALmssGO07TdwX1r1rkfOtdUH6NqaYdHJcfg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Julien,

I would appreciate this patch because I spent a lot of time
discovering LOADADDR and this would have really helped me.  My
suggestions:

1) Should this variable be exposed only for ARM for now?  ("depends on
BR2_arm || BR2_armeb")

2) Should this variable only be exposed for linux versions >= 3.7?
3.7 is when CONFIG_ARCH_MULTIPLATFORM appears.

3) The description in the help text might not help someone new to this
topic (like me).  I would suggest something like:

"If your ARM system's kernel is configured via the new (3.7+)
multi-architecture support (CONFIG_ARCH_MULTIPLATFORM=y in your linux
kernel .config), then it is necessary to specify a kernel load address
for the uImage.  This should be a hexadecimal string beginning with
0x.  Example setting: 0x00008000."

Thanks and best of luck,

       -dp


On Mon, Mar 11, 2013 at 3:35 AM,  <julien.boibessot@free.fr> wrote:
> From: Julien Boibessot <julien.boibessot@armadeus.com>
>
> This seems mandatory in recent Linux kernels configured with ARCH_MULTIPLATFORM
> (well at least on ARM/i.MX).
> If LOADADDR variable is not set when building multi-arch uImage then a dummy
> loadaddr is used, that prevent this image to boot in U-Boot (2012.04 in my
> case).
> Anyone else who need the same fix ?
>
> Signed-off-by: Julien Boibessot <julien.boibessot@armadeus.com>
> ---
>  linux/Config.in |    8 ++++++++
>  linux/linux.mk  |    4 ++++
>  2 files changed, 12 insertions(+), 0 deletions(-)
>
> diff --git a/linux/Config.in b/linux/Config.in
> index 94ce951..c582439 100644
> --- a/linux/Config.in
> +++ b/linux/Config.in
> @@ -213,6 +213,14 @@ config BR2_LINUX_KERNEL_IMAGE_TARGET_NAME
>           Specify the kernel make target to build the kernel that you
>           need.
>
> +config BR2_LINUX_KERNEL_UIMAGE_LOADADDR
> +       string "loadaddr for uImage"
> +       depends on BR2_LINUX_KERNEL_UIMAGE || BR2_LINUX_KERNEL_APPENDED_UIMAGE
> +       help
> +         When configured for multi-arch support, it is mandatory to define
> +         LOADADDR=0x... when asking recent kernels to generate a uImage.
> +         Let this option empty if your kernel is single-arch only.
> +
>  config BR2_LINUX_KERNEL_DTS_SUPPORT
>         bool "Device tree support"
>         help
> diff --git a/linux/linux.mk b/linux/linux.mk
> index 0352acd..361ce3c 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -95,6 +95,10 @@ LINUX_IMAGE_NAME=vmlinuz
>  endif
>  endif
>
> +ifeq ($(LINUX_IMAGE_NAME),uImage)
> +LINUX_MAKE_FLAGS+=LOADADDR=$(call qstrip,$(BR2_LINUX_KERNEL_UIMAGE_LOADADDR))
> +endif
> +
>  ifeq ($(BR2_LINUX_KERNEL_APPENDED_DTB),y)
>  LINUX_IMAGE_TARGET=zImage
>  else
> --
> 1.7.5.4
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot



--
Daniel.Price at gmail.com; Twitter: @danielbprice
