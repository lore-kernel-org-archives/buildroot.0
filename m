From: =?UTF-8?q?Guido=20Mart=C3=ADnez?= <guido@vanguardiasur.com.ar>
Date: Mon, 18 May 2015 11:24:42 -0300
Subject: [Buildroot] [PATCH v2 0/6] Add ARM Cortex-M3 support
Message-ID: <1431959088-15257-1-git-send-email-guido@vanguardiasur.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

this patchset introduces support for the M3 processors. These processors
don't have an MMU and they don't support the regular ARM mode (only
Thumb and Thumb2).

The OSELAS 2014.12.0 toolchain is added, along with a few patches to
make it usable within BR since it has some quirks. The toolchain is
packaged as a .deb package, so I implemented INFLATE.deb so we don't
need special EXTRACT_CMDS for it (although that isn't really too ugly,
so it's up for discussion).

I'm planning to send a defconfig for the CIAA board[1] once it's
mainlined in Linux. But, for now, this config can generate a proper
rootfs:
  BR2_arm=y
  BR2_cortex_m3=y
  BR2_TOOLCHAIN_EXTERNAL=y

The changes from v1 (sent by Ezequiel) are:
 - Patch 1 was accepted, so dropped it.

 - The toolchain checked is not skipped, but done with a different
 output as Yann suggested.

 - This toolchain version is newer than the previous one (2014.12.0 vs
 (2013.12.2).

 - Added a script to implement INFLATE.deb in support/extract/, to avoid
 custom extract commands. This might also be useful for other packages.

When we sent out v1 there was a discussion about adding
BR2_HAS_{ELF,FLAT}_SUPPORT and BR2_HAS_OPTIONAL_MMU to avoid
blacklisting each architecture on the ELF, FLAT and MMU configs. I
haven't done this for now as it would make it a huge patchset and is a
different objective (I think), but I can send a new patch for that if
there's interest.

Any comments and testing welcome!

[1] http://www.proyecto-ciaa.com.ar/

--

Guido Mart?nez (6):
  arm: update processor types
  pkg-utils: implement INFLATE for .deb files
  toolchain: allow for stupid toolchains
  toolchain: introduce BR2_TOOLCHAIN_HAS_RESOLVER
  nommu/flat: don't add -elf2flt for some toolchains
  toolchain-external: add OSELAS 2014.12.0 Cortex-M3 toolchain

 Makefile                                           |  2 +
 arch/Config.in                                     |  8 ++--
 arch/Config.in.arm                                 |  5 +++
 package/Makefile.in                                |  3 ++
 package/busybox/busybox.mk                         |  3 ++
 package/pkg-utils.mk                               |  1 +
 support/extract/inflate-deb.sh                     |  5 +++
 toolchain/Config.in                                |  6 +++
 toolchain/helpers.mk                               |  6 ++-
 toolchain/toolchain-common.in                      |  6 ++-
 toolchain/toolchain-external/Config.in             | 43 ++++++++++++++++++++++
 .../toolchain-external/toolchain-external.hash     |  4 ++
 toolchain/toolchain-external/toolchain-external.mk | 10 +++++
 13 files changed, 94 insertions(+), 8 deletions(-)
 create mode 100755 support/extract/inflate-deb.sh

-- 
2.1.4
