From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  5 Dec 2013 18:20:43 +0100
Subject: [Buildroot] [PULL REQUEST 00/16] ARC and Microblaze toolchain
	updates
Message-ID: <1386264059-14057-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,

Can you please pull the following patches? They have been around for a
while, and I've tested them successfully: the Microblaze LE,
Microblaze BE and ARC toolchains. It fixes a big number of build
issues on Microblaze especially, like OpenSSL, or Nettle.

According to Thomas DS comment, I've split Mischa's patch adding the
github helper into three patches: one adding the helper, one adding
the documentation, one converting a bunch of packages to the new
helper. Note that not all packages are converted, but this can be done
through followup commits: we really want this ARC and Microblaze stuff
to get merged now.

Thanks a lot!

Thomas

The following changes since commit 7af351d8da750fd7e3052459b2b2dd9f7041ff25:

  python-pyparsing: rename package's Config.in bool (2013-12-04 22:06:49 +0100)

are available in the git repository at:

  git at git.free-electrons.com:users/thomas-petazzoni/buildroot arc-microblaze-toolchain

for you to fetch changes up to 8aa872f9ecb4f91e2c9f341502f4d42b850146c8:

  gdb: add host-texinfo dependency for Git versions (2013-12-05 18:13:57 +0100)

----------------------------------------------------------------
Mischa Jonker (8):
      infra: introduce github helper function
      docs: document the new github helper function
      packages: convert Github http:// users to the github helper
      gdb: arc: Use git instead of website
      binutils: arc: Use git instead of website
      gcc: arc: Download from github instead of Synopsys website
      uclibc: arc: Use git instead of website
      Revert "arc: Add option for ARC-specific download site"

Spenser Gilliland (6):
      binutils: add microblaze internal toolchain
      gcc: add microblaze internal toolchain
      glibc: add microblaze internal toolchain
      gdb: add microblaze internal toolchain
      toolchain: enable microblaze toolchain
      defconfigs: update microblaze defconfigs to use new toolchain

Thomas Petazzoni (2):
      binutils: add missing dependencies for Git versions
      gdb: add host-texinfo dependency for Git versions

 arch/Config.in.arc                                           |   4 --
 configs/qemu_microblazebe_mmu_defconfig                      |   7 ---
 configs/qemu_microblazeel_mmu_defconfig                      |   7 ---
 docs/manual/adding-packages-generic.txt                      |   5 ++-
 docs/manual/adding-packages-tips.txt                         |   5 ++-
 package/a10disp/a10disp.mk                                   |   2 +-
 package/binutils/Config.in.host                              |   4 +-
 package/binutils/binutils.mk                                 |  22 ++++++---
 package/civetweb/civetweb.mk                                 |   2 +-
 package/cpuload/cpuload.mk                                   |   2 +-
 package/fb-test-app/fb-test-app.mk                           |   2 +-
 package/gcc/4.8-arc/100-uclibc-conf.patch                    |  15 -------
 package/gcc/4.8-arc/301-missing-execinfo_h.patch             |  13 ------
 package/gcc/4.8-arc/302-c99-snprintf.patch                   |  13 ------
 package/gcc/4.8-arc/305-libmudflap-susv3-legacy.patch        |  49 --------------------
 package/gcc/4.8-arc/disable_gc_sections.patch                | 145 ------------------------------------------------------------
 package/gcc/4.8-arc/fix_branch_out_of_range.patch            |  30 -------------
 package/gcc/Config.in.host                                   |  25 +++++++----
 package/gcc/gcc.mk                                           |  12 +++--
 package/gdb/Config.in.host                                   |   4 +-
 package/gdb/gdb.mk                                           |  16 ++++++-
 package/glibc/glibc.mk                                       |  12 +++++
 package/input-event-daemon/input-event-daemon.mk             |   2 +-
 package/jsmin/jsmin.mk                                       |   2 +-
 package/knock/knock.mk                                       |   2 +-
 package/libcec/libcec.mk                                     |   2 +-
 package/libcofi/libcofi.mk                                   |   2 +-
 package/libiqrf/libiqrf.mk                                   |   2 +-
 package/liblog4c-localtime/liblog4c-localtime.mk             |   2 +-
 package/libsha1/libsha1.mk                                   |   2 +-
 package/libsoc/libsoc.mk                                     |   2 +-
 package/libtpl/libtpl.mk                                     |   2 +-
 package/linenoise/linenoise.mk                               |   2 +-
 package/lua-ev/lua-ev.mk                                     |   2 +-
 package/luacrypto/luacrypto.mk                               |   2 +-
 package/luaexpatutils/luaexpatutils.mk                       |   2 +-
 package/luasql/luasql.mk                                     |   2 +-
 package/mongrel2/mongrel2.mk                                 |   2 +-
 package/mtdev2tuio/mtdev2tuio.mk                             |   2 +-
 package/neardal/neardal.mk                                   |   2 +-
 package/omap-u-boot-utils/omap-u-boot-utils.mk               |   2 +-
 package/on2-8170-modules/on2-8170-modules.mk                 |   2 +-
 package/pkg-download.mk                                      |   3 ++
 package/python-ipy/python-ipy.mk                             |   2 +-
 package/qjson/qjson.mk                                       |   2 +-
 package/rpi-firmware/rpi-firmware.mk                         |   2 +-
 package/rpi-userland/rpi-userland.mk                         |   2 +-
 package/socketcand/socketcand.mk                             |   2 +-
 package/sqlcipher/sqlcipher.mk                               |   2 +-
 package/sunxi-boards/sunxi-boards.mk                         |   2 +-
 package/sunxi-cedarx/sunxi-cedarx.mk                         |   2 +-
 package/sunxi-mali-prop/sunxi-mali-prop.mk                   |   2 +-
 package/sunxi-mali/sunxi-mali.mk                             |   2 +-
 package/sunxi-tools/sunxi-tools.mk                           |   2 +-
 package/tinymembench/tinymembench.mk                         |   2 +-
 package/tslib/tslib.mk                                       |   2 +-
 package/uclibc/0.9.33-arc/fix-fstat-for-be.patch             |  32 --------------
 package/uclibc/0.9.33-arc/fix-susv3-legacy-bcmp.patch        |  37 ----------------
 package/uclibc/0.9.33-arc/fix-susv3-legacy.patch             |  36 ---------------
 package/uclibc/0.9.33-arc/uclibc-arc-add-__kernel_long.patch |  29 ------------
 package/uclibc/Config.in                                     |   9 ++--
 package/uclibc/uclibc.mk                                     |   7 +--
 package/xl2tp/xl2tp.mk                                       |   2 +-
 package/yajl/yajl.mk                                         |   2 +-
 toolchain/Config.in                                          |   2 +-
 toolchain/toolchain-buildroot/Config.in                      |   9 +++-
 66 files changed, 135 insertions(+), 495 deletions(-)
 delete mode 100644 package/gcc/4.8-arc/100-uclibc-conf.patch
 delete mode 100644 package/gcc/4.8-arc/301-missing-execinfo_h.patch
 delete mode 100644 package/gcc/4.8-arc/302-c99-snprintf.patch
 delete mode 100644 package/gcc/4.8-arc/305-libmudflap-susv3-legacy.patch
 delete mode 100644 package/gcc/4.8-arc/disable_gc_sections.patch
 delete mode 100644 package/gcc/4.8-arc/fix_branch_out_of_range.patch
 delete mode 100644 package/uclibc/0.9.33-arc/fix-fstat-for-be.patch
 delete mode 100644 package/uclibc/0.9.33-arc/fix-susv3-legacy-bcmp.patch
 delete mode 100644 package/uclibc/0.9.33-arc/fix-susv3-legacy.patch
 delete mode 100644 package/uclibc/0.9.33-arc/uclibc-arc-add-__kernel_long.patch

-- 
1.8.1.2
