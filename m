From: ren_guo <ren_guo@c-sky.com>
Date: Mon, 6 Mar 2017 17:23:30 +0800
Subject: [Buildroot] [PATCH 2/2] configs: add defconfig for Nationalchip
 gx6605s dev board.
In-Reply-To: <20170304143512.094376ef@free-electrons.com>
References: <1488504021-598-1-git-send-email-ren_guo@c-sky.com>
 <1488504021-598-2-git-send-email-ren_guo@c-sky.com>
 <20170304143512.094376ef@free-electrons.com>
Message-ID: <d484bb69-02a0-0911-015a-1c4f613079ea@c-sky.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello, Thomas

>> diff --git a/board/csky/post-image.sh b/board/csky/post-image.sh
>> new file mode 100755
>> index 0000000..7bead4f
>> --- /dev/null
>> +++ b/board/csky/post-image.sh
>> @@ -0,0 +1,4 @@
>> +#!/bin/sh
>> +# copy board/csky/xxx/gdbinit to images/.gdbinit for
> Comment not really needed.
>
ok.

>> +BOARD_DIR="$(dirname $0)"
>> +cp -af $BOARD_DIR/${2}/gdbinit $BINARIES_DIR/.gdbinit
> Just hardcode the path here:
>
> install -D -m 0644 board/csky/gx6605s/gdbinit ${BINARIES_DIR}/.gdbinit
>
> If more boards are added later, this can be adjusted, but for now,
> there's only one board, so let's keep things simple.

ok

> Why is the file being copied as .gdbinit? This makes it hidden, not
> very easy for the users to notice there's this file in ${BINARIES_DIR}.

.gdbinit is the default script to csky-linux-gdb, I've update readme.txt to emphasize this.

>> +C-SKY is a CPU Architecture from www.c-sky.com and has it own instruction set.
>> +Just like arm and mips in linux/arch, it named as 'csky'.
>> +
>> +For C-SKY linux kernel it's made up of three components:
>> +1. linux/arch/csky contains the CPU related linux arch implement, eg: mmu,
>> +   task-switch, cache control, ... default git repo is here:
>> +
>> +   http://github.com/c-sky/csky-linux
>> +
>> +2. linux/addons contains the SOC's drivers which haven't committed in official
>> +   linux source code, but we really need them to make the board run.
>> +   Here is the default addons git repo:
>> +
>> +   http://github.com/c-sky/csky-addons
>> +
>> +   Some C-SKY soc vendor has it own addons git repo. And you can specify
>> +   the git-repo in buildroot configuration.
>> +
>> +3. Official Linux kernel source from www.kernel.org :)
> All of this is no longer correct, you're now providing a proper Git
> tree for the Linux kernel source code.

Yes, you are right. I've changed it.

>> +Buildroot will download cross compiler tools and make them together building,
>> +finally setup the rootfs with the packages which spicified in buildroot
>> +configuration.
> Not needed.

ok, remove it.

>> +
>> +How to build it
>> +===============
>> +
>> +Configure Buildroot
>> +-------------------
>> +
>> +The csky_gx6605s_defconfig configuration is a sample configuration with
>> +all that is required to bring the gx6605s Development Board:
>> +
>> +  $ make csky_gx6605s_defconfig
>> +
>> +Build everything
>> +----------------
>> +
>> +Note: you will need to have access to the network, since Buildroot will
>> +download the packages' sources.
>> +
>> +  $ make # All will be done, just wait :)
> You can remove the comment here.

ok, remove it.

>> +Result of the build
>> +-------------------
>> +
>> +After building, you should obtain this tree:
>> +
>> +    output/images/
>> +    ??? vmlinux
>> +    ??? rootfs.tar
>> +    ??? <board name>.dtb
>> +    ??? .gdbinit
>> +
>> +How to run it
>> +=============
>> +
>> +1. Download the Jtag-Server here:
>> +
>> +   https://pan.baidu.com/s/1o7VEPbO
> This is a big binary blob, that you want users to run as root. To be
> honest, I would not accept to run this random binary blob hosted on
> baidu.com on my machine.
>
> So I think it should:
>
>   1/ Be hosted in a more official location

We've prepared the tar.gz on github instead of xxx.sh.

>   2/ Not require to run as root

Now, you don't need sudo to install.
Perhaps you need run it with sudo ,it depends on libusb to detect
c510:b210 csky usb jtag.

>   3/ Preferably come with the source code.

No plan to release the source code, but we'll consider later.

> Also, if it's using the JTAG, do you need some additional hardware
> than  the board?

No need, it has integrated hardware Jtag.

> Your readme.txt should ideally point to a website that gives more
> details about the board.
>
I've updated the readme with the introduction of gx6605s dev board.

>> +   install it and run it:
>> +
>> +   $ DebugServerConsole -ddc -rstwait 1000 -prereset -port 1025
>> +
>> +2. Prepare the nfs-server in your linux PC. You can get the step in google, we
>> +   don't mention it here.
>> +
>> +   Then extract output/images/rootfs.tar to your nfsroot.
>> +
>> +3. Modified the bootargs in board/csky/<board>/<board>.dts'. You should
>> +   specify the correct nfsroot= and ip=, for example in gx6605s.dts:
>> +
>> +	chosen {
>> +   		bootargs = "console=ttyS0,115200 init=/sbin/init root=/dev/nfs\
>> +rw nfsroot=192.168.101.230:/opt/nfs/test,v3,tcp,nolock ip=192.168.101.25";
>> +	}
>> +
>> +   You need cd to buildroot dir and '$ make' again to update the dts in
>> +   output/images
> Our defconfig typically don't use NFS. Could you instead provide a
> defconfig that uses a SD card, or instructions to flash on eMMC/NAND ?

ok, we use usb drive.

>> +
>> +4. Setup the Console with the rate 115200/8-N-1.
>> +
>> +5. cd to the output/images and run.
>> +
>> +   For gx6605s, you need plug a usb ethernet card:
>> +   $csky-linux-gdb vmlinux
> Why does it need a "usb ethernet card" ?

The gx6605s SOC has no mac controller, it need usb to support networking.

>> +Finish
>> +======
>> +
>> +Any question contact me here:
>> +
>> +ren_guo at c-sky.com
>> +
>> +-----------
>> +Best Regards
>> +
>> +Guo Ren
> You can remove this "Finish" section entirely.

ok

>> diff --git a/configs/csky_gx6605s_defconfig b/configs/csky_gx6605s_defconfig
>> new file mode 100644
>> index 0000000..ad99b6c
>> --- /dev/null
>> +++ b/configs/csky_gx6605s_defconfig
>> @@ -0,0 +1,19 @@
>> +BR2_csky=y
>> +BR2_TOOLCHAIN_EXTERNAL=y
>> +BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
>> +BR2_TOOLCHAIN_EXTERNAL_URL="https://github.com/c-sky/tools/raw/master/csky-linux-tools-x86_64-glibc-linux-4.9.2-20170227.tar.gz"
>> +BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="csky-linux"
>> +BR2_TOOLCHAIN_EXTERNAL_GCC_4_5=y
>> +BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_9=y
>> +BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
>> +BR2_TOOLCHAIN_EXTERNAL_CXX=y
>> +BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
>> +BR2_SYSTEM_DHCP="eth0"
>> +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/csky/post-image.sh"
>> +BR2_ROOTFS_POST_SCRIPT_ARGS="gx6605s"
> This line can be removed once you change the post-image.sh as suggested
> above.

ok

Best Regards

guoren
