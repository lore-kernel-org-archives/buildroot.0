From: Martin Hicks <mort@bork.org>
Date: Tue, 8 Feb 2011 16:25:55 -0500
Subject: [Buildroot] [RFC] [PATCH] Add support for external kernel source
	directory
Message-ID: <20110208212555.GA17345@darwin.bork.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi,

I wanted to compile a kernel from an external git tree, so adding
support for using this tree as the kernel source for buildroot
seemed logical.

The thing I'm seeking comments on is my short-circuiting of
the .stamp_{downloaded,extraced,patched} bits.  Can someone
suggest a more elegant way of doing this?

..I removed patching support, since you should probably be using
some other tool to manage patches in the external tree anyways.

Comments appreciated:


Useful for those of us who develop against an external git tree.

Signed-off-by: Martin Hicks <mort@bork.org>
---
 linux/Config.in |   13 +++++++++++++
 linux/linux.mk  |    6 ++++++
 2 files changed, 19 insertions(+), 0 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 17aa29a..2913e7c 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -16,6 +16,7 @@ if BR2_LINUX_KERNEL
 #     version as the kernel headers
 #  3. A custom stable version
 #  4. A custom tarball
+#  5. An external tree
 #
 choice
 	prompt "Kernel version"
@@ -47,6 +48,12 @@ config BR2_LINUX_KERNEL_CUSTOM_TARBALL
 	  This option allows to specify the http or ftp location of a
 	  specific kernel source tarball
 
+config BR2_LINUX_KERNEL_CUSTOM_DIRECTORY
+	bool "Custom directory"
+	help
+	  This option allows to specify an external directory that
+	  contains an expanded kernel source tree
+
 endchoice
 
 config BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE
@@ -58,12 +65,17 @@ config BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION
 	string "URL of custom kernel tarball"
 	depends on BR2_LINUX_KERNEL_CUSTOM_TARBALL
 
+config BR2_LINUX_KERNEL_CUSTOM_DIRECTORY_LOCATION
+	string "Path of custom kernel source directory"
+	depends on BR2_LINUX_KERNEL_CUSTOM_DIRECTORY
+
 config BR2_LINUX_KERNEL_VERSION
 	string
 	default "2.6.37" if BR2_LINUX_KERNEL_2_6_37
 	default BR2_DEFAULT_KERNEL_HEADERS if BR2_LINUX_KERNEL_SAME_AS_HEADERS
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE if BR2_LINUX_KERNEL_CUSTOM_VERSION
 	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL
+	default "custom" if BR2_LINUX_KERNEL_CUSTOM_DIRECTORY
 
 #
 # Patch selection
@@ -71,6 +83,7 @@ config BR2_LINUX_KERNEL_VERSION
 
 config BR2_LINUX_KERNEL_PATCH
 	string "Custom kernel patches"
+	depends on !BR2_LINUX_KERNEL_CUSTOM_DIRECTORY
 	help
 	  A space-separated list of patches to apply to the
 	  kernel. Each patch can be described as an URL, a local file
diff --git a/linux/linux.mk b/linux/linux.mk
index 2bc2efe..e38ba9c 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -18,6 +18,12 @@ endif
 LINUX26_DIR:=$(BUILD_DIR)/linux-$(LINUX26_VERSION)
 LINUX26_PATCH=$(call qstrip,$(BR2_LINUX_KERNEL_PATCH))
 
+# The directory gets overridden if custom directory is selected
+ifeq ($(BR2_LINUX_KERNEL_CUSTOM_DIRECTORY),y)
+LINUX26_DIR=$(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_DIRECTORY_LOCATION))
+$(shell touch $(LINUX26_DIR)/.stamp_downloaded $(LINUX26_DIR)/.stamp_extracted $(LINUX26_DIR)/.stamp_patched)
+endif
+
 LINUX26_MAKE_FLAGS = \
 	HOSTCC="$(HOSTCC)" \
 	HOSTCFLAGS="$(HOSTCFLAGS)" \
-- 
1.5.6.5



-- 
Martin Hicks P.Eng.    |      mort at bork.org
Bork Consulting Inc.   |  +1 (613) 266-2296
