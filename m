From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 18 Sep 2014 21:39:29 +0200
Subject: [Buildroot] [PATCH 06 of 13] manual/user guide/customization: add
 section on device/permission tables
In-Reply-To: <patchbomb.1411069163@localhost>
References: <patchbomb.1411069163@localhost>
Message-ID: <38c4c958d5d944cad16b.1411069169@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds basic documentation on device and permission tables, a topic
which was currently not yet covered in the manual.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 docs/manual/customize-device-permission-tables.txt |  30 ++++++++++++++
 docs/manual/customize-rootfs.txt                   |   2 +
 docs/manual/customize.txt                          |   4 +
 3 files changed, 36 insertions(+), 0 deletions(-)

diff --git a/docs/manual/customize-device-permission-tables.txt b/docs/manual/customize-device-permission-tables.txt
new file mode 100644
--- /dev/null
+++ b/docs/manual/customize-device-permission-tables.txt
@@ -0,0 +1,30 @@
+// -*- mode:doc; -*-
+// vim: set syntax=asciidoc:
+
+[[customize-device-permission]]
+==== Setting file permissions and ownership and adding custom devices nodes
+
+Sometimes it is needed to set specific permissions or ownership on files
+or device nodes. For example, certain files may need to be owned by
+root.  Since the post-build scripts are not run as root, you cannot do
+such changes from there unless you use an explicit fakeroot from the
+post-build script.
+
+Instead, Buildroot provides support for so-called _permission tables_.
+To use this feature, set config option +BR2_ROOTFS_DEVICE_TABLE+ to a
+space-separated list of permission tables, regular text files following
+the xref:makedev-syntax[makedev syntax].
+
+If you are using a static device table (i.e. not using +devtmpfs+,
++mdev+, or +(e)udev+) then you can add device nodes using the same
+syntax, in so-called _device tables_. To use this feature, set config
+option +BR2_ROOTFS_STATIC_DEVICE_TABLE+ to a space-separated list of
+device tables.
+
+As shown in xref:customize-dir-structure[], the recommended location for
+such files is +board/<company>/<boardname>/+.
+
+It should be noted that if the specific permissions or device nodes are
+related to a specific application, you should set variables
++FOO_PERMISSIONS+ and +FOO_DEVICES+ in the package's +.mk+ file instead
+(see xref:generic-package-reference[]).
diff --git a/docs/manual/customize-rootfs.txt b/docs/manual/customize-rootfs.txt
--- a/docs/manual/customize-rootfs.txt
+++ b/docs/manual/customize-rootfs.txt
@@ -97,3 +97,5 @@
 This method is not recommended because it duplicates the entire
   skeleton, which prevents taking advantage of the fixes or improvements
   brought to the default skeleton in later Buildroot releases.
+
+include::customize-device-permission-tables.txt[]
diff --git a/docs/manual/customize.txt b/docs/manual/customize.txt
--- a/docs/manual/customize.txt
+++ b/docs/manual/customize.txt
@@ -16,6 +16,10 @@
      +BR2_ROOTFS_POST_BUILD_SCRIPT+)
   ** running arbitrary commands prior to generating the filesystem image
      (using +BR2_ROOTFS_POST_BUILD_SCRIPT+)
+  ** setting file permissions and ownership (using
+     +BR2_ROOTFS_DEVICE_TABLE+)
+  ** adding custom devices nodes (using
+     +BR2_ROOTFS_STATIC_DEVICE_TABLE+)
 * running arbitrary commands after generating the filesystem image
   (using +BR2_ROOTFS_POST_IMAGE_SCRIPT+)
 * adding project-specific patches to some packages (using
