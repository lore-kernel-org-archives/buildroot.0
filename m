From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 24 Sep 2020 23:49:01 +0200
Subject: [Buildroot] [PATCH v4 05/12] board/qemu: add IBM s390x and Z
 arch support
In-Reply-To: <20200917040802.846896-6-egorenar@linux.ibm.com>
References: <20200917040802.846896-1-egorenar@linux.ibm.com>
 <20200917040802.846896-6-egorenar@linux.ibm.com>
Message-ID: <20200924214901.GC11621@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Alexander, All,

On 2020-09-17 06:07 +0200, Alexander Egorenkov spake thusly:
> Signed-off-by: Alexander Egorenkov <egorenar@linux.ibm.com>
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

I was not too fond of this, so i dropped it and we still get a login
prompt in the terminal that started qemu.

Also, since qemu is not spawning a window to emulate a graphics card (of
sorts), then the tty1 will not really be usable anyway.

So I dropped the post-build script.

> +fi
> diff --git a/board/qemu/s390x/readme.txt b/board/qemu/s390x/readme.txt
> new file mode 100644
> index 0000000000..7fa41640c0
> --- /dev/null
> +++ b/board/qemu/s390x/readme.txt
> @@ -0,0 +1,8 @@
> +Run the emulation with:
> +
> +  qemu-system-s390x -M s390-ccw-virtio -cpu max,zpci=on -m 4G -smp 2 \
> +    -kernel output/images/bzImage -drive file=output/images/rootfs.ext2,if=virtio,format=raw \
> +    -append "rootwait root=/dev/vda net.ifnames=0 biosdevname=0" -display none -serial mon:stdio \
> +    -net nic,model=virtio -net user,host=10.0.2.10,hostfwd=tcp:127.0.0.1:10021-:22 # qemu_s390x_defconfig

I saw no reason to force the network IP,so I dropped it. Also, there is
no sshd running, so there is no need to do a port forwarding either, so
dropped too.

Applied to master with those minor fixes, thanks!

Regards,
Yann E. MORIN.

> +The login prompt will appear in the terminal that started Qemu.
> diff --git a/configs/qemu_s390x_defconfig b/configs/qemu_s390x_defconfig
> new file mode 100644
> index 0000000000..8e25d64e15
> --- /dev/null
> +++ b/configs/qemu_s390x_defconfig
> @@ -0,0 +1,24 @@
> +# Architecture
> +BR2_s390x=y
> +
> +# System
> +BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
> +BR2_SYSTEM_DHCP="eth0"
> +
> +# Filesystem
> +BR2_ROOTFS_POST_BUILD_SCRIPT="board/qemu/s390x/post-build.sh"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
> +BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
> +BR2_TARGET_ROOTFS_EXT2=y
> +# BR2_TARGET_ROOTFS_TAR is not set
> +
> +# Kernel
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.8.7"
> +BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
> +BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> +
> +# host-qemu for gitlab testing
> +BR2_PACKAGE_HOST_QEMU=y
> +BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE=y
> -- 
> 2.26.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
