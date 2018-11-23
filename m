From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 23 Nov 2018 22:04:03 +0100
Subject: [Buildroot] [PATCH] qemu: add an option to enable seccomp
In-Reply-To: <20181120131042.6468-1-casantos@datacom.com.br>
References: <20181120131042.6468-1-casantos@datacom.com.br>
Message-ID: <20181123220403.059e1442@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 20 Nov 2018 11:10:42 -0200, Carlos Santos wrote:
> It is required to resume working on the forthcoming libvirt package
> after a long test period (https://patchwork.ozlabs.org/patch/841613).
> 
> Leave it disabled by default, for backward compatibility.
> 
> Signed-off-by: Carlos Santos <casantos@datacom.com.br>
> ---
>  package/qemu/Config.in | 13 +++++++++++++
>  package/qemu/qemu.mk   |  8 +++++++-
>  2 files changed, 20 insertions(+), 1 deletion(-)
> 
> diff --git a/package/qemu/Config.in b/package/qemu/Config.in
> index 33d4cccd7b..032d2ccafe 100644
> --- a/package/qemu/Config.in
> +++ b/package/qemu/Config.in
> @@ -137,6 +137,19 @@ config BR2_PACKAGE_QEMU_FDT
>  	  Say 'y' here to have QEMU capable of constructing Device
>  	  Trees, and passing them to the VMs.
>  
> +config BR2_PACKAGE_QEMU_SECCOMP
> +	bool "Enable seccomp"
> +	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS
> +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
> +	select BR2_PACKAGE_LIBSECCOMP
> +	help
> +	  Enable support for the Linux Kernel's syscall filtering
> +	  mechanism.

I don't think we want to introduce an explicit option for this, just
enable seccomp support when BR2_PACKAGE_LIBSSECOMP=y.

> +comment "seccomp needs a toolchain w/ headers >= 3.12"
> +	depends on !BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS || \
> +		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
> +
>  comment "FDT support needs a toolchain w/ dynamic library"
>  	depends on BR2_STATIC_LIBS

This comment should anyway have remained close to the
BR2_PACKAGE_QEMU_FDT option.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
