From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 4 Aug 2019 11:48:44 +0200
Subject: [Buildroot] [PATCH] package/linux-headers: apply all Linux
 patches when BR2_KERNEL_HEADERS_AS_KERNEL=y
In-Reply-To: <20190804093644.7388-1-thomas.petazzoni@bootlin.com>
References: <20190804093644.7388-1-thomas.petazzoni@bootlin.com>
Message-ID: <20190804094844.GA25437@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2019-08-04 11:36 +0200, Thomas Petazzoni spake thusly:
> When BR2_KERNEL_HEADERS_AS_KERNEL=y, we expect that the Linux kernel
> headers code will be exactly the same as the Linux kernel code
> itself. The code currently takes into account the patches defined by
> BR2_LINUX_KERNEL_PATCH, but not the kernel patches that are stored in
> linux's BR2_GLOBAL_PATCH_DIR.
> 
> So for example, the current qemu_riscv32_virt_defconfig has:
> 
> BR2_GLOBAL_PATCH_DIR="board/qemu/riscv32-virt/patches/"
> 
> With:
> 
> board/qemu/riscv32-virt/patches/
> ??? linux
>     ??? 0001-Revert-riscv-Use-latest-system-call-ABI.patch
> 
> This patch gets properly applied when the Linux kernel is built, but
> not when the linux-headers package is built.
> 
> This commit fixes that by making sure patches stored in the "linux"
> BR2_GLOBAL_PATCH_DIR subdirectory are taken into account.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Acked-by: Yann E. MORIN <yann.morin.1998@free.fr>

> ---
> Yann, you gave your Acked-by in
> http://patchwork.ozlabs.org/patch/1119649/, but it was not a formal
> commit with a proper commit log, so I haven't kept your Acked-by.

The question you had in your previous, informal patch, was about the
ordering of the patches. The patches from global_patch_dir are always
applied after the patches we carry for a package, so the way you did it
here is correct I believe.

Regards,
Yann E. MORIN.

> ---
>  package/linux-headers/linux-headers.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/linux-headers/linux-headers.mk b/package/linux-headers/linux-headers.mk
> index 95432ade83..46f270a0e1 100644
> --- a/package/linux-headers/linux-headers.mk
> +++ b/package/linux-headers/linux-headers.mk
> @@ -60,7 +60,8 @@ endif # LINUX_HEADERS_CUSTOM_TARBALL
>  # Apply any necessary patches if we are using the headers from a kernel
>  # build.
>  ifeq ($(BR2_KERNEL_HEADERS_AS_KERNEL),y)
> -LINUX_HEADERS_PATCHES = $(call qstrip,$(BR2_LINUX_KERNEL_PATCH))
> +LINUX_HEADERS_PATCHES = $(call qstrip,$(BR2_LINUX_KERNEL_PATCH)) \
> +	$(wildcard $(addsuffix /linux,$(call qstrip,$(BR2_GLOBAL_PATCH_DIR))))
>  
>  # We rely on the generic package infrastructure to download and apply
>  # remote patches (downloaded from ftp, http or https). For local
> -- 
> 2.21.0
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
