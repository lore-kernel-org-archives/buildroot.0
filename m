From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 26 Aug 2016 08:13:54 +0200
Subject: [Buildroot] [PATCH v1 3/9] board/intel/common: Add possibility
 for adding ACPI tables to the initrd
In-Reply-To: <1472133887-34746-4-git-send-email-andriy.shevchenko@linux.intel.com>
References: <1472133887-34746-1-git-send-email-andriy.shevchenko@linux.intel.com>
 <1472133887-34746-4-git-send-email-andriy.shevchenko@linux.intel.com>
Message-ID: <7d61148d-f102-bc79-e177-3ec8f6f95b8e@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 25-08-16 16:04, Andy Shevchenko wrote:
> Add script which takes ASL files as input, compiles them to AML bytecode,
> and prepends the whole thing to the initrd archive. They are placed in
> kernel/firmware/acpi directory where the kernel is able to find and use
> them.

 Why is this a post-image script, and not just a post-build script that copies
everything in the right place and lets the cpio rootfs take care of generating
the cpio? AFAIK there is no particular requirement for this stuff to be at the
beginning of the cpio image, is there?

 Note: I don't agree with Thomas that there should be buildroot config for doing
this. It's simple enough to do in a post-build script, which is more flexible.

[snip]
> +# Pick iASL.
> +# First try from buildroot and if not there then try from the host.
> +[ -x "$HOST_DIR/usr/bin/iasl" ] && iasl="$HOST_DIR/usr/bin/iasl" || iasl=$(which iasl)

 You can skip the HOST_DIR part, because HOST_DIR/usr/bin is at the beginning of
PATH so that one will be picked up.

> +
> +[ -x "$iasl" ] || {
> +	echo "You need to to have iASL compiler available. You can either enable"
> +	echo "BR2_PACKAGE_HOST_ACPICA or install it locally for your host."
> +	echo "Typically the package is called acpica-tools in major distros".
> +	exit 1
> +}
> +
> +# The name of the folder is the name of a board
> +board_name="${BOARD_DIR##*/}"
> +[ "$board_name" = "common" ] && {
> +	echo "Adding ACPI tables is always specific to a board!"
> +	echo "You are not supposed to use common as board here!"
> +	exit 1
> +}
> +
> +# Always prefix with the board name to avoid mistakes if the initrd is used
> +# with another board.
> +updated_initrd_name="${board_name}-acpi-rootfs.cpio"
> +updated_initrd="$BINARIES_DIR/$updated_initrd_name"
> +initrd="$(readlink -enq "$BINARIES_DIR/initrd")"
> +tmpamldir="$BINARIES_DIR/acpi-tables"

 Better use BUILD_DIR for temporary stuff. Also, since you seem to want to
support several boards in a single output tree, append board_name to the
directory name.


 Regards,
 Arnout

> +
> +# Make sure existing tables get cleared
> +rm -fr $tmpamldir
> +mkdir -p $tmpamldir/kernel/firmware/acpi
> +
> +for table in $ACPI_TABLES; do
> +	[ -f "$ACPI_DIR/$table" ] || continue
> +
> +	$iasl -p $tmpamldir/kernel/firmware/acpi/$table "$ACPI_DIR/$table" > /dev/null 2>&1
> +
> +	echo "ACPI: Compiled ASL from $(realpath --relative-to=$PWD $ACPI_DIR/$table)"
> +done
> +
> +# Exit if no tables were compiled
> +[ -n "$(find $tmpamldir -type f)" ] || {
> +	echo "ACPI: No tables were compiled"
> +	exit 0
> +}
> +
> +# Attach compiled tables to initrd
> +(
> +	cd $tmpamldir
> +	find kernel | cpio -H newc -o > $updated_initrd 2>/dev/null
> +	cat $initrd >> $updated_initrd
> +	ln -sf "$updated_initrd_name" "$BINARIES_DIR/initrd"
> +)
> +
> +echo "ACPI: Created initrd with updated ACPI tables in $(realpath --relative-to=$PWD $updated_initrd)"
> diff --git a/configs/intel_defconfig b/configs/intel_defconfig
> index 8aff9e1..24167fc 100644
> --- a/configs/intel_defconfig
> +++ b/configs/intel_defconfig
> @@ -17,6 +17,9 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/intel/common/post-build.sh"
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/intel/common/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS=""
>  
> +# Host tools
> +BR2_PACKAGE_HOST_ACPICA=y
> +
>  # Busybox utilities (target)
>  BR2_PACKAGE_BUSYBOX_WATCHDOG=y
>  
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
