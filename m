From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Thu,  1 May 2014 14:32:08 -0500
Subject: [Buildroot] [PATCH 0/3] Add u-boot.pbl support
Message-ID: <1398972731-20680-1-git-send-email-rjbarnet@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I have finally gotten around to incorporating feedback from Thomas
Petazzoni for the RFC for adding u-boot.pbl support to Buildroot.

This patchset introduces support for generating a u-boot.pbl image
format in u-boot. The u-boot.pbl image format is used by the Freescale's
QorIQ series of processors for in a non-NOR flash based boot
configuration. It also adds support to u-boot to generate a Reset
Configuration Word (RCW) binary file RCW.bin when using u-boot.bin
format.

Customization of the RCW can be one of two methods: using Freescale's
QorIQ Configuration Suite (QCS) or by .cfg format specified by
docs/README.pblimage in the U-Boot source.

Note: u-boot.bin + RCW.bin is the files required for NOR flash based
booting for the QorIQ processors.

Some notes on design decisions:

 * For generating a RCW.bin - BR2_TARGET_UBOOT_RCW_BIN - I chose to
   only support generating this file using Freescale's QCS because that
   is the recommended way of customizing the RCW by Freescale. There is
   another tool that Freescale provides - RCW.py - which you can use to
   generate the the RCW.bin from text file configurations. However, this
   is not part of the scope of this patch set and may be added in the
   future.

  For reference, the RCW.py can be found at:
  http://git.freescale.com/git/cgit.cgi/ppc/sdk/rcw.git

 * The .cfg file format isn't a human readable or manageable format so it
   did not make sense to support this format for generating a RCW.bin file.
   See above note about a better solution to not using Freescale's QCS for
   storing the RCW information.

Thanks, 
-Ryan

Ryan Barnett (2):
  host-xxd: new package
  uboot: introduce u-boot.pbl format

Thomas Petazzoni (1):
  uboot: separate out OMAP options and definitions

 boot/uboot/Config.in               |  45 +++++---------
 boot/uboot/Config.in.arm-omap      |  31 ++++++++++
 boot/uboot/Config.in.ppc-freescale | 100 ++++++++++++++++++++++++++++++++
 boot/uboot/uboot.mk                |  29 ++--------
 boot/uboot/uboot.mk.arm-omap       |  29 ++++++++++
 boot/uboot/uboot.mk.ppc-freescale  | 116 +++++++++++++++++++++++++++++++++++++
 package/Config.in.host             |   1 +
 package/xxd/Config.in.host         |   6 ++
 package/xxd/xxd.mk                 |  20 +++++++
 9 files changed, 322 insertions(+), 55 deletions(-)
 create mode 100644 boot/uboot/Config.in.arm-omap
 create mode 100644 boot/uboot/Config.in.ppc-freescale
 create mode 100644 boot/uboot/uboot.mk.arm-omap
 create mode 100644 boot/uboot/uboot.mk.ppc-freescale
 create mode 100644 package/xxd/Config.in.host
 create mode 100644 package/xxd/xxd.mk

-- 
1.9.0
