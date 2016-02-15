From: Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
Date: Mon, 15 Feb 2016 12:29:49 -0300
Subject: [Buildroot] [PATCH v2 0/2] Add support for Firefly RK3288
Message-ID: <1455550191-28706-1-git-send-email-ariel@vanguardiasur.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

This is a patchset v2 adding support for the Firefly RK3288 board [0].
It includes 2 defconfigs:
  * configs/firefly_rk3288_defconfig: minimal configuration.
  * configs/firefly_rk3288_demo_defconfig: Qt5 + EGLFS backend enabled.

In order to get Qt5 + EGLFS backend running on the board, a new
mali-t76x package is added, which installs the required libraries for
Mali Midgard GPU from ARM [1].

Although most of the kernel support for the board has been mainlined,
the kernel is taken from Heiko St?bner's [2] devel/somewhat-stable
branch as it includes the latest support and the Mali GPU drivers.
The GPU drivers should be added as an extension separated from the
kernel in the future.

Uboot bootloader is taken from mainline tag v2016.01.

The building process will output a 'sdcard.img' that is ready to be
flash into a SD card and boot the board.

Changelog:
---------
v1 -> v2:
  * Modified mali-t76x package so headers are installed by the
    mesa3d-headers package.
  * Squashed commits 2/3 and 3/3.
  * Added a minimal defconfig, besides the demo defconfig (Qt5 + EGLFS).
  * Minor fixes.

Regards,

Links:
[0] http://en.t-firefly.com/en/firenow/firefly_rk3288/specifications/
[1] http://malideveloper.arm.com/resources/drivers/arm-mali-midgard-gpu-user-space-drivers/
[2] https://github.com/mmind/linux-rockchip

Ariel D'Alessandro (2):
  mali-t76x: add new package
  board/firefly_rk3288: add new board

 board/firefly/firefly-rk3288/extlinux.conf |  6 +++++
 board/firefly/firefly-rk3288/post-build.sh |  3 +++
 board/firefly/firefly-rk3288/post-image.sh | 20 +++++++++++++++
 board/firefly/firefly-rk3288/readme.txt    | 40 +++++++++++++++++++++++++++++
 board/firefly/firefly-rk3288/sd-image.cfg  | 22 ++++++++++++++++
 configs/firefly_rk3288_defconfig           | 33 ++++++++++++++++++++++++
 configs/firefly_rk3288_demo_defconfig      | 41 ++++++++++++++++++++++++++++++
 package/Config.in                          |  1 +
 package/mali-t76x/Config.in                | 28 ++++++++++++++++++++
 package/mali-t76x/egl.pc                   | 11 ++++++++
 package/mali-t76x/glesv2.pc                | 11 ++++++++
 package/mali-t76x/mali-t76x.hash           |  2 ++
 package/mali-t76x/mali-t76x.mk             | 27 ++++++++++++++++++++
 13 files changed, 245 insertions(+)
 create mode 100644 board/firefly/firefly-rk3288/extlinux.conf
 create mode 100755 board/firefly/firefly-rk3288/post-build.sh
 create mode 100755 board/firefly/firefly-rk3288/post-image.sh
 create mode 100644 board/firefly/firefly-rk3288/readme.txt
 create mode 100644 board/firefly/firefly-rk3288/sd-image.cfg
 create mode 100644 configs/firefly_rk3288_defconfig
 create mode 100644 configs/firefly_rk3288_demo_defconfig
 create mode 100644 package/mali-t76x/Config.in
 create mode 100644 package/mali-t76x/egl.pc
 create mode 100644 package/mali-t76x/glesv2.pc
 create mode 100644 package/mali-t76x/mali-t76x.hash
 create mode 100644 package/mali-t76x/mali-t76x.mk

-- 
2.7.0
