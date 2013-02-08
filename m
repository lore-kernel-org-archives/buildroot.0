From: John Stile <john@stilen.com>
Date: Fri, 08 Feb 2013 09:25:17 -0800
Subject: [Buildroot] need smaller filesystem for NOR
Message-ID: <1360344317.17385.31.camel@genx.eng.msli.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I primarily boot from one of two 128Mb NAND areas, but I have an 8Mb NOR
failsafe if NAND is bad.  I have about 5.5Mb available for the
Filesystem after loading at91bootstrap, uboot, uboot-env, and kernel.
...(using buildroot-2011.11)...

The rootfs.jffs2 for NAND is 41Mb.
I need one for NOR that is less than 5.5Mb.

Is there a good method or script to copy buildroot's rootfs.jffs2  to
make a smaller copy for NOR?

My first attempt  leads to
VFS: Mounted root (jffs2 filesystem) on device 31:1.
Freeing init memory: 104K
Warning: unable to open an initial console.
Kernel panic - not syncing: No init found.  Try passing init= option to kernel.
[<c0028678>] (unwind_backtrace+0x0/0xdc) from [<c0243990>] (panic+0x34/0x110)
[<c0243990>] (panic+0x34/0x110) from [<c002254c>] (init_post+0x138/0x170)
[<c002254c>] (init_post+0x138/0x170) from [<c0008408>] (kernel_init+0xbc/0xe8)
[<c0008408>] (kernel_init+0xbc/0xe8) from [<c003b634>] (do_exit+0x0/0x5a4)
[<c003b634>] (do_exit+0x0/0x5a4) from [<00000003>] (0x3)

I think this means the file system is found and mounted, and for some
reason, init isn't found, although I have played with init= to no avail,
and if I mount my little jffs2, I do see busybox and all the links
(/bin/init).

I tried to trying to hack it (unsuccessfully) with a post-build script
that tries to do what buildroot does:

#!/bin/bash
TARGET_DIR="${PWD}/output/target"
BUILD_DIR="${PWD}/output/build"
HOST_DIR="${PWD}/output/host"
STAGE_DIR="${PWD}/output/NORtarget"
TARGET_IMG="${PWD}/output/images/NORrootfs.jffs2"
FILTER_LIST=${PWD}/boarts/atmel/at91sam9g20ek/nor_flash_list.txt
ROOTFS_DEVICE_TABLES="${PWD}/target/generic/device_table.txt"
FULL_DEVICE_TABLE="$BUILD_DIR/_device_table.txt"

echo "[--] Remove old image: ${TARGET_DIR}"
rm -rf "${TARGET_DIR}"

echo "[--] Coypy into new image"
rsync -a \
 --exclude-from=${FILTER_LIST} \
${TARGET_DIR}/ ${STAGE_DIR}

echo "[--]  Size of new image:"
du -sh ${STAGE_DIR}

echo "[--]  Make device table:"
cat $ROOTFS_DEVICE_TABLES > $FULL_DEVICE_TABLE

FAKEROOT_SCRIPT="#!/bin/bash

chown -R 0:0 ${TARGET_DIR}

${HOST_DIR}/usr/bin/makedevs \
 -d ${BUILD_DIR}/_device_table.txt \
 ${TARGET_DIR}

${HOST_DIR}/usr/sbin/mkfs.jffs2 \
 -e 0x20000 -l -s 0x1000 -n \
 -d ${TARGET_DIR} \
 -o ${TARGET_IMG}

${HOST_DIR}/usr/bin/makedevs \
 -d ${BUILD_DIR}/_device_table.txt \
 ${TARGET_DIR}
"

echo "[--]  Call FAKEROOT_SCRIPT"
echo "${FAKEROOT_SCRIPT}"
$HOST_DIR/usr/bin/fakeroot -- /bin/bash -c "${FAKEROOT_SCRIPT}"
echo $?
