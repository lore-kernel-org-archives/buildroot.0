From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue,  1 Sep 2020 21:06:20 +0200
Subject: [Buildroot] [PATCH v2] package/gobject-introspection: disable for
 riscv32
Message-ID: <20200901190620.3507-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/e32/e323f43952b3863cedfdae765b3fb10ec6b8d889/
http://autobuild.buildroot.net/results/53e/53e7b82baa9edb342cd110717d6b8ac82d5d933c/

And many more.

qemu-user 5.0.0 for riscv32 segfaults when running the g-i qemu wrapper, so
disable gobject-introspection.  There are no autobuilder failures for next,
so it looks to be fixed in qemu 5.1.0.

As python-gobject and gst1-python select gobject-introspection, add a
BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS symbol they can depend on
rather than having to propagate the dependencies.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
Changes since v1:
- Handle reverse dependencies / add BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS

 package/gobject-introspection/Config.in  | 11 +++++++++--
 package/gstreamer1/gst1-python/Config.in |  4 ++--
 package/python-gobject/Config.in         |  4 ++--
 3 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/package/gobject-introspection/Config.in b/package/gobject-introspection/Config.in
index e312852cf2..57c569704e 100644
--- a/package/gobject-introspection/Config.in
+++ b/package/gobject-introspection/Config.in
@@ -1,7 +1,13 @@
+config BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS
+	bool
+	default y
+	depends on BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS
+	depends on !BR2_RISCV_32 # qemu-riscv32 segfaults in qemu-5.0.0
+
 config BR2_PACKAGE_GOBJECT_INTROSPECTION
 	bool "gobject-introspection"
 	depends on BR2_USE_MMU # python3, libglib2
-	depends on BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS
 	# While gcc 4.8 might be compatible with gobject-introspection,
 	# The autobuilders use some toolchains from codesourcery which
 	# have gcc 4.8 and a very old version of glibc, which will cause
@@ -34,9 +40,10 @@ config BR2_PACKAGE_GOBJECT_INTROSPECTION
 
 comment "gobject-introspection needs python3"
 	depends on !BR2_PACKAGE_PYTHON3
+	depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS
 
 comment "gobject-introspection needs a glibc toolchain, gcc >= 4.9"
 	depends on BR2_USE_MMU
-	depends on BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_USES_GLIBC || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/gstreamer1/gst1-python/Config.in b/package/gstreamer1/gst1-python/Config.in
index 9149703354..791562fea8 100644
--- a/package/gstreamer1/gst1-python/Config.in
+++ b/package/gstreamer1/gst1-python/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_GST1_PYTHON
 	bool "gst1-python"
 	depends on BR2_USE_MMU # libglib2, gobject-introspection
-	depends on BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS # gobject-introspection
+	depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS # gobject-introspection
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # gobject-introspection
 	depends on BR2_TOOLCHAIN_USES_GLIBC # gobject-introspection
 	depends on BR2_PACKAGE_PYTHON3 # gobject-introspection
@@ -19,6 +19,6 @@ comment "gst1-python needs python3"
 
 comment "gst1-python needs a glibc toolchain, gcc >= 4.9"
 	depends on BR2_USE_MMU
-	depends on BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_USES_GLIBC || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/python-gobject/Config.in b/package/python-gobject/Config.in
index d7ed437e8b..1c9303b0ba 100644
--- a/package/python-gobject/Config.in
+++ b/package/python-gobject/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_PYTHON_GOBJECT
 	bool "python-gobject"
 	depends on BR2_USE_MMU # libglib2, gobject-introspection
-	depends on BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS # gobject-introspection
+	depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS # gobject-introspection
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # gobject-introspection
 	depends on BR2_TOOLCHAIN_USES_GLIBC # gobject-introspection
 	depends on BR2_PACKAGE_PYTHON3 # gobject-introspection
@@ -14,6 +14,6 @@ config BR2_PACKAGE_PYTHON_GOBJECT
 
 comment "python-gobject needs a glibc toolchain, gcc >= 4.9"
 	depends on BR2_USE_MMU
-	depends on BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_USES_GLIBC || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
-- 
2.20.1
