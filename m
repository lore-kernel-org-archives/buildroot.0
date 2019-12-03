From: Adrian martinez munera <adrianmartinezmunera@gmail.com>
Date: Tue, 3 Dec 2019 09:44:51 +0100
Subject: [Buildroot] Zynqmp ZCU-102 Xilinx
In-Reply-To: <d46c58a9-4b07-878f-b638-1a4d1554e9b1@lucaceresoli.net>
References: <CADDW7LPbh8ep74a5kcu1CZQuaFxuUGyCUxuJT6uo6Y=m9ftmOA@mail.gmail.com>
 <d46c58a9-4b07-878f-b638-1a4d1554e9b1@lucaceresoli.net>
Message-ID: <CADDW7LPZ+oD9NzjqvbjVBDYj59K_6q1d8beoqwyQ==jFNTq=KA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Luca,
thanks for your answer!
How I said to Thomas, I'm trying to compile a Linux image to my ZCU-102
with EPICS (https://epics.anl.gov). But, as first step, I'd want build a
simple Linux image, all of this using Buildroot.
Using yours steps, I've created a pmufw.bin with your builder and the
'pm_cfg_obj.c', created by the Vivado project (xilpm library enabled).
Now I've a new two errors at the boot:
1. boot console [cdns0] disabled
2. The root file system is empty

*defconfig* file that I'm using:

BR2_aarch64=y
BR2_GLOBAL_PATCH_DIR="board/zynqmp/patches/"
BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_14=y
BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_GIT=y
BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://github.com/Xilinx/linux-xlnx.git"
BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="xilinx-v2018.3"
BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynqmp"
BR2_LINUX_KERNEL_DTS_SUPPORT=y
BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-zcu102-rev1.0"
BR2_TARGET_ROOTFS_EXT2=y
BR2_TARGET_ROOTFS_EXT2_4=y
# BR2_TARGET_ROOTFS_TAR is not set
BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="
https://github.com/ARM-software/arm-trusted-firmware.git"
BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="v1.5"
BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="zynqmp"
BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31_UBOOT=y
BR2_TARGET_UBOOT=y
BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
BR2_TARGET_UBOOT_CUSTOM_GIT=y
BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://github.com/xilinx/u-boot-xlnx.git"
BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="228801a215909365ae1dcdd799034195ad7264f7"
BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynqmp_zcu102_rev1_0"
BR2_TARGET_UBOOT_NEEDS_DTC=y
BR2_TARGET_UBOOT_SPL=y
BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
BR2_TARGET_UBOOT_ZYNQMP=y
BR2_TARGET_UBOOT_ZYNQMP_PMUFW="/home/adrian/Documents/ZCU-102/pmufw_builder/zynqmp-pmufw-builder/pmufw.bin"
BR2_PACKAGE_HOST_DOSFSTOOLS=y
BR2_PACKAGE_HOST_GENIMAGE=y
BR2_PACKAGE_HOST_MTOOLS=y

El mar., 26 nov. 2019 a las 17:49, Luca Ceresoli (<luca@lucaceresoli.net>)
escribi?:

> Hi Adrian,
>
> On 20/11/19 09:21, Adrian martinez munera wrote:
> > Hi,
> > I'm not sure if I have to write you by this mail.
> >
> > I'm using buildroot to create a Linux image to my ZCU-102, adding EPICS.
> >
> > My first attempt are been build  a simple Linux image, without EPICS,
> > but it doesn't work.
> >
> > ?Could you help me? ?Could you give me all of necessary files to build
> > the image?
>
> Thomas already replied with some objections, and I agree you should
> explain better your problem.
>
> However, as setting up booting is more complex on ZynqMP platforms than
> in other ones, here are a few notes to address booting. They could be
> useful for other people as well.
>
> Buildroot has a defconfig for the ZCU106 board, you can take that as a
> starting point. However some things have changed since that was added,
> so I recommend a better approach now.
>
> I assume you already have a Vivado project implementing your FPGA
> design. Even a project with a completely empty FPGA is OK, what matters
> is that you configure the "ZynqMP block" appropriately for the board
> (the Vivado wizard helps you in starting from a default configuration
> with proper DDR timings, among others).
>
> With the Vivado project you can start the Xilinx XSDK to produce a bsp
> (don't forget to enable the xilpm library in the wizard). The xilpm
> library in the generated bsp has a file called pm_cfg_obj.c. It's the
> "configuration object" that tells the PMU FW how to configure peripherals.
>
> Now you could go for the "old" approach, the one used for the zcu106
> defconfig currently in Buildroot: using zynqmp-pmufw-builder [0] you can
> generate a pmufw.bin that contains your configuration object hard-coded.
> This is how the pmufw binaries in zynqmp-pmufw-binaries [1], and used in
> Buildroot for ZCU106, have been generated.
>
> But I rather suggest to use the "new" approach. U-Boot SPL since
> v2019.10 can load the PMUFW configuration object at runtime (just like
> Xilinx FSBL does). In this case you can avoid hard-coding the config
> object into the pmufw binary, and use a "standard" PMUFW that works for
> any ZynqMP board. The v2018.3 PMUFW in [1] has been built in this way.
>
> For additional explanations on the "new" approach see [2]. I wrote some
> suggestions on how to implement such a workflow for yocto on the
> meta-xilinx mailing list [3], the underlying idea should apply to
> Buildroot as well.
>
> I hope this is useful for you. As pointed out by Thomas, your question
> is not very precise, so please add more details on exactly what you want
> to achieve, what you tried and how it failed. Somebody will probably be
> able to help you better.
>
> [0] https://github.com/lucaceresoli/zynqmp-pmufw-builder
> [1] https://github.com/lucaceresoli/zynqmp-pmufw-binaries
> [2] https://lucaceresoli.net/zynqmp-uboot-spl-pmufw-cfg-load/
> [3] https://lists.yoctoproject.org/g/meta-xilinx/message/4570
>
> --
> Luca
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20191203/f7609d58/attachment-0001.html>
