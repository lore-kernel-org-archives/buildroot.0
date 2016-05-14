From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 May 2016 16:17:11 +0200
Subject: [Buildroot] [PATCH 1/4] android-tools: fix dependency on libselinux
Message-ID: <1463235434-31134-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The fastboot sub-option of android-tools did not properly replicate the
dependency of libselinux, which it is selecting. Due to this, an invalid
configuration could be generated, with fastboot selected while thread
support is not available for example (and therefore libselinux is not
available). This problem was causing the following build failure:

 http://autobuild.buildroot.net/results/21e45cee04fd983c85c6702595ee3f7ed8470931/

This is fixed by replicating the selinux dependencies in the fastboot
sub-option and adding the relevant Config.in comment.

In addition, the main android-tools option had some logic to make sure
at least one of its sub-option is enabled: adbd by default on systems
with MMU, and fastboot by default on systems without MMU (because
fastboot is the only part that builds on noMMU systems).

However, with the new dependencies in the fastboot sub-option, this
logic would have become a lot more complicated. Since fastboot is very
unlikely to be used on noMMU systems, we simply make the whole package
not available on noMMU systems.

Cc: Gary Bisson <gary.bisson@boundarydevices.com>
Cc: Antoine Tenart <antoine.tenart@free-electrons.com>
Cc: Julien Corjon <corjon.j@ecagroup.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/android-tools/Config.in | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/package/android-tools/Config.in b/package/android-tools/Config.in
index 84f18e8..9be3f40 100644
--- a/package/android-tools/Config.in
+++ b/package/android-tools/Config.in
@@ -1,12 +1,14 @@
 config BR2_PACKAGE_ANDROID_TOOLS
 	bool "android-tools"
-	# adb/adbd needs mmu
+	# Technically, fastboot could build on noMMU systems. But
+	# since we need at least one of the three sub-options enabled,
+	# and adb/adbd can't be built on noMMU systems, and fastboot
+	# has some complicated dependencies, we simply make the whole
+	# package not available on noMMU platforms.
+	depends on BR2_USE_MMU
 	select BR2_PACKAGE_ANDROID_TOOLS_ADBD if \
 	      !BR2_PACKAGE_ANDROID_TOOLS_FASTBOOT && \
-	      !BR2_PACKAGE_ANDROID_TOOLS_ADB && \
-	      BR2_USE_MMU
-	select BR2_PACKAGE_ANDROID_TOOLS_FASTBOOT if \
-	      !BR2_USE_MMU
+	      !BR2_PACKAGE_ANDROID_TOOLS_ADB
 	help
 	  This package contains the fastboot and adb utilities, that
 	  can be used to interact with target devices using of these
@@ -18,11 +20,18 @@ config BR2_PACKAGE_ANDROID_TOOLS_FASTBOOT
 	bool "fastboot"
 	select BR2_PACKAGE_LIBSELINUX
 	select BR2_PACKAGE_ZLIB
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libselinux
+	depends on !BR2_STATIC_LIBS # libselinux
+	depends on !BR2_arc # libselinux
 	help
 	  This option will build and install the fastboot utility for
 	  the target, which can be used to reflash other target devices
 	  implementing the fastboot protocol.
 
+comment "fastboot needs a toolchain w/ threads, dynamic library"
+	depends on !BR2_arc
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+
 config BR2_PACKAGE_ANDROID_TOOLS_ADB
 	bool "adb"
 	depends on BR2_USE_MMU # uses fork()
-- 
2.7.4
