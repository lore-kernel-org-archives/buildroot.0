From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 13 Sep 2020 00:31:00 +0200
Subject: [Buildroot] [PATCH 2/3] arch: new architecture IBM s390x
In-Reply-To: <20200910174143.311039-3-egorenar@linux.ibm.com>
References: <20200910174143.311039-1-egorenar@linux.ibm.com>
 <20200910174143.311039-3-egorenar@linux.ibm.com>
Message-ID: <20200912223100.GI10548@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Aleksander, All,

Thanks for this new architecture support!

Would it be possible for you to pitch in a few word how IBM is using
Buildroot with s390x?

+Romain in Cc: question about the qemu boot-test for you below...

On 2020-09-10 19:41 +0200, Alexander Egorenkov spake thusly:
> New IBM s390x and Z big-endian architecture.
> 
> Signed-off-by: Alexander Egorenkov <egorenar@linux.ibm.com>
> ---
>  DEVELOPERS                              |  3 +++
>  Makefile                                |  1 +
>  arch/Config.in                          | 13 +++++++++
>  arch/Config.in.s390x                    | 35 +++++++++++++++++++++++++
>  board/qemu/s390x/linux.config           | 35 +++++++++++++++++++++++++
>  board/qemu/s390x/post-build.sh          | 11 ++++++++
>  board/qemu/s390x/readme.txt             |  6 +++++
>  configs/qemu_s390x_defconfig            | 11 ++++++++
>  linux/Config.in                         |  2 +-
>  package/cmake/Config.in                 |  3 ++-
>  package/gcc/gcc.mk                      |  5 ++++
>  package/go/Config.in.host               |  2 +-
>  package/kexec/Config.in                 |  2 +-
>  package/liburcu/Config.in               |  2 +-
>  package/makedumpfile/Config.in          |  2 +-
>  package/systemd/Config.in               |  1 +
>  toolchain/toolchain-buildroot/Config.in |  6 ++---
>  17 files changed, 131 insertions(+), 9 deletions(-)
>  create mode 100644 arch/Config.in.s390x
>  create mode 100644 board/qemu/s390x/linux.config
>  create mode 100755 board/qemu/s390x/post-build.sh
>  create mode 100644 board/qemu/s390x/readme.txt
>  create mode 100644 configs/qemu_s390x_defconfig

This patch does too many things; it should be split in more
self-contained patches:

 1. add the basic arch support:
        DEVELOPERS                              |  3 +++
        Makefile                                |  1 +
        arch/Config.in                          | 13 +++++++++
        arch/Config.in.s390x                    | 35 +++++++++++++++++++++++++
    Note that BR2_s390x should probably select BR2_ARCH_HAS_NO_TOOLCHAIN_BUILDROOT
    in this first patch, to only rely on an external toolchain as a
    first step (makes a simpler, smaller patch, easier to review)

 2. add support for the internal toolchain:
        package/gcc/gcc.mk                      |  5 ++++
        toolchain/toolchain-buildroot/Config.in |  6 ++---
    and then BR2_ARCH_HAS_NO_TOOLCHAIN_BUILDROOT can now be dropped.

 3. add bzImage support in Linux:
        linux/Config.in                         |  2 +-

 4. add the defconfig:
        board/qemu/s390x/linux.config           | 35 +++++++++++++++++++++++++
        board/qemu/s390x/post-build.sh          | 11 ++++++++
        board/qemu/s390x/readme.txt             |  6 +++++
        configs/qemu_s390x_defconfig            | 11 ++++++++

 6. one patch for each of the packages that gains an s390x capability:
        package/cmake/Config.in                 |  3 ++-
        package/go/Config.in.host               |  2 +-
        package/kexec/Config.in                 |  2 +-
        package/liburcu/Config.in               |  2 +-
        package/makedumpfile/Config.in          |  2 +-
        package/systemd/Config.in               |  1 +

See also below for more tidbits...

> diff --git a/DEVELOPERS b/DEVELOPERS
> index b1e60e505f..5e6e8c330c 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -146,6 +146,9 @@ N:	Alexander Egorenkov <egorenar-dev@posteo.net>
>  F:	package/makedumpfile/
>  F:	package/multipath-tools/
>  
> +N:	Alexander Egorenkov <egorenar@linux.ibm.com>
> +F:	arch/Config.in.s390x

Please also add board/qemu/s390x/ and configs/qemu_s390x_defconfig.

>  N:	Alexander Kurz <akurz@blala.de>
>  F:	package/minimodem/
>  
> diff --git a/Makefile b/Makefile
> index 9648fa58d8..384bfe3fe9 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -445,6 +445,7 @@ KERNEL_ARCH := $(shell echo "$(ARCH)" | sed -e "s/-.*//" \
>  	-e s/ppc.*/powerpc/ -e s/mips.*/mips/ \
>  	-e s/riscv.*/riscv/ \
>  	-e s/sh.*/sh/ \
> +	-e s/s390x/s390/ \
>  	-e s/microblazeel/microblaze/)

I did not realise that we still had this ugliness... I think that we
should ultimately move that to the Kconfig side rather than compute that
in the Makefile... But that's not to be part of your series.

[--SNIP--]
> diff --git a/arch/Config.in.s390x b/arch/Config.in.s390x
> new file mode 100644
> index 0000000000..26db901df0
> --- /dev/null
> +++ b/arch/Config.in.s390x
> @@ -0,0 +1,35 @@
> +
> +choice
> +	prompt "Target Architecture Variant"
> +	default BR2_s390x_z13

The default of a choice is always the first item that is available, so
no need to provide it in this case.

> +	depends on BR2_s390x
> +	help
> +	  Specific CPU variant to use
> +
> +config BR2_s390x_z13
> +	bool "z13"
> +	depends on BR2_s390x
> +
> +config BR2_s390x_z14
> +	bool "z14"
> +	depends on BR2_s390x
> +
> +config BR2_s390x_z15
> +	bool "z15"
> +	depends on BR2_s390x
> +
> +endchoice
[--SNIP--]
> diff --git a/board/qemu/s390x/post-build.sh b/board/qemu/s390x/post-build.sh
> new file mode 100755
> index 0000000000..bf83a002c2
> --- /dev/null
> +++ b/board/qemu/s390x/post-build.sh
> @@ -0,0 +1,11 @@
> +#!/bin/sh
> +
> +set -u
> +set -e
> +
> +# Add a console on tty1
> +if [ -e ${TARGET_DIR}/etc/inittab ]; then
> +    grep -qE '^tty1::' ${TARGET_DIR}/etc/inittab || \
> +	sed -i '/GENERIC_SERIAL/a\
> +tty1::respawn:/sbin/getty -L  tty1 0 vt100 # QEMU graphical window' ${TARGET_DIR}/etc/inittab
> +fi

Why can't you set Buildroot's option: BR2_TARGET_GENERIC_GETTY_PORT="tty1" ?

> diff --git a/board/qemu/s390x/readme.txt b/board/qemu/s390x/readme.txt
> new file mode 100644
> index 0000000000..13e7ae80a3
> --- /dev/null
> +++ b/board/qemu/s390x/readme.txt
> @@ -0,0 +1,6 @@
> +Run the emulation with:
> +
> +  qemu-system-s390x -M s390-ccw-virtio -cpu max,zpci=on -m 4G -smp 2 \
> +    -kernel output/images/bzImage -drive file=output/images/rootfs.ext2,if=virtio,format=raw \
> +    -append "rootwait root=/dev/vda net.ifnames=0 biosdevname=0" -display none -serial mon:stdio \
> +    -net nic,model=virtio -net user,host=10.0.2.10,hostfwd=tcp:127.0.0.1:10021-:22

Hint: if you end that line with a comment naming the defconfig, it will
be automatically boot-tested in our weekly gitlab-ci pipelines.

Romain ^^^^, can you xonfirm this is how tit works? And that multi-line
are supported (IIRC, they should be)?

> diff --git a/configs/qemu_s390x_defconfig b/configs/qemu_s390x_defconfig
> new file mode 100644
> index 0000000000..7b4e4acc3d
> --- /dev/null
> +++ b/configs/qemu_s390x_defconfig
> @@ -0,0 +1,11 @@
> +BR2_s390x=y
> +BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
> +BR2_SYSTEM_DHCP="eth0"
> +BR2_ROOTFS_POST_BUILD_SCRIPT="board/qemu/s390x/post-build.sh"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
> +BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
> +BR2_LINUX_KERNEL=y

This will by default use the latest kernel version known by Buildroot,
so when we update the kernel in Buildroot, this defconfig would use the
newer version of the kernel.

However, we prefer that defconfigs are known-tested to work, and thus
that they use a pinned version of the kernel:

    BR2_LINUX_KERNEL_CUSTOM_VERSION=y
    BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.8.7"

> +BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/s390x/linux.config"

Any reason we can't use a defconfig in the kerenl tree?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
