From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 28 Oct 2013 08:09:38 +0100
Subject: [Buildroot] [PATCH 1/2] Initial support for I.MX6 SabreAuto
	board
In-Reply-To: <BLU0-SMTP40FAFEA0B28C550B66412BF70D0@phx.gbl>
References: <BLU0-SMTP40FAFEA0B28C550B66412BF70D0@phx.gbl>
Message-ID: <526E0DB2.7000905@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  Hi Abdul,

  Thank you for your contribution. Even on this very small defconfig I 
have a few comments :-)

On 25/10/13 19:03, Abdul Hussain wrote:
> Signed-off-by: Abdul Hussain <hussain.abdul@outlook.com>
> ---
>   configs/imx6qsabreauto_defconfig |   16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
>   create mode 100644 configs/imx6qsabreauto_defconfig
>
> diff --git a/configs/imx6qsabreauto_defconfig b/configs/imx6qsabreauto_defconfig
> new file mode 100644
> index 0000000..1a3647a
> --- /dev/null
> +++ b/configs/imx6qsabreauto_defconfig
> @@ -0,0 +1,16 @@
> +BR2_arm=y
> +BR2_cortex_a9=y
> +BR2_TOOLCHAIN_EXTERNAL=y
> +BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201109=y

  We prefer to use the internal toolchain for minimal defconfigs.

  I do realize that that means you won't be able to use this defconfig as 
a basis for adding the codec and GPU libraries. As a solution, we have 
decided to also accept 'demo' defconfigs in the future that create a more 
extensive configuration that shows more of a board's capabilities.

> +BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV=y

  Why udev and not the default devtmpfs? udev adds a lot of bloat...

> +BR2_TARGET_GENERIC_GETTY_PORT="ttymxc3"

  Minor nit: the /dev/ttymxc count patch should come first in the series.

> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_GIT=y
> +BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL="git://git.freescale.com/imx/linux-2.6-imx.git"
> +BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION="imx_3.0.35_4.1.0"

  Better to download a tarball from

http://git.freescale.com/git/cgit.cgi/imx/linux-2.6-imx.git/snapshot/imx_3.0.35_4.1.0.tar.bz2

That goes about 10 times faster.

> +BR2_LINUX_KERNEL_DEFCONFIG="imx6"
> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BOARDNAME="mx6qsabreauto"
> +BR2_TARGET_UBOOT_CUSTOM_GIT=y
> +BR2_TARGET_UBOOT_CUSTOM_GIT_REPO_URL="git://git.denx.de/u-boot-imx.git"
> +BR2_TARGET_UBOOT_CUSTOM_GIT_VERSION="77b0e2239a13fa83a745ea9b03994bf780a9738a"

  Why a custom git? AFAICS there are no relevant differences between this 
version and the released uboot-2013.10?


  Regards,
  Arnout
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
