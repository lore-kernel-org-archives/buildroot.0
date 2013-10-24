From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Thu, 24 Oct 2013 10:24:24 -0500
Subject: [Buildroot] [RFC 0/2] uboot: add u-boot.pbl support
Message-ID: <1382628266-22635-1-git-send-email-rjbarnet@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patchset introduces support for generating a u-boot.pbl image
format in u-boot. The u-boot.pbl image format is used by the Freescale???s
QorIQ series of processors for in a non-NOR flash based boot
configuration. It also adds support to u-boot to generate a Reset
Configuration Word (RCW) binary file ??? RCW.bin. Customization of the
RCW can be one of two methods ??? using Freescale???s QorIQ Configuration
Suite (QCS) or by .cfg format specified by docs/README.pblimage in the
U-Boot source.

NOTE: u-boot.pbl format doesn't work in a SD configuration for
U-Boot 2013.10.

Some notes on design decisions:

 * For generating a RCW.bin ??? BR2_TARGET_UBOOT_RCW_BIN ??? I chose to
   only support generating this file using Freescale???s QCS because that
   is the recommended way of customizing the RCW by Freescale. There is
   another tool that Freescale provides - RCW.py - which you can use to
   generate the the RCW.bin from text file configurations. I will
   eventually look to add this package to buildroot but for now
   generating a RCW.bin in buildroot will be supported by exporting a
   'Hex String' configuration file from the QCS tool.

   Freescale???s RCW.py:
   http://git.freescale.com/git/cgit.cgi/ppc/sdk/rcw.git

 * I have not decided the best location for documentation on how to use
   this feature in the buildroot manual. For now, I will just include it
   in this cover letter with the intention that I move it in future
   version of the patch to somewhere in the manual once I???ve gotten
   feedback on the location to put this. I think maybe the
   ???deploying images??? location might be best suited for this which is
   under review currently.

Documentation
================================================

Freescale U-Boot QorIQ Support
------------------------------
The Freescale QorIQ series of processors can boot directly from eSPI FLASH,
SD/MMC and NAND, etc. These SoCs use a Pre-Boot Loader (PBL) to load
Reset Configuration Word (RCW) and/or pre-initialization instructions
(PBI). In order to boot in a boot configuration other than NOR Flash, a
specially packaged u-boot binary file is need - u-boot.pbl. For more
details on the PBL, refer to chapter 5 "Pre-Boot Loader" of reference
manual P2040RM/P3041RM/P4080RM/P5020RM at link:

http://www.freescale.com/webapp/search/Serp.jsp?Reference+Manuals

For more details on u-boot.pbl, please refer to +docs/README.pbl+ in
the u-boot source:

http://git.denx.de/cgi-bin/gitweb.cgi?p=u-boot.git;a=blob_plain;f=doc/README.pblimage;hb=HEAD

Buildroot Options
~~~~~~~~~~~~~~~~~
Support for generating u-boot.pbl is available in the U-Boot package
using +BR2_TARGET_UBOOT_FORMAT_PBL+. The U-Boot also has support for
customizing the RCW/PBI utilizing one of the formats.

 * A combination of two configurations files - rcw.cfg and pbi.cfg - in
 the format specified by +docs/README.pblimage+.

 * A +Hex String+ file exported from Freescale's QCS

The U-Boot package also has support for generating a RCW.bin file when
the u-boot.bin format is selected. A custom configuration must be
specified when this option is selected. The only format that is support
is a +Hex String+ file exported from QCS.

Exporting Custom PBL from Freescale's QCS
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Please refer to Freescale's documentation on "PBL Configuration Tool
User Guide" for using QCS customize the PBL settings:

http://www.freescale.com/infocenter/topic/qcs/qcspbl.html

The format that is required for the PBL to exported as is the
+Hex String+ which is specified in the Output File Type. Please refer
to Appendix B of the PBL Configuration Tool User Guide for more
information about this file type.

http://www.freescale.com/infocenter/topic/qcs_pbl_ug/4402240.html

Ryan Barnett (2):
  host-xxd: new package
  uboot: introduce u-boot.pbl format

 boot/uboot/Config.in       |   94 ++++++++++++++++++++++++++++++++++++
 boot/uboot/uboot.mk        |  114 ++++++++++++++++++++++++++++++++++++++++++++
 package/Config.in.host     |    1 +
 package/xxd/Config.in.host |    6 ++
 package/xxd/xxd.mk         |   20 ++++++++
 5 files changed, 235 insertions(+), 0 deletions(-)
 create mode 100644 package/xxd/Config.in.host
 create mode 100644 package/xxd/xxd.mk
