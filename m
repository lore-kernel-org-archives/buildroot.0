From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  3 May 2020 15:10:00 +0200
Subject: [Buildroot] [PATCH 2/3 v2] package/kmod: add option for host variant
In-Reply-To: <cover.1588511382.git.yann.morin.1998@free.fr>
References: <cover.1588511382.git.yann.morin.1998@free.fr>
Message-ID: <8975bac482a23ce136b832dfa569b37335dcefe8.1588511382.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Curently, host-kmod has no option to enable it, because only
the kernel depends on it, and this is unconditional (because
we can't know if modules will be enabled in the kernel config).

But we're soon to add options to enable various features of
kmod, so we'll need a place where to show those features.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Cc: Lucian Buga <lucianbuga@gmail.com>
---
 linux/Config.in             | 1 +
 package/Config.in.host      | 1 +
 package/kmod/Config.in.host | 6 ++++++
 3 files changed, 8 insertions(+)
 create mode 100644 package/kmod/Config.in.host

diff --git a/linux/Config.in b/linux/Config.in
index d7373ab25a..231d5a5962 100644
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
index f1246c708f..140ffa7198 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -38,6 +38,7 @@ menu "Host utilities"
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
-- 
2.20.1
