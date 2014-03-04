From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Mar 2014 19:15:45 +0100
Subject: [Buildroot] [git commit] Revert "linux: fix the KCONFIG_GET_OPT
	calls to be inside a BR2_LINUX_KERNEL test"
Message-ID: <20140304181827.1BC6590409@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4ff3aa2288022b50b685bce4bb72132453bcf650
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit 4ad1ea59a59f951fad072dcb19429e6f468abf05. The
whole host-lzop optional dependency logic cannot work, since the
configuration file will only be known after the kernel sources are
extracted, if an internal kernel defconfig is used, which is quite
common.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 linux/linux.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 680279c..91a5fb8 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -170,6 +170,7 @@ ifeq ($(BR2_LINUX_KERNEL),y)
 ifeq ($(wildcard $(KERNEL_SOURCE_CONFIG)),)
 $(error Configuration file '$(KERNEL_SOURCE_CONFIG)' not found.)
 endif
+endif
 
 ifeq ($(call KCONFIG_GET_OPT,CONFIG_KERNEL_LZO,$(KERNEL_SOURCE_CONFIG)),y)
 LINUX_DEPENDENCIES += host-lzop
@@ -177,7 +178,6 @@ endif
 ifeq ($(call KCONFIG_GET_OPT,CONFIG_RD_LZO,$(KERNEL_SOURCE_CONFIG)),y)
 LINUX_DEPENDENCIES += host-lzop
 endif
-endif
 
 define LINUX_CONFIGURE_CMDS
 	$(INSTALL) -m 0644 $(KERNEL_SOURCE_CONFIG) $(KERNEL_ARCH_PATH)/configs/buildroot_defconfig
