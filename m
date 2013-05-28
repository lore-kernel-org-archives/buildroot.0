From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 28 May 2013 23:29:33 +0200
Subject: [Buildroot] [PATCH 12/20] sunxi-boards: new package
In-Reply-To: <1369606110-8088-13-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Mon, 27 May 2013 00:08:22 +0200")
References: <1369606110-8088-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1369606110-8088-13-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87sj1694jm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> From: Carlo Caione <carlo.caione@gmail.com>
 Thomas> Signed-off-by: Carlo Caione <carlo.caione@gmail.com>
 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> ---
 Thomas>  package/Config.in                    |    1 +
 Thomas>  package/sunxi-boards/Config.in       |   19 +++++++++++++++++++
 Thomas>  package/sunxi-boards/sunxi-boards.mk |   17 +++++++++++++++++
 Thomas>  3 files changed, 37 insertions(+)
 Thomas>  create mode 100644 package/sunxi-boards/Config.in
 Thomas>  create mode 100644 package/sunxi-boards/sunxi-boards.mk

 Thomas> diff --git a/package/Config.in b/package/Config.in
 Thomas> index 1bd9309..50683ff 100644
 Thomas> --- a/package/Config.in
 Thomas> +++ b/package/Config.in
 Thomas> @@ -218,6 +218,7 @@ source "package/b43-firmware/Config.in"
 Thomas>  source "package/firmware-imx/Config.in"
 Thomas>  source "package/linux-firmware/Config.in"
 Thomas>  source "package/rpi-firmware/Config.in"
 Thomas> +source "package/sunxi-boards/Config.in"
 Thomas>  source "package/ux500-firmware/Config.in"
 Thomas>  source "package/zd1211-firmware/Config.in"
 Thomas>  endmenu
 Thomas> diff --git a/package/sunxi-boards/Config.in b/package/sunxi-boards/Config.in
 Thomas> new file mode 100644
 Thomas> index 0000000..27ee8fc
 Thomas> --- /dev/null
 Thomas> +++ b/package/sunxi-boards/Config.in
 Thomas> @@ -0,0 +1,19 @@
 Thomas> +config BR2_PACKAGE_SUNXI_BOARDS
 Thomas> +	bool "sunxi script.bin board file"
 Thomas> +	select BR2_PACKAGE_HOST_SUNXI_TOOLS

This should depend on BR2_arm like sunxi-tools.

 Thomas> +	help
 Thomas> +	  Sunxi-boards requires a compiled .fex files for hardware description,
 Thomas> +	  used by kernel during boot for hardware initialization. This package
 Thomas> +	  is specific for linux-sunxi kernel and it is useless for mainline
 Thomas> +	  kernel versions.
 Thomas> +
 Thomas> +	  https://github.com/linux-sunxi/sunxi-boards
 Thomas> +
 Thomas> +if BR2_PACKAGE_SUNXI_BOARDS
 Thomas> +config BR2_PACKAGE_SUNXI_BOARDS_BOARD_NAME
 Thomas> +	string "Board name"
 Thomas> +	help
 Thomas> +	  This field defines the name of the board for which the .bin
 Thomas> +	  files should be generated. See inside sys_config/a10 directory in
 Thomas> +	  sunxi-boards source code to see the list of valid board names.
 Thomas> +endif

It's imho silly to restrict this to the a10 variants, so I've changed
this to be a BR2_PACKAGE_SUNXI_FEX_FILE option, which is the exact
filename (including .fex extension) relative to the sys_config/
directory - E.G.:

BR2_PACKAGE_SUNXI_FEX_FILE="a10/mele_a1000.fex"


 Thomas> diff --git a/package/sunxi-boards/sunxi-boards.mk b/package/sunxi-boards/sunxi-boards.mk
 Thomas> new file mode 100644
 Thomas> index 0000000..1f52110
 Thomas> --- /dev/null
 Thomas> +++ b/package/sunxi-boards/sunxi-boards.mk
 Thomas> @@ -0,0 +1,17 @@
 Thomas> +#############################################################
 Thomas> +#
 Thomas> +# sunxi-boards
 Thomas> +#
 Thomas> +#############################################################
 Thomas> +
 Thomas> +SUNXI_BOARDS_VERSION = 88d663db44f65b73ef65c4148a28c6fa3665d2b6
 Thomas> +SUNXI_BOARDS_SITE = https://github.com/linux-sunxi/sunxi-boards/tarball/master
 Thomas> +SUNXI_BOARDS_DEPENDENCIES = host-sunxi-tools
 Thomas> +SUNXI_BOARDS_INSTALL_IMAGES = YES
 Thomas> +SUNXI_BOARDS_INSTALL_TARGET = NO
 Thomas> +
 Thomas> +define SUNXI_BOARDS_INSTALL_IMAGES_CMDS
 Thomas> +	$(FEX2BIN) $(@D)/sys_config/a10/$(BR2_PACKAGE_SUNXI_BOARDS_BOARD_NAME).fex $(BINARIES_DIR)/script.bin

Long line, so I've wrapped this. We also normally qstrip the text
strings so I've added that as well.

For the other text fields (like barebox/u-boot/linux defconfig name) we
do an early check to ensure the value isn't the empty string and error
out with a sensible error message, so I've added that as well.

Committed to next with these issues fixed, thanks.

-- 
Bye, Peter Korsgaard
