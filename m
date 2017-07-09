From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 9 Jul 2017 18:25:32 +0200
Subject: [Buildroot] Issue with the HOST_DIR/usr -> HOST_DIR move
Message-ID: <20170709182532.40ff2614@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Arnout,

I've started rebuilding the pre-built Buildroot external toolchains
after the HOST_DIR/usr -> HOST_DIR move. I've dropped my hack on the
toolchain wrapper to support the fact that I was moving the toolchain
out of the usr/ folder... because obviously this is no longer needed.
So basically, I'm building on top of master + a patch that builds
host-flex, host-gmp, host-mpc, etc. as static libraries instead of
shared ones.

Using this defconfig:

BR2_arm=y
BR2_HOST_DIR="/opt/br-arm-full-2017.05-1071-gef605f5"
BR2_JLEVEL=16
BR2_KERNEL_HEADERS_3_10=y
BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
BR2_GCC_VERSION_4_9_X=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
# BR2_TARGET_ROOTFS_TAR is not set

I'm seeing this build failure:

ESC[7m>>> uclibc 1.0.25 BuildingESC[27m
/usr/bin/make -j16 -C /opt/toolchain-build/build/uclibc-1.0.25 ARCH="arm" CROSS_COMPILE="/opt/br-arm-full-2017.05-1071-gef605f5/bin/arm-buildroot-linux-uclibcgnueabi-" UCLIBC_EXTRA_CFLAGS=" " HOSTCC="/usr/bin/gcc" headers
/opt/br-arm-full-2017.05-1071-gef605f5/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc.br_real: No such file or directory
/opt/br-arm-full-2017.05-1071-gef605f5/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc.br_real: No such file or directory
/opt/br-arm-full-2017.05-1071-gef605f5/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc.br_real: No such file or directory
/opt/br-arm-full-2017.05-1071-gef605f5/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc.br_real: No such file or directory
make[1]: Entering directory `/opt/toolchain-build/build/uclibc-1.0.25'
  MKDIR include/bits
  GEN include/bits/uClibc_config.h
/opt/br-arm-full-2017.05-1071-gef605f5/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc.br_real: No such file or directory
/opt/br-arm-full-2017.05-1071-gef605f5/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc.br_real: No such file or directory
/opt/br-arm-full-2017.05-1071-gef605f5/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc.br_real: No such file or directory
/opt/br-arm-full-2017.05-1071-gef605f5/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc.br_real: No such file or directory
  LN include/semaphore.h
  LN include/pthread.h
  LN include/bits/libc-lock.h
  LN include/bits/stdio-lock.h
  LN include/bits/pthreadtypes.h
  LN include/bits/semaphore.h
  GEN include/bits/sysnum.h
/opt/br-arm-full-2017.05-1071-gef605f5/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc.br_real: No such file or directory
/opt/br-arm-full-2017.05-1071-gef605f5/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc.br_real: No such file or directory

There are two problems here:

 * First, the problem that $(HOST_DIR)/usr didn't exist. The reason is
   that you rule that creates $(HOST_DIR)/usr is only triggered if the
   Buildroot Makefile creates $(HOST_DIR). But when you're building a
   SDK inside /opt/foo/, therefore setting BR2_HOST_DIR=/opt/foo/, it's
   pretty likely that /opt/foo/ might exist before Buildroot gets
   triggered. In such a situation, your $(HOST_DIR) rule in the main
   Makefile doesn't get triggered, and $(HOST_DIR)/usr is not created.

 * Even if the symlink doesn't exist, the build should still work.
   Indeed, the symlink was kept for backward compatibility reasons, but
   here I'm doing a full build from scratch, which I would expect to
   work even without the usr/ compatibility symlink.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
