From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 29 Oct 2016 14:08:45 +0200
Subject: [Buildroot] [PATCH v2 00/23] Splitting the toolchain-external
	package
Message-ID: <1477742948-11490-1-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,

Here is the second version of the toolchain-external package infra which
was started by Thomas Petazzoni last year. This new infra will clearly
separate the common external toolchain logic from the
toolchain-specific details and generally make the external toolchain
code hopefully easier to maintain.

The four first patches change all the functions used in
INSTALL_STAGING_CMDS and INSTALL_TARGET_CMDS to take more arguments
rather than using global variables.

Then all toolchain packages are introduced but are not yet used since
the new toolchain-external infra will be added in the final patch.

The final patch introduce the new toolchain external package infra
(see it's commit log for more information).

This second version take into acount the Arnout and Thomas review (Thanks).

Best regards,
Romain

Romain Naour (10):
  toolchain-external: TOOLCHAIN_EXTERNAL_CREATE_*_LIB_SYMLINK: use
    arguments instead of global variables
  toolchain-external: TOOLCHAIN_EXTERNAL_INSTALL_*_LIBS: use arguments
    instead of global variables
  toolchain-external: TOOLCHAIN_EXTERNAL_INSTALL_WRAPPER: use arguments
    instead of global variables
  toolchain-external: TOOLCHAIN_EXTERNAL_INSTALL_TARGET_GDBSERVER: use
    arguments instead of global variables
  toolchain-external-arago-armv5te: new package
  toolchain-external-linaro-armeb: new package
  toolchain-external-codesourcery-amd64: new package
  toolchain-external-codescape-img-mips: new package
  toolchain-external-codescape-mti-mips: new package
  toolchain-external: introduce and use external toolchain infra

Thomas Petazzoni (13):
  toolchain-external-blackfin-uclinux: new package
  toolchain-external-arago-armv7a: new package
  toolchain-external-custom: new package
  toolchain-external-linaro-aarch64: new package
  toolchain-external-linaro-arm: new package
  toolchain-external-musl-cross: new package
  toolchain-external-codesourcery-aarch64: new package
  toolchain-external-codesourcery-arm: new package
  toolchain-external-codesourcery-mips: new package
  toolchain-external-codesourcery-niosII: new package
  toolchain-external-codesourcery-sh: new package
  toolchain-external-codesourcery-x86: new package
  toolchain-external-synopsys-arc: new package

 package/Makefile.in                                |   2 +-
 package/wine/wine.mk                               |   2 +-
 toolchain/toolchain-external/Config.in             | 982 +--------------------
 ...chain-external.mk => pkg-toolchain-external.mk} | 848 ++++++++----------
 .../toolchain-external-arago-armv5te/Config.in     |  19 +
 .../Config.in.options                              |   6 +
 .../toolchain-external-arago-armv5te.hash          |   3 +
 .../toolchain-external-arago-armv5te.mk            |  23 +
 .../toolchain-external-arago-armv7a/Config.in      |  24 +
 .../Config.in.options                              |   6 +
 .../toolchain-external-arago-armv7a.hash           |   3 +
 .../toolchain-external-arago-armv7a.mk             |  23 +
 .../toolchain-external-blackfin-uclinux/Config.in  |  17 +
 .../Config.in.options                              |   6 +
 .../toolchain-external-blackfin-uclinux.hash       |   3 +
 .../toolchain-external-blackfin-uclinux.mk         |  36 +
 .../Config.in                                      |  62 ++
 .../Config.in.options                              |   6 +
 .../toolchain-external-codescape-img-mips.hash     |   3 +
 .../toolchain-external-codescape-img-mips.mk       |  48 +
 .../Config.in                                      |  73 ++
 .../Config.in.options                              |   6 +
 .../toolchain-external-codescape-mti-mips.hash     |   3 +
 .../toolchain-external-codescape-mti-mips.mk       |  48 +
 .../Config.in                                      |  17 +
 .../Config.in.options                              |   6 +
 .../toolchain-external-codesourcery-aarch64.hash   |   3 +
 .../toolchain-external-codesourcery-aarch64.mk     |  23 +
 .../Config.in                                      |  24 +
 .../Config.in.options                              |   6 +
 .../toolchain-external-codesourcery-amd64.hash     |   3 +
 .../toolchain-external-codesourcery-amd64.mk       |  13 +
 .../toolchain-external-codesourcery-arm/Config.in  |  33 +
 .../Config.in.options                              |   6 +
 .../toolchain-external-codesourcery-arm.hash       |   3 +
 .../toolchain-external-codesourcery-arm.mk         |  14 +
 .../toolchain-external-codesourcery-mips/Config.in |  93 ++
 .../Config.in.options                              |   6 +
 .../toolchain-external-codesourcery-mips.hash      |   3 +
 .../toolchain-external-codesourcery-mips.mk        |  14 +
 .../Config.in                                      |  17 +
 .../Config.in.options                              |   6 +
 .../toolchain-external-codesourcery-niosII.hash    |   3 +
 .../toolchain-external-codesourcery-niosII.mk      |  14 +
 .../toolchain-external-codesourcery-sh/Config.in   |  25 +
 .../Config.in.options                              |   6 +
 .../toolchain-external-codesourcery-sh.hash        |   3 +
 .../toolchain-external-codesourcery-sh.mk          |  14 +
 .../toolchain-external-codesourcery-x86/Config.in  |  29 +
 .../Config.in.options                              |   6 +
 .../toolchain-external-codesourcery-x86.hash       |   3 +
 .../toolchain-external-codesourcery-x86.mk         |  13 +
 .../toolchain-external-custom/Config.in            |   5 +
 .../toolchain-external-custom/Config.in.options    | 331 +++++++
 .../toolchain-external-custom.mk                   |  16 +
 .../toolchain-external-linaro-aarch64/Config.in    |  15 +
 .../Config.in.options                              |   6 +
 .../toolchain-external-linaro-aarch64.hash         |   3 +
 .../toolchain-external-linaro-aarch64.mk           |  17 +
 .../toolchain-external-linaro-arm/Config.in        |  27 +
 .../Config.in.options                              |   6 +
 .../toolchain-external-linaro-arm.hash             |   3 +
 .../toolchain-external-linaro-arm.mk               |  17 +
 .../toolchain-external-linaro-armeb/Config.in      |  26 +
 .../Config.in.options                              |   6 +
 .../toolchain-external-linaro-armeb.hash           |   3 +
 .../toolchain-external-linaro-armeb.mk             |  17 +
 .../toolchain-external-musl-cross/Config.in        |  30 +
 .../Config.in.options                              |   6 +
 .../toolchain-external-musl-cross.hash             |  12 +
 .../toolchain-external-musl-cross.mk               |  36 +
 .../toolchain-external-synopsys-arc/Config.in      |  20 +
 .../Config.in.options                              |   6 +
 .../toolchain-external-synopsys-arc.hash           |   5 +
 .../toolchain-external-synopsys-arc.mk             |  26 +
 .../toolchain-external/toolchain-external.hash     |  67 --
 toolchain/toolchain-external/toolchain-external.mk | 797 +----------------
 77 files changed, 1877 insertions(+), 2284 deletions(-)
 copy toolchain/toolchain-external/{toolchain-external.mk => pkg-toolchain-external.mk} (50%)
 create mode 100644 toolchain/toolchain-external/toolchain-external-arago-armv5te/Config.in
 create mode 100644 toolchain/toolchain-external/toolchain-external-arago-armv5te/Config.in.options
 create mode 100644 toolchain/toolchain-external/toolchain-external-arago-armv5te/toolchain-external-arago-armv5te.hash
 create mode 100644 toolchain/toolchain-external/toolchain-external-arago-armv5te/toolchain-external-arago-armv5te.mk
 create mode 100644 toolchain/toolchain-external/toolchain-external-arago-armv7a/Config.in
 create mode 100644 toolchain/toolchain-external/toolchain-external-arago-armv7a/Config.in.options
 create mode 100644 toolchain/toolchain-external/toolchain-external-arago-armv7a/toolchain-external-arago-armv7a.hash
 create mode 100644 toolchain/toolchain-external/toolchain-external-arago-armv7a/toolchain-external-arago-armv7a.mk
 create mode 100644 toolchain/toolchain-external/toolchain-external-blackfin-uclinux/Config.in
 create mode 100644 toolchain/toolchain-external/toolchain-external-blackfin-uclinux/Config.in.options
 create mode 100644 toolchain/toolchain-external/toolchain-external-blackfin-uclinux/toolchain-external-blackfin-uclinux.hash
 create mode 100644 toolchain/toolchain-external/toolchain-external-blackfin-uclinux/toolchain-external-blackfin-uclinux.mk
 create mode 100644 toolchain/toolchain-external/toolchain-external-codescape-img-mips/Config.in
 create mode 100644 toolchain/toolchain-external/toolchain-external-codescape-img-mips/Config.in.options
 create mode 100644 toolchain/toolchain-external/toolchain-external-codescape-img-mips/toolchain-external-codescape-img-mips.hash
 create mode 100644 toolchain/toolchain-external/toolchain-external-codescape-img-mips/toolchain-external-codescape-img-mips.mk
 create mode 100644 toolchain/toolchain-external/toolchain-external-codescape-mti-mips/Config.in
 create mode 100644 toolchain/toolchain-external/toolchain-external-codescape-mti-mips/Config.in.options
 create mode 100644 toolchain/toolchain-external/toolchain-external-codescape-mti-mips/toolchain-external-codescape-mti-mips.hash
 create mode 100644 toolchain/toolchain-external/toolchain-external-codescape-mti-mips/toolchain-external-codescape-mti-mips.mk
 create mode 100644 toolchain/toolchain-external/toolchain-external-codesourcery-aarch64/Config.in
 create mode 100644 toolchain/toolchain-external/toolchain-external-codesourcery-aarch64/Config.in.options
 create mode 100644 toolchain/toolchain-external/toolchain-external-codesourcery-aarch64/toolchain-external-codesourcery-aarch64.hash
 create mode 100644 toolchain/toolchain-external/toolchain-external-codesourcery-aarch64/toolchain-external-codesourcery-aarch64.mk
 create mode 100644 toolchain/toolchain-external/toolchain-external-codesourcery-amd64/Config.in
 create mode 100644 toolchain/toolchain-external/toolchain-external-codesourcery-amd64/Config.in.options
 create mode 100644 toolchain/toolchain-external/toolchain-external-codesourcery-amd64/toolchain-external-codesourcery-amd64.hash
 create mode 100644 toolchain/toolchain-external/toolchain-external-codesourcery-amd64/toolchain-external-codesourcery-amd64.mk
 create mode 100644 toolchain/toolchain-external/toolchain-external-codesourcery-arm/Config.in
 create mode 100644 toolchain/toolchain-external/toolchain-external-codesourcery-arm/Config.in.options
 create mode 100644 toolchain/toolchain-external/toolchain-external-codesourcery-arm/toolchain-external-codesourcery-arm.hash
 create mode 100644 toolchain/toolchain-external/toolchain-external-codesourcery-arm/toolchain-external-codesourcery-arm.mk
 create mode 100644 toolchain/toolchain-external/toolchain-external-codesourcery-mips/Config.in
 create mode 100644 toolchain/toolchain-external/toolchain-external-codesourcery-mips/Config.in.options
 create mode 100644 toolchain/toolchain-external/toolchain-external-codesourcery-mips/toolchain-external-codesourcery-mips.hash
 create mode 100644 toolchain/toolchain-external/toolchain-external-codesourcery-mips/toolchain-external-codesourcery-mips.mk
 create mode 100644 toolchain/toolchain-external/toolchain-external-codesourcery-niosII/Config.in
 create mode 100644 toolchain/toolchain-external/toolchain-external-codesourcery-niosII/Config.in.options
 create mode 100644 toolchain/toolchain-external/toolchain-external-codesourcery-niosII/toolchain-external-codesourcery-niosII.hash
 create mode 100644 toolchain/toolchain-external/toolchain-external-codesourcery-niosII/toolchain-external-codesourcery-niosII.mk
 create mode 100644 toolchain/toolchain-external/toolchain-external-codesourcery-sh/Config.in
 create mode 100644 toolchain/toolchain-external/toolchain-external-codesourcery-sh/Config.in.options
 create mode 100644 toolchain/toolchain-external/toolchain-external-codesourcery-sh/toolchain-external-codesourcery-sh.hash
 create mode 100644 toolchain/toolchain-external/toolchain-external-codesourcery-sh/toolchain-external-codesourcery-sh.mk
 create mode 100644 toolchain/toolchain-external/toolchain-external-codesourcery-x86/Config.in
 create mode 100644 toolchain/toolchain-external/toolchain-external-codesourcery-x86/Config.in.options
 create mode 100644 toolchain/toolchain-external/toolchain-external-codesourcery-x86/toolchain-external-codesourcery-x86.hash
 create mode 100644 toolchain/toolchain-external/toolchain-external-codesourcery-x86/toolchain-external-codesourcery-x86.mk
 create mode 100644 toolchain/toolchain-external/toolchain-external-custom/Config.in
 create mode 100644 toolchain/toolchain-external/toolchain-external-custom/Config.in.options
 create mode 100644 toolchain/toolchain-external/toolchain-external-custom/toolchain-external-custom.mk
 create mode 100644 toolchain/toolchain-external/toolchain-external-linaro-aarch64/Config.in
 create mode 100644 toolchain/toolchain-external/toolchain-external-linaro-aarch64/Config.in.options
 create mode 100644 toolchain/toolchain-external/toolchain-external-linaro-aarch64/toolchain-external-linaro-aarch64.hash
 create mode 100644 toolchain/toolchain-external/toolchain-external-linaro-aarch64/toolchain-external-linaro-aarch64.mk
 create mode 100644 toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in
 create mode 100644 toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in.options
 create mode 100644 toolchain/toolchain-external/toolchain-external-linaro-arm/toolchain-external-linaro-arm.hash
 create mode 100644 toolchain/toolchain-external/toolchain-external-linaro-arm/toolchain-external-linaro-arm.mk
 create mode 100644 toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in
 create mode 100644 toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in.options
 create mode 100644 toolchain/toolchain-external/toolchain-external-linaro-armeb/toolchain-external-linaro-armeb.hash
 create mode 100644 toolchain/toolchain-external/toolchain-external-linaro-armeb/toolchain-external-linaro-armeb.mk
 create mode 100644 toolchain/toolchain-external/toolchain-external-musl-cross/Config.in
 create mode 100644 toolchain/toolchain-external/toolchain-external-musl-cross/Config.in.options
 create mode 100644 toolchain/toolchain-external/toolchain-external-musl-cross/toolchain-external-musl-cross.hash
 create mode 100644 toolchain/toolchain-external/toolchain-external-musl-cross/toolchain-external-musl-cross.mk
 create mode 100644 toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in
 create mode 100644 toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in.options
 create mode 100644 toolchain/toolchain-external/toolchain-external-synopsys-arc/toolchain-external-synopsys-arc.hash
 create mode 100644 toolchain/toolchain-external/toolchain-external-synopsys-arc/toolchain-external-synopsys-arc.mk
 delete mode 100644 toolchain/toolchain-external/toolchain-external.hash

-- 
2.5.5
