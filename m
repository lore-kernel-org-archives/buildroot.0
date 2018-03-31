From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Fri, 30 Mar 2018 23:22:25 -0300
Subject: [Buildroot] [PATCH 00/36] check-package: allow to check other
 directories v1
Message-ID: <20180331022301.27501-1-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This series do some improvements to check-package:
 - enable checking directories other than package/;
 - add an entry to the manual;
 - change scanpypi to avoid new help text warnings;
 - fix the warnings that would show in the Gitlab CI job;
 - enable checking Config.in files in the Gitlab CI job.

Any subset 1..N of these patches can be applied without changing the result of
the Gitlab CI job because I first corrected the style then I added the check.

Patch 1 changes the main check-package script to make it more friendly to add
support to check directories other than package.

Patches 2 to 16 add support to check style in other directories:
 - arch/ and system/ (2),
 - boot/ (3 to 4),
 - fs/ (5 to 8),
 - linux/ (9 to 12),
 - toolchain/ (13 to 15),
 - Config.in* in the base dir (16).

Patch 17 adds an entry for check-package in the manual. The reason to it not be
patch 2 is because I added this text: "This script can be used for packages and
also for package-like files: boot, fs, toolchain, ...".

Patches 18 to 36 aim to add the style check for Config.in in Gitlab job CI.
Patches 18 to 33 fix all remaining style warnings for Config.in files after the
other directories were enabled in check-package. I tried to split the patches to
make the review easier but without creating a patch for each package, as it
would make this series really large. If you prefer other split between the
patches let me know.
Patch 34 changes scanpypi to generate help text compliant to check-package
(avoiding the need for patches as 33 in the future).
Patch 35 excludes 4 special Config.in files from the indentation check.
Patch 36 adds the Config.in files to be checked in Gitlab CI job.

This is how the Gitlab CI job output would look like with only the changes to
check-package applied and not the fix to package files:
https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/59340601

The resulting Gitlab CI job with the entire series applied is here:
https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/60295757
which is part of a full build:
https://gitlab.com/RicardoMartincoski/buildroot/pipelines/19730218

Regards,
Ricardo


Ricardo Martincoski (35):
  check-package: prepare to extend to other directories
  check-package: enable for arch/ and system/
  boot/*/*.mk: fix code style
  check-package: enable for boot/
  fs/yaffs2: fix code style
  fs/ubi: use namespace for internal variable
  fs/*/*.mk: fix code style
  check-package: enable for fs/
  linux/linux-ext-*.mk: fit file header into one line
  linux/linux*.mk: fix code style
  linux/linux.mk: use namespace for internal variables
  check-package: enable for linux/
  toolchain/wrapper: fix code style
  toolchain/toolchain.mk: fix code style
  check-package: enable for toolchain/
  check-package: enable for Config.in* in base dir
  docs/manual: add check-package to "Tips and tricks"
  */Config.in*: remove consecutive empty lines
  Config.in*: fix attributes order
  arch/Config.in*: fix attributes order
  boot/*/Config.in: fix attributes order
  fs/*/Config.in: fix attributes order
  package/*/Config.in: fix attributes order
  toolchain/*/Config.in: fix attributes order
  Config.in*: re-wrap help text
  arch/Config.in*: re-wrap help text
  boot/*/Config.in: re-wrap help text
  fs/*/Config.in: re-wrap help text
  linux/Config.*: re-wrap help text
  system/Config.in: re-wrap help text
  toolchain/{*/Config.in,*.in}: re-wrap help text
  qemu/Config.in.host: fix overindented depends on
  package/*/Config.in: re-wrap help text
  scanpypi: generate help text compliant to check-package
  .gitlab-ci.yml: extend check-package test to Config.* files

Thomas Petazzoni (1):
  utils/checkpackagelib: exclude four files from Config.in indentation
    check

 .gitlab-ci.yml                                     |   3 +-
 .gitlab-ci.yml.in                                  |   3 +-
 Config.in                                          |  36 +--
 Config.in.legacy                                   | 292 ++++++++++++---------
 arch/Config.in                                     |  99 +++----
 arch/Config.in.arc                                 |   2 +-
 arch/Config.in.arm                                 |   4 +-
 arch/Config.in.bfin                                |   2 +-
 arch/Config.in.m68k                                |   2 +-
 arch/Config.in.mips                                |  13 +-
 arch/Config.in.powerpc                             |   4 +-
 arch/Config.in.sh                                  |   2 +-
 arch/Config.in.sparc                               |   2 +-
 arch/Config.in.x86                                 |  30 +--
 arch/Config.in.xtensa                              |  20 +-
 boot/at91bootstrap/Config.in                       |   8 +-
 boot/at91bootstrap3/Config.in                      |  12 +-
 boot/at91dataflashboot/Config.in                   |   2 +-
 boot/barebox/barebox/Config.in                     |   1 -
 boot/lpc32xxcdl/Config.in                          |   2 +-
 boot/lpc32xxcdl/lpc32xxcdl.mk                      |   8 +-
 boot/mxs-bootlets/Config.in                        |   8 +-
 boot/syslinux/Config.in                            |   1 -
 boot/syslinux/syslinux.mk                          |   2 +-
 boot/uboot/Config.in                               |  55 ++--
 boot/uboot/uboot.mk                                |  14 +-
 docs/manual/adding-packages-tips.txt               |  31 +++
 docs/manual/adding-packages.txt                    |   2 +
 docs/manual/contribute.txt                         |   4 +
 fs/cpio/Config.in                                  |   6 +-
 fs/ext2/Config.in                                  |  22 +-
 fs/initramfs/Config.in                             |   3 +-
 fs/initramfs/initramfs.mk                          |   3 +-
 fs/iso9660/iso9660.mk                              |   1 -
 fs/jffs2/Config.in                                 |  23 +-
 fs/tar/Config.in                                   |   2 +-
 fs/ubi/Config.in                                   |  11 +-
 fs/ubi/ubi.mk                                      |   6 +-
 fs/yaffs2/{yaffs.mk => yaffs2.mk}                  |   0
 linux/Config.ext.in                                |  15 +-
 linux/Config.in                                    |  43 +--
 linux/linux-ext-aufs.mk                            |   2 +-
 linux/linux-ext-ev3dev-linux-drivers.mk            |   2 +-
 linux/linux-ext-fbtft.mk                           |   2 +-
 linux/linux-ext-rtai.mk                            |   6 +-
 linux/linux-ext-xenomai.mk                         |   4 +-
 linux/linux.mk                                     |  61 +++--
 package/mono/Config.in                             |   2 +-
 package/php/Config.in                              |   8 +-
 package/python-functools32/Config.in               |   4 +-
 package/python-jsonmodels/Config.in                |   4 +-
 package/qemu/Config.in.host                        |   2 +-
 package/systemd/Config.in                          |   4 +-
 system/Config.in                                   | 122 +++++----
 toolchain/Config.in                                |   2 +-
 toolchain/toolchain-buildroot/Config.in            |   2 +-
 toolchain/toolchain-common.in                      |  10 +-
 toolchain/toolchain-external/Config.in             |  11 +-
 .../Config.in                                      |   6 +-
 .../Config.in                                      |   6 +-
 .../toolchain-external-custom/Config.in.options    |  12 +-
 toolchain/toolchain-wrapper.mk                     |   6 +-
 toolchain/toolchain.mk                             |  20 +-
 utils/check-package                                |  45 +++-
 utils/checkpackagelib/lib_config.py                |   6 +
 utils/checkpackagelib/lib_mk.py                    |   9 +-
 utils/scanpypi                                     |   2 +-
 67 files changed, 659 insertions(+), 500 deletions(-)
 rename fs/yaffs2/{yaffs.mk => yaffs2.mk} (100%)

-- 
2.14.1
