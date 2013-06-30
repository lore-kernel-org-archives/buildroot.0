From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 30 Jun 2013 21:28:50 +0200
Subject: [Buildroot] [PATCH 00/23] Convert the internal toolchain backend to
	packages, add eglibc support
Message-ID: <1372620553-11416-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This is the third version of the patch set that converts the internal
toolchain backend to packages. The most notable feature of this new
version is that it adds support to build a toolchain with the eglibc C
library (though we should consider this experimental for the moment).

This patch set is no longer at the RFC stage, I've done quite a bit of
testing and it seems to be ready for more widespread testing. I would
really appreciate if others could take it and test it in their context
and report success/issues.

The code is also available from:

   git://git.free-electrons.com/users/thomas-petazzoni/buildroot.git toolchain-infra

Changes from RFCv2:

 * Rebased on top of master, merged the strip/debug uClibc changes
   done by Gustavo.

 * Added support for installing the uClibc test suite (broken on ARM,
   but it was already broken), and the 'make uclibc-menuconfig'
   target.

 * Added support to build the eglibc C library as part of the
   Buildroot internal toolchain backend. This required some long-due
   refactoring of the C library options.

 * Many, many fixes found when doing more testing.

Changes from RFCv1:

 * Factorize all the common logic of the gcc packages into
   package/gcc/gcc.mk, and move the gcc packages as
   package/gcc/gcc-initial, package/gcc/gcc-intermediate and
   package/gcc/gcc-final. The individual .mk files for each gcc
   variant becomes a *lot* smaller. Suggested by Thomas De
   Schampheleire.

 * Exclude a few more things when extracting the gcc source code
   tarball.

Summary of the patches:

 * Patches 1 to 6 are cleanup / preparation patches. They can be
   applied right now (which would help reduce the size of this patch
   set).

 * Patch 7 converts elf2flt to the package infrastructure.

 * Patch 8 converts the kernel headers to the package infrastructure.

 * Patch 9 introduces package/gcc/gcc.mk (common definitions for the
   three gcc packages) and the package/gcc/Config.in.host file.

 * Patch 10, 11 and 12 introduce the gcc-initial, gcc-intermediate and
   gcc-final packages. At this point, they are not used by Buildroot.

 * Patch 13 switches the toolchain build logic to use the gcc-initial,
   gcc-intermediate and gcc packages, and removed the toolchain/gcc
   code.

 * Patch 14 makes a small optimization to the size of the sources
   extracted for gcc.

 * Patch 15 converts uClibc to the package infrastructure.

 * Patch 16 to 18 make some followup cleanups.

 * Patch 19 add BR2_TOOLCHAIN_USES_{UCLIBC,GLIBC} options that are
   independent of the toolchain backend, and simplifies the entire
   Buildroot code base to use them.

 * Patch 20 moves the uClibc configuration options from the toolchain/
   directory to the uClibc package itslef.

 * Patch 21 introduces the eglibc package.

 * Patch 22 enables the eglibc support in the internal Buildroot
   toolchain backend.

 * Patch 23 updates the manual accordingly.

Some comments:

 * This patch set completely removes the support for building the
   toolchain on the target (i.e the new gcc package and uClibc package
   do not support building/installing the target variant). A cleanup
   patch at the end of the series removes BR2_HAVE_DEVFILES.

 * The gcc-initial, gcc-intermediate and gcc packages each extract
   their own copy of the gcc sources. With the previous code,
   out-of-tree builds were used to share the tree, but moving to the
   package infrastructure makes this more difficult. Since the build
   is still done in a sub-directory called 'build' inside each source
   directory (because gcc does not support in-tree build), I've tried
   to symlink the source directories, and create separate build
   sub-directories (build-initial, build-intermediate, build-final),
   but the problem comes with the stamp files, that would have the
   same name and location for the gcc-initial, gcc-intermediate and
   gcc packages.

   In order to mitigate this additional amount of work and disk space
   consumption, I've added a little optimization to the gcc sources
   extraction, by not extracting the libjava, libgo and gcc/testsuites
   directories. This reduces approximately by half the size of the gcc
   sources.

 * The uClibc code to mungle the .config has been heavily
   reworked. Some of the logic has been moved to the Config.in file,
   when it allows to more easily calculate the configuration values.

Best regards,

Thomas

Thomas Petazzoni (23):
  uClibc: KERNEL_SOURCE no longer exists
  busybox: don't use kernel headers directly
  package: allow to override the make install target for host packages
  toolchain/gcc: remove dead code related to host binary stripping
  toolchain: remove references to LIBFLOAT_TARGET
  toolchain/gcc: get rid of stale variable reference
  elf2flt: convert to the package infrastructure
  kernel-headers: migrate to the package infrastructure
  gcc: common definitions
  gcc-initial: new package
  gcc-intermediate: new package
  gcc-final: new package
  toolchain: switch to using gcc through package infrastructure
  gcc-initial, gcc-intermediate, gcc-final: optimize extraction
  uclibc: convert to the package infrastructure
  Remove TOOLCHAIN_DIR
  Use more sensible names for the external/ctng targets
  Remove BR2_HAVE_DEVFILES
  Introduce BR2_TOOLCHAIN_USES_{UCLIBC,GLIBC}
  uclibc: move configuration options into the package
  eglibc: new package
  eglibc: enable support in the Buildroot toolchain backend
  docs/manual: update to mention eglibc support in Buildroot toolchain
    backend

 Config.in                                          |   8 -
 Config.in.legacy                                   |   7 +
 Makefile                                           |  24 +-
 docs/manual/configure.txt                          |  52 +-
 package/Config.in                                  |   1 -
 package/Makefile.in                                |   2 +-
 package/boost/boost.mk                             |   2 +-
 package/busybox/busybox.mk                         |   3 +-
 package/dbus/dbus.mk                               |   2 -
 package/eglibc/eglibc.mk                           |  94 +++
 .../Config.in => package/elf2flt/Config.in.host    |   2 +-
 package/elf2flt/elf2flt.mk                         |  28 +
 .../elf2flt => package/elf2flt/src}/LICENSE.TXT    |   0
 .../elf2flt => package/elf2flt/src}/Makefile.in    |   0
 .../elf2flt/elf2flt => package/elf2flt/src}/README |   0
 .../elf2flt => package/elf2flt/src}/config.guess   |   0
 .../elf2flt => package/elf2flt/src}/config.sub     |   0
 .../elf2flt => package/elf2flt/src}/configure      |   0
 .../elf2flt => package/elf2flt/src}/configure.in   |   0
 .../elf2flt => package/elf2flt/src}/cygwin-elf.h   |   0
 .../elf2flt => package/elf2flt/src}/e1-elf2flt.ld  |   0
 .../elf2flt => package/elf2flt/src}/elf2flt.c      |   0
 .../elf2flt => package/elf2flt/src}/elf2flt.ld     |   0
 .../elf2flt/elf2flt => package/elf2flt/src}/flat.h |   0
 .../elf2flt => package/elf2flt/src}/flthdr.c       |   0
 .../elf2flt => package/elf2flt/src}/install-sh     |   0
 .../elf2flt => package/elf2flt/src}/ld-elf2flt.in  |   0
 .../elf2flt => package/elf2flt/src}/maketarball.sh |   0
 .../elf2flt => package/elf2flt/src}/stubs.c        |   0
 package/elfutils/Config.in                         |   9 +-
 package/elfutils/elfutils.mk                       |   2 +-
 package/freescale-imx/gpu-viv-bin-mx6q/Config.in   |   8 +-
 .../1001-gcc-4.2.x-inhibit-libc.patch              |   0
 ...-fix-removal-of-redundant-cast-operations.patch |   0
 ...conditional-insn-which-clobbers-cc_status.patch |   0
 ...use-movh-to-move-immediates-into-register.patch |   0
 .../gcc/4.3.6/100-uclibc-conf.patch                |  20 -
 .../gcc/4.3.6/104-gnuhurd-uclibc-conf.patch        |   0
 .../gcc/4.3.6/301-missing-execinfo_h.patch         |   0
 .../gcc/4.3.6/302-c99-snprintf.patch               |   0
 .../gcc/4.3.6/305-libmudflap-susv3-legacy.patch    |   0
 .../gcc/4.3.6/810-arm-softfloat-libgcc.patch       |   0
 .../4.3.6/993-arm_insn-opinit-RTX_CODE-fixup.patch |   0
 .../gcc/4.3.6/998-gcc-4.3.0-fix-header.00.patch    |   0
 .../gcc/4.3.6/999-4.3.2-armeabi-aapcs-linux.patch  |   0
 .../4.3.6/999-4.3.3-arm-fix-for-bug-37436.patch    |   0
 ...gcc-4.3.0-cris-pragma-pack-warning-remove.patch |   0
 .../gcc/4.3.6/gcc-43-pr39429.patch                 |   0
 .../powerpc-link-with-math-lib.patch.conditional   |   0
 .../gcc/4.4.7-arc/fix_branch_out_of_range.patch    |   0
 .../gcc/4.4.7/100-uclibc-conf.patch                |  20 -
 .../gcc/4.4.7/301-missing-execinfo_h.patch         |   0
 .../gcc/4.4.7/302-c99-snprintf.patch               |   0
 .../gcc/4.4.7/305-libmudflap-susv3-legacy.patch    |   0
 .../gcc/4.4.7/810-arm-softfloat-libgcc.patch       |   0
 .../gcc/4.4.7/950-sparc-leon.patch                 |   0
 .../gcc/4.4.7/gcc-44-pr39429.patch                 |   0
 .../powerpc-link-with-math-lib.patch.conditional   |   0
 .../gcc/4.5.4/100-uclibc-conf.patch                |  20 -
 .../gcc/4.5.4/301-missing-execinfo_h.patch         |   0
 .../gcc/4.5.4/302-c99-snprintf.patch               |   0
 .../gcc/4.5.4/305-libmudflap-susv3-legacy.patch    |   0
 .../gcc/4.5.4/810-arm-softfloat-libgcc.patch       |   0
 .../gcc/4.5.4/820-arm-unbreak-armv4t.patch         |   0
 .../gcc/4.5.4/830-arm-pr43440.patch                |   0
 .../powerpc-link-with-math-lib.patch.conditional   |   0
 .../gcc/4.6.4/100-uclibc-conf.patch                |  20 -
 .../gcc/4.6.4/301-missing-execinfo_h.patch         |   0
 .../gcc/4.6.4/302-c99-snprintf.patch               |   0
 .../gcc/4.6.4/305-libmudflap-susv3-legacy.patch    |   0
 .../gcc/4.6.4/810-arm-softfloat-libgcc.patch       |   0
 .../gcc/4.6.4/820-arm-unbreak-armv4t.patch         |   0
 .../powerpc-link-with-math-lib.patch.conditional   |   0
 .../gcc/4.7.3}/100-uclibc-conf.patch               |  20 -
 .../gcc/4.7.3/301-missing-execinfo_h.patch         |   0
 .../gcc/4.7.3/302-c99-snprintf.patch               |   0
 .../gcc/4.7.3/305-libmudflap-susv3-legacy.patch    |   0
 .../gcc/4.7.3/810-arm-softfloat-libgcc.patch       |   0
 .../gcc/4.7.3/830-arm_unbreak_armv4t.patch         |   0
 .../powerpc-link-with-math-lib.patch.conditional   |   0
 .../gcc/4.8.1/100-uclibc-conf.patch                |  22 -
 .../gcc/4.8.1/301-missing-execinfo_h.patch         |   0
 .../gcc/4.8.1/302-c99-snprintf.patch               |   0
 .../gcc/4.8.1/305-libmudflap-susv3-legacy.patch    |   0
 .../gcc/4.8.1/810-arm-softfloat-libgcc.patch       |   0
 .../gcc/4.8.1/830-arm_unbreak_armv4t.patch         |   0
 .../powerpc-link-with-math-lib.patch.conditional   |   0
 .../gcc/Config.in => package/gcc/Config.in.host    |  12 +-
 package/gcc/gcc-final/gcc-final.mk                 | 138 +++++
 package/gcc/gcc-initial/gcc-initial.mk             |  39 ++
 package/gcc/gcc-intermediate/gcc-intermediate.mk   |  45 ++
 package/gcc/gcc.mk                                 | 176 ++++++
 package/gpsd/Config.in                             |   4 +-
 package/gsl/gsl.mk                                 |   2 +-
 package/iozone/iozone.mk                           |   2 +-
 package/libdnet/libdnet.mk                         |   2 -
 package/libglib2/libglib2.mk                       |   2 -
 package/libv4l/Config.in                           |   8 +-
 ...tall-fix-__packed-in-exported-kernel-head.patch |   0
 .../linux-headers/3.3.8/linux-fix-umode_t.patch    |   0
 .../linux-headers/Config.in.host                   |   5 +-
 package/linux-headers/linux-headers.mk             |  31 +
 package/ltp-testsuite/Config.in                    |   2 +-
 package/lua/lua.mk                                 |  13 -
 package/mongrel2/Config.in                         |   4 +-
 package/multimedia/gst-plugin-x170/Config.in       |   4 +-
 package/multimedia/mpg123/mpg123.mk                |   3 +-
 package/multimedia/on2-8170-libs/Config.in         |   4 +-
 package/nbd/nbd.mk                                 |   2 +-
 package/ncurses/ncurses.mk                         |  20 -
 package/network-manager/network-manager.mk         |   2 +-
 package/nss-mdns/Config.in                         |   2 +-
 package/opencv/opencv.mk                           |   2 -
 package/openssl/openssl.mk                         |  12 -
 package/orc/orc.mk                                 |   3 -
 package/php/php.mk                                 |   2 +-
 package/pkg-autotools.mk                           |   3 +-
 package/pkg-generic.mk                             |   2 -
 package/python/python.mk                           |  16 +-
 package/python3/python3.mk                         |  16 +-
 package/sdl_sound/sdl_sound.mk                     |   2 +-
 package/squid/squid.mk                             |   2 +-
 package/taglib/taglib.mk                           |   2 -
 package/tzdata/Config.in                           |   2 +-
 ...__libc_epoll_pwait-compile-failure-on-x86.patch |   0
 ...x-e500-__fe_nomask_env-use-of-__set_errno.patch |   0
 .../0.9.32.1/uclibc-linuxthreads-errno-fix.patch   |   0
 .../uclibc/0.9.32.1/uclibc-sparc-errno-fix.patch   |   0
 .../uclibc/0.9.32.1/uclibc-unshare.patch           |   0
 .../uclibc-OpenWRT-140-avr32_atomic_fix.patch      |   0
 .../uclibc-bits-time.h-sync-with-glibc-2.16.patch  |   0
 .../0.9.33.2/uclibc-define-MSG_CMSG_CLOEXEC.patch  |   0
 .../uclibc/0.9.33.2/uclibc-dup3.patch              |   0
 package/uclibc/Config.in                           | 247 ++++++++
 .../uClibc => package/uclibc}/uClibc-0.9.32.config |   0
 .../uClibc => package/uclibc}/uClibc-0.9.33.config |   0
 .../uclibc}/uClibc-snapshot.config                 |   0
 package/uclibc/uclibc.mk                           | 484 +++++++++++++++
 package/usbutils/usbutils.mk                       |   2 -
 package/xenomai/xenomai.mk                         |   2 -
 toolchain/Config.in                                |  15 +
 toolchain/elf2flt/elf2flt.mk                       |  46 --
 toolchain/gcc/4.7.3/100-uclibc-conf.patch          |  33 --
 toolchain/gcc/Config.in.2                          |  34 --
 toolchain/gcc/gcc-uclibc-4.x.mk                    | 646 ---------------------
 toolchain/kernel-headers/kernel-headers.mk         |  87 ---
 toolchain/toolchain-buildroot.mk                   |  13 +-
 toolchain/toolchain-buildroot/Config.in            |  46 +-
 toolchain/toolchain-buildroot/Config.in.2          |  79 +--
 toolchain/toolchain-common.in                      |   8 +-
 toolchain/toolchain-crosstool-ng.mk                |   3 -
 toolchain/toolchain-crosstool-ng/Config.in         |  11 +-
 toolchain/toolchain-crosstool-ng/crosstool-ng.mk   |  18 +-
 toolchain/toolchain-external.mk                    |   4 -
 toolchain/toolchain-external/Config.in             |   9 +-
 toolchain/toolchain-external/ext-tool.mk           |   5 +-
 toolchain/uClibc/Config.in                         |  97 ----
 toolchain/uClibc/uclibc.mk                         | 622 --------------------
 158 files changed, 1454 insertions(+), 2009 deletions(-)
 create mode 100644 package/eglibc/eglibc.mk
 rename toolchain/elf2flt/Config.in => package/elf2flt/Config.in.host (91%)
 create mode 100644 package/elf2flt/elf2flt.mk
 rename {toolchain/elf2flt/elf2flt => package/elf2flt/src}/LICENSE.TXT (100%)
 rename {toolchain/elf2flt/elf2flt => package/elf2flt/src}/Makefile.in (100%)
 rename {toolchain/elf2flt/elf2flt => package/elf2flt/src}/README (100%)
 rename {toolchain/elf2flt/elf2flt => package/elf2flt/src}/config.guess (100%)
 rename {toolchain/elf2flt/elf2flt => package/elf2flt/src}/config.sub (100%)
 rename {toolchain/elf2flt/elf2flt => package/elf2flt/src}/configure (100%)
 rename {toolchain/elf2flt/elf2flt => package/elf2flt/src}/configure.in (100%)
 rename {toolchain/elf2flt/elf2flt => package/elf2flt/src}/cygwin-elf.h (100%)
 rename {toolchain/elf2flt/elf2flt => package/elf2flt/src}/e1-elf2flt.ld (100%)
 rename {toolchain/elf2flt/elf2flt => package/elf2flt/src}/elf2flt.c (100%)
 rename {toolchain/elf2flt/elf2flt => package/elf2flt/src}/elf2flt.ld (100%)
 rename {toolchain/elf2flt/elf2flt => package/elf2flt/src}/flat.h (100%)
 rename {toolchain/elf2flt/elf2flt => package/elf2flt/src}/flthdr.c (100%)
 rename {toolchain/elf2flt/elf2flt => package/elf2flt/src}/install-sh (100%)
 rename {toolchain/elf2flt/elf2flt => package/elf2flt/src}/ld-elf2flt.in (100%)
 rename {toolchain/elf2flt/elf2flt => package/elf2flt/src}/maketarball.sh (100%)
 rename {toolchain/elf2flt/elf2flt => package/elf2flt/src}/stubs.c (100%)
 rename {toolchain => package}/gcc/4.2.2-avr32-2.1.5/1001-gcc-4.2.x-inhibit-libc.patch (100%)
 rename {toolchain => package}/gcc/4.2.2-avr32-2.1.5/903-avr32-fix-removal-of-redundant-cast-operations.patch (100%)
 rename {toolchain => package}/gcc/4.2.2-avr32-2.1.5/904-avr32-fix-conditional-insn-which-clobbers-cc_status.patch (100%)
 rename {toolchain => package}/gcc/4.2.2-avr32-2.1.5/905-avr32-optimize-movsf2-use-movh-to-move-immediates-into-register.patch (100%)
 copy {toolchain => package}/gcc/4.3.6/100-uclibc-conf.patch (53%)
 rename {toolchain => package}/gcc/4.3.6/104-gnuhurd-uclibc-conf.patch (100%)
 rename {toolchain => package}/gcc/4.3.6/301-missing-execinfo_h.patch (100%)
 rename {toolchain => package}/gcc/4.3.6/302-c99-snprintf.patch (100%)
 rename {toolchain => package}/gcc/4.3.6/305-libmudflap-susv3-legacy.patch (100%)
 rename {toolchain => package}/gcc/4.3.6/810-arm-softfloat-libgcc.patch (100%)
 rename {toolchain => package}/gcc/4.3.6/993-arm_insn-opinit-RTX_CODE-fixup.patch (100%)
 rename {toolchain => package}/gcc/4.3.6/998-gcc-4.3.0-fix-header.00.patch (100%)
 rename {toolchain => package}/gcc/4.3.6/999-4.3.2-armeabi-aapcs-linux.patch (100%)
 rename {toolchain => package}/gcc/4.3.6/999-4.3.3-arm-fix-for-bug-37436.patch (100%)
 rename {toolchain => package}/gcc/4.3.6/999-gcc-4.3.0-cris-pragma-pack-warning-remove.patch (100%)
 rename {toolchain => package}/gcc/4.3.6/gcc-43-pr39429.patch (100%)
 rename {toolchain => package}/gcc/4.3.6/powerpc-link-with-math-lib.patch.conditional (100%)
 rename {toolchain => package}/gcc/4.4.7-arc/fix_branch_out_of_range.patch (100%)
 rename {toolchain => package}/gcc/4.4.7/100-uclibc-conf.patch (53%)
 rename {toolchain => package}/gcc/4.4.7/301-missing-execinfo_h.patch (100%)
 rename {toolchain => package}/gcc/4.4.7/302-c99-snprintf.patch (100%)
 rename {toolchain => package}/gcc/4.4.7/305-libmudflap-susv3-legacy.patch (100%)
 rename {toolchain => package}/gcc/4.4.7/810-arm-softfloat-libgcc.patch (100%)
 rename {toolchain => package}/gcc/4.4.7/950-sparc-leon.patch (100%)
 rename {toolchain => package}/gcc/4.4.7/gcc-44-pr39429.patch (100%)
 rename {toolchain => package}/gcc/4.4.7/powerpc-link-with-math-lib.patch.conditional (100%)
 rename {toolchain => package}/gcc/4.5.4/100-uclibc-conf.patch (53%)
 rename {toolchain => package}/gcc/4.5.4/301-missing-execinfo_h.patch (100%)
 rename {toolchain => package}/gcc/4.5.4/302-c99-snprintf.patch (100%)
 rename {toolchain => package}/gcc/4.5.4/305-libmudflap-susv3-legacy.patch (100%)
 rename {toolchain => package}/gcc/4.5.4/810-arm-softfloat-libgcc.patch (100%)
 rename {toolchain => package}/gcc/4.5.4/820-arm-unbreak-armv4t.patch (100%)
 rename {toolchain => package}/gcc/4.5.4/830-arm-pr43440.patch (100%)
 rename {toolchain => package}/gcc/4.5.4/powerpc-link-with-math-lib.patch.conditional (100%)
 rename {toolchain => package}/gcc/4.6.4/100-uclibc-conf.patch (53%)
 rename {toolchain => package}/gcc/4.6.4/301-missing-execinfo_h.patch (100%)
 rename {toolchain => package}/gcc/4.6.4/302-c99-snprintf.patch (100%)
 rename {toolchain => package}/gcc/4.6.4/305-libmudflap-susv3-legacy.patch (100%)
 rename {toolchain => package}/gcc/4.6.4/810-arm-softfloat-libgcc.patch (100%)
 rename {toolchain => package}/gcc/4.6.4/820-arm-unbreak-armv4t.patch (100%)
 rename {toolchain => package}/gcc/4.6.4/powerpc-link-with-math-lib.patch.conditional (100%)
 rename {toolchain/gcc/4.3.6 => package/gcc/4.7.3}/100-uclibc-conf.patch (53%)
 rename {toolchain => package}/gcc/4.7.3/301-missing-execinfo_h.patch (100%)
 rename {toolchain => package}/gcc/4.7.3/302-c99-snprintf.patch (100%)
 rename {toolchain => package}/gcc/4.7.3/305-libmudflap-susv3-legacy.patch (100%)
 rename {toolchain => package}/gcc/4.7.3/810-arm-softfloat-libgcc.patch (100%)
 rename {toolchain => package}/gcc/4.7.3/830-arm_unbreak_armv4t.patch (100%)
 rename {toolchain => package}/gcc/4.7.3/powerpc-link-with-math-lib.patch.conditional (100%)
 rename {toolchain => package}/gcc/4.8.1/100-uclibc-conf.patch (51%)
 rename {toolchain => package}/gcc/4.8.1/301-missing-execinfo_h.patch (100%)
 rename {toolchain => package}/gcc/4.8.1/302-c99-snprintf.patch (100%)
 rename {toolchain => package}/gcc/4.8.1/305-libmudflap-susv3-legacy.patch (100%)
 rename {toolchain => package}/gcc/4.8.1/810-arm-softfloat-libgcc.patch (100%)
 rename {toolchain => package}/gcc/4.8.1/830-arm_unbreak_armv4t.patch (100%)
 rename {toolchain => package}/gcc/4.8.1/powerpc-link-with-math-lib.patch.conditional (100%)
 rename toolchain/gcc/Config.in => package/gcc/Config.in.host (94%)
 create mode 100644 package/gcc/gcc-final/gcc-final.mk
 create mode 100644 package/gcc/gcc-initial/gcc-initial.mk
 create mode 100644 package/gcc/gcc-intermediate/gcc-intermediate.mk
 create mode 100644 package/gcc/gcc.mk
 rename toolchain/kernel-headers/linux-3.0.84-headers_install-fix-__packed-in-exported-kernel-head.patch => package/linux-headers/3.0.84/linux-headers-headers_install-fix-__packed-in-exported-kernel-head.patch (100%)
 rename toolchain/kernel-headers/linux-3.3.8-fix-umode_t.patch => package/linux-headers/3.3.8/linux-fix-umode_t.patch (100%)
 rename toolchain/kernel-headers/Config.in => package/linux-headers/Config.in.host (94%)
 create mode 100644 package/linux-headers/linux-headers.mk
 rename toolchain/uClibc/uClibc-0.9.32.1-Fix-__libc_epoll_pwait-compile-failure-on-x86.patch => package/uclibc/0.9.32.1/uclibc-Fix-__libc_epoll_pwait-compile-failure-on-x86.patch (100%)
 rename toolchain/uClibc/uClibc-0.9.32.1-Fix-e500-__fe_nomask_env-use-of-__set_errno.patch => package/uclibc/0.9.32.1/uclibc-Fix-e500-__fe_nomask_env-use-of-__set_errno.patch (100%)
 rename toolchain/uClibc/uClibc-0.9.32.1-linuxthreads-errno-fix.patch => package/uclibc/0.9.32.1/uclibc-linuxthreads-errno-fix.patch (100%)
 rename toolchain/uClibc/uClibc-0.9.32.1-sparc-errno-fix.patch => package/uclibc/0.9.32.1/uclibc-sparc-errno-fix.patch (100%)
 rename toolchain/uClibc/uClibc-0.9.32.1-unshare.patch => package/uclibc/0.9.32.1/uclibc-unshare.patch (100%)
 rename toolchain/uClibc/uClibc-0.9.33.2-OpenWRT-140-avr32_atomic_fix.patch => package/uclibc/0.9.33.2/uclibc-OpenWRT-140-avr32_atomic_fix.patch (100%)
 rename toolchain/uClibc/uClibc-0.9.33.2-bits-time.h-sync-with-glibc-2.16.patch => package/uclibc/0.9.33.2/uclibc-bits-time.h-sync-with-glibc-2.16.patch (100%)
 rename toolchain/uClibc/uClibc-0.9.33.2-define-MSG_CMSG_CLOEXEC.patch => package/uclibc/0.9.33.2/uclibc-define-MSG_CMSG_CLOEXEC.patch (100%)
 rename toolchain/uClibc/uClibc-0.9.33.2-dup3.patch => package/uclibc/0.9.33.2/uclibc-dup3.patch (100%)
 create mode 100644 package/uclibc/Config.in
 rename {toolchain/uClibc => package/uclibc}/uClibc-0.9.32.config (100%)
 rename {toolchain/uClibc => package/uclibc}/uClibc-0.9.33.config (100%)
 rename {toolchain/uClibc => package/uclibc}/uClibc-snapshot.config (100%)
 create mode 100644 package/uclibc/uclibc.mk
 delete mode 100644 toolchain/elf2flt/elf2flt.mk
 delete mode 100644 toolchain/gcc/4.7.3/100-uclibc-conf.patch
 delete mode 100644 toolchain/gcc/Config.in.2
 delete mode 100644 toolchain/gcc/gcc-uclibc-4.x.mk
 delete mode 100644 toolchain/kernel-headers/kernel-headers.mk
 delete mode 100644 toolchain/uClibc/Config.in
 delete mode 100644 toolchain/uClibc/uclibc.mk

-- 
1.8.1.2
