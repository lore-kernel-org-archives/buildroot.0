From: Mischa Jonker <Mischa.Jonker@synopsys.com>
Date: Thu,  2 May 2013 21:51:21 +0200
Subject: [Buildroot] [PATCH v4 00/12] ARC port
Message-ID: <1367524293-32081-1-git-send-email-mjonker@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

Accidentally the first patch of the series was missing in v3 (wrong usage
of git format-patch command on my side...). So this is a resend of v3, but
now with an extra patch!

The patch set is also published on our github site: 
https://github.com/foss-for-synopsys-dwc-arc-processors/buildroot

Thanks, Mischa

Changes in v4:
 * re-added missing bison/flex host dependencies patch for gcc

Changes in v3:
 * removed GCC arch-dependency cleanup patch (should be discussed separately)
 * 3.9-rc8-->3.9 kernel headers
 * Added bison/flex host dependencies

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
  toolchain/gcc: Add host-{flex,bison} dependencies for GCC 4.2,4.3,4.4
  arc: Add ARC and ARC BE architecture
  arc: Add option for ARC-specific download site
  arc: Add support for ARC-specific binutils
  arc: disable Crosstool-NG for ARC
  arc: add gcc for ARC
  arc: Add support for ARC-specific uClibc
  arc: Make sure that libgcc doesn't get included when it doesn't exist
    yet
  toolchain/gcc: Only enable --with-float when it makes sense
  toolchain/toolchain-buildroot: Disable NPTL for ARC
  arc: Add arc, arcbe to gnuconfig
  kernel-headers: Add support for ARC kernel headers

 Makefile                                           |    1 +
 arch/Config.in                                     |   18 +++++
 arch/Config.in.arc                                 |   18 +++++
 .../binutils/2.19-arc/add-empty-info-files.patch   |   72 ++++++++++++++++++++
 package/binutils/Config.in.host                    |    2 +
 package/binutils/binutils.mk                       |    7 ++
 support/gnuconfig/config.sub                       |    4 +-
 toolchain/Config.in                                |    2 +-
 .../gcc/4.4.7-arc/fix_branch_out_of_range.patch    |   30 ++++++++
 toolchain/gcc/Config.in                            |   22 ++++--
 toolchain/gcc/gcc-uclibc-4.x.mk                    |   37 +++++++---
 toolchain/kernel-headers/Config.in                 |   14 +++--
 toolchain/toolchain-buildroot/Config.in.2          |    1 +
 toolchain/uClibc/Config.in                         |   10 ++-
 toolchain/uClibc/uClibc-snapshot.config            |    2 +
 toolchain/uClibc/uclibc.mk                         |   19 +++++-
 16 files changed, 227 insertions(+), 32 deletions(-)
 create mode 100644 arch/Config.in.arc
 create mode 100644 package/binutils/2.19-arc/add-empty-info-files.patch
 create mode 100644 toolchain/gcc/4.4.7-arc/fix_branch_out_of_range.patch
