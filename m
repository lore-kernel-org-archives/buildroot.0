From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 25 Nov 2013 10:31:51 +0100
Subject: [Buildroot] [PATCH 4/5] fs/custom: generate complete,
 partition-based device images
In-Reply-To: <ddf2a31498f7f8e1ec0d40d73849bc254ec00b6d.1385157864.git.yann.morin.1998@free.fr>
References: <cover.1385157864.git.yann.morin.1998@free.fr>
 <ddf2a31498f7f8e1ec0d40d73849bc254ec00b6d.1385157864.git.yann.morin.1998@free.fr>
Message-ID: <52931907.2040207@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  Hi Yann,

  This patch is obviously too large to be reviewed in a single shot, so 
here are some detailed comments on certain parts of it.

  I don't think there's a way to split the patch up to make review 
easier, unfortunately. But anyway, the functionality is completely 
isolated from the rest so it doesn't hurt to commit it as is and fix up 
later if necessary.


On 22/11/13 23:50, Yann E. MORIN wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
>
> Contrary to the existing fs/ schemes, which each generate only a single
> filesystem image for the root filesystem, this new scheme allows the
> user to generate more complex images.
>
> The basis behind this is a .ini-like description of the layout of the
> final target storage:
>    - the list of device(s)
>    - per-device, the list of partition(s)
>    - per-partition, the content
>
> For now, the only content possible for partitions is a filesystem. It
> should be pretty easy to add new types (eg. un-formated, or raw blob).
>
> Also, only two filesystems are supported: ext{2,3,4} and vfat. Adding
> more will be relatively easy, provided we have the necessary host
> packages to deal with those filesystems.
>
> The existing Buildroot filesystem generators are re-used as much as
> possible when it makes sense; when it does not (eg. for vfat), a specific
> generator is used.
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

[snip, unreviewed]

> diff --git a/fs/Config.in b/fs/Config.in
> index da4c5ff..8721220 100644
> --- a/fs/Config.in
> +++ b/fs/Config.in
> @@ -11,5 +11,6 @@ source "fs/romfs/Config.in"
>   source "fs/squashfs/Config.in"
>   source "fs/tar/Config.in"
>   source "fs/ubifs/Config.in"
> +source "fs/custom/Config.in"

  Shouldn't this be kept alphabetical?

>
>   endmenu
> diff --git a/fs/custom/Config.in b/fs/custom/Config.in
> new file mode 100644
> index 0000000..fabb878
> --- /dev/null
> +++ b/fs/custom/Config.in
> @@ -0,0 +1,18 @@
> +config BR2_TARGET_ROOTFS_CUSTOM_PARTITION_TABLE
> +	string "partition table"

  In most cases, we don't rely on the non-emptiness of a string to 
determine if some option is enabled or not, but rather there's an 
explicit config option to enable it. I'm not convinced that that is a 
good principle, but it's how things are done now.

> +	help
> +	  Enter the path to a partition-table for your device.
> +
> +	  This will allow Buildroot to generate a more complex target
> +	  image, which may consist of more than one filesystem on more
> +	  than one partition.
> +
> +	  See docs/manual/bla-bla on how to construct such a partition

  I couldn't find the bla-bla section :-)

  We currently have one reference to the manual, and it's formatted like 
this:

http://buildroot.org/downloads/manual/manual.html#rootfs-custom

  I like that much better - though it's too long of course, but perhaps 
Peter can create a shortlink http://buildroot.org/man that expands to
http://buildroot.org/downloads/manual/manual.html ? [OT: such a shortlink 
for autobuilder results would also be convenient, because currently the 
references to autobuilder fixes exceed the 76-column width].


> +	  table.
> +
> +# For the fs infrasturcture, we need that option to be set.
> +# Additionally, it allows us to force the TAR output.
> +config BR2_TARGET_ROOTFS_CUSTOM
> +	def_bool y
> +	depends on BR2_TARGET_ROOTFS_CUSTOM_PARTITION_TABLE != ""

  In most other cases we use the following construct:

	bool
	default y if BR2_TARGET_ROOTFS_CUSTOM_PARTITION_TABLE != ""

> +	select BR2_TARGET_ROOTFS_TAR

[snip, unreviewed]

> diff --git a/fs/custom/custom.mk b/fs/custom/custom.mk
> new file mode 100644
> index 0000000..940a32a
> --- /dev/null
> +++ b/fs/custom/custom.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# custom partitioning
> +#
> +################################################################################
> +
> +define ROOTFS_CUSTOM_CMD
> + BUILD_DIR=$(BUILD_DIR) fs/custom/genimages \"$(BR2_TARGET_ROOTFS_CUSTOM_PARTITION_TABLE)\"

  Should be indented with a tab.

  Does that quoting work? It sill expand to

genimages \""path/to/partitiontable"\"

  so genimages' $1 will be "path/to/partititiontable" including the quotes.

  Anyway, the symbol should be qstrip'ped and any required quotes added 
explicitly. That makes it easier to run

make BR2_TARGET_ROOTFS_CUSTOM_PARTITION_TABLE=some/other/path


> +endef
> +
> +# We need the tarball to be generated first

  This comment is redundant

> +ROOTFS_CUSTOM_DEPENDENCIES += rootfs-tar
> +
> +$(eval $(call ROOTFS_TARGET,custom))

[snip, unreviewed]

> diff --git a/fs/custom/genimages b/fs/custom/genimages
> new file mode 100755
> index 0000000..aba3021
> --- /dev/null
> +++ b/fs/custom/genimages
> @@ -0,0 +1,214 @@
> +#!/bin/bash

  I have a general question for the maintainers here:

* Do we really want to rely on bash even more?

* Would it make sense to implement complex things like this in a proper 
programming language (read: python), which would solidify our dependency 
on python?

  With python's ConfigParser, this file would be reduced to +- 20 lines...


> +set -e
> +set -E
> +
> +#-----------------------------------------------------------------------------
> +main() {
> +    local part_table="${1}"
> +    local tmp_dir
> +    local rootfs_dir
> +    local -a devices
> +    local extract
> +    local cur_section
> +    local -a sections devices partitions
> +    local -A variables values partdevs
> +    local sec dev part var val
> +    local secs devs parts vars vals
> +
> +    if [ ! -f "${part_table}" ]; then
> +        error "%s: no such file\n" "${part_table}"
> +        exit 1
> +    fi
> +
> +    export PATH="${HOST_DIR}/usr/bin:${HOST_DIR}/usr/sbin:${PATH}"
> +
> +    tmp_dir="$( mktemp -d --tmpdir rpi-genimage.XXXXXX )"

  Small nit: I think it would make more sense to create the tmp_dir 
relative to the output directory.

  Larger nit: there should be a trap to clean up tmp_dir. Or 
alternatively, if it's relative to the output directory do the cleanup in 
the beginning.

  And finally, I'd create the tmp_dir only after parsing and validating 
the partition file.

> +
> +    rootfs_dir="${tmp_dir}/rootfs"
> +    mkdir -p "${rootfs_dir}"
> +
> +    # Parse all the sections in one go, we'll sort
> +    # all the mess afterwards...
> +    debug "parsing partitions descriptions file '%s'\n" \
> +          "${part_table}"
> +    while read line; do
> +        line="$( sed -r -e 's/[[:space:]]*#.*$//; //d;' <<<"${line}" )"

  I would try to avoid sed -r if you don't really need it - especially if 
you don't use extended regexp@all.

  To make this incredibly complex line a little more readable, I'd split 
it in two lines:

     line="$( sed -e 's/[[:space:]]*#.*$//' <<<"${line}" )"
     line="$( sed -e '//d;' <<<"${line}" )"

> +
> +        # Detect start of global section, skip anything else
> +        case "${line}" in
> +        "") continue;;
> +        '['*']')
> +            cur_section="$( sed -r -e 's/[][]//g;' <<<"${line}" )"
> +            debug "  entering section '%s'\n" "${cur_section}"
> +            sections+=( "${cur_section}" )
> +            continue
> +        ;;
> +        ?*=*)   ;;
> +        *)      error "malformed entry '%s'\n" "${line}";;
> +        esac
> +
> +        var="${line%%=*}"
> +        eval val="${line#*=}"
> +        debug "    adding '%s'='%s'\n" "${var}" "${val}"
> +        variables+=( ["${cur_section}"]=",${var}" )
> +        values+=( ["${cur_section}:${var}"]="${val}" )
> +    done <"${part_table}"

  I would add explicit checks that the global section exists and that it 
includes the required variables.

> +
> +    # Create lists of devices, partitions, and partition:device pairs.
> +    debug "creating intermeditate lists\n"
> +    devices=( ${values["global:devices"]//,/ } )
> +    for dev in "${devices[@]}"; do
> +        partitions=( ${values["${dev}:partitions"]//,/ } )

  I'd include a check that partitions exsits and has the right format.

> +    done
> +    for dev in "${devices[@]}"; do
> +        for part in ${values["${dev}:partitions"]//,/ }; do
> +            partdevs+=( ["${part}"]="${dev}" )

  Why do you loop twice here, instead of just doing this in the previous 
loop?

  I'm not very familiar with bash array syntax, but can't you use 
something like "for part in ${partitions[@]}" ?

> +        done
> +    done
> +
> +    # Now, we must order the partitions so that their mountpoint
> +    # is empty by the time we build the upper-level partition.
> +    # For example, given this layout of mountpoints:
> +    #   /
> +    #   /usr
> +    #   /usr/var
> +    # We must ensure /usr/var is empty at the time we create the /usr
> +    # filesystem image; and similarly, we must ensure /usr is empty by
> +    # the time we create the / filesystem image
> +    # So, a simple reverse alphabetical sort will do the trick
> +    debug "sorting partitions\n"
> +    sorted_parts=( $(
> +        for part in "${partitions[@]}"; do
> +            printf "%s:%s\n" "${part}" "${values["${part}:fs_root"]}"
> +        done                    \
> +        |sort -t: -k2 -r        \
> +        |sed -r -e 's/:[^:]+$//;'
> +    ) )
> +
> +    trace "extracting root (if needed)\n"
> +    case "${values["global:extract"]}" in
> +        targz)  c=z ;;&
> +        tarbz2) c=j ;;&
> +        tarxz)  c=J ;;&

  Since we use a fairly recent tar, tar will auto-detect compression 
based on the extension. By the way, since you only support tar anyway, I 
would remove this option completely. Whenever it is actually useful, it 
can be added again (with a default to tar for backwards compatibility).

> +        tar)    c=  ;;&
> +        tar*)   tar x${c}f "${BINARIES_DIR}/rootfs.tar" -C "${rootfs_dir}";;
> +        "")     ;;
> +        *)      error "unknown extract method '%s'\n" "${extract}";;
> +    esac

[Rest is unreviewed]

  Regards,
  Arnout



-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
