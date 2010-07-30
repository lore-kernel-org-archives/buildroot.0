From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 30 Jul 2010 10:24:08 +0200
Subject: [Buildroot] [git commit master 1/1] linux: more mistake detection
Message-ID: <20100730082547.C1741836C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=af5dc83da448ac6f911741d1a51ce315cb052057
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Just as we do for U-Boot, error out in the Linux kernel makefile when
the defconfig name or the configuration file path are not
correct. What prompted me to implement this was a report on IRC from
an user using BR 2010.05 and not understand why the kernel build
process was failing. It was because he just forgot to set the path of
the configuration file.

Of course, it doesn't catch all mistakes (like pointing to a
non-existing defconfig or to a non-existing configuration file), but
it at least catches basic mistakes.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 linux/linux.mk |   13 +++++++++++++
 1 files changed, 13 insertions(+), 0 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index a3e5a0c..3fc259c 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -160,3 +160,16 @@ linux26-rebuild-with-initramfs: $(LINUX26_DIR)/.stamp_initramfs_rebuilt
 ifeq ($(BR2_LINUX_KERNEL),y)
 TARGETS+=linux26
 endif
+
+# Checks to give errors that the user can understand
+ifeq ($(BR2_LINUX_KERNEL_USE_DEFCONFIG),y)
+ifeq ($(call qstrip,$(BR2_LINUX_KERNEL_DEFCONFIG)),)
+$(error No kernel defconfig name specified, check your BR2_LINUX_KERNEL_DEFCONFIG setting)
+endif
+endif
+
+ifeq ($(BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG),y)
+ifeq ($(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE)),)
+$(error No kernel configuration file specified, check your BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE setting)
+endif
+endif
\ No newline at end of file
-- 
1.7.1
