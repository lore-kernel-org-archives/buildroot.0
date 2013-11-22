From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 22 Nov 2013 23:50:57 +0100
Subject: [Buildroot] [PATCH 4/5] fs/custom: generate complete,
	partition-based device images
In-Reply-To: <cover.1385157864.git.yann.morin.1998@free.fr>
References: <cover.1385157864.git.yann.morin.1998@free.fr>
Message-ID: <ddf2a31498f7f8e1ec0d40d73849bc254ec00b6d.1385157864.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Contrary to the existing fs/ schemes, which each generate only a single
filesystem image for the root filesystem, this new scheme allows the
user to generate more complex images.

The basis behind this is a .ini-like description of the layout of the
final target storage:
  - the list of device(s)
  - per-device, the list of partition(s)
  - per-partition, the content

For now, the only content possible for partitions is a filesystem. It
should be pretty easy to add new types (eg. un-formated, or raw blob).

Also, only two filesystems are supported: ext{2,3,4} and vfat. Adding
more will be relatively easy, provided we have the necessary host
packages to deal with those filesystems.

The existing Buildroot filesystem generators are re-used as much as
possible when it makes sense; when it does not (eg. for vfat), a specific
generator is used.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 docs/manual/appendix.txt              |   1 +
 docs/manual/customize-filesystems.txt |  35 +++++
 docs/manual/customize.txt             |   2 +
 docs/manual/partition-layout.txt      | 258 ++++++++++++++++++++++++++++++++++
 fs/Config.in                          |   1 +
 fs/custom/Config.in                   |  18 +++
 fs/custom/boot/mbr                    |  57 ++++++++
 fs/custom/boot/pre-post               |   8 ++
 fs/custom/custom.mk                   |  14 ++
 fs/custom/fs/ext                      |  22 +++
 fs/custom/fs/pre-post                 |  40 ++++++
 fs/custom/fs/vfat                     |  17 +++
 fs/custom/functions                   |  47 +++++++
 fs/custom/genimages                   | 214 ++++++++++++++++++++++++++++
 14 files changed, 734 insertions(+)
 create mode 100644 docs/manual/customize-filesystems.txt
 create mode 100644 docs/manual/partition-layout.txt
 create mode 100644 fs/custom/Config.in
 create mode 100644 fs/custom/boot/mbr
 create mode 100644 fs/custom/boot/pre-post
 create mode 100644 fs/custom/custom.mk
 create mode 100644 fs/custom/fs/ext
 create mode 100644 fs/custom/fs/pre-post
 create mode 100644 fs/custom/fs/vfat
 create mode 100644 fs/custom/functions
 create mode 100755 fs/custom/genimages

diff --git a/docs/manual/appendix.txt b/docs/manual/appendix.txt
index 74ee8fd..53f4205 100644
--- a/docs/manual/appendix.txt
+++ b/docs/manual/appendix.txt
@@ -6,6 +6,7 @@ Appendix
 
 include::makedev-syntax.txt[]
 include::makeusers-syntax.txt[]
+include::partition-layout.txt[]
 
 
 // Automatically generated lists:
diff --git a/docs/manual/customize-filesystems.txt b/docs/manual/customize-filesystems.txt
new file mode 100644
index 0000000..cddee42
--- /dev/null
+++ b/docs/manual/customize-filesystems.txt
@@ -0,0 +1,35 @@
+// -*- mode:doc; -*-
+// vim: set syntax=asciidoc:
+
+[[filesystem-custom]]
+Customizing the generated filesystem images
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
++Buildroot+ knows by default how to generate a few different kind of
+filesystems, such as +squashfs+, +ext2/3/4+, +cramfs+... But those
+filesystems are all generated to contain the complete target directory
+hierarchy in a single filesystem, mounted as the root filesystem +/+.
+That is, even if you select both an +ext2+ and a +squashfs+ filesystems,
+the content of the two generated images will be the exact same, only the
+types of the filesystems will be different.
+
+Most devices require a more complex setup, with different parts of the
+directory structure split across different filesystems, each stored on
+different partitions of one or more storage devices.
+
++Buildroot+ can generate such complex setups, using a +partition table layout
+description+. This is a simple text file, not unlike the +.ini+ style of
+configuration files, that describes how the target directory hierarchy has
+to be split across the target storage devices. It is a bit like a flattened
+tree of the storage layout.
+
+Set the variable +BR2_TARGET_ROOTFS_CUSTOM_PARTITION_TABLE+ to the path of
+the file containing your +partition table layout description+.
+
+See xref:part-layout-desc-syntax[] for the complete documentation of the
++partition table layout description+ syntax.
+
+[underline]*Note:* Although more versatile than the single filesystem image
+mechanism, the +partition table layout description+ might be unable to
+describe very complex setups. For example, it is not capable of handling
++initramfs+ based systems, or NFS-mounted filesystems.
diff --git a/docs/manual/customize.txt b/docs/manual/customize.txt
index 0456ef1..83cfaa0 100644
--- a/docs/manual/customize.txt
+++ b/docs/manual/customize.txt
@@ -14,6 +14,8 @@ include::customize-kernel-config.txt[]
 
 include::customize-toolchain.txt[]
 
+include::customize-filesystems.txt[]
+
 include::customize-store.txt[]
 
 include::customize-packages.txt[]
diff --git a/docs/manual/partition-layout.txt b/docs/manual/partition-layout.txt
new file mode 100644
index 0000000..5d99e15
--- /dev/null
+++ b/docs/manual/partition-layout.txt
@@ -0,0 +1,258 @@
+// -*- mode:doc; -*-
+// vim: set syntax=asciidoc:
+
+[[part-layout-desc-syntax]]
+
+Partition table layout description syntax
+-----------------------------------------
+
+The +partition table layout description+ syntax is not unlike the standard
+https://en.wikipedia.org/wiki/.ini[+.ini+] syntax. There are two types of
+entries: +sections+, that may contain zero or more +properties+.
+
++Sections+ are specified between square brackets +[]+, _eg._: +[name]+.
+
++Properties+ are specified as key-value pairs, _eg._: +key=value+, and
+are documented as:
+
+* +key-name+ (optional or mandatory): description
+** +value1+: description
+** +value2+: description
+** ...
+
+[underline]*Note:* Unlike the standard +.ini+ syntax, the +partition table
+layout description+ _is_ case-sensitive.
+
+The order of +sections+ is irrelevant. However, for readability, we recomend
+the +partition table layout description+ starts with the +global+ section.
+
+The global section
+~~~~~~~~~~~~~~~~~~
+
+The +[global]+ section defines some global settings, and the list of devices.
+
+Properties for the global section
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+* +extract+ (mandatory): the type of base image to extract
+** +tar+: extract the +rootfs.tar+ base image generated by +Buildroot+
+
+* +devices+ (mandatory): the comma-separated list of storage devices to
+  use on the device. Each device is the filename of the device node
+  present in +/dev+
+
+The devices and partitions sections
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+The devices and partitions sections define, for each device or partition,
+the content of that device or partition.
+
+For each device listed in the +[global]+ section, there must be a
+corresponding section named after that device.
+
+For each partition listed in a device section, there must be a corresponding
+section named after that partition.
+
+Properties for the device section
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+* +type+ (mandatory): the type of content for that device or partition
+** +boot+: the device contains one or more partitions, and
+   _may_ serve as a boot device
+** +fs+: the device contains a filesystem
+
+Properties for the partition section
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+* +type+ (mandatory): the type of content for that device or partition
+** +fs+: the device contains a filesystem
+
+* +size+: the size of that partition, in bytes
+
+Properties for +type=boot+
+^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+* +partitions+ (mandatory): the comma-separated list of partition(s) on
+  this device; no two partitions may have the same name, even if they
+  reside on different devices; partitions names shall match this regexp:
+  `^[[:alpha:]][[:alnum:]-_]*$` (_ie._ starts with a letter, followed by
+  zero or more alpha-numeric character or a dash or an underscore)
+
+* +partalign+ (optional): the alignment of partitions, in bytes; defaults
+  to an alignment of one, which means no alignment
+
+* +boot_type+ (mandatory): the partitioning scheme to use on this device
+** +mbr+: use an https://en.wikipedia.org/wiki/Master_boot_record[MBR]
+   partitioning scheme
+
+Properties for +boot_type=mbr+
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+* +mbr_bootcode+ (optional): the bootcode to use, as a path to the file
+  containing the bootcode image, relative tto the +$(BINARIES_DIR)+
+  directory; defaults to no bootcode (eg. filled with +0+s)
+
+Properties for partitions whose containing device is +boot_type=mbr+
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+* +mbr_type+ (mandatory): the partition
+  https://en.wikipedia.org/wiki/Partition_type#List_of_partition_IDs[type]
+
+Properties for +type=fs+
+^^^^^^^^^^^^^^^^^^^^^^^^
+
+* +fs_type+ (mandatory): the type of filesystem to generate
+** +ext+: generate an extended filesystem (ext2, ext3, ext4)
+** +vfat+: generate an VFAT filesystem (FAT16, FAT32)
+
+* +fs_root+ (mandatory): the directory, relative to +$(TARGET_DIR)+, from
+  which to fill the filesystem, and consequently the mountpoint of that
+  filesystem
+
+* +fs_vfstype+ (optional): the type of filesystem to use when calling
+  +mount+, if different from +fs_type+
+
+* +fs_mntopts+ (optional): the mount options; defaults to +defaults+
+
+* +fs_label+ (optional): the label to assign to this filesystem, if that
+  filesystem supports a label
+
+Properties for +fs_type=ext+
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+* +ext_gen+ (mandatory): the generation of extended filesystem to generate
+** +2+, +3+, +4+: for an ext2, ext3 or ext4 filesystem
+
+* +ext_rev+ (mandatory): the revision of the extended filesystem
+** +0+ (ext2 only): generate a revision 0 extended filesystem filesystem
+** +1+ (mandatory for ext3 or ext4): generate a revision 1 extended
+   filesystem
+
+Properties for +fs_type=vfat+
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+* +vfat_size+ (optional): the VFAT-size of the filesystem
+** +12+, +16+, +32+: generate a FAT12, FAT16, or FAT32
+
+Generation of the filesystems
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+The filesystems are generated in an order such that a filesystem that is
+mounted as a sub-directory of another filesystem is generated first.
+
+A filesystem is filled with the content of the directory corresponding to
+its mountpoint, and then that directory is emptied before continuing to the
+next filesystem. That way, the mountpoints are empty before the filesystem
+that contains them are generated.
+
+Finally, an entry in added in +/etc/fstab+ for each generated filesystem, so
+they are mounted at boot time.
+
+Requirements on host packages
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Depending on what types of partitioning and filesystems are used by your
++partition table layout description+, you may have to enable some
+host-packages in the +Host utilities+ sub-menu.
+
+Since the content of a +partition table layout description+ is very
+specific to a board and/or a project, there is no way for Buildroot to
+automatically select those host packages, and thus it is your
+responsibility to select the appropriate ones.
+
+For example, for an MBR partitioning, you will have to enable the +host
+genpart+ package. For FAT filesystems, you will have to enable both of
++host dosfstools+ and +host mtools+.
+
+Examples
+~~~~~~~~
+
+.Simplest partition table layout description
+====
+----
+[global]
+extract=tar
+devices=sda
+
+[sda]
+type=fs
+fs_type=ext
+fs_vfstype=ext4
+fs_root=/
+ext_gen=4
+ext_rev=1
+----
+
+The +partition table layout description+ above defines a single device
++sda+. That device contains an ext4 filesystem, which is filled with the
+whole content of the +rootfs.tar+, and is mounted on +/+.
+====
+
+.More copmplex table layout description
+====
+----
+[global]
+extract=tar
+devices=mmcblk0,sda
+
+[mmcblk0]
+type=boot
+boot_type=mbr
+partitions=boot,root
+partalign=$((1024*1024))
+
+[sda]
+type=boot
+boot_type=mbr
+partitions=data
+partalign=4096
+
+[boot]
+type=fs
+mbr_type=$((0xC))
+size=$((16*1048576))
+fs_type=vfat
+fs_mntopts=ro
+fs_label=BOOT
+fs_root=/boot
+vfat_size=32
+
+[root]
+type=fs
+mbr_type=$((0x83))
+size=268435456
+fs_type=ext
+fs_vfstype=ext4
+fs_mntopts=discard,delalloc
+fs_root=/
+fs_label=ROOT
+ext_gen=4
+ext_rev=1
+
+[data]
+type=fs
+mbr_type=$((0x83))
+size=$((4*1024*1048576))
+fs_type=ext
+fs_vfstype=ext2
+fs_root=/data
+fs_label=DATA
+ext_gen=2
+ext_rev=1
+----
+====
+
+The example above defines two devices, +mmcblk0+ and +sda+.
+
+The +mmcblk0+ device contains two partitions, +boot+ and +root+; partitions
+are aligned on a 1MiB boundary. The +sda+ device contains a single partition,
++data+, aligned on a 4KiB boundary.
+
+The +boot+ partition is a 16MiB FAT32 filesystem filled with the content
+of, and mounted on, +/boot+, and with label +BOOT+.
+
+The +data+ partition is a 4GiB ext2r1 filesystem filled with the content
+of, and mounted on, +/data+, and with label +DATA+.
+
+The +root+ partition is a 256MiB ext4 filesystem filled the the rest of,
+and mounted on, +/+, and with label +ROOT+.
diff --git a/fs/Config.in b/fs/Config.in
index da4c5ff..8721220 100644
--- a/fs/Config.in
+++ b/fs/Config.in
@@ -11,5 +11,6 @@ source "fs/romfs/Config.in"
 source "fs/squashfs/Config.in"
 source "fs/tar/Config.in"
 source "fs/ubifs/Config.in"
+source "fs/custom/Config.in"
 
 endmenu
diff --git a/fs/custom/Config.in b/fs/custom/Config.in
new file mode 100644
index 0000000..fabb878
--- /dev/null
+++ b/fs/custom/Config.in
@@ -0,0 +1,18 @@
+config BR2_TARGET_ROOTFS_CUSTOM_PARTITION_TABLE
+	string "partition table"
+	help
+	  Enter the path to a partition-table for your device.
+
+	  This will allow Buildroot to generate a more complex target
+	  image, which may consist of more than one filesystem on more
+	  than one partition.
+
+	  See docs/manual/bla-bla on how to construct such a partition
+	  table.
+
+# For the fs infrasturcture, we need that option to be set.
+# Additionally, it allows us to force the TAR output.
+config BR2_TARGET_ROOTFS_CUSTOM
+	def_bool y
+	depends on BR2_TARGET_ROOTFS_CUSTOM_PARTITION_TABLE != ""
+	select BR2_TARGET_ROOTFS_TAR
diff --git a/fs/custom/boot/mbr b/fs/custom/boot/mbr
new file mode 100644
index 0000000..0f0ab39
--- /dev/null
+++ b/fs/custom/boot/mbr
@@ -0,0 +1,57 @@
+# Build a complete MBR-based image
+
+do_image() {
+    # ${1} is fs_root, irrelevant here
+    local img="${2}"
+    local i begin part part_img size type _begin _size
+    local -a part_offset part_file
+
+    # Fill-in the boot record with zeroes
+    # Ideally, we should dump the bootloader code here, but since
+    # we don't have any so far, that will have to be done in a
+    # later step.
+    debug "adding (fake) bootcode\n"
+    dd if=/dev/zero of="${img}" bs=$((0x1be)) count=0 seek=1 2>/dev/null
+
+    # Generate partition entries
+    i=0
+    begin=${partalign}
+    debug "adding partitions descriptors\n"
+    for part in ${partitions[${dev}]//,/ }; do
+        debug "  %s\n" "${part}"
+        part_offset+=( ${begin} )
+        part_img="${tmp_dir}/${dev}.${part}.img"
+        part_file+=( "${part_img}" )
+        size=$( align_val $( stat -c '%s' "${part_img}" ) 512 )
+        type="${values["${part}:mbr_type"]}"
+        # LBA is a exressed in a number of 512-byte bocks
+        # and genparts only deals with LBA
+        _begin=$((begin/512))   # begin is already 512-byte aligned
+        _size=$((size/512))     # size is already 512-byte aligned
+        debug "    start=%s (LBA %s)\n" "${begin}" "${_begin}"
+        debug "    size =%s (LBA %s)\n" "${size}"  "${_size}"
+        debug "    type =%s\n"          "${type}"
+        genpart -b ${_begin} -s ${_size} -t ${type} >>"${img}"
+        begin=$( align_val $((begin+size)) ${partalign} )
+        i=$((i+1))
+    done
+    nb_parts=${i}
+    # Generate entries for empty partitions
+    for(( ; i<4; i++ )); do
+        debug "  (empty)\n"
+        genpart -t 0 >>"${img}"
+    done
+    # Dump the boot signature
+    printf "\x55\xaa" >>"${img}"
+
+    for(( i=0; i<nb_parts; i++ )); do
+        part_img="${part_file[${i}]}"
+        offset=${part_offset[${i}]}
+        _offset=$(( offset/512 ))  # offset is already 512-byte aligned
+        dd if="${part_img}" of="${img}" \
+           bs=512 seek=${_offset}       \
+           conv=notrunc,sparse          2>/dev/null
+    done
+}
+
+# vim: ft=sh
diff --git a/fs/custom/boot/pre-post b/fs/custom/boot/pre-post
new file mode 100644
index 0000000..507d17e
--- /dev/null
+++ b/fs/custom/boot/pre-post
@@ -0,0 +1,8 @@
+do_image_pre() {
+    :
+}
+do_image_post() {
+    :
+}
+
+#vim: set ft=sh
diff --git a/fs/custom/custom.mk b/fs/custom/custom.mk
new file mode 100644
index 0000000..940a32a
--- /dev/null
+++ b/fs/custom/custom.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# custom partitioning
+#
+################################################################################
+
+define ROOTFS_CUSTOM_CMD
+ BUILD_DIR=$(BUILD_DIR) fs/custom/genimages \"$(BR2_TARGET_ROOTFS_CUSTOM_PARTITION_TABLE)\"
+endef
+
+# We need the tarball to be generated first
+ROOTFS_CUSTOM_DEPENDENCIES += rootfs-tar
+
+$(eval $(call ROOTFS_TARGET,custom))
diff --git a/fs/custom/fs/ext b/fs/custom/fs/ext
new file mode 100644
index 0000000..5f9b4e7
--- /dev/null
+++ b/fs/custom/fs/ext
@@ -0,0 +1,22 @@
+# Create an extended file system
+
+do_image() {
+    local root_dir="${1}"
+    local img="${2}"
+    local -a fs_opts
+    local gen rev
+
+    fs_opts+=( -z )
+    fs_opts+=( -d "${root_dir}" )
+    [ -z "${size}"    ] || fs_opts+=( -b $((size/1024)) )
+    [ -n "${ext_gen}" ] || ext_gen=2
+    [ -n "${ext_rev}" ] || ext_rev=1
+
+    # Remember, we're running from Buildroot's TOP_DIR
+    GEN=${ext_gen} REV=${ext_rev}                   \
+    ./fs/ext2/genext2fs.sh "${fs_opts[@]}" "${img}" >/dev/null
+
+    [ -z "${fs_label}" ] || tune2fs -L "${fs_label}" "${img}" >/dev/null
+}
+
+# vim: ft=sh
diff --git a/fs/custom/fs/pre-post b/fs/custom/fs/pre-post
new file mode 100644
index 0000000..9563bec
--- /dev/null
+++ b/fs/custom/fs/pre-post
@@ -0,0 +1,40 @@
+#-----------------------------------------------------------------------------
+do_image_pre() {
+    :
+}
+
+#-----------------------------------------------------------------------------
+do_image_post() {
+    local rootfs_dir="${1}"
+    local fs_root="${2}"
+    local img_file="${3}"
+    local part="${4}"
+    local dev mntops vfstype fs_root_esc
+
+    subname+="[post-image]"
+
+    # Empty the partition's mountpoint
+    find "${fs_root_dir}" -maxdepth 1 \! -path "${fs_root_dir}" -exec rm -rf {} +
+
+    # Add entry in fstab, but not if this is '/'
+    # Don't add either if rootfs was not extracted
+    if [    "${fs_root}" = "/"               \
+         -o -z "${values["global:extract"]}" ]; then
+        return 0
+    fi
+    fs_root_esc="$( sed -r -e 's:/:\\/:g;' <<<"${fs_root}" )"
+    sed -r -i -e "/[^[:space:]]+[[:space:]]+${fs_root_esc}[[:space:]]/d"    \
+                 "${rootfs_dir}/etc/fstab"
+    dev="$( get_part_dev_node "${part}" )"
+    vfstype="${fs_vfstype:-${fs_type}}"
+    mntops="${fs_mntops:-defaults}"
+    printf "/dev/%s %s %s %s 0 0\n"     \
+           "${dev}" "${fs_root}"        \
+           "${vfstype}" "${mntops}"     \
+           >>"${rootfs_dir}/etc/fstab"
+
+    subname="${subname%\[post-image\]}"
+}
+
+#-----------------------------------------------------------------------------
+# vim: ft=sh
diff --git a/fs/custom/fs/vfat b/fs/custom/fs/vfat
new file mode 100644
index 0000000..aa5545f
--- /dev/null
+++ b/fs/custom/fs/vfat
@@ -0,0 +1,17 @@
+# Create a VFAT file system
+
+do_image() {
+    local root_dir="${1}"
+    local img="${2}"
+    local -a fs_opts
+
+    dd if=/dev/zero of="${img}" bs=${size} count=0 seek=1 2>/dev/null
+
+    [ -z "${vfat_size}" ] || fs_opts+=( -F ${vfat_size} )
+    [ -z "${fs_label}"  ] || fs_opts+=( -n "${fs_label}" )
+    mkfs.vfat "${fs_opts[@]}" "${img}" >/dev/null
+
+    mcopy -i "${img}" "${root_dir}/"* '::'
+}
+
+# vim: ft=sh
diff --git a/fs/custom/functions b/fs/custom/functions
new file mode 100644
index 0000000..4b41021
--- /dev/null
+++ b/fs/custom/functions
@@ -0,0 +1,47 @@
+# Common functions
+
+#------------------------------------------------------------------------------
+align_val() {
+    local val="${1}"
+    local align="${2}"
+    local aligned
+
+    aligned=$(( ( (val+align-1) / align ) * align ))
+
+    printf "%d" ${aligned}
+}
+
+#------------------------------------------------------------------------------
+# Some trace functions
+trace() {
+    local fmt="${1}"
+    shift
+
+    printf "%s" "${myname}"
+    if [ -n "${subname}" ]; then
+        printf "(%s)" "${subname}"
+    fi
+    printf ": ${fmt}" "${@}"
+}
+
+debug() { :; }
+if [ -n "${DEBUG}" ]; then
+    debug() {
+        trace "${@}" >&2
+    }
+fi
+
+error() {
+    trace "${@}" >&2
+    exit 1
+}
+
+on_error() {
+    local ret=${?}
+
+    error "unexpected error caught: %d\n" ${ret}
+}
+trap on_error ERR
+set -E -e
+
+# vim: ft=sh
diff --git a/fs/custom/genimages b/fs/custom/genimages
new file mode 100755
index 0000000..aba3021
--- /dev/null
+++ b/fs/custom/genimages
@@ -0,0 +1,214 @@
+#!/bin/bash
+set -e
+set -E
+
+#-----------------------------------------------------------------------------
+main() {
+    local part_table="${1}"
+    local tmp_dir
+    local rootfs_dir
+    local -a devices
+    local extract
+    local cur_section
+    local -a sections devices partitions
+    local -A variables values partdevs
+    local sec dev part var val
+    local secs devs parts vars vals
+
+    if [ ! -f "${part_table}" ]; then
+        error "%s: no such file\n" "${part_table}"
+        exit 1
+    fi
+
+    export PATH="${HOST_DIR}/usr/bin:${HOST_DIR}/usr/sbin:${PATH}"
+
+    tmp_dir="$( mktemp -d --tmpdir rpi-genimage.XXXXXX )"
+
+    rootfs_dir="${tmp_dir}/rootfs"
+    mkdir -p "${rootfs_dir}"
+
+    # Parse all the sections in one go, we'll sort
+    # all the mess afterwards...
+    debug "parsing partitions descriptions file '%s'\n" \
+          "${part_table}"
+    while read line; do
+        line="$( sed -r -e 's/[[:space:]]*#.*$//; //d;' <<<"${line}" )"
+
+        # Detect start of global section, skip anything else
+        case "${line}" in
+        "") continue;;
+        '['*']')
+            cur_section="$( sed -r -e 's/[][]//g;' <<<"${line}" )"
+            debug "  entering section '%s'\n" "${cur_section}"
+            sections+=( "${cur_section}" )
+            continue
+        ;;
+        ?*=*)   ;;
+        *)      error "malformed entry '%s'\n" "${line}";;
+        esac
+
+        var="${line%%=*}"
+        eval val="${line#*=}"
+        debug "    adding '%s'='%s'\n" "${var}" "${val}"
+        variables+=( ["${cur_section}"]=",${var}" )
+        values+=( ["${cur_section}:${var}"]="${val}" )
+    done <"${part_table}"
+
+    # Create lists of devices, partitions, and partition:device pairs.
+    debug "creating intermeditate lists\n"
+    devices=( ${values["global:devices"]//,/ } )
+    for dev in "${devices[@]}"; do
+        partitions=( ${values["${dev}:partitions"]//,/ } )
+    done
+    for dev in "${devices[@]}"; do
+        for part in ${values["${dev}:partitions"]//,/ }; do
+            partdevs+=( ["${part}"]="${dev}" )
+        done
+    done
+
+    # Now, we must order the partitions so that their mountpoint
+    # is empty by the time we build the upper-level partition.
+    # For example, given this layout of mountpoints:
+    #   /
+    #   /usr
+    #   /usr/var
+    # We must ensure /usr/var is empty@the time we create the /usr
+    # filesystem image; and similarly, we must ensure /usr is empty by
+    # the time we create the / filesystem image
+    # So, a simple reverse alphabetical sort will do the trick
+    debug "sorting partitions\n"
+    sorted_parts=( $(
+        for part in "${partitions[@]}"; do
+            printf "%s:%s\n" "${part}" "${values["${part}:fs_root"]}"
+        done                    \
+        |sort -t: -k2 -r        \
+        |sed -r -e 's/:[^:]+$//;'
+    ) )
+
+    trace "extracting root (if needed)\n"
+    case "${values["global:extract"]}" in
+        targz)  c=z ;;&
+        tarbz2) c=j ;;&
+        tarxz)  c=J ;;&
+        tar)    c=  ;;&
+        tar*)   tar x${c}f "${BINARIES_DIR}/rootfs.tar" -C "${rootfs_dir}";;
+        "")     ;;
+        *)      error "unknown extract method '%s'\n" "${extract}";;
+    esac
+
+    # Render all partition images
+    for part in "${sorted_parts[@]}"; do
+        trace "preparing filesystem for partition '%s'\n" "${part}"
+        render_img "${rootfs_dir}" "${part}"                        \
+                   "${tmp_dir}/${partdevs["${part}"]}.${part}.img"
+    done
+
+    # Aggregate all devices images
+    for dev in "${devices[@]}"; do
+        trace "assembling partitions in device '%s'\n" "${dev}"
+        render_img "${rootfs_dir}" "${dev}" "${tmp_dir}/${dev}.img"
+    done
+
+    # Copy all partitions and devices images to the image dir
+    for part in "${sorted_parts[@]}"; do
+        debug "copying partition '%s' to image dir\n" "${part}"
+        dd if="${tmp_dir}/${partdevs["${part}"]}.${part}.img"           \
+           of="${BINARIES_DIR}/$( get_part_dev_node "${part}" ).img"    \
+           bs=4096 conv=sparse                                          2>/dev/null
+    done
+    for dev in "${devices[@]}"; do
+        debug "copying device '%s' to image dir\n" "${dev}"
+        dd if="${tmp_dir}/${dev}.img"       \
+           of="${BINARIES_DIR}/${dev}.img"  \
+           bs=4096 conv=sparse              2>/dev/null
+    done
+
+    [ -n "${DEBUG}" ] || rm -rf "${tmp_dir}"
+}
+
+#-----------------------------------------------------------------------------
+render_img() {
+    local rootfs_dir="${1}"
+    local img="${2}"
+    local img_file="${3}"
+    local type sub_type fs_root_dir
+
+    type="${values["${img}:type"]}"
+    sub_type="${values["${img}:${type}_type"]}"
+
+    # Sanity checks
+    [ -n "${type}" ] || error "'%s': unspecified type\n" "${img}"
+    if [ ! -d "fs/custom/${type}" ]; then
+        error "'%s': unsupported type '%s'\n" "${img}" "${type}"
+    fi
+    [ -n "${sub_type}" ] || error "'%s': unspecified %s_type\n" "${img}" "${type}"
+    if [ ! -f "fs/custom/${type}/${sub_type}" ]; then
+        error "'%s': unknown %s_type '%s'\n" "${img}" "${type}" "${sub_type}"
+    fi
+
+    # Need to call the renderer in a subshell so that its definitions
+    # do not pollute our environment
+    subname="${sub_type}"
+    (
+        trap 'exit $?' ERR
+        for var in ${variables["${img}"]//,/ }; do
+            eval "${var}=\"${values["${img}:${var}"]}\""
+        done
+        fs_root_dir="${rootfs_dir}${fs_root}"
+        . "fs/custom/${type}/pre-post"
+        . "fs/custom/${type}/${sub_type}"
+        do_image_pre "${rootfs_dir}" "${fs_root}" "${img_file}" "${img}"
+        do_image "${fs_root_dir}" "${img_file}"
+        do_image_post "${rootfs_dir}" "${fs_root}" "${img_file}" "${img}"
+    )
+    ret=${?}
+    [ ${ret} -eq 0 ] || exit ${ret}
+    subname=""
+}
+
+#-----------------------------------------------------------------------------
+get_part_dev_node() {
+    local part="${1}"
+    local dev
+    local i c p
+
+    dev="${devices["${part}"]}"
+    i="${values["${dev}:partstart"]:-1}"
+
+    # If device node ends with a number, partitions are denoted
+    # with a 'p' before the partition number, eg.:
+    #   /dev/mmcblk0    --> /dev/mmcblk0p1
+    #   /dev/sda        --> /dev/sda1
+    case "${dev#${dev%?}}" in
+        [0-9])  c="p";;
+        *)      c="";;
+    esac
+
+    for p in ${values["${dev}:partitions"]//,/ }; do
+        if [ "${p}" = "${part}" ]; then
+            printf "%s%s%d" "${dev}" "${c}" ${i}
+            return 0
+        fi
+        i=$((i+1))
+    done
+
+    error "'%s': partition not found. WTF?\n" "${part}"
+}
+
+#-----------------------------------------------------------------------------
+myname="${0##*/}"
+mydir="${0%/*}"
+
+TOP_DIR="$( pwd )"
+export myname mydir TOP_DIR
+
+. "fs/custom/functions"
+
+# This script can deal with extracting the rootfs tarball, but we need to
+# be root for that.
+if [ $(id -u) -ne 0 ]; then
+    printf "error: not root\n"
+    exit 1
+else
+    main "${@}"
+fi
-- 
1.8.1.2
