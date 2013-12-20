From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 20 Dec 2013 23:32:54 +0100
Subject: [Buildroot] [PATCH 1/4] fs/custom: generate complete,
	partition-based device images
In-Reply-To: <cover.1387578655.git.yann.morin.1998@free.fr>
References: <cover.1387578655.git.yann.morin.1998@free.fr>
Message-ID: <64a7e3a995100104cdebd681621a9abb510a1820.1387578655.git.yann.morin.1998@free.fr>
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

It is possible to create MBR- or GPT-based partitoining schemes. Adding
new ones should be relatively easy (but would need adequate host tools).

For now, the only content possible for partitions is a filesystem. It
should be pretty easy to add new types (eg. un-formated, or raw blob).

Also, only two filesystems are supported: ext{2,3,4} and vfat. Adding
more will be relatively easy, provided we have the necessary host
packages to deal with those filesystems.

The existing Buildroot filesystem generators are re-used as much as
possible when it makes sense; when it does not (eg. for vfat), a specific
generator is used.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Ryan Barnett <rjbarnet@rockwellcollins.com>
---
 docs/manual/appendix.txt              |   1 +
 docs/manual/customize-filesystems.txt |  35 ++++
 docs/manual/customize.txt             |   2 +
 docs/manual/partition-layout.txt      | 314 ++++++++++++++++++++++++++++++++++
 fs/Config.in                          |   1 +
 fs/custom/Config.in                   |  16 ++
 fs/custom/boot/gpt                    | 126 ++++++++++++++
 fs/custom/boot/mbr                    |  57 ++++++
 fs/custom/boot/pre-post               |   8 +
 fs/custom/custom.mk                   |  38 ++++
 fs/custom/fs/ext                      |  22 +++
 fs/custom/fs/pre-post                 |  67 ++++++++
 fs/custom/fs/vfat                     |  17 ++
 fs/custom/functions                   |  47 +++++
 fs/custom/genimages                   | 242 ++++++++++++++++++++++++++
 15 files changed, 993 insertions(+)
 create mode 100644 docs/manual/customize-filesystems.txt
 create mode 100644 docs/manual/partition-layout.txt
 create mode 100644 fs/custom/Config.in
 create mode 100644 fs/custom/boot/gpt
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
index 7e46fd8..6d062ea 100644
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
index 0000000..553f862
--- /dev/null
+++ b/docs/manual/partition-layout.txt
@@ -0,0 +1,314 @@
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
+entries: +sections+, that may each contain zero or more +properties+.
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
+* +keep_parts+ (optional): also copy the individual partition images
+  of all devices to +$(BINARIES_DIR)+. Settings from the device sections
+  or the partition sections take precedence over this one.
+** +yes+: copy the individual partition images
+** +no+ (the default): do not copy individual partition images
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
+
+* +keep_parts+ (optional): also copy the individual partition images
+  for this device to +$(BINARIES_DIR)+. Settings from the partition
+  sections take precedence over this one.
+** +yes+: copy the individual partition images
+** +no+ (the default): do not copy individual partition images
+
+Properties for the partition section
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+* +type+ (mandatory): the type of content for that device or partition
+** +fs+: the partition contains a filesystem
+
+* +size+: the size of that partition, in bytes
+
+* +keep+ (optional): copy this partition image to +$(BINARIES_DIR)+
+** +yes+: copy this partition image
+** +no+ (the default): do not copy this partition image
+
+Properties for +type=boot+
+^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+* +boot_type+ (mandatory): the partitioning scheme to use on this device
+** +mbr+: use an https://en.wikipedia.org/wiki/Master_boot_record[MBR]
+   partitioning scheme
+** +gpt+: use a https://en.wikipedia.org/wiki/GUID_Partition_Table[GPT]
+   partitioning scheme
+
+* +partitions+ (mandatory): the comma-separated list of partition(s) on
+  this device; no two partitions may have the same name, even if they
+  reside on different devices; partitions names shall match this regexp:
+  `^[[:alpha:]][[:alnum:]-_]*$` (_ie._ starts with a letter, followed by
+  zero or more alpha-numeric character or a dash or an underscore)
+
+* +partalign+ (optional): the alignment of partitions, in bytes; defaults
+  to an alignment of one, which means no alignment; depending on the
+  +boot_type+, some restrictions may apply, and are documented for each
+  +boot_type+
+
+Properties for +boot_type=mbr+
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+* +mbr_bootcode+ (optional): the bootcode to use, as a path to the file
+  containing the bootcode image, relative to the +$(BINARIES_DIR)+
+  directory; defaults to no bootcode (eg. filled with zeroes)
+
+* +partalign+: must be a multiple of 512
+
+Properties for +boot_type=gpt+
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+* +partalign+: must be a multiple of 512
+
+********
+Currently, only 512-byte sectors are supported. 4k sectors are not.
+********
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
+** +vfat+: generate a VFAT filesystem (FAT16, FAT32)
+
+* +fs_label+ (optional): the label to assign to this filesystem, if that
+  filesystem supports a label
+
+* +fs_files_0+, +fs_files_1+, +fs_files_N+ (optional): the list of files,
+  relative to $(BINARIES_DIR), to store in the filesystem. These entries
+  must be indexed starting from 0, and must be sequential: the first
+  missing entry ends the list
+
+* +fs_root+ (optional): the mountpoint of the filesystem
+
+* +fs_vfstype+ (optional): the type of filesystem to use when calling
+  +mount+, if different from +fs_type+
+
+* +fs_mntopts+ (optional): the mount options; defaults to +defaults+
+
+_Note_: valid use-cases for +fs_root+ and +fs_files_N+:
+
+* if only +fs_root+ is specified (and no +fs_files_N+): the filesystem
+  content is made exclusively from +$(TARGET_DIR)/$(fs_root)+, and the
+  filesystem is mounted at runtime
+
+* if both +fs_root+ and at least one +fs_files_N+ are specified: the
+  filesystem content is made exclusively from the +fs_files_N+ entries,
+  and mounted at runtime. +$(TARGET_DIR)/$(fs_root)+ must be empty
+
+* if at least one +fs_files_N+ is specified, and +fs_root+ is not: the
+  filesystem content is made exclusively from the +fs_files_N+ entries,
+  and the filesystem is not mounted at runtime
+
+* if neither +fs_root+ nor +fs_files_N+ is specified: this is an error
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
+type=boot
+boot_type=mbr
+partitions=root
+partalign=1048576
+
+[root]
+type=fs
+fs_type=ext
+fs_vfstype=ext4
+fs_root=/
+ext_gen=4
+ext_rev=1
+----
+
+The +partition table layout description+ above defines a single device
++sda+. That device contains a single partition, +root+, with an ext4
+filesystem, which is filled with the whole content of the +rootfs.tar+,
+and is mounted on +/+.
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
index da4c5ff..44e04f7 100644
--- a/fs/Config.in
+++ b/fs/Config.in
@@ -3,6 +3,7 @@ menu "Filesystem images"
 source "fs/cloop/Config.in"
 source "fs/cpio/Config.in"
 source "fs/cramfs/Config.in"
+source "fs/custom/Config.in"
 source "fs/ext2/Config.in"
 source "fs/initramfs/Config.in"
 source "fs/iso9660/Config.in"
diff --git a/fs/custom/Config.in b/fs/custom/Config.in
new file mode 100644
index 0000000..e5a8ee7
--- /dev/null
+++ b/fs/custom/Config.in
@@ -0,0 +1,16 @@
+config BR2_TARGET_ROOTFS_CUSTOM
+	bool "Custom partition table layout"
+	select BR2_TARGET_ROOTFS_TAR
+
+config BR2_TARGET_ROOTFS_CUSTOM_PARTITION_TABLE
+	string "path to the custom partition table layout description"
+	depends on BR2_TARGET_ROOTFS_CUSTOM
+	help
+	  Enter the path to a partition-table for your device.
+
+	  This will allow Buildroot to generate a more complex target
+	  image, which may consist of more than one filesystem on more
+	  than one partition.
+
+	  See docs/manual/bla-bla on how to construct such a partition
+	  table.
diff --git a/fs/custom/boot/gpt b/fs/custom/boot/gpt
new file mode 100644
index 0000000..8592cbf
--- /dev/null
+++ b/fs/custom/boot/gpt
@@ -0,0 +1,126 @@
+# Build a complete GPT-based image
+
+# For a GPT-based partitionning, we need to compute the complete
+# image size before we can attempt to generate the partition table.
+# Then, we need to add the size of the GPT itself, plus that of its
+# backup copy, plus the protective MBR.
+# The size of the GPT itself depends on the sector size, and the
+# number of partitions in the GPT. Sectors can be either 512-byte
+# or 4096-byte large; The numbers of partitions is unlimited, but
+# it is suggested there is space to store at least 128 of them; a
+# partition description is 128-byte large.
+#
+# https://en.wikipedia.org/wiki/GUID_Partition_Table
+#
+# So, here's what we do:
+#   - consider 512-byte sectors (since GPT on 4k sectors is not well
+#     documented)
+#   - consider at least 128 partitions; if the layout defines more than
+#     that, we need to round that number up to the smallest multiple of
+#     4 (since there are 4 partition descriptions in a 512-byte sector)
+#   - generate an empty, sparse file that is big enough to store the MBR,
+#     the two GPT copies, and the aligned partitions.
+#   - dump each partition in turn in their final location in that file
+#   - generate a parted script that creates the partition table in that
+#     file
+#
+#   Simg = 512 + 2*(Sgpt) + ?( aligned(Spart,512) )
+#   Sgpt = 512 + Nent*128
+#
+# Where:
+#   Simg        : size of the image
+#   Sgpt        : size of one GPT
+#   Spart       : size of each partition
+#   Nent        : number of partition entries
+#   aligned()   : the alignment function
+#
+# Sicne 4k-large sectors are not really explained on Wikipedia, we can
+# add this later on.
+
+do_image() {
+    # ${1} is fs_root, irrelevant here
+    local img="${2}"
+
+    # How many partitions do we have?
+    nb_parts=0
+    for part in ${partitions[${dev}]//,/ }; do
+        nb_parts=$((nb_parts+1))
+    done
+
+    # How many partition entries do we need?
+    nb_entries=$((4*((nb_parts+3)/4)))
+    nb_entries=$((nb_entries<128?128:nb_entries))
+
+    # The size of a single GPT
+    gpt_size=$((512+(128*nb_entries)))
+
+    # Offset of the first partition
+    begin=$(align_val $((512+$(align_val ${gpt_size} 512))) ${partalign} )
+
+    # Initialise our image file
+    dd if=/dev/zero of="${img}"     \
+       bs=1 seek=${begin} count=0   \
+       conv=sparse                  2>/dev/null
+
+    # Compute the space required to store all partitions
+    # and store them in the image file
+    size_parts=0
+    _offset=${begin}
+    i=1
+    debug "adding partions descriptions\n"
+    for part in ${partitions[${dev}]//,/ }; do
+        debug "  %s\n" "${part}"
+        _part_img="${tmp_dir}/${dev}.${part}.img"
+        _size=$( align_val $( stat -c '%s' "${_part_img}" ) 512 )
+        part_offset+=( ${_offset} )
+        _attr="${values["${part}:gpt_attr"]}"
+        _label="${values["${part}:gpt_label"]}"
+
+        # If the partition has no label, use the filesystem label
+        if [ -z "${_label}" ]; then
+            _label="${values["${part}:fs_label"]}"
+        fi
+        if [ -z "${_label}" ]; then
+            _label="data"
+        fi
+
+        debug "    start=%s\n" "${_offset}"
+        debug "    size =%s\n" "${_size}"
+        debug "    end  =%s\n" "$((_offset+_size-1))"
+
+        dd if="${_part_img}" of="${img}"    \
+           bs=512 seek=$((_offset/512))     \
+           conv=notrunc,sparse              2>/dev/null
+
+        parted_script+=( mkpart "${_label}"    \
+                                ${_offset}              \
+                                $((_offset+_size-1))    \
+                       )
+        if [ -n "${_attr}" ]; then
+            for attr in "${_attr//,/ }"; do
+                parted_script+=( set ${i} ${attr} on )
+            done
+        fi
+
+        size_parts=$((size_parts+_size))
+        _offset=$((_offset+_size))
+        i=$((i+1))
+    done
+
+    # Terminate our image file
+    img_size=$(align_val $(( begin + size_parts + gpt_size )) 512)
+    debug "begin   =%s\n" ${begin}
+    debug "nb_entry=%s\n" ${nb_entries}
+    debug "gpt_size=%s\n" ${gpt_size}
+    debug "img_size=%s\n" ${img_size}
+    dd if=/dev/zero of="${img}" \
+       bs=1 seek=${img_size}    \
+       count=0 conv=sparse      2>/dev/null
+
+    for i in parted -s "${img}" mklabel gpt unit B "${parted_script[@]}"; do
+        debug "--> '%s'\n" "${i}"
+    done
+    parted -s "${img}" mklabel gpt unit B "${parted_script[@]}"
+}
+
+# vim: ft=sh
diff --git a/fs/custom/boot/mbr b/fs/custom/boot/mbr
new file mode 100644
index 0000000..af7c6cb
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
+        # LBA is exressed in a number of 512-byte blocks
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
index 0000000..63c1f23
--- /dev/null
+++ b/fs/custom/custom.mk
@@ -0,0 +1,38 @@
+################################################################################
+#
+# custom partitioning
+#
+################################################################################
+
+define ROOTFS_CUSTOM_CMD
+	BUILD_DIR=$(BUILD_DIR) fs/custom/genimages \
+		'$(call qstrip,$(BR2_TARGET_ROOTFS_CUSTOM_PARTITION_TABLE))'
+endef
+
+# rootfs-custom uses rootfs.tar as the source to generate
+# the resulting image(s), so we need to build it first.
+ROOTFS_CUSTOM_DEPENDENCIES += rootfs-tar
+
+# All of the following filesystem generators, or partition managers, are
+# optional, but if they are selected, we may need them, so we need to
+# depend on them
+ifeq ($(BR2_PACKAGE_HOST_DOSFSTOOLS),y)
+ROOTFS_CUSTOM_DEPENDENCIES += host-dosfstools
+endif
+ifeq ($(BR2_PACKAGE_HOST_E2FSPROGS),y)
+ROOTFS_CUSTOM_DEPENDENCIES += host-e2fsprogs
+endif
+ifeq ($(BR2_PACKAGE_HOST_GENEXT2FS),y)
+ROOTFS_CUSTOM_DEPENDENCIES += host-genext2fs
+endif
+ifeq ($(BR2_PACKAGE_HOST_GENPART),y)
+ROOTFS_CUSTOM_DEPENDENCIES += host-genpart
+endif
+ifeq ($(BR2_PACKAGE_HOST_MTOOLS),y)
+ROOTFS_CUSTOM_DEPENDENCIES += host-mtools
+endif
+ifeq ($(BR2_PACKAGE_HOST_PARTED),y)
+ROOTFS_CUSTOM_DEPENDENCIES += host-parted
+endif
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
index 0000000..40ec047
--- /dev/null
+++ b/fs/custom/fs/pre-post
@@ -0,0 +1,67 @@
+#-----------------------------------------------------------------------------
+do_image_pre() {
+    local i file
+
+    # if fs_root_dir is not specified, we have to create one
+    # It *does* override the caller's fs_root_dir value, but
+    # that's on purpose
+    # If fs_root_dir is specified, and we have at least fs_files_0,
+    # then fs_root_dir/ must be enpty
+    if [ -z "${fs_root_dir}" ]; then
+        if [ -n "${values["${part}:fs_files_0"]}" ]; then
+            error "%s: no fs_root specified, and no fs_files_0\n" "${part}"
+        fi
+        fs_root_dir="$( mktemp -d "${tmp_dir}/XXXXXX" )"
+    else
+        if [    -n "${values["${part}:fs_files_0"]}"      \
+             -a $( ls -1A "${fs_root_dir}" |wc -l ) -ne 0 ]; then
+            error "%s: %s is not empty, but fs_files_0 is specified\n"  \
+                  "${part}" "${fs_root_dir#${fs_root}}"
+        fi
+    fi
+
+    i=0
+    while true; do
+        file="${values["${part}:fs_files_${i}"]}"
+        [ -n "${file}" ] || break
+        debug "%s: adding fs_files_%d %s\n" "${part}" ${i} "${file}"
+        install -D "${BINARIES_DIR}/${file}" "${fs_root_dir}/${file##*/}"
+        i=$((i+1))
+    done
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
+    if [    "${fs_root}" = "/" -o -z "${fs_root}" \
+         -o -z "${values["global:extract"]}"      ]; then
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
index 0000000..00820fc
--- /dev/null
+++ b/fs/custom/genimages
@@ -0,0 +1,242 @@
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
+    local has_global_section
+
+    # We need bash 4 or above for asociative arrays
+    if [ ${BASH_VERSINFO[0]} -lt 4 ]; then
+        error "bash 4 or above is needed\n"
+    fi
+
+    if [ ! -f "${part_table}" ]; then
+        error "%s: no such file\n" "${part_table}"
+        exit 1
+    fi
+
+    export PATH="${HOST_DIR}/usr/bin:${HOST_DIR}/usr/sbin:${PATH}"
+
+    # Parse all the sections in one go, we'll sort
+    # all the mess afterwards...
+    debug "parsing partitions descriptions file '%s'\n" \
+          "${part_table}"
+    has_global_section=0
+    while read line; do
+        line="$( sed -r -e 's/[[:space:]]*#.*$//;' <<<"${line}" )"
+
+        # Detect start of global section, skip anything else
+        case "${line}" in
+        "") continue ;;
+        '[global]') has_global_section=1 ;;&
+        '['*']')
+            cur_section="$( sed -r -e 's/[][]//g;' <<<"${line}" )"
+            debug "  entering section '%s'\n" "${cur_section}"
+            sections+=( "${cur_section}" )
+            continue
+        ;;
+        ?*=*) ;;
+        *)  error "malformed entry '%s'\n" "${line}" ;;
+        esac
+
+        var="${line%%=*}"
+        eval val="${line#*=}"
+        debug "    adding '%s'='%s'\n" "${var}" "${val}"
+        variables+=( ["${cur_section}"]=",${var}" )
+        values+=( ["${cur_section}:${var}"]="${val}" )
+    done <"${part_table}"
+
+    if [ ${has_global_section} -eq 0 ]; then
+        error "no global section defined\n"
+    fi
+
+    # Create lists of devices, partitions, and partition:device pairs.
+    debug "creating intermediate lists\n"
+    devices=( ${values["global:devices"]//,/ } )
+    for dev in "${devices[@]}"; do
+        # Sanity check first: all devices must have a corresponding
+        # section, which means they should have a type
+        if [ -z "${values["${dev}:type"]}" ]; then
+            error "device '%s' has no type (no section?)\n" "${dev}"
+        fi
+        partitions+=( ${values["${dev}:partitions"]//,/ } )
+        for part in ${values["${dev}:partitions"]//,/ }; do
+            # Sanity check first: all partitions must have a corresponding
+            # section, which means they should have a type
+            if [ -z "${values["${part}:type"]}" ]; then
+                error "partition '%s' has no type (no section?)\n" "${dev}"
+            fi
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
+            # Partitions that are not mounted can be generated
+            # in any order
+            if [ -n "${values["${part}:fs_root"]}" ]; then
+                printf "%s:%s\n" "${part}" "${values["${part}:fs_root"]}"
+            else
+                printf "%s\n" "${part}"
+            fi
+        done                    \
+        |sort -t: -k2 -r        \
+        |sed -r -e 's/:[^:]+$//;'
+    ) )
+
+    tmp_dir="${BUILD_DIR}/genimages.tmp"
+    rootfs_dir="${tmp_dir}/rootfs"
+    # Since we don't remove it in case of error (to be able to inspect its
+    # content), we must remove it now (a previous run may have left it).
+    rm -rf "${tmp_dir}"
+    mkdir -p "${rootfs_dir}"
+
+    case "${values["global:extract"]}" in
+        tar)
+            trace "extracting rootfs.tar\n"
+            tar xf "${BINARIES_DIR}/rootfs.tar" -C "${rootfs_dir}"
+        ;;
+        *)  error "unknown extract method '%s'\n" "${extract:-(none)}"
+        ;;
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
+    if [ "${values["global:keep_partitions"]}" = "yes" ]; then
+        for part in "${sorted_parts[@]}"; do
+            debug "copying partition '%s' to image dir\n" "${part}"
+            dd if="${tmp_dir}/${partdevs["${part}"]}.${part}.img"           \
+               of="${BINARIES_DIR}/$( get_part_dev_node "${part}" ).img"    \
+               bs=4096 conv=sparse                                          2>/dev/null
+        done
+    fi
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
+    dev="${partdevs["${part}"]}"
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
