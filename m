From: Jagan Teki <jagan@amarulasolutions.com>
Date: Wed, 8 Jul 2020 15:37:56 +0530
Subject: [Buildroot] [PATCH] configs/rock_pi_n8: new defconfig
In-Reply-To: <1594097887-25563-1-git-send-email-sunil@amarulasolutions.com>
References: <1594097887-25563-1-git-send-email-sunil@amarulasolutions.com>
Message-ID: <CAMty3ZCa-Rn-60Sw=SbQnkBjQvhW6U3jSUyZwxB2+D7PwLrPAg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jul 7, 2020 at 10:28 AM Suniel Mahesh
<sunil@amarulasolutions.com> wrote:
>
> Add initial support for RK3288 SOM based radxa rockpi-n8
> target with below features:
>
>         - Custom U-Boot 2020.07-rc4
>           https://github.com/amarula/u-boot-amarula.git
>           branch rock-pi
>         - Custom Linux 5.7.0-rc1
>           https://github.com/amarula/linux-amarula.git
>           branch rockpi
>         - GPT partition layout is being used
>         - Default packages from buildroot
>
> Signed-off-by: Suniel Mahesh <sunil@amarulasolutions.com>
> ---
> NOTE:
> - patches for this target are submitted to Linux and u-boot
>   mainline, once accepted and merged, we use mainline Linux
>   and u-boot.
> ---
>  .gitlab-ci.yml                      |  1 +
>  DEVELOPERS                          |  2 ++
>  board/radxa/rockpi-n8/extlinux.conf |  4 +++
>  board/radxa/rockpi-n8/genimage.cfg  | 39 ++++++++++++++++++++++++
>  board/radxa/rockpi-n8/post-build.sh |  5 +++
>  board/radxa/rockpi-n8/readme.txt    | 61 +++++++++++++++++++++++++++++++++++++
>  configs/rock_pi_n8_defconfig        | 49 +++++++++++++++++++++++++++++
>  7 files changed, 161 insertions(+)
>  create mode 100644 board/radxa/rockpi-n8/extlinux.conf
>  create mode 100644 board/radxa/rockpi-n8/genimage.cfg
>  create mode 100755 board/radxa/rockpi-n8/post-build.sh
>  create mode 100644 board/radxa/rockpi-n8/readme.txt
>  create mode 100644 configs/rock_pi_n8_defconfig
>
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index ac4288b..119f98e 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -324,6 +324,7 @@ roc_pc_rk3399_defconfig: { extends: .defconfig }
>  rock64_defconfig: { extends: .defconfig }
>  rockpro64_defconfig: { extends: .defconfig }
>  rock_pi_4_defconfig: { extends: .defconfig }
> +rock_pi_n8_defconfig: { extends: .defconfig }
>  rock_pi_n10_defconfig: { extends: .defconfig }
>  roseapplepi_defconfig: { extends: .defconfig }
>  s6lx9_microboard_defconfig: { extends: .defconfig }
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 9f93d3a..7738847 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2405,6 +2405,7 @@ F:        board/friendlyarm/nanopc-t4
>  F:     board/friendlyarm/nanopi-m4
>  F:     board/orangepi/orangepi-rk3399
>  F:     board/radxa/rockpi-4
> +F:     board/radxa/rockpi-n8
>  F:     board/radxa/rockpi-n10
>  F:     board/pine64/rockpro64
>  F:     configs/nanopc_t4_defconfig
> @@ -2412,6 +2413,7 @@ F:        configs/nanopi_m4_defconfig
>  F:     configs/orangepi_rk3399_defconfig
>  F:     configs/roc_pc_rk3399_defconfig
>  F:     configs/rock_pi_4_defconfig
> +F:     configs/rock_pi_n8_defconfig
>  F:     configs/rock_pi_n10_defconfig
>  F:     configs/rockpro64_defconfig
>  F:     package/arm-gnu-a-toolchain/
> diff --git a/board/radxa/rockpi-n8/extlinux.conf b/board/radxa/rockpi-n8/extlinux.conf
> new file mode 100644
> index 0000000..3b05d78
> --- /dev/null
> +++ b/board/radxa/rockpi-n8/extlinux.conf
> @@ -0,0 +1,4 @@
> +label RK3399_ROCKPI_N8 linux
> +  kernel /uImage
> +  devicetree /rk3288-rock-pi-n8.dtb
> +  append console=ttyS2,115200n8 root=/dev/mmcblk0p4 rw rootwait

Better replace this root device into PARTUUID you can add GPT part ID
for rootfs.

> diff --git a/board/radxa/rockpi-n8/genimage.cfg b/board/radxa/rockpi-n8/genimage.cfg
> new file mode 100644
> index 0000000..36d7906
> --- /dev/null
> +++ b/board/radxa/rockpi-n8/genimage.cfg
> @@ -0,0 +1,39 @@
> +image boot.vfat {
> +       vfat {
> +               files = {
> +                       "uImage",
> +                       "rk3288-rock-pi-n8.dtb",
> +                       "extlinux"
> +               }
> +       }
> +       size = 112M
> +}
> +
> +image sdcard.img {
> +
> +       hdimage {
> +               gpt = true
> +       }
> +
> +       partition loader1 {
> +               image = "idbloader.img"
> +               offset = 32K
> +       }
> +
> +       partition loader2 {
> +               image = "u-boot-dtb.img"
> +               offset = 8M
> +       }
> +
> +       partition boot {
> +               partition-type = 0xC
> +               bootable = "true"
> +               image = "boot.vfat"
> +               offset = 16M
> +       }
> +
> +       partition rootfs {
> +               partition-type = 0x83
> +               image = "rootfs.ext4"

partid here.
