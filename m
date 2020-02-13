From: Jagan Teki <jagan@amarulasolutions.com>
Date: Thu, 13 Feb 2020 13:52:23 +0530
Subject: [Buildroot] [PATCH 4/4] configs/roc-rk3399-pc: new defconfig
In-Reply-To: <1581573151-18943-5-git-send-email-sunil@amarulasolutions.com>
References: <1581573151-18943-1-git-send-email-sunil@amarulasolutions.com>
 <1581573151-18943-5-git-send-email-sunil@amarulasolutions.com>
Message-ID: <CAMty3ZCKK+Lyi7zawfgPArb75ZB9GXNi9Ga=J5yQi4_35zDUWg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Feb 13, 2020 at 11:23 AM <sunil@amarulasolutions.com> wrote:
>
> From: Suniel Mahesh <sunil@amarulasolutions.com>
>
> This initial support includes:
> Linux 5.4
> U-Boot 2020.01
> Arm Trusted Firmware v2.2
> Buildroot default packages.
>
> Signed-off-by: Suniel Mahesh <sunil@amarulasolutions.com>
> ---
>  .gitlab-ci.yml                            |  1 +
>  DEVELOPERS                                |  4 +++
>  board/firefly/roc-rk3399-pc/extlinux.conf |  4 +++
>  board/firefly/roc-rk3399-pc/genimage.cfg  | 22 +++++++++++++
>  board/firefly/roc-rk3399-pc/post-build.sh |  5 +++
>  board/firefly/roc-rk3399-pc/readme.txt    | 17 ++++++++++
>  configs/roc_pc_rk3399_defconfig           | 53 +++++++++++++++++++++++++++++++
>  7 files changed, 106 insertions(+)
>  create mode 100644 board/firefly/roc-rk3399-pc/extlinux.conf
>  create mode 100644 board/firefly/roc-rk3399-pc/genimage.cfg
>  create mode 100644 board/firefly/roc-rk3399-pc/post-build.sh
>  create mode 100644 board/firefly/roc-rk3399-pc/readme.txt
>  create mode 100644 configs/roc_pc_rk3399_defconfig
>
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index a6436a8..8140243 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -301,6 +301,7 @@ raspberrypi4_64_defconfig: { extends: .defconfig }
>  raspberrypi4_defconfig: { extends: .defconfig }
>  raspberrypi_defconfig: { extends: .defconfig }
>  riotboard_defconfig: { extends: .defconfig }
> +roc_pc_rk3399_defconfig: { extends: .defconfig }
>  rock64_defconfig: { extends: .defconfig }
>  roseapplepi_defconfig: { extends: .defconfig }
>  s6lx9_microboard_defconfig: { extends: .defconfig }
> diff --git a/DEVELOPERS b/DEVELOPERS
> index cb13035..a60c9fd 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2342,6 +2342,10 @@ N:       Steven Noonan <steven@uplinklabs.net>
>  F:     package/hwloc/
>  F:     package/powertop/
>
> +N:     Suniel Mahesh <sunil@amarulasolutions.com>
> +F:     board/firefly/
> +F:     configs/roc_pc_rk3399_defconfig
> +
>  N:     Sven Haardiek <sven.haardiek@iotec-gmbh.de>
>  F:     package/lcdproc/
>  F:     package/python-influxdb/
> diff --git a/board/firefly/roc-rk3399-pc/extlinux.conf b/board/firefly/roc-rk3399-pc/extlinux.conf
> new file mode 100644
> index 0000000..50a358f
> --- /dev/null
> +++ b/board/firefly/roc-rk3399-pc/extlinux.conf
> @@ -0,0 +1,4 @@
> +label RK3399RocPC linux

s/RK3399RocPC/ROC-RK3399-PC

> +  kernel /boot/Image
> +  devicetree /boot/rk3399-roc-pc.dtb
> +  append earlycon=uart8250,mmio32,0xff1a0000 root=/dev/mmcblk0p1 rootwait
> diff --git a/board/firefly/roc-rk3399-pc/genimage.cfg b/board/firefly/roc-rk3399-pc/genimage.cfg
> new file mode 100644
> index 0000000..966c869
> --- /dev/null
> +++ b/board/firefly/roc-rk3399-pc/genimage.cfg
> @@ -0,0 +1,22 @@
> +image sdcard.img {
> +       hdimage {
> +       }
> +
> +       partition u-boot-tpl-spl-dtb {
> +               in-partition-table = "no"
> +               image = "idbloader.img"
> +               offset = 32K
> +       }
> +
> +       partition u-boot-dtb {
> +               in-partition-table = "no"
> +               image = "u-boot.itb"
> +               offset = 8M
> +               size = 30M
> +       }
> +
> +       partition rootfs {
> +               partition-type = 0x83
> +               image = "rootfs.ext4"
> +       }
> +}
> diff --git a/board/firefly/roc-rk3399-pc/post-build.sh b/board/firefly/roc-rk3399-pc/post-build.sh
> new file mode 100644
> index 0000000..1f5ff6a
> --- /dev/null
> +++ b/board/firefly/roc-rk3399-pc/post-build.sh
> @@ -0,0 +1,5 @@
> +#!/bin/sh
> +
> +BOARD_DIR="$(dirname $0)"
> +
> +install -m 0644 -D $BOARD_DIR/extlinux.conf $TARGET_DIR/boot/extlinux/extlinux.conf
> diff --git a/board/firefly/roc-rk3399-pc/readme.txt b/board/firefly/roc-rk3399-pc/readme.txt
> new file mode 100644
> index 0000000..f8367fb
> --- /dev/null
> +++ b/board/firefly/roc-rk3399-pc/readme.txt
> @@ -0,0 +1,17 @@
> +Libre Computer Board ROC-RK3399-PC
> +===================================
> +
> +ROC-RK3399-PC is highest performance platforms leveraging the popular
> +Rockchip RK3399 SoC from Firefly and Libretech.
> +
> +Wiki link:
> +https://wiki.amarulasolutions.com/bsp/rockchip/rk3399/roc-rk3399-pc.html
> +
> +Build:
> +
> +  $ make roc_pc_rk3399_defconfig
> +  $ make
> +

Add information about how to program the image?

Jagan.
