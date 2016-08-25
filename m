From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 25 Aug 2016 23:37:05 +0200
Subject: [Buildroot] [PATCH v1 2/9] board/intel/common: Add common files
 for x86 boards
In-Reply-To: <1472133887-34746-3-git-send-email-andriy.shevchenko@linux.intel.com>
References: <1472133887-34746-1-git-send-email-andriy.shevchenko@linux.intel.com>
 <1472133887-34746-3-git-send-email-andriy.shevchenko@linux.intel.com>
Message-ID: <20160825233705.5a061f79@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 25 Aug 2016 17:04:40 +0300, Andy Shevchenko wrote:
> There are several x86 boards that can utilize same image creation
> infrastructure.
> 
> Add common configuration, cmdline, post-image.sh, post-build.sh scripts and
> placeholders for their extensions.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Thanks for working on this, it's great to see contributions from Intel
for those platforms. However, I'm afraid, quite a few things in there
really aren't done in the Buildroot spirit/philosophy. See some
comments below.


> diff --git a/board/intel/common/README.rst b/board/intel/common/README.rst
> new file mode 100644
> index 0000000..e427067
> --- /dev/null
> +++ b/board/intel/common/README.rst

We don't use the .rst format anywhere else in the tree, so please stick
to a regular readme.txt, like we have for all other platforms.

> +Building an image
> +~~~~~~~~~~~~~~~~~
> +
> +For building a normal bootable image, you need to do following steps:
> +
> +1) Build your own kernel.
> +
> +2) Configure Buildroot.
> +
> +The Buildroot configuration would be done by running::
> +
> +	% make <BOARD>_defconfig
> +
> +For most of the boards it's good enough to use generic [intel_defconfig]_.
> +
> +3) Build Buildroot.
> +
> +Build the necessary Buildroot packages and resulting image::
> +
> +	% make KERNEL_SRC=~/linux

What is this magic KERNEL_SRC variable? In appearance at least, it
completely circumvents the Buildroot config options for specifying where
the kernel sources are located. So this is clearly a no-go.

> +Supported environment variables
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +The scripts under ``board/intel/common`` accept several environment variables
> +that can be used to alter the default behaviour. Typically you do something
> +like::
> +
> +	% make KERNEL_SRC=~/linux

Should not exist.

> +in order to take advantage of these.
> +
> +BOARD_INTEL_CUSTOM_CMDLINE
> +	provides a custom appendix to the command line.
> +
> +BOARD_INTEL_DIR
> +	points to a specific board directory.
> +
> +KERNEL_SRC
> +	path to your kernel output folder.

I'm not sure any of these should exist. KERNEL_SRC is already something
provided by Buildroot.

The board directory can be known by other ways (see how the various
raspberrypi variants are handled, for example).

> +Alterate console

Alterate, or alternate ?

> +~~~~~~~~~~~~~~~~
> +
> +By default ``ttyS0`` is used as a default cosole for both kernel and userspace.

cosole -> console

> +The **BR2_TARGET_GENERIC_GETTY_PORT** variable could be used to alterate this
> +setting.

Why not, but this is general Buildroot usage, not related to Intel
boards specifically.

> +Supported boards
> +~~~~~~~~~~~~~~~~
> +
> +.. [intel_defconfig] Generic config for most of Intel SoCs.

This part is pretty uninformative :)

> +Examples
> +~~~~~~~~
> +
> +- ASuS T100TA and the rest with ``ttyUSB0``::
> +
> +	% make KERNEL_SRC=~/linux BR2_TARGET_GENERIC_GETTY_PORT=ttyUSB0		\
> +				  BOARD_INTEL_CUSTOM_CMDLINE="reboot=h,p"
> +
> +- Galileo (Quark)::
> +
> +	% make KERNEL_SRC=~/linux BR2_TARGET_GENERIC_GETTY_PORT=ttyS1
> +
> +- Joule (Broxton), Edison (Merrifield)::
> +
> +	% make KERNEL_SRC=~/linux BR2_TARGET_GENERIC_GETTY_PORT=ttyS2
> +
> +- Minnowboard [#]_::
> +
> +	% make KERNEL_SRC=~/linux BR2_TARGET_GENERIC_GETTY_PORT=ttyPCH0
> +
> +.. [#] Minnowboard MAX goes the standard way with ``ttyS0``.

Please instead provide different defconfigs for those platforms:

	galileo_defconfig
	minnowboard_defconfig
	joule_defconfig

etc.


> diff --git a/board/intel/common/post-build.d/README b/board/intel/common/post-build.d/README
> new file mode 100644
> index 0000000..5bcb10b
> --- /dev/null
> +++ b/board/intel/common/post-build.d/README
> @@ -0,0 +1,4 @@
> +#
> +# This folder contains the shell scripts which will be executed in alphabetical
> +# order on post build stage.
> +#

I don't think we want an Intel specific mechanism for directories
containing post-build scripts. I'd prefer to extend the current
BR2_ROOTFS_POST_BUILD_SCRIPT logic (which allows to pass multiple
space-separated post-build script) to automatically run all scripts in
a directory if one entry in BR2_ROOTFS_POST_BUILD_SCRIPT is a directory.

Or maybe, with the small number of post-build scripts and post-image
scripts that you have, just call them from the relevant board defconfig.

> +# Read cmdline and modify console parameter
> +sed -e "s#$console_default#$console#" "$cmdline" > "$BINARIES_DIR/cmdline"

What is this cmdline file doing in the end?

> diff --git a/board/intel/common/post-image.d/40-prepare-initrd b/board/intel/common/post-image.d/40-prepare-initrd
> new file mode 100755
> index 0000000..7bf7769
> --- /dev/null
> +++ b/board/intel/common/post-image.d/40-prepare-initrd
> @@ -0,0 +1,14 @@
> +#!/bin/sh -e
> +
> +#
> +# Copyright (c) 2016 Intel Corp.
> +#
> +
> +#
> +# Environment:
> +#
> +# None
> +#

That's really a whole lot of nothing for just a single line of useful
code :-)

> diff --git a/configs/intel_defconfig b/configs/intel_defconfig
> new file mode 100644
> index 0000000..8aff9e1
> --- /dev/null
> +++ b/configs/intel_defconfig

We don't have the concept of such generic defconfigs. We have defconfig
per identified platform, and I'm not really sure to understand the
logic behind this generic defconfig that then needs to be passed
through custom environment variables to be customized depending on the
platform.

It's clearly not the direction I would like to take for the defconfigs.

> +# Packages
> +BR2_PACKAGE_KEXEC=y
> +BR2_PACKAGE_KEXEC_ZLIB=y
> +BR2_PACKAGE_LRZSZ=y
> +BR2_PACKAGE_SCREEN=y

We normally don't enable specific packages in our defconfig, since they
are meant to be minimal, i.e just the toolchain, kernel, bootloader,
and Busybox userspace.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
