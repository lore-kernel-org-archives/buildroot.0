From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 20 Apr 2020 15:06:03 +0200
Subject: [Buildroot] [PATCH 1/2] support/scripts: add check-dotconfig.py
In-Reply-To: <20200420091757.2931721-1-romain.naour@gmail.com>
References: <20200420091757.2931721-1-romain.naour@gmail.com>
Message-ID: <20200420130603.GH5035@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2020-04-20 11:17 +0200, Romain Naour spake thusly:
> For the same reason as for 50b747f212be2c9c0f7cf10c674ed488d042715c,
> we need to check if the generated configuration file (.config)
> contains all symbols present in the defconfig file.
> 
> If not there is an issue with the defconfig.
> 
> This script will be used in .gitlab-ci.yml.
> 
> Inspired by is_toolchain_usable() function from genrandconfig:
> https://git.busybox.net/buildroot/tree/utils/genrandconfig?h=2020.02#n164
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  support/scripts/check-dotconfig.py | 37 ++++++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100755 support/scripts/check-dotconfig.py
> 
> diff --git a/support/scripts/check-dotconfig.py b/support/scripts/check-dotconfig.py
> new file mode 100755
> index 0000000000..9e60810c1d
> --- /dev/null
> +++ b/support/scripts/check-dotconfig.py
> @@ -0,0 +1,37 @@
> +#!/usr/bin/env python3
> +
> +# This script check if the .config is contains all lines present in the defconfig.
> +
> +import sys
> +
> +
> +def main():
> +    if not (len(sys.argv) == 3):
> +        print("Error: incorrect number of arguments")
> +        print("""Usage: check-dotconfig <configfile> <defconfig>""")
> +        sys.exit(1)
> +
> +    configfile = sys.argv[1]
> +    defconfig = sys.argv[2]
> +
> +    with open(configfile) as configf:
> +        configlines = configf.readlines()
> +
> +    defconfiglines = []
> +    with open(defconfig) as defconfigf:
> +        for line in defconfigf.readlines():
> +            if line.startswith("BR2_"):
> +                defconfiglines.append(line)

And what about lines that match '# foo is not set' ?
We also want to ensure those are still present too.

> +    # Check that all the defconfig lines are still present
> +    for defconfigline in defconfiglines:
> +        if defconfigline not in configlines:
> +            print("WARN: defconfig can't be used\n")
> +            print("      Missing: %s\n" % defconfigline.strip())
> +            return False

This only reports a single missing variable, while there can more than
one.

Here is a proposal for an updated script:

    #!/usr/bin/env python3

    # This scripts check that all lines present in the defconfig are
    # still present in the .config

    import sys


    def main():
        if not (len(sys.argv) == 3):
            print("Error: incorrect number of arguments")
            print("""Usage: check-dotconfig <configfile> <defconfig>""")
            sys.exit(1)

        configfile = sys.argv[1]
        defconfig = sys.argv[2]

        # strip() to get rid of trailing \n
        with open(configfile) as configf:
            configlines = [l.strip() for l in configf.readlines()]

        defconfiglines = []
        with open(defconfig) as defconfigf:
            for line in defconfigf.readlines():
                # strip() to get rid of trailing \n
                line = line.strip()
                if line.startswith("BR2_"):
                    defconfiglines.append(line)
                elif line.startswith('# BR2_') and line.endswith(' is not set'):
                    defconfiglines.append(line)

        # Check that all the defconfig lines are still present
        missing = [defconfigline.strip() for defconfigline in defconfiglines
                   if defconfigline not in configlines]

        if len(missing):
            print("WARN: defconfig {} can't be used:".format(defconfig))
            for m in missing:
                print("      Missing: {}".format(m))
        sys.exit(1 if len(missing) else 0)


    if __name__ == "__main__":
        main()


And with this script, I ran:

    $ for cfg in $(make list-defconfigs |sed -r -e '/ - /!d; s/  (.*) - .*/\1/'); do
        make "${cfg}" >/dev/null 2>&1
        support/scripts/check-dotconfig.py .config configs/"${cfg}"
    done
    WARN: defconfig configs/amarula_a64_relic_defconfig can't be used:
          Missing: BR2_PACKAGE_HOST_ANDROID_TOOLS_FASTBOOT=y
    WARN: defconfig configs/beaglebone_qt5_defconfig can't be used:
          Missing: BR2_PACKAGE_QT5=y
          Missing: BR2_PACKAGE_QT5BASE_EXAMPLES=y
          Missing: BR2_PACKAGE_QT5BASE_EGLFS=y
          Missing: BR2_PACKAGE_QT5BASE_DEFAULT_QPA="wayland"
          Missing: BR2_PACKAGE_QT5QUICKCONTROLS=y
          Missing: BR2_PACKAGE_QT5WAYLAND=y
          Missing: BR2_PACKAGE_QT5WAYLAND_COMPOSITOR=y
    WARN: defconfig configs/engicam_imx6qdl_icore_qt5_defconfig can't be used:
          Missing: BR2_PACKAGE_QT5=y
          Missing: BR2_PACKAGE_QT5BASE_LICENSE_APPROVED=y
          Missing: BR2_PACKAGE_QT5BASE_OPENGL_LIB=y
          Missing: BR2_PACKAGE_QT5BASE_LINUXFB=y
          Missing: BR2_PACKAGE_QT5BASE_FONTCONFIG=y
          Missing: BR2_PACKAGE_QT5BASE_GIF=y
          Missing: BR2_PACKAGE_QT5BASE_JPEG=y
          Missing: BR2_PACKAGE_GLMARK2=y
          Missing: BR2_PACKAGE_QT5CINEX=y
          Missing: BR2_PACKAGE_QT5CINEX_HD=y
    WARN: defconfig configs/freescale_imx28evk_defconfig can't be used:
          Missing: BR2_TARGET_ROOTFS_EXT4=y
    WARN: defconfig configs/imx23evk_defconfig can't be used:
          Missing: BR2_TARGET_ROOTFS_EXT4=y
    WARN: defconfig configs/imx6-sabresd_qt5_defconfig can't be used:
          Missing: BR2_PACKAGE_QT5=y
          Missing: BR2_PACKAGE_QT5BASE_LICENSE_APPROVED=y
          Missing: BR2_PACKAGE_QT5BASE_OPENGL_LIB=y
          Missing: BR2_PACKAGE_QT5BASE_LINUXFB=y
          Missing: BR2_PACKAGE_QT5BASE_FONTCONFIG=y
          Missing: BR2_PACKAGE_QT5BASE_GIF=y
          Missing: BR2_PACKAGE_QT5BASE_JPEG=y
          Missing: BR2_PACKAGE_QT5CINEX=y
          Missing: BR2_PACKAGE_QT5CINEX_HD=y
    WARN: defconfig configs/minnowboard_max-graphical_defconfig can't be used:
          Missing: BR2_PACKAGE_GLMARK2=y
          Missing: BR2_PACKAGE_MESA3D_DEMOS=y
    WARN: defconfig configs/nanopi_r1_defconfig can't be used:
          Missing: BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nanopi_r1"
    WARN: defconfig configs/olimex_a20_olinuxino_lime2_defconfig can't be used:
          Missing: BR2_PACKAGE_SUNXI_MALI_MAINLINE=y
          Missing: BR2_PACKAGE_SUNXI_MALI_MAINLINE_DRIVER=y
    WARN: defconfig configs/olimex_a20_olinuxino_lime_defconfig can't be used:
          Missing: BR2_PACKAGE_SUNXI_MALI_MAINLINE=y
          Missing: BR2_PACKAGE_SUNXI_MALI_MAINLINE_DRIVER=y
    WARN: defconfig configs/olimex_imx233_olinuxino_defconfig can't be used:
          Missing: BR2_TARGET_ROOTFS_EXT4=y
    WARN: defconfig configs/qemu_ppc_virtex_ml507_defconfig can't be used:
          Missing: BR2_SOFT_FLOAT=y
    WARN: defconfig configs/qemu_riscv32_virt_defconfig can't be used:
          Missing: BR2_TARGET_OPENSBI_USE_PLAT=y
    WARN: defconfig configs/qemu_riscv64_virt_defconfig can't be used:
          Missing: BR2_TARGET_OPENSBI_USE_PLAT=y
    WARN: defconfig configs/raspberrypi3_qt5we_defconfig can't be used:
          Missing: BR2_PACKAGE_QT5=y
          Missing: BR2_PACKAGE_QT5BASE_EXAMPLES=y
          Missing: BR2_PACKAGE_QT5BASE_GIF=y
          Missing: BR2_PACKAGE_QT5BASE_JPEG=y
          Missing: BR2_PACKAGE_QT5BASE_PNG=y
          Missing: BR2_PACKAGE_QT5WEBENGINE=y
          Missing: BR2_PACKAGE_QT5WEBENGINE_PROPRIETARY_CODECS=y


> +    return True
> +
> +
> +if __name__ == "__main__":
> +    main()
> -- 
> 2.25.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
