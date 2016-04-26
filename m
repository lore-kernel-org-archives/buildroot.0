From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 26 Apr 2016 22:18:37 +0200
Subject: [Buildroot] [PATCH 2/2] ARM Trusted Firmware (ATF) added to
 boot/
In-Reply-To: <8acf7d43ca7e5392a31b8739074c5bc6beb27c71.1461688139.git.jpinto@synopsys.com>
References: <eeb5c500573a8584bfbfe6d33bf160c725683a18.1461688139.git.jpinto@synopsys.com>
 <8acf7d43ca7e5392a31b8739074c5bc6beb27c71.1461688139.git.jpinto@synopsys.com>
Message-ID: <20160426221837.41842bef@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This patch should be the first patch in the series, and its title
should be:

	atfirmware: new package

> diff --git a/boot/Config.in b/boot/Config.in
> index 54760b9..e162fcc 100644
> --- a/boot/Config.in
> +++ b/boot/Config.in
> @@ -13,5 +13,6 @@ source "boot/mxs-bootlets/Config.in"
>  source "boot/syslinux/Config.in"
>  source "boot/uboot/Config.in"
>  source "boot/xloader/Config.in"
> +source "boot/atfirmware/Config.in"

Alphabetic ordering please.

> diff --git a/boot/atfirmware/Config.in b/boot/atfirmware/Config.in
> new file mode 100644
> index 0000000..67a0831
> --- /dev/null
> +++ b/boot/atfirmware/Config.in
> @@ -0,0 +1,81 @@
> +config BR2_ATFIRMWARE

Should be named BR2_TARGET_ATFIRMWARE to be consistent with other
bootloaders. Of course then all options below should be prefixed with
BR2_TARGET_ATFIRMWARE_.

> +	

Remove this empty line.

> +	bool "ARM Trusted Firmware (ATF)"

Make this option:

	depends on BR2_aarch64

(unless ATF is useful/used also on other architectures)

> +	help
> +	  Enable this option if you want to build the ATF for your ARM based
> +	  embedded device.
> +
> +if BR2_ATFIRMWARE
> +
> +choice
> +	prompt "ATF version"

Like U-Boot/Barebox, please have a default that consists in using the
latest official version released, i.e right now v1.2.

> +config BR2_ATFIRMWARE_CUSTOM_TARBALL
> +	bool "Custom tarball"
> +	help
> +	  This option allows to specify a URL pointing to a ATF source
> +	  tarball. This URL can use any protocol recognized by Buildroot,
> +	  like http://, ftp://, file:// or scp://.
> +
> +	  When pointing to a local tarball using file://, you may want to
> +	  use a make variable like $(TOPDIR) to reference the root of the
> +	  Buildroot tree.
> +
> +config BR2_ATFIRMWARE_CUSTOM_GIT
> +	bool "Custom Git repository"
> +	help
> +	  This option allows Buildroot to get the ATF source code from a 
> +	  Git repository.
> +
> +config BR2_ATFIRMWARE_CUSTOM_LOCAL
> +	bool "Local directory"
> +	help
> +	  This option allows Buildroot to get the ATF kernel source code from
> +	  a local directory.
> +
> +endchoice
> +
> +config BR2_ATFIRMWARE_CUSTOM_TARBALL_LOCATION
> +	string "URL of custom kernel tarball"

kernel, really? :-)

> +	depends on BR2_ATFIRMWARE_CUSTOM_TARBALL
> +
> +if BR2_ATFIRMWARE_CUSTOM_GIT
> +
> +config BR2_ATFIRMWARE_CUSTOM_REPO_URL
> +	string "URL of custom repository"
> +	depends on BR2_ATFIRMWARE_CUSTOM_GIT
> +
> +config BR2_ATFIRMWARE_CUSTOM_REPO_VERSION
> +	string "Custom repository version"
> +	depends on BR2_ATFIRMWARE_CUSTOM_GIT
> +	help
> +	  Revision to use in the typical format used by Git
> +	  E.G. a sha id, a tag, branch, ..

I know "branch" is mentioned in linux/Config.in, but that's a bad idea.
Just say that it can be a SHA1 commit id or a tag.

> +config BR2_ATFIRMWARE_CUSTOM_LOCAL_PATH
> +	string "Path to the local directory"
> +	depends on BR2_ATFIRMWARE_CUSTOM_LOCAL
> +	help
> +	  Path to the local directory with the ATF source code.
> +
> +config BR2_ATFIRMWARE_PLATFORM
> +	string "ATF Target Platform"
> +	help
> +	  E.G. If using a Juno board, you should specify 'juno' as 
> +	  your platform.

Please put something more generic like:

	  Name of ATF platform to build for.

> +config BR2_BOOT_ATFIRMWARE_PAYLOAD_PATH

this should be named BR2_TARGET_ATFIRMWARE ...

> +	string "Path to the BL33 binary"
> +	help
> +	  If you wish to build into the ATF a bootloader like U-Boot, you
> +	  should indicate the path to its binary here.
> +
> +config BR2_BOOT_ATFIRMWARE_ADDITIONAL_VARIABLES
> +	string "Additional ATF build variables"
> +	help
> +	  Additional parameters for the ATF build
> +	  E.G. 'SCP_BL2=<path_to_bl2> DEBUG=1 LOG_LEVEL=20'
> +
> +endif # BR2_ATFIRMWARE
> diff --git a/boot/atfirmware/atfirmware.mk b/boot/atfirmware/atfirmware.mk
> new file mode 100644
> index 0000000..ce1e01e
> --- /dev/null
> +++ b/boot/atfirmware/atfirmware.mk
> @@ -0,0 +1,39 @@
> +################################################################################
> +#
> +# ARM Trusted Firmware
> +#
> +################################################################################
> +
> +# Compute ATF_SOURCE and ATF_SITE from the configuration

Please support the latest official version here (as requested above).

> +ifeq ($(BR2_ATFIRMWARE_CUSTOM_TARBALL),y)
> +ATFIRMWARE_TARBALL = $(call qstrip,$(BR2_ATFIRMWARE_CUSTOM_TARBALL_LOCATION))
> +ATFIRMWARE_SITE = $(patsubst %/,%,$(dir $(ATFIRMWARE_TARBALL)))
> +ATFIRMWARE_SOURCE = $(notdir $(ATFIRMWARE_TARBALL))
> +BR_NO_CHECK_HASH_FOR += $(ATFIRMWARE_SOURCE)
> +else ifeq ($(BR2_ATFIRMWARE_CUSTOM_LOCAL),y)
> +ATFIRMWARE_SITE = $(call qstrip,$(BR2_ATFIRMWARE_CUSTOM_LOCAL_PATH))
> +ATFIRMWARE_SITE_METHOD = local
> +else ifeq ($(BR2_ATFIRMWARE_CUSTOM_GIT),y)
> +ATFIRMWARE_SITE = $(call qstrip,$(BR2_ATFIRMWARE_CUSTOM_REPO_URL))
> +ATFIRMWARE_SITE_METHOD = git
> +endif
> +
> +ATFIRMWARE_INSTALL_IMAGES = YES
> +
> +define ATFIRMWARE_BUILD_CMDS
> +	$(MAKE) CROSS_COMPILE=$(TARGET_CROSS) \
> +	BL33=$(call qstrip,$(BR2_BOOT_ATFIRMWARE_PAYLOAD_PATH) \

Is it OK if the BL33 variable is empty?

> +	$(BR2_BOOT_ATFIRMWARE_ADDITIONAL_VARIABLES) \
> +	all fip

Please indent the continuations lines. So:

	$(MAKE) CROSS_COMPILE=$(TARGET_CROSS) \
		BL33=... \
		$(BR2_....) \
		all fip

> +endef
> +
> +define ATFIRMWARE_INSTALL_IMAGES_CMDS
> +	if test -h $(@D)/build/$(BR2_ATFIRMWARE_PLATFORM)/bl1.bin ; then \
> +		cp -L $(@D)/build/$(BR2_ATFIRMWARE_PLATFORM)/bl1.bin $(BINARIES_DIR)/ ; \
> +	fi
> +	if test -h $(@D)/build/$(BR2_ATFIRMWARE_PLATFORM)/fip.bin ; then \
> +		cp -L $(@D)/build/$(BR2_ATFIRMWARE_PLATFORM)/fip.bin $(BINARIES_DIR)/ ; \
> +	fi

On my platform, the final image is named "flash-image.bin". Is this a
non-standard vendor-specific choice? (I've only worked with one vendor
specific fork of ATF). This file is different (and bigger than
fip.bin). So maybe we should simply make it configurable which image
files should be copied to BINARIES_DIR ?

In addition, in my case, the file is in build/<platform>/debug/, but
I guess it's because I did a debug build.

Could you rework the above comments and send an updated version?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
