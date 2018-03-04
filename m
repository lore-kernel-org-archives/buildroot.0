From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun,  4 Mar 2018 22:31:16 +0100
Subject: [Buildroot] [PATCH 02/23] linux: add
 BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF
In-Reply-To: <20180304213137.24681-1-thomas.petazzoni@bootlin.com>
References: <20180304213137.24681-1-thomas.petazzoni@bootlin.com>
Message-ID: <20180304213137.24681-3-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some Linux kernel configuration options (such as CONFIG_UNWINDER_ORC)
require building a host program that needs libelf.

Users who have libelf installed on their system won't see a problem,
but users who don't have libelf installed will get a build
failure. Therefore, this commit adds an option that allows a user to
indicate that his Linux kernel configuration requires libelf. When
this option is enabled, we add host-elfutils to the dependencies of
the linux package (host-elfutils provides the libelf library).

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 linux/Config.in | 13 +++++++++++++
 linux/linux.mk  |  4 ++++
 2 files changed, 17 insertions(+)

diff --git a/linux/Config.in b/linux/Config.in
index 663a4063e2..d1d99b2810 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -425,6 +425,19 @@ config BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL
 	  such as "scripts/extract-cert.c:21:25: fatal error:
 	  openssl/bio.h: No such file or directory".
 
+config BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF
+	bool "Needs host libelf"
+	help
+	  Some Linux kernel configuration options (such as
+	  CONFIG_UNWINDER_ORC) require building a host program that
+	  needs libelf. Enabling this option will ensure host-elfutils
+	  (which provides libelf) gets built before the Linux kernel.
+
+	  Enable this option if you get a Linux kernel build failure
+	  such as "Cannot generate ORC metadata for
+	  CONFIG_UNWINDER_ORC=y, please install libelf-dev,
+	  libelf-devel or elfutils-libelf-devel".
+
 # Linux extensions
 source "linux/Config.ext.in"
 
diff --git a/linux/linux.mk b/linux/linux.mk
index 83c57b60ad..76bf2c2ea7 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -84,6 +84,10 @@ ifeq ($(BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL),y)
 LINUX_DEPENDENCIES += host-openssl
 endif
 
+ifeq ($(BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF),y)
+LINUX_DEPENDENCIES += host-elfutils
+endif
+
 # If host-uboot-tools is selected by the user, assume it is needed to
 # create a custom image
 ifeq ($(BR2_PACKAGE_HOST_UBOOT_TOOLS),y)
-- 
2.14.3
