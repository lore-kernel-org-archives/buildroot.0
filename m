From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 10 Jan 2019 22:14:57 +0100
Subject: [Buildroot] [PATCH 0/3] Fix pkg-kconfig packages with ccache enabled
Message-ID: <20190110211500.14368-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This series addresses a problem that has been reported several times:
if you have BR2_CCACHE=y and run "make uboot-menuconfig" from a clean
tree, it fails because U-Boot tries to build the kconfig code with
ccache, but ccache has not been built yet.

To address this, we:

 - Make sure to pass HOSTCC=$(HOSTCC_NOCCACHE) in the kconfig steps of
   kconfig packages. This has in fact no real effect, because linux
   and u-boot were overriding HOSTCC, and other packages were not
   passing HOSTCC, so plain "gcc" was used.

 - Fix the U-Boot case by passing HOSTCC=$(HOSTCC_NOCCACHE)

 - Make the Linux case consistent with other kconfig packages by also
   passing HOSTCC=$(HOSTCC_NOCCACHE)

Thanks,

Thomas

Thomas Petazzoni (3):
  package/pkg-kconfig: pass HOSTCC during kconfig steps
  boot/uboot: use HOSTCC_NOCCACHE as kconfig HOSTCC
  linux: use HOSTCC_NOCCACHE as kconfig HOSTCC

 boot/uboot/uboot.mk    |  5 +++--
 linux/linux.mk         | 17 ++++++++++-------
 package/pkg-kconfig.mk | 10 +++++++---
 3 files changed, 20 insertions(+), 12 deletions(-)

-- 
2.20.1
