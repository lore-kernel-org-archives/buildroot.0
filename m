From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri,  3 Jan 2014 18:19:38 +0100
Subject: [Buildroot] [PATCH 5/5] fs/custom: add support for raw
	device/partition content
In-Reply-To: <cover.1388768519.git.yann.morin.1998@free.fr>
References: <cover.1388768519.git.yann.morin.1998@free.fr>
Message-ID: <7169ba439a58c2be53605535ec4ffbe4c69f23a1.1388768519.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Add the ability to fill a device or partition from a raw binary blob.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 docs/manual/partition-layout.txt |  8 ++++++++
 fs/custom/genimages              |  5 +++++
 fs/custom/raw/pre-post           | 14 ++++++++++++++
 fs/custom/raw/raw                | 12 ++++++++++++
 4 files changed, 39 insertions(+)
 create mode 100644 fs/custom/raw/pre-post
 create mode 100644 fs/custom/raw/raw

diff --git a/docs/manual/partition-layout.txt b/docs/manual/partition-layout.txt
index e9027bf..c237893 100644
--- a/docs/manual/partition-layout.txt
+++ b/docs/manual/partition-layout.txt
@@ -65,6 +65,7 @@ Properties for the device section
 * +type+ (mandatory): the type of content for that device or partition
 ** +boot+: the device contains one or more partitions, and
    _may_ serve as a boot device
+** +raw+: the device contains a raw binary blob
 
 * +keep_partitions+ (optional): also copy the individual partition images
   for this device to +$(BINARIES_DIR)+. Settings from the partition
@@ -77,6 +78,7 @@ Properties for the partition section
 
 * +type+ (mandatory): the type of content for that device or partition
 ** +fs+: the partition contains a filesystem
+** +raw+: the partition contains a raw binary blob
 
 * +size+: the size of that partition, in bytes
 
@@ -104,6 +106,12 @@ Properties for +type=boot+
   +boot_type+, some restrictions may apply, and are documented for each
   +boot_type+
 
+Properties for +type=raw+
+^^^^^^^^^^^^^^^^^^^^^^^^^
+
+* +raw_file+: the filename, relative to +$(BINARIES_DIR)+, that contains
+  the binary blob
+
 Properties for +boot_type=mbr+
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
diff --git a/fs/custom/genimages b/fs/custom/genimages
index 204f13b..e7d9065 100755
--- a/fs/custom/genimages
+++ b/fs/custom/genimages
@@ -175,6 +175,11 @@ render_img() {
     if [ ! -d "fs/custom/${type}" ]; then
         error "'%s': unsupported type '%s'\n" "${img}" "${type}"
     fi
+
+    # Special case for 'raw': there is no sub-type, we just fake the
+    # sub-type to be 'raw' as well.
+    [ "${type}" != "raw" ] || sub_type="raw"
+
     [ -n "${sub_type}" ] || error "'%s': unspecified %s_type\n" "${img}" "${type}"
     if [ ! -f "fs/custom/${type}/${sub_type}" ]; then
         error "'%s': unknown %s_type '%s'\n" "${img}" "${type}" "${sub_type}"
diff --git a/fs/custom/raw/pre-post b/fs/custom/raw/pre-post
new file mode 100644
index 0000000..af4bcf5
--- /dev/null
+++ b/fs/custom/raw/pre-post
@@ -0,0 +1,14 @@
+#-----------------------------------------------------------------------------
+# No dependencies
+
+#-----------------------------------------------------------------------------
+do_image_pre() {
+    :
+}
+
+#-----------------------------------------------------------------------------
+do_image_post() {
+    :
+}
+
+#vim: set ft=sh
diff --git a/fs/custom/raw/raw b/fs/custom/raw/raw
new file mode 100644
index 0000000..3cbee48
--- /dev/null
+++ b/fs/custom/raw/raw
@@ -0,0 +1,12 @@
+# Generate a partition from a plain file
+
+#-----------------------------------------------------------------------------
+# No extra dependencies
+
+#-----------------------------------------------------------------------------
+do_image() {
+    # ${1} is the root_dir, which is irrelevant here
+    local img="${2}"
+
+    dd if="${BINARIES_DIR}/${raw_file}" of="${img}" bs=4096 conv=sparse 2>/dev/null
+}
-- 
1.8.1.2
