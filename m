From: Anders Darander <anders.darander@gmail.com>
Date: Thu,  9 May 2013 22:31:26 +0200
Subject: [Buildroot] [PATCH 0/5] Upgrade BeagleBone kernel to 3.8
Message-ID: <1368131491-14115-1-git-send-email-anders.darander@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Anders Darander <anders@chargestorm.se>

Hi,

(I'm resending this series from a subscribed address).

This patch series upgrades the kernel for the BeagleBone to 3.8.

The 3.8 kernel is taken from TI's own repo, and the actual branch/commit used
are the same as currently being used in their own BSP (see meta-ti for
OpenEmbedded / Yocto).

As the BB support is being mainlined, the old board-setup has been removed,
thus the 3.8 kernel requires the use of a device tree. (A DTS, am33x-bone.dts
is included in the kernel).

The new package, am33x-cm3, consists of the FW blob for the Cortex M3 on the
BB that handles the power management of the board. Without this firmware
loaded, even a simple `reboot` won't succeed. In the old 3.2 kernel, this was
compiled in as a part of the kernel, however, in the 3.8 kernel, it has to be
loaded during the runtime.

The last patch in the series (0005-beaglebone-enable-NFS-root.patch) is not
necessary; it's only my preferred way of testing.

Cheers,
Anders

Anders Darander (5):
  beaglebone: update to linux 3.8
  beaglebone: reduce defconfig
  am33x-cm3: add FW for suspend/resume
  beaglebone: add am33x-cm3
  beaglebone: enable NFS root

 board/beaglebone/linux-3.2.9.config       |  252 -----------------------------
 board/beaglebone/linux-3.8.config         |  203 +++++++++++++++++++++++
 configs/beaglebone_defconfig              |   23 +--
 package/Config.in                         |    1 +
 package/am33x-cm3/Config.in               |    4 +
 package/am33x-cm3/am335x-pm-firmware-load |    6 +
 package/am33x-cm3/am33x-cm3.mk            |   26 +++
 7 files changed, 247 insertions(+), 268 deletions(-)
 delete mode 100644 board/beaglebone/linux-3.2.9.config
 create mode 100644 board/beaglebone/linux-3.8.config
 create mode 100644 package/am33x-cm3/Config.in
 create mode 100755 package/am33x-cm3/am335x-pm-firmware-load
 create mode 100644 package/am33x-cm3/am33x-cm3.mk

-- 
1.7.10.4
