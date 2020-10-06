From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 6 Oct 2020 21:43:35 +0200
Subject: [Buildroot] [git commit] package/kmod: add option for host variant
Message-ID: <20201006193503.2714C80E36@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4ca9edaad2fae69ebe02b70065808b44b98c9d4f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Curently, host-kmod has no option to enable it, because only
the kernel depends on it, and this is unconditional (because
we can't know if modules will be enabled in the kernel config).

But we're soon to add options to enable various features of
kmod, so we'll need a place where to show those features.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Cc: Lucian Buga <lucianbuga@gmail.com>
Tested-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 linux/Config.in             | 1 +
 package/Config.in.host      | 1 +
 package/kmod/Config.in.host | 6 ++++++
 3 files changed, 8 insertions(+)

diff --git a/linux/Config.in b/linux/Config.in
index 619fed86dc..5bd3cdb59b 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -2,6 +2,7 @@ menu "Kernel"
 
 config BR2_LINUX_KERNEL
 	bool "Linux Kernel"
+	select BR2_PACKAGE_HOST_KMOD # Unconditional, even if modules not enabled
 	select BR2_PACKAGE_HOST_IMAGEMAGICK if BR2_LINUX_KERNEL_CUSTOM_LOGO_PATH != ""
 	help
 	  Enable this option if you want to build a Linux kernel for
diff --git a/package/Config.in.host b/package/Config.in.host
index 58b600d948..546f1c226d 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -39,6 +39,7 @@ menu "Host utilities"
 	source "package/imx-usb-loader/Config.in.host"
 	source "package/jq/Config.in.host"
 	source "package/jsmin/Config.in.host"
+	source "package/kmod/Config.in.host"
 	source "package/libp11/Config.in.host"
 	source "package/lld/Config.in.host"
 	source "package/lpc3250loader/Config.in.host"
diff --git a/package/kmod/Config.in.host b/package/kmod/Config.in.host
new file mode 100644
index 0000000000..ea99a790f6
--- /dev/null
+++ b/package/kmod/Config.in.host
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_HOST_KMOD
+	bool "host kmod"
+	help
+	  kmod is a set of tools to handle common tasks with Linux
+	  kernel modules like insert, remove, list, check properties,
+	  resolve dependencies and aliases.
