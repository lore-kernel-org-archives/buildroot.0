From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Mar 2017 14:35:12 +0100
Subject: [Buildroot] [PATCH 2/2] configs: add defconfig for Nationalchip
 gx6605s dev board.
In-Reply-To: <1488504021-598-2-git-send-email-ren_guo@c-sky.com>
References: <1488504021-598-1-git-send-email-ren_guo@c-sky.com>
 <1488504021-598-2-git-send-email-ren_guo@c-sky.com>
Message-ID: <20170304143512.094376ef@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  3 Mar 2017 09:20:21 +0800, Guo Ren wrote:
> gx6605s is a nice SOC for dvbs2 DVB product, and C-SKY inside.
> 
> Signed-off-by: Guo Ren <ren_guo@c-sky.com>
> ---
>  DEVELOPERS                     |   2 +
>  board/csky/gx6605s/gdbinit     |  25 ++++++++++
>  board/csky/post-image.sh       |   4 ++
>  board/csky/readme.txt          | 106 +++++++++++++++++++++++++++++++++++++++++
>  configs/csky_gx6605s_defconfig |  19 ++++++++
>  5 files changed, 156 insertions(+)

This is almost good, but there are still a few minor issues.

> diff --git a/board/csky/post-image.sh b/board/csky/post-image.sh
> new file mode 100755
> index 0000000..7bead4f
> --- /dev/null
> +++ b/board/csky/post-image.sh
> @@ -0,0 +1,4 @@
> +#!/bin/sh
> +# copy board/csky/xxx/gdbinit to images/.gdbinit for

Comment not really needed.

> +BOARD_DIR="$(dirname $0)"
> +cp -af $BOARD_DIR/${2}/gdbinit $BINARIES_DIR/.gdbinit

Just hardcode the path here:

install -D -m 0644 board/csky/gx6605s/gdbinit ${BINARIES_DIR}/.gdbinit

If more boards are added later, this can be adjusted, but for now,
there's only one board, so let's keep things simple.

Why is the file being copied as .gdbinit? This makes it hidden, not
very easy for the users to notice there's this file in ${BINARIES_DIR}.


> +C-SKY is a CPU Architecture from www.c-sky.com and has it own instruction set.
> +Just like arm and mips in linux/arch, it named as 'csky'.
> +
> +For C-SKY linux kernel it's made up of three components:
> +1. linux/arch/csky contains the CPU related linux arch implement, eg: mmu,
> +   task-switch, cache control, ... default git repo is here:
> +
> +   http://github.com/c-sky/csky-linux
> +
> +2. linux/addons contains the SOC's drivers which haven't committed in official
> +   linux source code, but we really need them to make the board run.
> +   Here is the default addons git repo:
> +
> +   http://github.com/c-sky/csky-addons
> +
> +   Some C-SKY soc vendor has it own addons git repo. And you can specify
> +   the git-repo in buildroot configuration.
> +
> +3. Official Linux kernel source from www.kernel.org :)

All of this is no longer correct, you're now providing a proper Git
tree for the Linux kernel source code.

> +Buildroot will download cross compiler tools and make them together building,
> +finally setup the rootfs with the packages which spicified in buildroot 
> +configuration.

Not needed.

> +
> +How to build it
> +===============
> +
> +Configure Buildroot
> +-------------------
> +
> +The csky_gx6605s_defconfig configuration is a sample configuration with
> +all that is required to bring the gx6605s Development Board:
> +
> +  $ make csky_gx6605s_defconfig
> +
> +Build everything
> +----------------
> +
> +Note: you will need to have access to the network, since Buildroot will
> +download the packages' sources.
> +
> +  $ make # All will be done, just wait :)

You can remove the comment here.

> +Result of the build
> +-------------------
> +
> +After building, you should obtain this tree:
> +
> +    output/images/
> +    ??? vmlinux
> +    ??? rootfs.tar
> +    ??? <board name>.dtb
> +    ??? .gdbinit
> +
> +How to run it
> +=============
> +
> +1. Download the Jtag-Server here:
> +
> +   https://pan.baidu.com/s/1o7VEPbO

This is a big binary blob, that you want users to run as root. To be
honest, I would not accept to run this random binary blob hosted on
baidu.com on my machine.

So I think it should:

 1/ Be hosted in a more official location

 2/ Not require to run as root

 3/ Preferably come with the source code.

Also, if it's using the JTAG, do you need some additional hardware
than  the board?

Your readme.txt should ideally point to a website that gives more
details about the board.

> +   install it and run it:
> +
> +   $ DebugServerConsole -ddc -rstwait 1000 -prereset -port 1025
> +
> +2. Prepare the nfs-server in your linux PC. You can get the step in google, we
> +   don't mention it here.
> +
> +   Then extract output/images/rootfs.tar to your nfsroot.
> +
> +3. Modified the bootargs in board/csky/<board>/<board>.dts'. You should
> +   specify the correct nfsroot= and ip=, for example in gx6605s.dts:
> +
> +	chosen {
> +   		bootargs = "console=ttyS0,115200 init=/sbin/init root=/dev/nfs\
> +rw nfsroot=192.168.101.230:/opt/nfs/test,v3,tcp,nolock ip=192.168.101.25";
> +	}
> +
> +   You need cd to buildroot dir and '$ make' again to update the dts in
> +   output/images

Our defconfig typically don't use NFS. Could you instead provide a
defconfig that uses a SD card, or instructions to flash on eMMC/NAND ?

> +
> +4. Setup the Console with the rate 115200/8-N-1.
> +
> +5. cd to the output/images and run.
> +
> +   For gx6605s, you need plug a usb ethernet card:
> +   $csky-linux-gdb vmlinux

Why does it need a "usb ethernet card" ?

> +Finish
> +======
> +
> +Any question contact me here:
> +
> +ren_guo at c-sky.com
> +
> +-----------
> +Best Regards
> +
> +Guo Ren

You can remove this "Finish" section entirely.

> diff --git a/configs/csky_gx6605s_defconfig b/configs/csky_gx6605s_defconfig
> new file mode 100644
> index 0000000..ad99b6c
> --- /dev/null
> +++ b/configs/csky_gx6605s_defconfig
> @@ -0,0 +1,19 @@
> +BR2_csky=y
> +BR2_TOOLCHAIN_EXTERNAL=y
> +BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> +BR2_TOOLCHAIN_EXTERNAL_URL="https://github.com/c-sky/tools/raw/master/csky-linux-tools-x86_64-glibc-linux-4.9.2-20170227.tar.gz"
> +BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="csky-linux"
> +BR2_TOOLCHAIN_EXTERNAL_GCC_4_5=y
> +BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_9=y
> +BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
> +BR2_TOOLCHAIN_EXTERNAL_CXX=y
> +BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
> +BR2_SYSTEM_DHCP="eth0"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/csky/post-image.sh"
> +BR2_ROOTFS_POST_SCRIPT_ARGS="gx6605s"

This line can be removed once you change the post-image.sh as suggested
above.

> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/c-sky/linux-4.9.y/archive/3549ac308d427b0adb98b410d0acd82449fb5c13.tar.gz"
> +BR2_LINUX_KERNEL_DEFCONFIG="gx66xx"
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="gx6605s"

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
