From: Chris Wilkinson <winstonian36@gmail.com>
Date: Mon, 29 Oct 2012 14:54:50 -0400
Subject: [Buildroot] Inconsistent kallsyms data error on ARM
Message-ID: <1351536890.13635.11.camel@Homeserver>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I intermittently get the below error on ARM/EM7210 after make clean,
make.

In  the past it has gone away following config changes but I was never
able to isolate just what buildroot or kernel config changes were
responsible.

What would cause this?

chrisw at Homeserver:~/embedded/buildroot-2012.08$ make
mkdir -p /home/chrisw/embedded/buildroot-2012.08/output/target/etc
echo "buildroot"
> /home/chrisw/embedded/buildroot-2012.08/output/target/etc/hostname
/bin/sed -i -e '$a \127.0.1.1\tbuildroot' \
		-e
'/^127.0.1.1/d' /home/chrisw/embedded/buildroot-2012.08/output/target/etc/hosts
mkdir -p /home/chrisw/embedded/buildroot-2012.08/output/target/etc
echo "Welcome to Buildroot"
> /home/chrisw/embedded/buildroot-2012.08/output/target/etc/issue
/bin/sed -i -e '/# GENERIC_SERIAL$/s~^.*#~ttyS0::respawn:/sbin/getty -L
ttyS0 115200 vt100 #~' \
		/home/chrisw/embedded/buildroot-2012.08/output/target/etc/inittab
/bin/sed -i -e '/^#.*# REMOUNT_ROOTFS_RW$/s~^#\
+~~' /home/chrisw/embedded/buildroot-2012.08/output/target/etc/inittab
>>> linux 3.4.7 Building
PATH="/home/chrisw/embedded/buildroot-2012.08/output/host/bin:/home/chrisw/embedded/buildroot-2012.08/output/host/usr/bin:/home/chrisw/embedded/buildroot-2012.08/output/host/usr/sbin/:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/usr/sbin:/home/chrisw/embedded/x-tools/arm-unknown-linux-gnueabi/bin" PERLLIB="/home/chrisw/embedded/buildroot-2012.08/output/host/usr/lib/perl" /usr/bin/make -j4 HOSTCC="/usr/bin/gcc" HOSTCFLAGS="" ARCH=arm INSTALL_MOD_PATH=/home/chrisw/embedded/buildroot-2012.08/output/target CROSS_COMPILE=" /home/chrisw/embedded/buildroot-2012.08/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-" DEPMOD=/home/chrisw/embedded/buildroot-2012.08/output/host/usr/sbin/depmod -C /home/chrisw/embedded/buildroot-2012.08/output/build/linux-3.4.7 zImage
make[1]: Entering directory
`/home/chrisw/embedded/buildroot-2012.08/output/build/linux-3.4.7'
  CHK     include/linux/version.h
  CHK     include/generated/utsrelease.h
make[2]: `include/generated/mach-types.h' is up to date.
  CALL    scripts/checksyscalls.sh
  CHK     include/generated/compile.h
  KSYM    .tmp_kallsyms1.S
  AS      .tmp_kallsyms1.o
  LD      .tmp_vmlinux2
  KSYM    .tmp_kallsyms2.S
  AS      .tmp_kallsyms2.o
  LD      vmlinux
  SYSMAP  System.map
  SYSMAP  .tmp_System.map
Inconsistent kallsyms data
This is a bug - please report about it
Try make KALLSYMS_EXTRA_PASS=1 as a workaround
make[1]: *** [vmlinux] Error 1
make[1]: Leaving directory
`/home/chrisw/embedded/buildroot-2012.08/output/build/linux-3.4.7'
make: ***
[/home/chrisw/embedded/buildroot-2012.08/output/build/linux-3.4.7/.stamp_built] Error 2

-Chris-
