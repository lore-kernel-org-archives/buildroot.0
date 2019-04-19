From: Shyam Saini <shyam.saini@amarulasolutions.com>
Date: Fri, 19 Apr 2019 23:41:23 +0530
Subject: [Buildroot] [Patch V2] board/friendlyarm: Add support fot
 RK3399 NanoPi M4 board
In-Reply-To: <CAOf5uwmUk4K2EDut-7y-ujXju+XPx4MrV1rt_bWc4T2yiDUjDA@mail.gmail.com>
References: <20190419082954.27833-1-shyam.saini@amarulasolutions.com>
 <CAOf5uwmUk4K2EDut-7y-ujXju+XPx4MrV1rt_bWc4T2yiDUjDA@mail.gmail.com>
Message-ID: <CA+drQ_Mpi3Zfgrm8asOTCjDm9vcm_fVRgBZEyo6mLncr7gOGaQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Hi

> On Fri, Apr 19, 2019 at 10:30 AM Shyam Saini
> <shyam.saini@amarulasolutions.com> wrote:
> >
> > This initial support includes:
> >         Custom u-boot
> >         Linux v5.1-rc1
> >         ATF v2.0
> >         Buildroot default packages
> >
> > Mainline uboot does not automatically builds itb image for rk3398, so
> > add u-boot patch to fix this
> >
> > Rk3399 soc based board uses python pyelftools library in uboot so make it
> > is as uboot dependency.
> >
> > Signed-off-by: Shyam Saini <shyam.saini@amarulasolutions.com>
> > ---
> > This support is added on top of these two patches because of python
> > pyelftools library dependency on uboot
> > [1] https://patchwork.ozlabs.org/patch/1087590/
> > [2] https://patchwork.ozlabs.org/patch/1087591/
> >
> > Here are complete test boots logs for this support:
> > https://paste.ubuntu.com/p/hYcwB5KqkR/
> >
> > Changelogs:
> >
> > V1->V2:
> >         Fix extra white space and extra new line
> >         Remove wrong uboot patch
> >         Rename uboot patch appropriately
> >         Add NanoPi M4 official wiki
> >         Improve commit message
> > ---
> > ---
> >  .gitlab-ci.yml                                     |  1 +
> >  DEVELOPERS                                         |  4 ++
> >  board/friendlyarm/nanopi-m4/extlinux.conf          |  4 ++
> >  board/friendlyarm/nanopi-m4/genimage.cfg           | 22 +++++++++
> >  .../0001-autobuild-itb-image-for-rk3399-socs.patch | 13 +++++
> >  board/friendlyarm/nanopi-m4/post-build.sh          |  8 +++
> >  board/friendlyarm/nanopi-m4/readme.txt             | 46 +++++++++++++++++
> >  configs/nanopi_m4_defconfig                        | 57 ++++++++++++++++++++++
> >  8 files changed, 155 insertions(+)
> >  create mode 100644 board/friendlyarm/nanopi-m4/extlinux.conf
> >  create mode 100644 board/friendlyarm/nanopi-m4/genimage.cfg
> >  create mode 100644 board/friendlyarm/nanopi-m4/patches/uboot/0001-autobuild-itb-image-for-rk3399-socs.patch
> >  create mode 100755 board/friendlyarm/nanopi-m4/post-build.sh
> >  create mode 100644 board/friendlyarm/nanopi-m4/readme.txt
> >  create mode 100644 configs/nanopi_m4_defconfig
> >
> > diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> > index ef16b73bfb..4a425900c0 100644
> > --- a/.gitlab-ci.yml
> > +++ b/.gitlab-ci.yml
> > @@ -175,6 +175,7 @@ mx6sx_udoo_neo_defconfig: { extends: .defconfig }
> >  mx6udoo_defconfig: { extends: .defconfig }
> >  nanopi_m1_defconfig: { extends: .defconfig }
> >  nanopi_m1_plus_defconfig: { extends: .defconfig }
> > +nanopi_m4_defconfig: {extends: .defconfig}
> >  nanopi_neo_defconfig: { extends: .defconfig }
> >  nexbox_a95x_defconfig: { extends: .defconfig }
> >  nitrogen6sx_defconfig: { extends: .defconfig }
> > diff --git a/DEVELOPERS b/DEVELOPERS
> > index c91325e284..cca869af9e 100644
> > --- a/DEVELOPERS
> > +++ b/DEVELOPERS
> > @@ -2000,6 +2000,10 @@ F:       package/tunctl/
> >  F:     package/ubus/
> >  F:     package/wolfssl/
> >
> > +N:     Shyam Saini <shyam.saini@amarulasolutions.com>
> > +F:     board/friendlyarm/nanopi-m4/
> > +F:     configs/nanopi_m4_defconfig
> > +
> >  N:     Simon Dawson <spdawson@gmail.com>
> >  F:     boot/at91bootstrap3/
> >  F:     package/cppzmq/
> > diff --git a/board/friendlyarm/nanopi-m4/extlinux.conf b/board/friendlyarm/nanopi-m4/extlinux.conf
> > new file mode 100644
> > index 0000000000..e5861cdcbe
> > --- /dev/null
> > +++ b/board/friendlyarm/nanopi-m4/extlinux.conf
> > @@ -0,0 +1,4 @@
> > +label NanoPi M4 5.1-rc1
> > +  kernel /boot/Image
> > +  devicetree /boot/rk3399-nanopi-m4.dtb
> > +  append earlycon=uart8250,mmio32,0xff1a0000 root=/dev/mmcblk1p1 rootwait
> > diff --git a/board/friendlyarm/nanopi-m4/genimage.cfg b/board/friendlyarm/nanopi-m4/genimage.cfg
> > new file mode 100644
> > index 0000000000..6404b0ad3b
> > --- /dev/null
> > +++ b/board/friendlyarm/nanopi-m4/genimage.cfg
> > @@ -0,0 +1,22 @@
> > +image sdcard.img {
> > +       hdimage {
> > +       }
> > +
> > +       partition u-boot-spl-dtb {
> > +               in-partition-table = "no"
> > +               image = "u-boot-spl-dtb.img"
> > +               offset = 32K
> > +       }
> > +
> > +       partition u-boot-dtb {
> > +               in-partition-table = "no"
> > +               image = "u-boot.itb"
> > +               offset = 8M
> > +               size = 30M
> > +       }
> > +
> > +       partition rootfs {
> > +               partition-type = 0x83
> > +               image = "rootfs.ext4"
> > +       }
> > +}
> > diff --git a/board/friendlyarm/nanopi-m4/patches/uboot/0001-autobuild-itb-image-for-rk3399-socs.patch b/board/friendlyarm/nanopi-m4/patches/uboot/0001-autobuild-itb-image-for-rk3399-socs.patch
> > new file mode 100644
> > index 0000000000..ef363e0a96
> > --- /dev/null
> > +++ b/board/friendlyarm/nanopi-m4/patches/uboot/0001-autobuild-itb-image-for-rk3399-socs.patch
> > @@ -0,0 +1,13 @@
> > +diff --git a/Kconfig b/Kconfig
> > +index 5679a288ec..46f511123a 100644
> > +--- a/Kconfig
> > ++++ b/Kconfig
> > +@@ -230,7 +230,7 @@ config BUILD_TARGET
> > +       default "u-boot-with-spl.sfp" if TARGET_SOCFPGA_GEN5
> > +       default "u-boot-spl.kwb" if ARCH_MVEBU && SPL
> > +       default "u-boot-elf.srec" if RCAR_GEN3
> > +-      default "u-boot.itb" if SPL_LOAD_FIT && ARCH_SUNXI
> > ++      default "u-boot.itb" if SPL_LOAD_FIT && (ARCH_ROCKCHIP || ARCH_SUNXI)
> > +       default "u-boot.kwb" if KIRKWOOD
> > +       help
> > +         Some SoCs need special image types (e.g. U-Boot binary
> > diff --git a/board/friendlyarm/nanopi-m4/post-build.sh b/board/friendlyarm/nanopi-m4/post-build.sh
> > new file mode 100755
>
> diff --git a/Kconfig b/Kconfig
> index 5679a288ec..46f511123a 100644
> --- a/Kconfig
> +++ b/Kconfig
> @@ -230,7 +230,7 @@ config BUILD_TARGET
>         default "u-boot-with-spl.sfp" if TARGET_SOCFPGA_GEN5
>         default "u-boot-spl.kwb" if ARCH_MVEBU && SPL
>         default "u-boot-elf.srec" if RCAR_GEN3
> -       default "u-boot.itb" if SPL_LOAD_FIT && ARCH_SUNXI
> +       default "u-boot.itb" if SPL_LOAD_FIT && (ARCH_ROCKCHIP || ARCH_SUNXI)
>         default "u-boot.kwb" if KIRKWOOD
>         help
>           Some SoCs need special image types (e.g. U-Boot binary
> diff --git a/Makefile b/Makefile
> index 92e04dd689..9b1ed1a01b 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1169,7 +1169,7 @@ ifeq
> ($(CONFIG_SPL_FIT_GENERATOR),"arch/arm/mach-rockchip/make_fit_atf.py")
>  U_BOOT_ITS_DEPS += u-boot
>  endif
>  $(U_BOOT_ITS): $(U_BOOT_ITS_DEPS) FORCE
> -       $(srctree)/$(CONFIG_SPL_FIT_GENERATOR) \
> +       $(srctree)/$(CONFIG_SPL_FIT_GENERATOR) -b $(BL31) \
>         $(patsubst %,arch/$(ARCH)/dts/%.dtb,$(subst ",,$(CONFIG_OF_LIST))) > $@
>  endif
>  endif
>
> This is broken, I need to pass the -b option to give the information
> where to pick BL31.

Sorry, I missed this in repeated builds.

Both the patches would be applied to custom u-boot repo.


Thanks a lot for this feedback and reporting.
