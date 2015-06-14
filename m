From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 Jun 2015 16:33:25 +0200
Subject: [Buildroot] [PATCH 0/6] Internal toolchain backend updates
Message-ID: <1434292411-5003-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here is a set of updates to the internal toolchain backend, bumping
uClibc-ng, adding support for gcc 5.1, bumping gdb 7.9 and
deprecating support for eglibc.

Also available at:

  git at git.free-electrons.com:users/thomas-petazzoni/buildroot

branch internal-toolchain-updates.

Best regards,

Thomas

Thomas Petazzoni (6):
  uclibc: bump uClibc-ng to 1.0.3
  uclibc: add libgcc_s_resume fix
  gcc: add support for gcc 5.1
  gcc: switch to gcc 4.9 as the default version
  gdb: bump 7.9 series to 7.9.1
  toolchain-buildroot: mark eglibc as deprecated

 package/gcc/5.1.0/100-uclibc-conf.patch            |  15 +
 .../5.1.0/200-gcc-poison-system-directories.patch  | 207 +++++++++++++
 .../5.1.0/201-libgcc-remove-unistd-header.patch    |  14 +
 package/gcc/5.1.0/301-missing-execinfo_h.patch     |  13 +
 package/gcc/5.1.0/810-arm-softfloat-libgcc.patch   |  30 ++
 package/gcc/5.1.0/830-arm_unbreak_armv4t.patch     |  15 +
 .../840-microblaze-enable-dwarf-eh-support.patch   | 166 +++++++++++
 package/gcc/5.1.0/850-libstdcxx-uclibc-c99.patch   | 273 ++++++++++++++++++
 package/gcc/5.1.0/860-cilk-wchar.patch             |  56 ++++
 .../5.1.0/900-libitm-fixes-for-musl-support.patch  |  65 +++++
 .../901-fixincludes-update-for-musl-support.patch  |  32 ++
 package/gcc/5.1.0/902-unwind-fix-for-musl.patch    |  36 +++
 ...dc++-libgfortran-gthr-workaround-for-musl.patch |  80 +++++
 package/gcc/5.1.0/904-musl-libc-config.patch       | 321 +++++++++++++++++++++
 .../gcc/5.1.0/905-add-musl-support-to-gcc.patch    | 130 +++++++++
 package/gcc/5.1.0/906-mips-musl-support.patch      |  37 +++
 package/gcc/5.1.0/907-x86-musl-support.patch       |  45 +++
 package/gcc/5.1.0/908-arm-musl-support.patch       |  45 +++
 package/gcc/5.1.0/909-aarch64-musl-support.patch   |  33 +++
 package/gcc/Config.in.host                         |  11 +-
 package/gcc/gcc.hash                               |   2 +
 .../0001-gdbserver-fix-uClibc-whithout-MMU.patch   |   0
 ...gdbserver-xtensa-drop-xtensa_usrregs_info.patch |   0
 ...erver-xtensa-fix-typo-in-XCHAL_HAVE_LOOPS.patch |   0
 package/gdb/Config.in.host                         |   2 +-
 package/gdb/gdb.hash                               |   2 +-
 .../0.9.33.2/0071-Fix-libgcc_s_resume-issue.patch  |  53 ++++
 .../0001-fix-static-linking-of-pthread-apps.patch  |  72 -----
 ...ert-Do-not-define-unimplemented-functions.patch | 118 --------
 .../1.0.3/0001-Fix-libgcc_s_resume-issue.patch     |  53 ++++
 package/uclibc/Config.in                           |   2 +-
 package/uclibc/uclibc.hash                         |   2 +-
 toolchain/toolchain-buildroot/Config.in            |   1 +
 33 files changed, 1735 insertions(+), 196 deletions(-)
 create mode 100644 package/gcc/5.1.0/100-uclibc-conf.patch
 create mode 100644 package/gcc/5.1.0/200-gcc-poison-system-directories.patch
 create mode 100644 package/gcc/5.1.0/201-libgcc-remove-unistd-header.patch
 create mode 100644 package/gcc/5.1.0/301-missing-execinfo_h.patch
 create mode 100644 package/gcc/5.1.0/810-arm-softfloat-libgcc.patch
 create mode 100644 package/gcc/5.1.0/830-arm_unbreak_armv4t.patch
 create mode 100644 package/gcc/5.1.0/840-microblaze-enable-dwarf-eh-support.patch
 create mode 100644 package/gcc/5.1.0/850-libstdcxx-uclibc-c99.patch
 create mode 100644 package/gcc/5.1.0/860-cilk-wchar.patch
 create mode 100644 package/gcc/5.1.0/900-libitm-fixes-for-musl-support.patch
 create mode 100644 package/gcc/5.1.0/901-fixincludes-update-for-musl-support.patch
 create mode 100644 package/gcc/5.1.0/902-unwind-fix-for-musl.patch
 create mode 100644 package/gcc/5.1.0/903-libstdc++-libgfortran-gthr-workaround-for-musl.patch
 create mode 100644 package/gcc/5.1.0/904-musl-libc-config.patch
 create mode 100644 package/gcc/5.1.0/905-add-musl-support-to-gcc.patch
 create mode 100644 package/gcc/5.1.0/906-mips-musl-support.patch
 create mode 100644 package/gcc/5.1.0/907-x86-musl-support.patch
 create mode 100644 package/gcc/5.1.0/908-arm-musl-support.patch
 create mode 100644 package/gcc/5.1.0/909-aarch64-musl-support.patch
 rename package/gdb/{7.9 => 7.9.1}/0001-gdbserver-fix-uClibc-whithout-MMU.patch (100%)
 rename package/gdb/{7.9 => 7.9.1}/0002-gdbserver-xtensa-drop-xtensa_usrregs_info.patch (100%)
 rename package/gdb/{7.9 => 7.9.1}/0003-gdbserver-xtensa-fix-typo-in-XCHAL_HAVE_LOOPS.patch (100%)
 create mode 100644 package/uclibc/0.9.33.2/0071-Fix-libgcc_s_resume-issue.patch
 delete mode 100644 package/uclibc/1.0.2/0001-fix-static-linking-of-pthread-apps.patch
 delete mode 100644 package/uclibc/1.0.2/0002-Revert-Do-not-define-unimplemented-functions.patch
 create mode 100644 package/uclibc/1.0.3/0001-Fix-libgcc_s_resume-issue.patch

-- 
2.1.0
