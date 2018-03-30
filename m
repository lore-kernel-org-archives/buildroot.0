From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 30 Mar 2018 18:59:16 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] linux: add
 BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF
Message-ID: <20180330193201.8070A811AD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=803f16c9671b503a265a39d7b94fba0acd2b3c4c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Some Linux kernel configuration options (such as CONFIG_UNWINDER_ORC)
require building a host program that needs libelf.

Users who have libelf installed on their system won't see a problem,
but users who don't have libelf installed will get a build
failure. Therefore, this commit adds an option that allows a user to
indicate that his Linux kernel configuration requires libelf. When
this option is enabled, we add host-elfutils to the dependencies of
the linux package (host-elfutils provides the libelf library).

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit f7cd72b3d4e2b1d993c293e355e350bedbed4eab)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in | 13 +++++++++++++
 linux/linux.mk  |  4 ++++
 2 files changed, 17 insertions(+)

diff --git a/linux/Config.in b/linux/Config.in
index e91bdb99c7..9024f73f53 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -404,6 +404,19 @@ config BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL
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
index 359f21c75c..8ef2b03445 100644
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
