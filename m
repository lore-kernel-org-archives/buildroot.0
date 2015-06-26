From: =?UTF-8?q?Guido=20Mart=C3=ADnez?= <guido@vanguardiasur.com.ar>
Date: Fri, 26 Jun 2015 14:33:18 -0300
Subject: [Buildroot] [PATCH v3 0/4] Add ARM Cortex-M3 support
Message-ID: <1435340002-20396-1-git-send-email-guido@vanguardiasur.com.ar>
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
make it usable within BR since it has some quirks (patches #2 and #3).

I'm planning to send a defconfig for the CIAA board[1] once it's
mainlined in Linux. But, for now, this config can generate a proper
rootfs:
  BR2_arm=y
  BR2_cortex_m3=y
  BR2_TOOLCHAIN_EXTERNAL=y

The changes from v2 are:
 - Patch #1 adapted to new MMU/BINFMT configs

 - INFLATE.deb patch dropped as it didn't work for every .deb.

 - elf2flt patch dropped, as it didn't make sense and it's not needed
   for now. We encountered some problems building a custom U-boot and
   it's likely that the problem is there.

Any comments and testing welcome!

[1] http://www.proyecto-ciaa.com.ar/

Guido Mart?nez (4):
  arm: update processor types
  toolchain: allow for stupid toolchains
  toolchain: introduce BR2_TOOLCHAIN_HAS_RESOLVER
  toolchain-external: add OSELAS 2014.12.0 Cortex-M3 toolchain

 arch/Config.in.arm                                 |  5 +++
 package/busybox/busybox.mk                         |  3 ++
 toolchain/Config.in                                |  3 ++
 toolchain/helpers.mk                               |  6 ++--
 toolchain/toolchain-external/Config.in             | 42 ++++++++++++++++++++++
 .../toolchain-external/toolchain-external.hash     |  4 +++
 toolchain/toolchain-external/toolchain-external.mk | 10 ++++++
 7 files changed, 71 insertions(+), 2 deletions(-)

-- 
2.1.4
