From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 26 Aug 2016 18:42:04 +0200
Subject: [Buildroot] [PATCH v1 2/9] board/intel/common: Add common files
 for x86 boards
In-Reply-To: <1472133887-34746-3-git-send-email-andriy.shevchenko@linux.intel.com>
References: <1472133887-34746-1-git-send-email-andriy.shevchenko@linux.intel.com>
 <1472133887-34746-3-git-send-email-andriy.shevchenko@linux.intel.com>
Message-ID: <36e805f2-78c3-859f-d51f-dfb4e9ff01e1@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Andy,

 I generally agree with Thomas's comments, and have a few more.

On 25-08-16 16:04, Andy Shevchenko wrote:
[snip]
> +3) Build Buildroot.
> +
> +Build the necessary Buildroot packages and resulting image::
> +
> +	% make KERNEL_SRC=~/linux
> +
> +where ``~/linux`` is whatever the path to the kernel output folder is.
> +
> +4) Get the resulting image.
> +
> +The resulting image is placed under output/images and is called either
> +``rootfs.cpio.bz2`` or ``initrd``. ``initrd`` is the link to the last modified
> +image since some scripts may alter it on post image stage.

 Why are you not building a kernel or bootloader in this defconfig?

 Why is it called 'initrd'? All bootloaders allow to pass an initrd with a
different name. And it's this initrd name that caused confusion in our
understanding of the two cpio archives: if it would have said 'cat
rootfs.cpio.bz2 >> $initrd' it would have been a lot more obvious.

> +
> +Supported environment variables

 Don't pass things through environment variables, pass them on the command line.
The same arguments are passed to all scripts, so you have to parse them with
some advanced getopt, but that's easy. E.g. the following converts args to vars:

for arg; do
   [[ $arg == *=* ]] && eval "$arg"
done


> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +The scripts under ``board/intel/common`` accept several environment variables
> +that can be used to alter the default behaviour. Typically you do something
> +like::
> +
> +	% make KERNEL_SRC=~/linux
> +
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

 As mentioned by Thomas: scripts that are part of buildroot should only support
a buildroot-built kernel.

 And the defconfigs should build that kernel.

> +
> +Alterate console
> +~~~~~~~~~~~~~~~~
> +
> +By default ``ttyS0`` is used as a default cosole for both kernel and userspace.
> +The **BR2_TARGET_GENERIC_GETTY_PORT** variable could be used to alterate this
> +setting.
> +
> +Supported boards
> +~~~~~~~~~~~~~~~~
> +
> +.. [intel_defconfig] Generic config for most of Intel SoCs.
> +
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

 As mentioned by Thomas, each of these should have their own defconfig. To show
the commonality, you could make them start with intel_*.

> +
> +.. [#] Minnowboard MAX goes the standard way with ``ttyS0``.
> diff --git a/board/intel/common/cmdline b/board/intel/common/cmdline
> new file mode 100644
> index 0000000..54465ef
> --- /dev/null
> +++ b/board/intel/common/cmdline
> @@ -0,0 +1 @@
> +console=tty1 console=ttyS0,115200n8
> diff --git a/board/intel/common/libshell-intel b/board/intel/common/libshell-intel
> new file mode 100644
> index 0000000..f834ecb
> --- /dev/null
> +++ b/board/intel/common/libshell-intel
> @@ -0,0 +1,26 @@
> +#
> +# Copyright (c) 2016 Intel Corp.
> +#
> +
> +#
> +# Environment:
> +#
> +# BOARD_INTEL_DIR		- Directory holding board specific
> +#				  configuration
> +#
> +
> +# Use this folder to provide board specific files
> +BOARD_DIR_DEFAULT="$(dirname $(dirname "$0"))"
> +BOARD_DIR="$(readlink -mnq "${BOARD_INTEL_DIR:-$BOARD_DIR_DEFAULT}")"
> +
> +[ -d "$BOARD_DIR" ] || echo "Warning: $BOARD_INTEL_DIR does not exist"
> +
> +# Looking up for a custom file if provided, otherwise fallback to the original name
> +intel_file_lookup() {
> +	[ -f "$BOARD_DIR/$1" ] && echo "$BOARD_DIR/$1" || echo "$BOARD_DIR_DEFAULT/$1"
> +}
> +
> +# Looking up for a custom folder if provided, otherwise fallback to the original name
> +intel_folder_lookup() {
> +	[ -d "$BOARD_DIR/$1" ] && echo "$BOARD_DIR/$1" || echo "$BOARD_DIR_DEFAULT/$1"
> +}

 I don't see why we would need this fallback approach. The defconfigs and
related board stuff are not meant to be used for real development. Instead, they
should be copied and adapted for real development.


 Regards,
 Arnout

[snip]
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
