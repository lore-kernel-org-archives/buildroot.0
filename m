From: Graham Leva <celaxodon@gmail.com>
Date: Fri,  6 Nov 2020 18:29:25 -0600
Subject: [Buildroot] [PATCH 1/1] package/linux-nvidia: add nvidia linux
 kernel extensions package
In-Reply-To: <20201107002925.6561-1-celaxodon@gmail.com>
References: <20201107002925.6561-1-celaxodon@gmail.com>
Message-ID: <20201107002925.6561-2-celaxodon@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A required dependency for building NVIDIA's Linux for Tegra
kernel for the Jetson line of boards.

Signed-off-by: Graham Leva <celaxodon@gmail.com>
---
 DEVELOPERS                             |  3 +++
 linux/Config.ext.in                    | 10 ++++++++++
 package/Config.in                      |  1 +
 package/linux-nvidia/Config.in         |  7 +++++++
 package/linux-nvidia/linux-nvidia.hash |  2 ++
 package/linux-nvidia/linux-nvidia.mk   | 20 ++++++++++++++++++++
 6 files changed, 43 insertions(+)
 create mode 100644 package/linux-nvidia/Config.in
 create mode 100644 package/linux-nvidia/linux-nvidia.hash
 create mode 100644 package/linux-nvidia/linux-nvidia.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index b245c1cd7e..391688c1c9 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1036,6 +1036,9 @@ F:	package/libsrtp/
 F:	package/libwebsock/
 F:	package/sofia-sip/
 
+N:  Graham Leva <celaxodon@gmail.com>
+F:  package/linux-nvidia/
+
 N:	Grzegorz Blach <grzegorz@blach.pl>
 F:	fs/f2fs/
 F:	package/bluez5_utils-headers/
diff --git a/linux/Config.ext.in b/linux/Config.ext.in
index 734a52a533..e817b4da13 100644
--- a/linux/Config.ext.in
+++ b/linux/Config.ext.in
@@ -52,6 +52,16 @@ config BR2_LINUX_KERNEL_EXT_RTAI
 	help
 	  RTAI Kernel part.
 
+#-------------------------------------------------------------------------------
+# NVIDIA Linux Tegra drivers and patches
+config BR2_LINUX_KERNEL_EXT_LINUX_NVIDIA
+    bool "NVIDIA Linux Tegra drivers and patches"
+    select BR2_PACKAGE_LINUX_NVIDIA
+    help
+      NVIDIA Linux Tegra kernel drivers and patches
+
+      https://developer.nvidia.com/embedded/linux-tegra
+
 #-------------------------------------------------------------------------------
 # ev3dev Linux drivers
 config BR2_LINUX_KERNEL_EXT_EV3DEV_LINUX_DRIVERS
diff --git a/package/Config.in b/package/Config.in
index 504cfec98e..e677f0acea 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -481,6 +481,7 @@ endmenu
 	source "package/libubootenv/Config.in"
 	source "package/libuio/Config.in"
 	source "package/linux-backports/Config.in"
+        source "package/linux-nvidia/Config.in"
 	source "package/linux-serial-test/Config.in"
 	source "package/linuxconsoletools/Config.in"
 	source "package/lirc-tools/Config.in"
diff --git a/package/linux-nvidia/Config.in b/package/linux-nvidia/Config.in
new file mode 100644
index 0000000000..6693d59a96
--- /dev/null
+++ b/package/linux-nvidia/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LINUX_NVIDIA
+	bool "Linux for Tegra"
+	depends on BR2_LINUX_KERNEL
+	help
+	  NVIDIA Linux source code for Tegra
+
+	  https://developer.nvidia.com/embedded/linux-tegra
diff --git a/package/linux-nvidia/linux-nvidia.hash b/package/linux-nvidia/linux-nvidia.hash
new file mode 100644
index 0000000000..394d5ca193
--- /dev/null
+++ b/package/linux-nvidia/linux-nvidia.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  ed1102afdce44bad4a016c95f361d281129f2125b8fd5616c837b7e8224eccd0  linux-nvidia-tegra-l4t-r32.4.2.tar.gz
diff --git a/package/linux-nvidia/linux-nvidia.mk b/package/linux-nvidia/linux-nvidia.mk
new file mode 100644
index 0000000000..c460ea1a66
--- /dev/null
+++ b/package/linux-nvidia/linux-nvidia.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# NVIDIA Linux for Tegra
+#
+################################################################################
+
+LINUX_NVIDIA_VERSION = tegra-l4t-r32.4.2
+LINUX_NVIDIA_SITE = git://nv-tegra.nvidia.com/linux-nvidia.git
+LINUX_NVIDIA_LICENSE = GPL-2.0
+LINUX_NVIDIA_LICENSE_FILES = drivers/Makefile
+
+# Must be defined here as well as in hardware-nvidia packages
+export NV_BUILD_KERNEL_DTS_ROOT=$(BUILD_DIR)/hardware/nvidia
+
+# L4T build process requires specific directory layouts
+define LINUX_NVIDIA_CONFIGURE_CMDS
+	ln -s $(BUILD_DIR)/linux-nvidia-$(LINUX_NVIDIA_VERSION) $(BUILD_DIR)/nvidia
+endef
+
+$(eval $(generic-package))
-- 
2.17.1
