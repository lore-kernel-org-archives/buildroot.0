From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 3 Feb 2019 20:27:41 +0100
Subject: [Buildroot] [git commit] linux: add option to enable support for
 Device Tree overlays
Message-ID: <20190203192721.3432883689@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=eb37deb670c6f9024751fe43eaf1381f2b832a6d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add an option to compile device trees in Linux with symbol generation
such that device tree overlays can be loaded on the target system

Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
[Arnout: remove "default n" and move setting of LINUX_MAKE_ENV to the
 place where the rest is set.]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 linux/Config.in | 8 ++++++++
 linux/linux.mk  | 4 ++++
 2 files changed, 12 insertions(+)

diff --git a/linux/Config.in b/linux/Config.in
index 4f6ae2e9ee..8b04471008 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -394,6 +394,14 @@ config BR2_LINUX_KERNEL_CUSTOM_DTS_PATH
 	  You can provide a list of dts paths to copy and
 	  build, separated by spaces.
 
+config BR2_LINUX_KERNEL_DTB_OVERLAY_SUPPORT
+	bool "Build Device Tree with overlay support"
+	help
+	  If enabled, pass the "-@" option to dtc, such that
+	  symbols are generated in the compiled Device Tree.
+	  Choose this option to support Device Tree overlays
+	  on the target system.
+
 endif
 
 config BR2_LINUX_KERNEL_INSTALL_TARGET
diff --git a/linux/linux.mk b/linux/linux.mk
index 02def89113..62068106e0 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -143,6 +143,10 @@ ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_8),y)
 LINUX_MAKE_ENV += KCFLAGS=-Wno-attribute-alias
 endif
 
+ifeq ($(BR2_LINUX_KERNEL_DTB_OVERLAY_SUPPORT),y)
+LINUX_MAKE_ENV += DTC_FLAGS=-@
+endif
+
 # Get the real Linux version, which tells us where kernel modules are
 # going to be installed in the target filesystem.
 LINUX_VERSION_PROBED = `$(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) --no-print-directory -s kernelrelease 2>/dev/null`
