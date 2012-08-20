From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Date: Mon, 20 Aug 2012 14:07:19 +0200
Subject: [Buildroot] [PATCH v3] at91bootstrap3: new package
In-Reply-To: <1345192583-5115-1-git-send-email-spdawson@gmail.com>
References: <1345192583-5115-1-git-send-email-spdawson@gmail.com>
Message-ID: <20120820120718.GA6060@game.jcrosoft.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09:36 Fri 17 Aug     , spdawson at gmail.com wrote:
> From: Simon Dawson <spdawson@gmail.com>
> 
> Note that this new package, at91bootstrap3, is being added alongside the
> existing at91bootstrap. This was suggested by Thomas Petazzoni, whose
> comments on the mailing list are quoted below.
> 
>   For this package, I am not sure we can do a simple version bump. Since
>   there is (was?) no upstream for AT91Bootstrap 1.x, many
>   vendors/companies had to maintain their patches on top of AT91Bootstrap
>   1.x. See for example
>   board/calao/usb-a9263/at91bootstrap-1.16-usb-a9263.patch. Therefore,
>   removing AT91Bootstrap 1.x from the tree will prevent those platforms
>   to work. I know people should upgrade, but AT91Bootstrap 3.x is quite
>   significantly different, so the porting effort is not that simple.
> 
>   Therefore, I'm wondering whether we should kee at91bootstrap as it is,
>   and create a separate package at91bootstrap3 for the 3.x generation.
> 
> Signed-off-by: Simon Dawson <spdawson@gmail.com>
> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  v3: Resend.
>  v2: Improved patch in response to feedback from Arnout Vandecappelle.
> 
>  boot/Config.in                                     |    1 +
>  boot/at91bootstrap3/Config.in                      |   53 ++
>  .../at91bootstrap3-u-boot-relocation-fix.patch     |  747 ++++++++++++++++++++
>  boot/at91bootstrap3/at91bootstrap3.mk              |   67 ++
>  4 files changed, 868 insertions(+)
>  create mode 100644 boot/at91bootstrap3/Config.in
>  create mode 100644 boot/at91bootstrap3/at91bootstrap3-u-boot-relocation-fix.patch
>  create mode 100644 boot/at91bootstrap3/at91bootstrap3.mk
> 
> diff --git a/boot/Config.in b/boot/Config.in
> index 5252a49..a55139b 100644
> --- a/boot/Config.in
> +++ b/boot/Config.in
> @@ -1,6 +1,7 @@
>  menu "Bootloaders"
>  
>  source "boot/at91bootstrap/Config.in"
> +source "boot/at91bootstrap3/Config.in"
>  source "boot/at91dataflashboot/Config.in"
>  source "boot/barebox/Config.in"
>  source "boot/grub/Config.in"
> diff --git a/boot/at91bootstrap3/Config.in b/boot/at91bootstrap3/Config.in
> new file mode 100644
> index 0000000..110f808
> --- /dev/null
> +++ b/boot/at91bootstrap3/Config.in
> @@ -0,0 +1,53 @@
> +config BR2_TARGET_AT91BOOTSTRAP3
> +	depends on BR2_arm926t
> +	bool "AT91 Bootstrap 3"
> +	help
> +	  AT91Bootstrap is a first level bootloader for the Atmel AT91
> +	  devices. It integrates algorithms for:
> +	  - Device initialization such as clock configuration, PIO settings...
> +	  - Peripheral drivers such as PIO, PMC or SDRAMC...
> +	  - Physical media algorithm such as DataFlash, NandFlash, NOR Flash...
> +
> +if BR2_TARGET_AT91BOOTSTRAP3
> +
> +config BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_PATCH_DIR
> +	string "custom patch dir"
> +	help
> +	  If your board requires custom patches, add the path to the
> +	  directory containing the patches here. The patches must be
> +	  named at91bootstrap3-<something>.patch.
> +
> +	  Most users may leave this empty
> +
> +#
> +# Configuration selection
> +#
> +
> +choice
> +	prompt "AT91 Bootstrap 3 configuration"
> +	default BR2_TARGET_AT91BOOTSTRAP3_USE_DEFCONFIG
> +
> +config BR2_TARGET_AT91BOOTSTRAP3_USE_DEFCONFIG
> +	bool "Using a defconfig"
> +
> +config BR2_TARGET_AT91BOOTSTRAP3_USE_CUSTOM_CONFIG
> +	bool "Using a custom config file"
> +
> +endchoice
> +
> +config BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG
> +	string "Defconfig name"
> +	depends on BR2_TARGET_AT91BOOTSTRAP3_USE_DEFCONFIG
> +	help
> +	  Name of the at91bootstrap3 defconfig file to use, without the
> +	  trailing _defconfig.  The defconfig is located at
> +	  board/<processor>/<board>_defconfig in the at91bootstrap3
> +	  tree.
> +
> +config BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_CONFIG_FILE
> +	string "Configuration file path"
> +	depends on BR2_TARGET_AT91BOOTSTRAP3_USE_CUSTOM_CONFIG
> +	help
> +	  Path to the at91bootstrap3 configuration file
> +
> +endif # BR2_TARGET_AT91BOOTSTRAP3
> diff --git a/boot/at91bootstrap3/at91bootstrap3-u-boot-relocation-fix.patch b/boot/at91bootstrap3/at91bootstrap3-u-boot-relocation-fix.patch
> new file mode 100644
> index 0000000..62bbd2a
> --- /dev/null
> +++ b/boot/at91bootstrap3/at91bootstrap3-u-boot-relocation-fix.patch
> @@ -0,0 +1,747 @@
> +Every AT91SAM plaforms were broken between 2010.12 and 2011.03 because
> +of the relocation changes.
> +
> +We have to get JUMP_ADDR consistent with what is used by u-boot
> +(CONFIG_SYS_TEXT_BASE).
> +
> +I also chose to "repartition" the dataflash. u-boot is now living at
> +0x4000, letting 16kB for the bootstrap. We also have to increase the
> +IMG_SIZE as u-boot as grown larger than the default value.
> +As requested on the u-boot ML, we assume that it could be up to 512kB
> +big.
> +
> +It means that now, you have to flash your kernel at 0x0008C000 instead
> +of 0x00042000. And so you also have to load it from that address from
> +u-boot.
> +
> +Then, remember that you could decrease IMG_SIZE to boot faster.
> +
> +Signed-off-by: Alexandre Belloni <alexandre.belloni@piout.net>
> +Signed-off-by: Simon Dawson <spdawson@gmail.com>
> +
> +diff -Nurp a/board/afeb9260/afeb9260_defconfig b/board/afeb9260/afeb9260_defconfig
> +--- a/board/afeb9260/afeb9260_defconfig	2011-11-18 08:13:09.000000000 +0000
> ++++ b/board/afeb9260/afeb9260_defconfig	2012-07-25 20:52:17.967694276 +0100
> +@@ -97,9 +97,9 @@ CONFIG_LOAD_UBOOT=y
> + # CONFIG_LOAD_64KB is not set
> + # CONFIG_LOAD_1MB is not set
> + # CONFIG_LOAD_4MB is not set
> +-CONFIG_IMG_ADDRESS="0x00008400"
> +-CONFIG_IMG_SIZE="0x00040000"
> +-CONFIG_JUMP_ADDR="0x23F00000"
> ++CONFIG_IMG_ADDRESS="0x00004000"
> ++CONFIG_IMG_SIZE="0x00080000"
> ++CONFIG_JUMP_ADDR="0x21F00000"
> + CONFIG_APP_CHECK=y
> + # CONFIG_LONG_TEST is not set
> + # CONFIG_DEBUG is not set
> +diff -Nurp a/board/at91cap9adk/at91cap9adk_defconfig b/board/at91cap9adk/at91cap9adk_defconfig
> +--- a/board/at91cap9adk/at91cap9adk_defconfig	2011-11-18 08:13:09.000000000 +0000
> ++++ b/board/at91cap9adk/at91cap9adk_defconfig	2012-07-25 20:52:30.603693814 +0100
> +@@ -96,8 +96,8 @@ CONFIG_LOAD_UBOOT=y
> + # CONFIG_LOAD_64KB is not set
> + # CONFIG_LOAD_1MB is not set
> + # CONFIG_LOAD_4MB is not set
> +-CONFIG_IMG_ADDRESS="0x00008400"
> +-CONFIG_IMG_SIZE="0x00040000"
> ++CONFIG_IMG_ADDRESS="0x00004000"
> ++CONFIG_IMG_SIZE="0x00080000"
Nack on this barebox does need this and boot slower You must put this as an
option

Best Regards,
J.
