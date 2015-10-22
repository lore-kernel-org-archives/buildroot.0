From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 22 Oct 2015 22:20:45 +0200
Subject: [Buildroot] [PATCH v5] board: add support for ARM Juno r1
 Development Board
In-Reply-To: <b132a8d9bc9e51f56f7b4a5c0e4c02404aaabd8a.1444647414.git.jpinto@synopsys.com>
References: <b132a8d9bc9e51f56f7b4a5c0e4c02404aaabd8a.1444647414.git.jpinto@synopsys.com>
Message-ID: <5629451D.8060502@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22-10-15 18:17, Joao Pinto wrote:
> The Juno r1 ARM Development Platform (ADP) is a software development
> platform for ARMv8-A, it includes the Juno r1 Versatile Express board 
> and an ARMv8-A reference software port available through Linaro.
> 
> Signed-off-by: Joao Pinto <jpinto@synopsys.com>
> ---
> 
> Changes v4 -> v5:
>  -Added changelog to the patch
> Changes v3 -> v4  (Thomas Petazzoni):
>  -The kernel' arm64 defconfig lacks a considerable amount of 
>  configuration items regarding the Juno r1 board, and that is the reason
>  of this custom kernel configuration file.
>  -The ARM Juno needs a kernel image called Image, and that 
>  it the reason why BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM is being used.
>  -A new readme.txt was produced.
> 
>  board/arm/junor1/linux-junor1-defconfig | 176 ++++++++++++++++++++++++++++++++
>  board/arm/junor1/readme.txt             |  76 ++++++++++++++
>  configs/arm_junor1_defconfig            |  16 +++
>  3 files changed, 268 insertions(+)
>  create mode 100644 board/arm/junor1/linux-junor1-defconfig
>  create mode 100644 board/arm/junor1/readme.txt
>  create mode 100644 configs/arm_junor1_defconfig
> 
> diff --git a/board/arm/junor1/linux-junor1-defconfig b/board/arm/junor1/linux-junor1-defconfig
> new file mode 100644
> index 0000000..b216d3e
> --- /dev/null
> +++ b/board/arm/junor1/linux-junor1-defconfig

 This defconfig again contains a lot of options that I doubt are very useful. It
even enables some things that are explicitly disabled in the arm64 defconfig, e.g.

# CONFIG_UTS_NS is not set
# CONFIG_WIRELESS is not set


 But it doesn't look too bad, so I'm OK with it as it is.

[snip]

> diff --git a/board/arm/junor1/readme.txt b/board/arm/junor1/readme.txt
> new file mode 100644
> index 0000000..2b3ebf5
> --- /dev/null
> +++ b/board/arm/junor1/readme.txt
> @@ -0,0 +1,76 @@
> +ARM Juno r1
> +
> +Intro
> +=====
> +
> +These instructions apply to all models of the ARM Juno:
> +  - Juno r0 (does not support PCIe)
> +  - Juno r1 (supports PCIe)

 If the same binaries apply to both r0 and r1, why not call it something juno
without r1?

> +
> +Buildroot will generate the kernel image, device tree blob and a 
> +minimal root filesystem.
> +
> +How to build it
> +===============
> +
> +Configure Buildroot
> +-------------------
> +
> +Configuring Buildroot is pretty simple, just execute:
> +
> +  $ make arm_junor1_defconfig
> +
> +Build the rootfs, kernel and DTB
> +--------------------------------
> +
> +Note: you will need to have access to the network, since Buildroot will
> +download the packages' sources.
> +
> +You may now build your rootfs with:
> +
> +  $ make
> +
> +(This may take a while)

 I think this is a lot of text for something so simple :-)

> +
> +Result of the build
> +-------------------
> +
> +After building, you should obtain this tree:
> +
> +    output/images/
> +    +-- rootfs.tar
> +    +-- juno-r1.dtb
> +    +-- Image
> +
> +Preparing your rootfs
> +======================
> +Format your pen drive as a ext3 filesystem by executing:
> +
> +   $ mkfs.ext3 /dev/<your device> 
> +
> +Installing your rootfs
> +======================
> +After mounting the pen drive please execute the following:
> +
> +   $ sudo tar -xvf output/images/rootfs.tar -C <pen drive mount path>
> +
> +When completed make sure to unmount the device:
> +   
> +   $ umount <pen drive mount path>
> +
> +Insert the pen drive in one of the ARM Juno' USB type A connectors.

 So why not just generate an ext4 image instead of this procedure?

> +
> +Installing kernel image and DTB
> +===============================
> +1. Connect to the ARM Juno UART0 and execute USB_ON in the terminal

 What does this mean? I mean, if the system is running, you'd have a getty on
UART0, no?

> +2. Connect a USB cable between your PC and ARM Juno USB type B connector
> +   A mass storage device should appear in your desktop.
> +3. Open the software/ folder
> +4. Copy the 'Image' file to software/
> +5. Copy the 'juno-r1.dtb' file to software/ and rename it to r1a57a53.dtb
> +6. Press the red button in the front pannel of ARM Juno

 Is there no way to boot directly from the pen drive instead?

> +
> +At this time, the board will erase the Flash entry for each new item and
> +replace it with the lastest ones.
> +When finished, the board will boot and mount the root filesystem at /dev/sda1.
> +
> diff --git a/configs/arm_junor1_defconfig b/configs/arm_junor1_defconfig
> new file mode 100644
> index 0000000..3987293
> --- /dev/null
> +++ b/configs/arm_junor1_defconfig
> @@ -0,0 +1,16 @@
> +BR2_aarch64=y
> +BR2_KERNEL_HEADERS_VERSION=y
> +BR2_DEFAULT_KERNEL_VERSION="4.2.2"
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_2=y
> +BR2_TARGET_GENERIC_HOSTNAME="junor1-buildroot"
> +BR2_TARGET_GENERIC_ISSUE="Welcome to SNPS Juno r1 by Buildroot"
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_GIT=y
> +BR2_LINUX_KERNEL_CUSTOM_REPO_URL="http://git.linaro.org/landing-teams/working/arm/kernel.git"
> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="6917b51dee54f21816706af2278517b7af218f9a"

 This is just v4.3-rc1, so you could use an upstream kernel instead of Linaro.
Are you sure you took the right sha?

> +BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/arm/junor1/linux-junor1-defconfig"
> +BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
> +BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="Image"
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="arm/juno-r1"

 No need for a bootloader?

 Regards,
 Arnout



-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
