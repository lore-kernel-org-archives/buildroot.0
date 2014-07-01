From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  1 Jul 2014 20:02:59 +0200
Subject: [Buildroot] [PATCH 00/10] Proposals of deprecation/removal,
	mainly affecting toolchain
Message-ID: <1404237789-15563-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This set of patches proposes a certain number of deprecation or
removal. They are mostly independent from each other:

 - Deprecation of the AVR32 architecture.
 - Removal of old binutils versions
 - Removal of uClibc 0.9.32.1
 - Removal of gcc 4.3.x and 4.6.x
 - Removal of gdb 7.4 and 7.5
 - Removal of busybox version selection

Let me know what you think about those various proposals.

Thanks,

Thomas

Thomas Petazzoni (10):
  arch: deprecate the AVR32 architecture
  binutils: switch mips/mipsel/sh to binutils 2.21.1 by default
  binutils: remove 2.20.1, 2.21 and 2.23.1
  uclibc: remove version 0.9.32.1
  package: remove references to uClibc 0.9.32
  uclibc: remove BR2_UCLIBC_ARM_TYPE
  gcc: remove versions 4.3.x and 4.6.x
  qt: remove gcc 4.6.x specific kludge
  gdb: remove versions 7.4 and 7.5
  busybox: support only one version

 Config.in.legacy                                   |   84 +-
 arch/Config.in                                     |    6 +
 package/aiccu/Config.in                            |    3 +-
 package/binutils/2.20.1/110-arm-eabi-conf.patch    |   24 -
 package/binutils/2.20.1/120-sh-conf.patch          |   42 -
 .../2.20.1/300-001_ld_makefile_patch.patch         |   24 -
 .../2.20.1/300-012_check_ldrunpath_length.patch    |   21 -
 package/binutils/2.20.1/400-arm_link_speed.patch   |  183 ----
 package/binutils/2.20.1/500-sysroot.patch          |   36 -
 package/binutils/2.21/110-arm-eabi-conf.patch      |   24 -
 package/binutils/2.21/120-sh-conf.patch            |   42 -
 .../binutils/2.21/300-001_ld_makefile_patch.patch  |   24 -
 .../2.21/300-012_check_ldrunpath_length.patch      |   21 -
 package/binutils/2.21/500-sysroot.patch            |   36 -
 package/binutils/2.23.1/120-sh-conf.patch          |   29 -
 .../2.23.1/300-001_ld_makefile_patch.patch         |   24 -
 .../2.23.1/300-012_check_ldrunpath_length.patch    |   21 -
 package/binutils/2.23.1/500-sysroot.patch          |   37 -
 .../binutils/2.23.1/900-xtensa-trampolines.patch   |  846 ----------------
 .../901-xtensa-gas-first-frag-alignment.patch      |   51 -
 .../902-xtensa-gas-ld-diff-relocation-signed.patch |  133 ---
 package/binutils/Config.in.host                    |   16 +-
 package/busybox/1.19.4/busybox-1.19.4-udhcp.patch  |  164 ----
 .../busybox/1.20.2/busybox-1.20.2-kernel_ver.patch |   25 -
 package/busybox/1.20.2/busybox-1.20.2-ntpd.patch   |   11 -
 .../1.20.2/busybox-1.20.2-pkg-config-selinux.patch |   67 --
 .../1.20.2/busybox-1.20.2-sys-resource.patch       |  123 ---
 ...01-libbb-use-poll.h-instead-of-sys-poll.h.patch |   32 -
 ...onfig-include-linux-if_slip.h-instead-of-.patch |   33 -
 ...libiproute-use-linux-if_packet.h-instead-.patch |   36 -
 package/busybox/Config.in                          |   37 +-
 ...ibiproute-use-linux-if_packet.h-instead-.patch} |    0
 ...patch => busybox-0002-busybox-1.22.1-ash.patch} |    0
 ...atch => busybox-0003-busybox-1.22.1-date.patch} |    0
 ...ch => busybox-0004-busybox-1.22.1-iplink.patch} |    0
 ....patch => busybox-0005-busybox-1.22.1-nc.patch} |    0
 package/busybox/busybox-1.19.x.config              | 1013 -------------------
 package/busybox/busybox-1.20.x.config              | 1024 -------------------
 package/busybox/busybox-1.21.x.config              | 1030 --------------------
 .../{busybox-1.22.x.config => busybox.config}      |    0
 package/busybox/busybox.mk                         |    7 +-
 package/connman/Config.in                          |    4 +-
 package/fio/Config.in                              |    7 +-
 package/gcc/4.3.6/100-uclibc-conf.patch            |   13 -
 package/gcc/4.3.6/104-gnuhurd-uclibc-conf.patch    |   13 -
 package/gcc/4.3.6/301-missing-execinfo_h.patch     |   11 -
 package/gcc/4.3.6/302-c99-snprintf.patch           |   13 -
 .../gcc/4.3.6/305-libmudflap-susv3-legacy.patch    |   49 -
 package/gcc/4.3.6/810-arm-softfloat-libgcc.patch   |   29 -
 .../4.3.6/993-arm_insn-opinit-RTX_CODE-fixup.patch |   41 -
 .../gcc/4.3.6/998-gcc-4.3.0-fix-header.00.patch    |   15 -
 .../gcc/4.3.6/999-4.3.2-armeabi-aapcs-linux.patch  |   18 -
 .../4.3.6/999-4.3.3-arm-fix-for-bug-37436.patch    |   86 --
 ...gcc-4.3.0-cris-pragma-pack-warning-remove.patch |   13 -
 package/gcc/4.3.6/gcc-43-pr39429.patch             |   24 -
 .../powerpc-link-with-math-lib.patch.conditional   |  125 ---
 package/gcc/4.6.4/100-uclibc-conf.patch            |   13 -
 package/gcc/4.6.4/301-missing-execinfo_h.patch     |   11 -
 package/gcc/4.6.4/302-c99-snprintf.patch           |   13 -
 .../gcc/4.6.4/305-libmudflap-susv3-legacy.patch    |   49 -
 package/gcc/4.6.4/810-arm-softfloat-libgcc.patch   |   38 -
 package/gcc/4.6.4/820-arm-unbreak-armv4t.patch     |   14 -
 .../powerpc-link-with-math-lib.patch.conditional   |  125 ---
 package/gcc/Config.in.host                         |   16 -
 package/gdb/7.4.1/00_all_ptrace_setsiginfo.patch   |  314 ------
 package/gdb/7.4.1/05_all_readline-headers.patch    |   42 -
 .../gdb-100-xtensa-fix-linux-ptrace-includes.patch |   60 --
 .../7.4.1/gdb-101-xtensa-fix-on-64-bit-hosts.patch |   42 -
 .../gdb-100-xtensa-fix-linux-ptrace-includes.patch |   60 --
 .../7.5.1/gdb-101-xtensa-fix-on-64-bit-hosts.patch |   42 -
 package/gdb/Config.in.host                         |   10 -
 package/iputils/Config.in                          |    3 +-
 package/libglib2/libglib2.mk                       |    2 +-
 package/mpd/Config.in                              |    1 -
 package/mtr/Config.in                              |    2 +-
 package/qt/qt.mk                                   |    5 -
 ...x-e500-__fe_nomask_env-use-of-__set_errno.patch |   34 -
 ...__libc_epoll_pwait-compile-failure-on-x86.patch |   43 -
 ...deps-add-__kernel_long-and-__kernel_ulong.patch |  392 --------
 .../0.9.32.1/uclibc-0004-sparc-errno-fix.patch     |   11 -
 package/uclibc/0.9.32.1/uclibc-0005-unshare.patch  |   82 --
 .../uclibc-0006-linuxthreads-errno-fix.patch       |   68 --
 ...07-libc-add-non-standard-execvpe-function.patch |  163 ----
 ...ibc-0008-libc-stdlib-add-mkostemp-helpers.patch |  155 ---
 package/uclibc/Config.in                           |   25 -
 package/uclibc/uClibc-0.9.32.config                |  268 -----
 package/uclibc/uclibc.mk                           |    9 -
 87 files changed, 99 insertions(+), 7803 deletions(-)
 delete mode 100644 package/binutils/2.20.1/110-arm-eabi-conf.patch
 delete mode 100644 package/binutils/2.20.1/120-sh-conf.patch
 delete mode 100644 package/binutils/2.20.1/300-001_ld_makefile_patch.patch
 delete mode 100644 package/binutils/2.20.1/300-012_check_ldrunpath_length.patch
 delete mode 100644 package/binutils/2.20.1/400-arm_link_speed.patch
 delete mode 100644 package/binutils/2.20.1/500-sysroot.patch
 delete mode 100644 package/binutils/2.21/110-arm-eabi-conf.patch
 delete mode 100644 package/binutils/2.21/120-sh-conf.patch
 delete mode 100644 package/binutils/2.21/300-001_ld_makefile_patch.patch
 delete mode 100644 package/binutils/2.21/300-012_check_ldrunpath_length.patch
 delete mode 100644 package/binutils/2.21/500-sysroot.patch
 delete mode 100644 package/binutils/2.23.1/120-sh-conf.patch
 delete mode 100644 package/binutils/2.23.1/300-001_ld_makefile_patch.patch
 delete mode 100644 package/binutils/2.23.1/300-012_check_ldrunpath_length.patch
 delete mode 100644 package/binutils/2.23.1/500-sysroot.patch
 delete mode 100644 package/binutils/2.23.1/900-xtensa-trampolines.patch
 delete mode 100644 package/binutils/2.23.1/901-xtensa-gas-first-frag-alignment.patch
 delete mode 100644 package/binutils/2.23.1/902-xtensa-gas-ld-diff-relocation-signed.patch
 delete mode 100644 package/busybox/1.19.4/busybox-1.19.4-udhcp.patch
 delete mode 100644 package/busybox/1.20.2/busybox-1.20.2-kernel_ver.patch
 delete mode 100644 package/busybox/1.20.2/busybox-1.20.2-ntpd.patch
 delete mode 100644 package/busybox/1.20.2/busybox-1.20.2-pkg-config-selinux.patch
 delete mode 100644 package/busybox/1.20.2/busybox-1.20.2-sys-resource.patch
 delete mode 100644 package/busybox/1.21.1/0001-libbb-use-poll.h-instead-of-sys-poll.h.patch
 delete mode 100644 package/busybox/1.21.1/0002-network-ifconfig-include-linux-if_slip.h-instead-of-.patch
 delete mode 100644 package/busybox/1.21.1/0003-networking-libiproute-use-linux-if_packet.h-instead-.patch
 rename package/busybox/{1.22.1/0001-networking-libiproute-use-linux-if_packet.h-instead-.patch => busybox-0001-networking-libiproute-use-linux-if_packet.h-instead-.patch} (100%)
 rename package/busybox/{1.22.1/0002-busybox-1.22.1-ash.patch => busybox-0002-busybox-1.22.1-ash.patch} (100%)
 rename package/busybox/{1.22.1/0003-busybox-1.22.1-date.patch => busybox-0003-busybox-1.22.1-date.patch} (100%)
 rename package/busybox/{1.22.1/0004-busybox-1.22.1-iplink.patch => busybox-0004-busybox-1.22.1-iplink.patch} (100%)
 rename package/busybox/{1.22.1/0005-busybox-1.22.1-nc.patch => busybox-0005-busybox-1.22.1-nc.patch} (100%)
 delete mode 100644 package/busybox/busybox-1.19.x.config
 delete mode 100644 package/busybox/busybox-1.20.x.config
 delete mode 100644 package/busybox/busybox-1.21.x.config
 rename package/busybox/{busybox-1.22.x.config => busybox.config} (100%)
 delete mode 100644 package/gcc/4.3.6/100-uclibc-conf.patch
 delete mode 100644 package/gcc/4.3.6/104-gnuhurd-uclibc-conf.patch
 delete mode 100644 package/gcc/4.3.6/301-missing-execinfo_h.patch
 delete mode 100644 package/gcc/4.3.6/302-c99-snprintf.patch
 delete mode 100644 package/gcc/4.3.6/305-libmudflap-susv3-legacy.patch
 delete mode 100644 package/gcc/4.3.6/810-arm-softfloat-libgcc.patch
 delete mode 100644 package/gcc/4.3.6/993-arm_insn-opinit-RTX_CODE-fixup.patch
 delete mode 100644 package/gcc/4.3.6/998-gcc-4.3.0-fix-header.00.patch
 delete mode 100644 package/gcc/4.3.6/999-4.3.2-armeabi-aapcs-linux.patch
 delete mode 100644 package/gcc/4.3.6/999-4.3.3-arm-fix-for-bug-37436.patch
 delete mode 100644 package/gcc/4.3.6/999-gcc-4.3.0-cris-pragma-pack-warning-remove.patch
 delete mode 100644 package/gcc/4.3.6/gcc-43-pr39429.patch
 delete mode 100644 package/gcc/4.3.6/powerpc-link-with-math-lib.patch.conditional
 delete mode 100644 package/gcc/4.6.4/100-uclibc-conf.patch
 delete mode 100644 package/gcc/4.6.4/301-missing-execinfo_h.patch
 delete mode 100644 package/gcc/4.6.4/302-c99-snprintf.patch
 delete mode 100644 package/gcc/4.6.4/305-libmudflap-susv3-legacy.patch
 delete mode 100644 package/gcc/4.6.4/810-arm-softfloat-libgcc.patch
 delete mode 100644 package/gcc/4.6.4/820-arm-unbreak-armv4t.patch
 delete mode 100644 package/gcc/4.6.4/powerpc-link-with-math-lib.patch.conditional
 delete mode 100644 package/gdb/7.4.1/00_all_ptrace_setsiginfo.patch
 delete mode 100644 package/gdb/7.4.1/05_all_readline-headers.patch
 delete mode 100644 package/gdb/7.4.1/gdb-100-xtensa-fix-linux-ptrace-includes.patch
 delete mode 100644 package/gdb/7.4.1/gdb-101-xtensa-fix-on-64-bit-hosts.patch
 delete mode 100644 package/gdb/7.5.1/gdb-100-xtensa-fix-linux-ptrace-includes.patch
 delete mode 100644 package/gdb/7.5.1/gdb-101-xtensa-fix-on-64-bit-hosts.patch
 delete mode 100644 package/uclibc/0.9.32.1/uclibc-0001-Fix-e500-__fe_nomask_env-use-of-__set_errno.patch
 delete mode 100644 package/uclibc/0.9.32.1/uclibc-0002-Fix-__libc_epoll_pwait-compile-failure-on-x86.patch
 delete mode 100644 package/uclibc/0.9.32.1/uclibc-0003-libc-sysdeps-add-__kernel_long-and-__kernel_ulong.patch
 delete mode 100644 package/uclibc/0.9.32.1/uclibc-0004-sparc-errno-fix.patch
 delete mode 100644 package/uclibc/0.9.32.1/uclibc-0005-unshare.patch
 delete mode 100644 package/uclibc/0.9.32.1/uclibc-0006-linuxthreads-errno-fix.patch
 delete mode 100644 package/uclibc/0.9.32.1/uclibc-0007-libc-add-non-standard-execvpe-function.patch
 delete mode 100644 package/uclibc/0.9.32.1/uclibc-0008-libc-stdlib-add-mkostemp-helpers.patch
 delete mode 100644 package/uclibc/uClibc-0.9.32.config

-- 
2.0.0
