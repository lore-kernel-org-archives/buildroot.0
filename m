From: Anders Darander <anders@chargestorm.se>
Date: Sat, 11 May 2013 14:57:24 +0200
Subject: [Buildroot] [PATCH v2 0/4] Upgrade BeagleBone kernel to 3.8
Message-ID: <1368277048-17340-1-git-send-email-anders@chargestorm.se>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

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

The use of the Cortex-A8 compilerc for the Cortex M-3 code, has been verified
to work using the buildroot compiler. TI is using the same setup in their BSP
built using Yocto Project (i.e. use the A8 compiler for thde M3 FW).

The last patch in the series (0004-beaglebone-enable-NFS-root.patch) is not
necessary; it's only my preferred way of testing.

Cheers,
Anders

V2: 
    * Squashed the reduction of the kernel config into the first commit (the
      actual upgrade commit).

    * Running format patch with -M10 instead of -M to detect the rename.

    * Fixes in the am33x-cm3 package:
      * Changed to tag (instead of SHA1), changed to http instead of git
        protocol. 

      * Renamed the license.
      * Install the init script in a _INIT_SYSV hook.


Anders Darander (4):
  beaglebone: update to linux 3.8
  am33x-cm3: add FW for suspend/resume
  beaglebone: add am33x-cm3 to the build
  beaglebone: enable NFS root

 .../{linux-3.2.9.config => linux-3.8.config}       |  219 ++++++++------------
 configs/beaglebone_defconfig                       |   11 +-
 package/Config.in                                  |    1 +
 package/am33x-cm3/Config.in                        |    4 +
 package/am33x-cm3/am335x-pm-firmware-load          |    6 +
 package/am33x-cm3/am33x-cm3.mk                     |   28 +++
 6 files changed, 131 insertions(+), 138 deletions(-)
 rename board/beaglebone/{linux-3.2.9.config => linux-3.8.config} (44%)
 create mode 100644 package/am33x-cm3/Config.in
 create mode 100755 package/am33x-cm3/am335x-pm-firmware-load
 create mode 100644 package/am33x-cm3/am33x-cm3.mk

-- 
1.7.10.4
