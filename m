From: Romain Naour <romain.naour@gmail.com>
Date: Wed, 16 Sep 2020 19:51:36 +0200
Subject: [Buildroot] [PATCH v3 04/11] board/qemu: add IBM s390x and Z
 arch support
In-Reply-To: <20200916055934.609436-5-egorenar@linux.ibm.com>
References: <20200916055934.609436-1-egorenar@linux.ibm.com>
 <20200916055934.609436-5-egorenar@linux.ibm.com>
Message-ID: <a79e13e6-902e-c351-c292-383660e06451@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Alexander,

Thanks for this new version.

Le 16/09/2020 ? 07:59, Alexander Egorenkov a ?crit?:
> Signed-off-by: Alexander Egorenkov <egorenar@linux.ibm.com>
> ---
>  DEVELOPERS                     |  2 ++
>  board/qemu/s390x/post-build.sh | 11 +++++++++++
>  board/qemu/s390x/readme.txt    |  8 ++++++++
>  configs/qemu_s390x_defconfig   | 13 +++++++++++++
>  4 files changed, 34 insertions(+)
>  create mode 100755 board/qemu/s390x/post-build.sh
>  create mode 100644 board/qemu/s390x/readme.txt
>  create mode 100644 configs/qemu_s390x_defconfig
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 2285694f66..2c6cc45d45 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -148,6 +148,8 @@ F:	package/multipath-tools/
>  
>  N:	Alexander Egorenkov <egorenar@linux.ibm.com>
>  F:	arch/Config.in.s390x
> +F:	board/qemu/s390x/
> +F:	configs/qemu_s390x_defconfig
>  
>  N:	Alexander Kurz <akurz@blala.de>
>  F:	package/minimodem/
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
> +
> +The login prompt will appear in the terminal that started Qemu.
> diff --git a/configs/qemu_s390x_defconfig b/configs/qemu_s390x_defconfig
> new file mode 100644
> index 0000000000..5f41b1e626
> --- /dev/null
> +++ b/configs/qemu_s390x_defconfig
> @@ -0,0 +1,13 @@
> +BR2_s390x=y
> +BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
> +BR2_SYSTEM_DHCP="eth0"
> +BR2_ROOTFS_POST_BUILD_SCRIPT="board/qemu/s390x/post-build.sh"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
> +BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.8.7"
> +BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
> +BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> +BR2_TARGET_ROOTFS_EXT2=y
> +# BR2_TARGET_ROOTFS_TAR is not set
> 

Other qemu_*_defconfig select host-qemu to build qemu-system-<arch> for gitlab
runtime testing:

# host-qemu for gitlab testing
BR2_PACKAGE_HOST_QEMU=y
BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE=y

But this require to add s309x to BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS:

diff --git a/package/qemu/Config.in.host b/package/qemu/Config.in.host
index 7ccf768d15..a7c0f7bf59 100644
--- a/package/qemu/Config.in.host
+++ b/package/qemu/Config.in.host
@@ -15,6 +15,7 @@ config BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS
 	default y if BR2_powerpc64
 	default y if BR2_powerpc64le
 	default y if BR2_riscv
+	default y if BR2_s390x
 	default y if BR2_sh
 	default y if BR2_sparc
 	default y if BR2_sparc64

While testing with QEMU emulator version 5.1.0 built by Buildroot I get:

VFIO - User Level meta-driver version: 0.3
illegal operation: 0001 ilc:1 [#1] SMP
Modules linked in: s390_trng(+) rng_core aes_s390 des_s390 libdes virtio_net
net_failover failover vfio_ccw vfio_mdev mdev vfio_iommu_type1 sha_common vfio
CPU: 0 PID: 135 Comm: udevd Not tainted 5.8.7 #1
Hardware name: QEMU 2964 QEMU (KVM/Linux)
Krnl PSW : 0704f00180000000 000003ff8001d078 (trng_init+0x78/0x190 [s390_trng])
           R:0 T:1 IO:1 EX:1 Key:0 M:1 W:0 P:0 AS:3 CC:3 PM:0 RI:0 EA:3
Krnl GPRS: 000000008fcb9458 0000000000000000 00000000fcbf3614 0000000000000001
           0000000000000000 0000000000000002 0000000000000004 0000000002ad35c0
           0000000000000ac0 000003ff8001d190 0000000000000000 000003ff8000e300
           00000000fcb14000 0000000000001b78 000003ff8001d056 000003e0007cfc90
Krnl Code: 000003ff8001d06c: a714fffe		brc	1,000003ff8001d068
           000003ff8001d070: 9120f0ae		tm	174(%r15),32
          #000003ff8001d074: a774001b		brc	7,000003ff8001d0aa
          >000003ff8001d078: c010ffff8bc8	larl	%r1,000003ff8000e808
           000003ff8001d07e: e32010000002	ltg	%r2,0(%r1)
           000003ff8001d084: a7840073		brc	8,000003ff8001d16a
           000003ff8001d088: e55c20180004	chsi	24(%r2),4
           000003ff8001d08e: a7c4006e		brc	12,000003ff8001d16a
Call Trace:
[<000003ff8001d078>] trng_init+0x78/0x190 [s390_trng]
([<000003ff8001d056>] trng_init+0x56/0x190 [s390_trng])
 [<0000000000100818>] do_one_initcall+0x40/0x1f0
 [<0000000000207cd2>] do_init_module+0x6a/0x290
 [<000000000020950a>] __do_sys_finit_module+0xaa/0xc8
 [<0000000000b9801c>] system_call+0xe0/0x2b0
Last Breaking-Event-Address:
 [<000003ff8001d05c>] trng_init+0x5c/0x190 [s390_trng]
Kernel panic - not syncing: Fatal exception: panic_on_oops


I'm not sure it's a kernel or qemu issue because I can't reproduce with qemu
installed on a Fedora 31 (QEMU emulator version 4.1.1 (qemu-4.1.1-1.fc31)).

Best regards,
Romain
