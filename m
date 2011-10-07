From: Sven Neumann <s.neumann@raumfeld.com>
Date: Sat, 08 Oct 2011 00:49:08 +0200
Subject: [Buildroot] error building kernel with initramfs
Message-ID: <1318027748.4647.3.camel@bender>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net

Hi,

if you select gzip compression for the rootfs.cpio file
(BR2_TARGET_ROOTFS_CPIO_GZIP), then the rebuild of the kernel with
initramfs is going to fail:

[7m>>>   Generating root filesystem image rootfs.cpio[27m
if [ ! -e /var/lib/buildbot/build-arm-1.8/build/output/target/init ]; then /usr/bin/install -m 0755 fs/cpio/init /var/lib/buildbot/build-arm-1.8/build/output/target/init; fi
rm -f /var/lib/buildbot/build-arm-1.8/build/output/build/_fakeroot.fs
touch /var/lib/buildbot/build-arm-1.8/build/output/build/.fakeroot.00000
cat /var/lib/buildbot/build-arm-1.8/build/output/build/.fakeroot* > /var/lib/buildbot/build-arm-1.8/build/output/build/_fakeroot.fs
echo "chown -R 0:0 /var/lib/buildbot/build-arm-1.8/build/output/target" >> /var/lib/buildbot/build-arm-1.8/build/output/build/_fakeroot.fs
cat target/generic/device_table.txt  > /var/lib/buildbot/build-arm-1.8/build/output/build/_device_table.txt
echo "/var/lib/buildbot/build-arm-1.8/build/output/host/usr/bin/makedevs -d /var/lib/buildbot/build-arm-1.8/build/output/build/_device_table.txt /var/lib/buildbot/build-arm-1.8/build/output/target" >> /var/lib/buildbot/build-arm-1.8/build/output/build/_fakeroot.fs
echo "	cd /var/lib/buildbot/build-arm-1.8/build/output/target && find . | cpio --quiet -o -H newc > /var/lib/buildbot/build-arm-1.8/build/output/images/rootfs.cpio" >> /var/lib/buildbot/build-arm-1.8/build/output/build/_fakeroot.fs
chmod a+x /var/lib/buildbot/build-arm-1.8/build/output/build/_fakeroot.fs
/var/lib/buildbot/build-arm-1.8/build/output/host/usr/bin/fakeroot -- /var/lib/buildbot/build-arm-1.8/build/output/build/_fakeroot.fs
rootdir=/var/lib/buildbot/build-arm-1.8/build/output/target
table='/var/lib/buildbot/build-arm-1.8/build/output/build/_device_table.txt'
gzip -9 -f /var/lib/buildbot/build-arm-1.8/build/output/images/rootfs.cpio
[7m>>>   Rebuilding kernel with initramfs[27m
# Build the kernel.
PATH="/var/lib/buildbot/build-arm-1.8/build/output/host/bin:/var/lib/buildbot/build-arm-1.8/build/output/host/usr/bin:/var/lib/buildbot/build-arm-1.8/build/output/host/usr/sbin/:/usr/local/bin:/usr/bin:/bin:/usr/games" PERLLIB="/var/lib/buildbot/build-arm-1.8/build/output/host/usr/lib/perl" /usr/bin/make -j4 HOSTCC="/usr/bin/gcc" HOSTCFLAGS="" ARCH=arm INSTALL_MOD_PATH=/var/lib/buildbot/build-arm-1.8/build/output/target CROSS_COMPILE=" /var/lib/buildbot/build-arm-1.8/build/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-" LZMA="/var/lib/buildbot/build-arm-1.8/build/output/host/usr/bin/lzma" -C /var/lib/buildbot/build-arm-1.8/build/output/build/linux-3.0.4 uImage
make[1]: Entering directory `/var/lib/buildbot/build-arm-1.8/build/output/build/linux-3.0.4'
  CHK     include/linux/version.h
  CHK     include/generated/utsrelease.h
make[2]: `include/generated/mach-types.h' is up to date.
  CALL    scripts/checksyscalls.sh
  /var/lib/buildbot/build-arm-1.8/build/output/build/linux-3.0.4/scripts/gen_initramfs_list.sh: Cannot open '/var/lib/buildbot/build-arm-1.8/build/output/images/rootfs.cpio'
make[2]: *** [usr/initramfs_data.cpio.gz] Error 1
  CHK     include/generated/compile.h
make[1]: *** [usr] Error 2
make[1]: *** Waiting for unfinished jobs....
make[1]: *** wait: No child processes.  Stop.
make: *** [/var/lib/buildbot/build-arm-1.8/build/output/build/linux-3.0.4/.stamp_initramfs_rebuilt] Error 2


I guess the fix for this is to change fs/initramfs/Config.in to select
BR2_TARGET_ROOTFS_CPIO_NONE, right ?


Sven
