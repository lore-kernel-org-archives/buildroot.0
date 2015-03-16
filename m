From: Adrian Weiler <a.weiler@aldea.de>
Date: Mon, 16 Mar 2015 19:35:18 +0100
Subject: [Buildroot] [PATCH 0/1] Support for the Lamobo R1 a.k.a.
	BananaPi-R1 router board
Message-ID: <1426530919-27935-1-git-send-email-a.weiler@aldea.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, it seems that the only distribution supporting the
BananaPi-R1 router board is OpenWrt.

This is a buildroot setup for the BananaPi-R1 router board.

The intention is to create a lightweight environment for playing (or working ;-)
with this board and being able to use the latest kernel free of unknown contributions.

This includes
- code ported from OpenWrt:
  o  add the b53 PHY-driver to the Linux sources
  o  patches to the device tree for sun7i devices
  o  add the swconfig userland tool for configuring the b53 switch
  o  patches needed for uboot to support the bananapi family and the b53 switch

- sample configurations
  o  a default configuration lamobo_r1_defconfig
  o  a default Linux configuration based on the latest stable kernel 3.19.1
  o  a sample script for configuring the b53 switch 

- a post-image script for building a bootable SD card image.


OPEN ISSUES:
============
- The WLAN chip will NOT work in AP mode, even with the latest Linux sources.
  (This does not work in OpenWrt either).


Disclaimer:
This is a bare bones setup only and is NOT intended as a replacement for OpenWrt.
There is NO web based configuration, no UCI and all the other fancy stuff from OpenWrt.
You will have to configure everything from the command line.

Have fun!

Adrian Weiler (1):
  Support for the Lamobo R1 a.k.a. BananaPi-R1 router board

 board/bananapi/r1/busybox.config                   | 1054 ++++
 board/bananapi/r1/fs-overlay/etc/dnsmasq.conf      |  623 ++
 board/bananapi/r1/fs-overlay/etc/hostapd.conf      |   18 +
 board/bananapi/r1/fs-overlay/etc/init.d/S02led     |   32 +
 board/bananapi/r1/fs-overlay/etc/network/eth0.up   |   19 +
 .../bananapi/r1/fs-overlay/etc/network/interfaces  |   10 +
 board/bananapi/r1/fs-overlay/etc/network/wlan0.up  |    9 +
 board/bananapi/r1/fs-overlay/root/.ssh/.empty      |    0
 board/bananapi/r1/linux-3.19.1.config              |  263 +
 .../r1/patches/linux/linux-3.19-001-lamobo.patch   | 6004 ++++++++++++++++++++
 board/bananapi/r1/patches/package/.empty           |    0
 board/bananapi/r1/post-image.sh                    |  108 +
 board/bananapi/r1/uEnv.txt                         |    6 +
 boot/uboot/uboot-001-bananapi.patch                |   50 +
 configs/lamobo_r1_defconfig                        |   62 +
 package/Config.in                                  |    1 +
 package/swconfig/001-no-uci.patch                  |  236 +
 package/swconfig/Config.in                         |   11 +
 package/swconfig/swconfig.mk                       |   24 +
 19 files changed, 8530 insertions(+)
 create mode 100644 board/bananapi/r1/busybox.config
 create mode 100644 board/bananapi/r1/fs-overlay/etc/dnsmasq.conf
 create mode 100644 board/bananapi/r1/fs-overlay/etc/hostapd.conf
 create mode 100644 board/bananapi/r1/fs-overlay/etc/init.d/S02led
 create mode 100644 board/bananapi/r1/fs-overlay/etc/network/eth0.up
 create mode 100644 board/bananapi/r1/fs-overlay/etc/network/interfaces
 create mode 100644 board/bananapi/r1/fs-overlay/etc/network/wlan0.up
 create mode 100644 board/bananapi/r1/fs-overlay/root/.ssh/.empty
 create mode 100644 board/bananapi/r1/linux-3.19.1.config
 create mode 100644 board/bananapi/r1/patches/linux/linux-3.19-001-lamobo.patch
 create mode 100644 board/bananapi/r1/patches/package/.empty
 create mode 100755 board/bananapi/r1/post-image.sh
 create mode 100644 board/bananapi/r1/uEnv.txt
 create mode 100644 boot/uboot/uboot-001-bananapi.patch
 create mode 100644 configs/lamobo_r1_defconfig
 create mode 100644 package/swconfig/001-no-uci.patch
 create mode 100644 package/swconfig/Config.in
 create mode 100644 package/swconfig/swconfig.mk

-- 
1.8.3.2
