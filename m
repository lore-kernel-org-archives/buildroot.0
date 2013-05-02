From: Mischa Jonker <Mischa.Jonker@synopsys.com>
Date: Thu,  2 May 2013 15:00:39 +0200
Subject: [Buildroot] [PATCH v3 00/11] ARC port
Message-ID: <1367499650-29869-1-git-send-email-mjonker@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

Now that 3.9 has been released, ARC doesn't depend on its own kernel anymore.
This is reflected in the patch set, furthermore, bison/flex host dependencies
have been removed (thanks to Thomas for his input).

The GCC version architecture dependency cleanup patch is not really related to
ARC, and I will come with a proposal as a separate patch.

The patch set is also published on our github site: 
https://github.com/foss-for-synopsys-dwc-arc-processors/buildroot

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

Mischa Jonker (11):
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
 toolchain/gcc/gcc-uclibc-4.x.mk                    |    5 ++
 toolchain/kernel-headers/Config.in                 |   14 +++--
 toolchain/toolchain-buildroot/Config.in.2          |    1 +
 toolchain/uClibc/Config.in                         |   10 ++-
 toolchain/uClibc/uClibc-snapshot.config            |    2 +
 toolchain/uClibc/uclibc.mk                         |   19 +++++-
 16 files changed, 207 insertions(+), 20 deletions(-)
 create mode 100644 arch/Config.in.arc
 create mode 100644 package/binutils/2.19-arc/add-empty-info-files.patch
 create mode 100644 toolchain/gcc/4.4.7-arc/fix_branch_out_of_range.patch
