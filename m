From: Mischa Jonker <Mischa.Jonker@synopsys.com>
Date: Wed, 24 Apr 2013 12:13:11 +0200
Subject: [Buildroot] [PATCH v2 00/12] RFC: ARC port
Message-ID: <1366798403-6984-1-git-send-email-mjonker@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

Thanks for the prompt feedback that I have received on the patches. Here's
a new revision of the patchset to introduce ARC support in BuildRoot; I
think I have addressed all the comments received from Thomas and Arnout.

Thanks,

Mischa

Changes in v2:
 * BR2_ARC_SITE hardcoded now, and moved to Config.in.arc
 * makeinfo dependency removed from binutils
 * Added 3.9-rc8 kernel headers
 * Patches split where suggested
 * Removed ARC-specific uClibc config
 * Moved ARC-specific binutils out of the choice menu
 * Introduced explicit BR2_arcel, BR2_arceb symbols a la microblaze
 * Added a patch that cleans up GCC architecture dependencies
 * Fixed patches for binutils, gcc

Mischa Jonker (12):
  arc: Add ARC and ARC BE architecture
  arc: Add option for ARC-specific download site
  arc: Add support for ARC-specific binutils
  arc: Add arc, arcbe to gnuconfig
  arc: disable Crosstool-NG for ARC
  arc: add gcc for ARC
  arc: Add support for ARC-specific uClibc
  arc: Make sure that libgcc doesn't get included when it doesn't exist
    yet
  kernel-headers: Use ../testing URL for kernel release candidates
  kernel-headers: Add 3.9-rc8 headers to make ARC work
  toolchain/gcc: Only enable --with-float when it makes sense
  toolchain/gcc: Introduce BR2_ARCH_HAS_NO_GCC_x_y

 Makefile                                           |    1 +
 arch/Config.in                                     |   29 ++++++++
 arch/Config.in.arc                                 |   25 +++++++
 arch/Config.in.arm                                 |   10 +++
 arch/Config.in.powerpc                             |    9 +++
 arch/Config.in.sparc                               |   24 +++++++
 arch/Config.in.x86                                 |    2 +
 .../binutils/2.19-arc/add-empty-info-files.patch   |   72 ++++++++++++++++++++
 package/binutils/Config.in.host                    |    2 +
 package/binutils/binutils.mk                       |    3 +
 support/gnuconfig/config.sub                       |    4 +-
 toolchain/Config.in                                |    2 +-
 .../gcc/4.4.7-arc/fix_branch_out_of_range.patch    |   30 ++++++++
 toolchain/gcc/Config.in                            |   50 +++++++++++--
 toolchain/gcc/gcc-uclibc-4.x.mk                    |    5 ++
 toolchain/kernel-headers/Config.in                 |   18 ++++--
 toolchain/kernel-headers/kernel-headers.mk         |    3 +
 toolchain/uClibc/Config.in                         |   10 ++-
 toolchain/uClibc/uClibc-snapshot.config            |    2 +
 toolchain/uClibc/uclibc.mk                         |   19 +++++-
 20 files changed, 300 insertions(+), 20 deletions(-)
 create mode 100644 arch/Config.in.arc
 create mode 100644 package/binutils/2.19-arc/add-empty-info-files.patch
 create mode 100644 toolchain/gcc/4.4.7-arc/fix_branch_out_of_range.patch
