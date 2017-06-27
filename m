From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 27 Jun 2017 23:30:38 +0200
Subject: [Buildroot] [PATCH] board: icorem6: Add Qt5 configs for 800x480
 LVDS display
In-Reply-To: <1498580320-12765-1-git-send-email-jteki@openedev.com>
References: <1498580320-12765-1-git-send-email-jteki@openedev.com>
Message-ID: <ea0da7f5-8077-0758-7770-59be17163b4a@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Jagan,

On 27-06-17 18:18, Jagan Teki wrote:
> From: Jagan Teki <jagan@amarulasolutions.com>
> 
> i.CoreM6 Starter Kit has 800x480 LVDS display, this patch adds
> relevant qt5 configs with supports opensource Etnaviv graphical stack.
> 
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
>  ...6qdl-icore-Add-backlight-support-for-lvds.patch | 65 ++++++++++++++++++++++
>  ...0002-arm-dts-imx6q-icore-Add-LVDS-support.patch | 53 ++++++++++++++++++
>  ...-arm-dts-imx6q-icore-Add-touchscreen-node.patch | 40 +++++++++++++
>  ...v7_defconfig-Select-max11801_ts-touchscre.patch | 32 +++++++++++
>  ...x6qdl_icore-Add-video-details-on-bootargs.patch | 32 +++++++++++

 Ugh, not nice to have such big feature patches in Buildroot. Is there going to
be in 4.12 or 4.13? Same for U-Boot. If these patches are not on their way to
upstream, I don't think it's acceptable for Buildroot. If they are on their way
upstream, we can live with having them in Buildroot for a while. Please do
indicate the upstream status in each patch.


>  board/engicam/icorem6/readme.txt                   | 13 +++++
>  .../icorem6/rootfs_overlay/root/icorem6.json       | 11 ++++
>  configs/engicam_imx6qdl_icore_defconfig            | 40 +++++++++++++
>  8 files changed, 286 insertions(+)
[snip]
> diff --git a/board/engicam/icorem6/readme.txt b/board/engicam/icorem6/readme.txt
> index 0ad60bf..f63330a 100644
> --- a/board/engicam/icorem6/readme.txt
> +++ b/board/engicam/icorem6/readme.txt
> @@ -66,4 +66,17 @@ To boot your newly created system:
>  - close JM3 for sd boot.
>  - power on the board.
>  
> +Testing graphics on i.CoreM6 Starter Kit:
> +========================================
> +
> +Running kmscube
> +# kmscube -D /dev/dri/card1
> +
> +Running glmark2-es2-drm
> +# glmark2-es2-drm
> +
> +Running Qt5 Cinematic Demo:
> +# export QT_QPA_EGLFS_KMS_CONFIG=/root/icorem6.json
> +# CinematicExperience-demo
> +
>  Enjoy!
> diff --git a/board/engicam/icorem6/rootfs_overlay/root/icorem6.json b/board/engicam/icorem6/rootfs_overlay/root/icorem6.json
> new file mode 100644
> index 0000000..ac139a3
> --- /dev/null
> +++ b/board/engicam/icorem6/rootfs_overlay/root/icorem6.json

 /root is not a nice place to put this, and icorem6.json is not a very
descriptive name. How about /etc/kms-icorem6.json ?

> @@ -0,0 +1,11 @@
> +{
> +  "device": "/dev/dri/card1",
> +  "hwcursor": false,
> +  "pbuffers": true,
> +  "outputs": [
> +    {
> +      "name": "LVDS-1",
> +      "mode": "800x480"
> +    }
> +  ]
> +}
> diff --git a/configs/engicam_imx6qdl_icore_defconfig b/configs/engicam_imx6qdl_icore_defconfig
> index 466d60c..4a875b9 100644
> --- a/configs/engicam_imx6qdl_icore_defconfig
> +++ b/configs/engicam_imx6qdl_icore_defconfig

 You should keep this config minimal, and instead create a new
engicam_imx6qdl_icore_qt5_defconfig. When you do, please generate your patch
with 'git format-patch -C --find-copies-harder' so we can easily see the
differences.

> @@ -21,11 +21,13 @@ BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
>  BR2_TARGET_UBOOT_FORMAT_DTB_IMG=y
>  BR2_TARGET_UBOOT_SPL=y
>  BR2_TARGET_UBOOT_SPL_NAME="SPL"
> +BR2_TARGET_UBOOT_PATCH="board/engicam/icorem6/patches/u-boot-*.patch"

 Instead of specifying separate patches for U-Boot and Linux, you should specify
BR2_GLOBAL_PATCH_DIR and put the patches inside a uboot and a linux
subdirectory. Cfr. the imx6sabre configs.

>  
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.5"
> +BR2_LINUX_KERNEL_PATCH="board/engicam/icorem6/patches/linux-*.patch"
>  BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
>  BR2_LINUX_KERNEL_UIMAGE=y
>  BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x10008000"
> @@ -36,8 +38,46 @@ BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6dl-icore imx6q-icore"
>  BR2_TARGET_GENERIC_ISSUE="Welcome to Engicam i.CoreM6 Quad/Dual/DualLite/Solo Starter Kit"
>  BR2_TARGET_ROOTFS_EXT2=y
>  BR2_TARGET_ROOTFS_EXT2_4=y
> +BR2_TARGET_ROOTFS_EXT2_BLOCKS=122880
>  BR2_PACKAGE_HOST_DOSFSTOOLS=y
>  BR2_PACKAGE_HOST_GENIMAGE=y
>  BR2_PACKAGE_HOST_MTOOLS=y
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/engicam/icorem6/genimage.cfg"
> +BR2_ROOTFS_OVERLAY="board/engicam/icorem6/rootfs_overlay"
> +
> +# qt5 dependencies

 Very nice to collect these together, but please move up to the rest of the
toolchain configuration.

> +BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
> +BR2_TOOLCHAIN_BUILDROOT_CXX=y
> +BR2_TOOLCHAIN_USES_GLIBC=y

 Which package requires glibc? AFAICS all the packages you select here should
work with uClibc and musl as well.

> +
> +# qt5
> +BR2_PACKAGE_QT5=y
> +BR2_PACKAGE_QT5BASE_GUI=y
> +BR2_PACKAGE_QT5BASE_OPENGL=y
> +BR2_PACKAGE_QT5BASE_FONTCONFIG=y
> +BR2_PACKAGE_QT5BASE_GIF=y
> +BR2_PACKAGE_QT5BASE_JPEG=y
> +
> +# mesa3d
> +BR2_PACKAGE_MESA3D=y
> +BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV=y
> +BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST=y
> +BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST=y

 Why do you need the swrast drivers? Please explain in the commit message.

> +BR2_PACKAGE_MESA3D_OPENGL_ES=y
> +
> +# qt5 demo packages
> +BR2_PACKAGE_GLMARK2=y
> +BR2_PACKAGE_MESA3D_DEMOS=y
> +BR2_PACKAGE_KMSCUBE=y
> +BR2_PACKAGE_QT5CINEX=y
> +BR2_PACKAGE_QT5CINEX_HD=y
> +
> +# fonts
> +BR2_PACKAGE_BITSTREAM_VERA=y
> +BR2_PACKAGE_CANTARELL=y
> +BR2_PACKAGE_DEJAVU=y
> +BR2_PACKAGE_FONT_AWESOME=y
> +BR2_PACKAGE_GHOSTSCRIPT_FONTS=y
> +BR2_PACKAGE_INCONSOLATA=y
> +BR2_PACKAGE_LIBERATION=y

 Could you limit the fonts to just what is needed to make the demos run? IIRC
liberation should be sufficient, no?

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
