From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 May 2016 00:12:53 +0200
Subject: [Buildroot] [PATCH 0/9] Various toolchain related fixes/updates
Message-ID: <1463436782-17051-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This patch series contain various fixes/updates to the toolchain
support.

 - The first two patches might be considered for 2016.05, as they fix
   real problems: building gcc 6.x on Microblaze, and making sure
   people don't select glibc 2.22 (which is our default version) with
   gcc 6.x, as it doesn't build.

 - The next four patches take care of gdb, adding support for 7.11,
   moving to 7.10 as the default, and removing 7.8.

 - eglibc support is removed.

 - binutils 2.23 support is removed. This patch has already been
   submitted in the past, I included it in this series as it is
   related to the other changes.

 - musl support is no longer considered experimental.

Thanks!

Thomas

Thomas Petazzoni (9):
  gcc: fix build of gcc 6.x on Microblaze
  glibc: disable build of glibc 2.22 with gcc 6.x
  gdb: add support for gdb 7.11
  gdb: switch to 7.10 as the default version
  gdb: remove version 7.8
  gdb: specify hashes for the ARC and Microblaze versions
  toolchain: remove eglibc support
  binutils: remove support for version 2.23
  toolchain: musl support is no longer experimental

 Config.in.legacy                                   |  31 +-
 package/binutils/2.23.2/120-sh-conf.patch          |  29 -
 .../2.23.2/300-001_ld_makefile_patch.patch         |  24 -
 .../2.23.2/300-012_check_ldrunpath_length.patch    |  21 -
 package/binutils/2.23.2/500-sysroot.patch          |  37 -
 .../2.23.2/600-poison-system-directories.patch     | 279 -------
 .../binutils/2.23.2/900-xtensa-trampolines.patch   | 846 ---------------------
 .../901-xtensa-gas-first-frag-alignment.patch      |  51 --
 .../902-xtensa-gas-ld-diff-relocation-signed.patch | 133 ----
 ...ix-ld-segfault-when-linking-linux-modules.patch |  47 --
 ...-target-out-of-range-xtensa-ld-relaxation.patch |  79 --
 ...ines-search-code-for-conditional-branches.patch |  90 ---
 ...localized-symbol-refcounting-with-gc-sect.patch |  57 --
 ...x-gas-segfault-with-text-section-literals.patch |  56 --
 ...-xtensa-fix-signedness-of-gas-relocations.patch |  47 --
 ...15-xtensa-fix-.init-.fini-literals-moving.patch |  70 --
 package/binutils/Config.in.host                    |  10 -
 package/binutils/binutils.hash                     |   1 -
 .../840-microblaze-enable-dwarf-eh-support.patch   | 166 ----
 package/gcc/Config.in.host                         |   2 +-
 .../0001-gdbserver-fix-uClibc-whithout-MMU.patch   |  34 -
 ...gdbserver-xtensa-drop-xtensa_usrregs_info.patch |  47 --
 ...erver-xtensa-fix-typo-in-XCHAL_HAVE_LOOPS.patch |  46 --
 .../0004-Add-some-casts-for-building-on-musl.patch |  70 --
 ...musl-Move-W_STOPCODE-to-common-gdb_wait-h.patch |  63 --
 package/gdb/7.8.2/0006-move-__SIGRTMIN.patch       |  58 --
 package/gdb/Config.in.host                         |  14 +-
 package/gdb/gdb.hash                               |   9 +-
 .../2.18-svnr23787/0001-CVE-2014-7817-eglibc.patch | 174 -----
 .../glibc/2.18-svnr23787/0002-accept-make4.patch   |  33 -
 .../glibc/2.18-svnr23787/0003-CVE-2014-6040.patch  | 141 ----
 .../glibc/2.18-svnr23787/0004-CVE-2014-9402.patch  |  20 -
 .../glibc/2.18-svnr23787/0005-CVE-2015-1472.patch  |  88 ---
 .../2.19-svnr25243/0001-CVE-2014-7817-eglibc.patch | 174 -----
 .../glibc/2.19-svnr25243/0002-CVE-2014-6040.patch  | 141 ----
 .../glibc/2.19-svnr25243/0003-CVE-2014-9402.patch  |  20 -
 .../glibc/2.19-svnr25243/0004-CVE-2015-1472.patch  |  88 ---
 package/glibc/Config.in                            |  29 +-
 package/glibc/glibc.mk                             |   7 -
 toolchain/toolchain-buildroot/Config.in            |  25 +-
 toolchain/toolchain-external/Config.in             |   4 +-
 41 files changed, 45 insertions(+), 3316 deletions(-)
 delete mode 100644 package/binutils/2.23.2/120-sh-conf.patch
 delete mode 100644 package/binutils/2.23.2/300-001_ld_makefile_patch.patch
 delete mode 100644 package/binutils/2.23.2/300-012_check_ldrunpath_length.patch
 delete mode 100644 package/binutils/2.23.2/500-sysroot.patch
 delete mode 100644 package/binutils/2.23.2/600-poison-system-directories.patch
 delete mode 100644 package/binutils/2.23.2/900-xtensa-trampolines.patch
 delete mode 100644 package/binutils/2.23.2/901-xtensa-gas-first-frag-alignment.patch
 delete mode 100644 package/binutils/2.23.2/902-xtensa-gas-ld-diff-relocation-signed.patch
 delete mode 100644 package/binutils/2.23.2/903-xtensa-fix-ld-segfault-when-linking-linux-modules.patch
 delete mode 100644 package/binutils/2.23.2/904-Fix-call8-call-target-out-of-range-xtensa-ld-relaxation.patch
 delete mode 100644 package/binutils/2.23.2/905-Fix-trampolines-search-code-for-conditional-branches.patch
 delete mode 100644 package/binutils/2.23.2/911-xtensa-fix-localized-symbol-refcounting-with-gc-sect.patch
 delete mode 100644 package/binutils/2.23.2/912-xtensa-fix-gas-segfault-with-text-section-literals.patch
 delete mode 100644 package/binutils/2.23.2/914-xtensa-fix-signedness-of-gas-relocations.patch
 delete mode 100644 package/binutils/2.23.2/915-xtensa-fix-.init-.fini-literals-moving.patch
 delete mode 100644 package/gcc/6.1.0/840-microblaze-enable-dwarf-eh-support.patch
 delete mode 100644 package/gdb/7.8.2/0001-gdbserver-fix-uClibc-whithout-MMU.patch
 delete mode 100644 package/gdb/7.8.2/0002-gdbserver-xtensa-drop-xtensa_usrregs_info.patch
 delete mode 100644 package/gdb/7.8.2/0003-gdbserver-xtensa-fix-typo-in-XCHAL_HAVE_LOOPS.patch
 delete mode 100644 package/gdb/7.8.2/0004-Add-some-casts-for-building-on-musl.patch
 delete mode 100644 package/gdb/7.8.2/0005-musl-Move-W_STOPCODE-to-common-gdb_wait-h.patch
 delete mode 100644 package/gdb/7.8.2/0006-move-__SIGRTMIN.patch
 delete mode 100644 package/glibc/2.18-svnr23787/0001-CVE-2014-7817-eglibc.patch
 delete mode 100644 package/glibc/2.18-svnr23787/0002-accept-make4.patch
 delete mode 100644 package/glibc/2.18-svnr23787/0003-CVE-2014-6040.patch
 delete mode 100644 package/glibc/2.18-svnr23787/0004-CVE-2014-9402.patch
 delete mode 100644 package/glibc/2.18-svnr23787/0005-CVE-2015-1472.patch
 delete mode 100644 package/glibc/2.19-svnr25243/0001-CVE-2014-7817-eglibc.patch
 delete mode 100644 package/glibc/2.19-svnr25243/0002-CVE-2014-6040.patch
 delete mode 100644 package/glibc/2.19-svnr25243/0003-CVE-2014-9402.patch
 delete mode 100644 package/glibc/2.19-svnr25243/0004-CVE-2015-1472.patch

-- 
2.7.4
