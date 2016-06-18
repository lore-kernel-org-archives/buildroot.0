From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Jun 2016 15:05:15 +0200
Subject: [Buildroot] [git commit] linux: allow the selection of the
	architecture's default configuration
Message-ID: <20160618130526.2EABF818C4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=53ced1f6d3da6b037d45a70ed0d8a25f5ab15142
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

To configure the Linux kernel, we currently provide two options:

 1. Passing a defconfig name (for example "multi_v7"), to which we append
    "_defconfig" to run "make multi_v7_defconfig".

 2. Passing a path to a custom configuration file.

Unfortunately, those two possibilities do not allow to configure the
kernel when you want to use the default configuration built into the
kernel for a given architecture. For example, on ARM64, there is a
single defconfig simply called "defconfig", which you can load by
running "make defconfig".

Using the mechanism (1) above doesn't work because we append
"_defconfig" automatically.

One solution would be to change (1) and require the user to enter the
full defconfig named (i.e "multi_v7_defconfig" instead of "multi_v7"),
but we would break all existing Buildroot configurations.

So instead, we add a third option, which simply tells Buildroot to use
the default configuration for the selected architecture. In this case,
Buildroot will configure the kernel by running "make defconfig".

Cc: Naresh Kamboju <naresh.kamboju@linaro.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 linux/Config.in | 8 ++++++++
 linux/linux.mk  | 2 ++
 2 files changed, 10 insertions(+)

diff --git a/linux/Config.in b/linux/Config.in
index ce55271..be6d0cc 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -142,6 +142,14 @@ choice
 config BR2_LINUX_KERNEL_USE_DEFCONFIG
 	bool "Using an in-tree defconfig file"
 
+config BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG
+	bool "Use the architecture default configuration"
+	help
+	  This option will use the default configuration for the
+	  selected architecture. I.e, it is equivalent to running
+	  "make ARCH=<foo> defconfig". This is useful on architectures
+	  that have a single defconfig file, such as ARM64.
+
 config BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG
 	bool "Using a custom (def)config file"
 
diff --git a/linux/linux.mk b/linux/linux.mk
index a751da9..fb844ef 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -206,6 +206,8 @@ LINUX_POST_PATCH_HOOKS += LINUX_TRY_PATCH_TIMECONST
 
 ifeq ($(BR2_LINUX_KERNEL_USE_DEFCONFIG),y)
 LINUX_KCONFIG_DEFCONFIG = $(call qstrip,$(BR2_LINUX_KERNEL_DEFCONFIG))_defconfig
+else ifeq ($(BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG),y)
+LINUX_KCONFIG_DEFCONFIG = defconfig
 else ifeq ($(BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG),y)
 LINUX_KCONFIG_FILE = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE))
 endif
