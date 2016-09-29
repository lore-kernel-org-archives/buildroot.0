From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 29 Sep 2016 22:37:51 +0200
Subject: [Buildroot] [PATCH v2] zynq: document how to use custom
 ps7_init files
In-Reply-To: <1475031612-43682-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1475031612-43682-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <c12b938d-96da-ad8e-4dbd-bdf00bd281ed@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Matt,

 I have a few minor and one major remark below.

On 28-09-16 05:00, Matt Weber wrote:
> From: Masahiro Yamada <yamada.masahiro@socionext.com>
> 
> Since U-Boot supported SPL for Zynq boards at v2014.04 release, it
> became much easier to build a system.  At that time, however, users
> still needed to manually copy ps7_init.c/h to the U-Boot source tree
> to generate a working SPL image because ps7_init.c/h output from
> Xilinx tools are not compatible with GPL.
> 
> Later, the license problem was solved when Xilinx tools became able
> to output the GPL-compatible variants (ps7_init_gpl.c/h) as well.
> U-Boot v2015.07 or later includes ps7_init_gpl.c/h for major Zynq
> boards so that users can build a boot image straight away.
> 
> Now Buildroot supports 3 boards (Zedboard, MicroZed, ZC706) without
> any manual intervention.  This is a good thing itself, but commit
> b9cd72cdbfe3 ("zynq_zc706: bump U-Boot to xilinx-v2016.2") entirely
> dropped the information about custom ps7_init files.
> 
> This commit provides up-to-date guidance for how to customize the
> ps7_init files.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
> 
> ---
> v1 -> v2
>  - Updated readme wording discussed in
>    https://patchwork.ozlabs.org/patch/654309/
> 
> ---
>  board/zynq/readme.txt | 46 +++++++++++++++++++++++++++++++++++++++-------
>  1 file changed, 39 insertions(+), 7 deletions(-)
> 
> diff --git a/board/zynq/readme.txt b/board/zynq/readme.txt
> index 51e28b6..364ec39 100644
> --- a/board/zynq/readme.txt
> +++ b/board/zynq/readme.txt
> @@ -6,13 +6,6 @@ Currently, three boards are natively supported by Buildroot:
>   - Avnet ZedBoard (zynq_zed_defconfig)
>   - Avnet MicroZed (zynq_microzed_defconfig)
>  
> -The following build procedure focuses on them, but you can adjust it to your
> -board even if it is not listed above.  Major Zynq-based boards are supported by
> -U-Boot, and their Device Trees are merged in Linux Kernel.  If your board is the
> -case, booting the kernel is a piece of cake.  All you need to do is to change:
> - - Kernel Device Tree file name (BR2_LINUX_KERNEL_INTREE_DTS_NAME)
> - - U-Boot board defconfig (BR2_TARGET_UBOOT_BOARD_KCONFIG)
> -
>  Steps to create a working system for a Zynq board:
>  
>  1) Configuration (do one of the following)
> @@ -50,3 +43,42 @@ References:
>  
>   - Zedboard/Microzed information including schematics, reference designs, and
>     manuals are available from http://www.zedboard.org .
> +
> +Support for other boards:
> +
> +If you want to build a system for other boards (for ex. Digilent Zybo board).
> +Most major Zynq-based boards have U-Boot and Kernel support.  If your
> +board happens to be supported, booting the kernel and using U-Boot
> +just requires the following Buildroot updates:
> + - Kernel Device Tree file name (BR2_LINUX_KERNEL_INTREE_DTS_NAME)
> + - U-Boot board defconfig (BR2_TARGET_UBOOT_BOARD_DEFCONFIG)
> +
> +Custom ps7_init_gpl.c/h support:
> +
> +To generate a working boot.bin image, ps7_init_gpl.c/h are required in the
> +U-Boot source tree.  Those files are output from the Xilinx tools, but for

 I would put the notice from the end immediately here. I.e.

To generate a working boot.bin image, ps7_init_gpl.c/h are required in the
U-Boot source tree. Without those files, boot.bin will be built successfully
but it will not be functional at all. Those files are output from ...

> +convenience, U-Boot includes the default ps7_init_gpl.c/h of popular boards.
> +These files may need to be updated for any programmable logic customizations

 These -> those (otherwise it looks as if you are talking about different files
than before).

> +which impact ps7_init (clock/pin setup & mapping/AXI bridge setup/etc).
> +See board/xilinx/zynq/ directory of U-Boot for natively supported ps7_init
> +files.  If the ps7_init files for your board are not found in U-Boot, you need
> +to add them by yourself.  (You can still override the existing ones if you want
> +to customize them for your purpose.)

 That last sentence doesn't make a lot of sense to me, and I suspect it's redundant.

> +
> +1) Start with a defconfig supported by Buildroot (for ex. Zedboard)

 for ex. -> 'e.g.' or 'for example'

> +    make zynq_zed_defconfig
> +
> +2) make uboot-menuconfig
> +    Visit the following menu and enable CONFIG_ZYNQ_CUSTOM_INIT.
> +
> +    ARM architecture  --->
> +       [*] Use custom ps7_init provided by Xilinx tool
> +
> +3) Copy ps7_init_gpl.c/h generated by the Xilinx tools into
> +   output/build/uboot-xilinx-<pkg version>/board/xilinx/zynq/custom_hw_platform/

 The user should be made aware that the custom files will disappear again if you
clean. Something like:

Note that the files need to be re-copied after cleaning the output directory,
and there is no way to save it as part of the buildroot configuration except as
a uboot patch.

 Which makes me think: perhaps a uboot option should be added (conditional on
BR2_TARGET_UBOOT_ZYNQ_IMAGE) that allows the user to specify a custom file?


> +
> +4) make


> +
> +*Notice*
> +While the build will successfully complete with/without the ps7_init_gpl.*
> +files, the boot.bin generated without ones will not be functional at all.

 This last sentence didn't read very easily for me, I reworded it above.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
