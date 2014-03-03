From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 3 Mar 2014 22:55:49 +0100
Subject: [Buildroot] [git commit] linux: fix the KCONFIG_GET_OPT calls to be
	inside a BR2_LINUX_KERNEL test
Message-ID: <20140303215726.AC186828EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4ad1ea59a59f951fad072dcb19429e6f468abf05
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The KCONFIG_GET_OPT calls added by
ca80782f4571f004c2b8cf2d0e60e83343beff34 ('linux: only depend on
host-lzop if needed') are made even if the kernel package is not
selected. This hangs the linux.mk parsing as they try to read from a
file that doesn't exist.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 linux/linux.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 91a5fb8..680279c 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -170,7 +170,6 @@ ifeq ($(BR2_LINUX_KERNEL),y)
 ifeq ($(wildcard $(KERNEL_SOURCE_CONFIG)),)
 $(error Configuration file '$(KERNEL_SOURCE_CONFIG)' not found.)
 endif
-endif
 
 ifeq ($(call KCONFIG_GET_OPT,CONFIG_KERNEL_LZO,$(KERNEL_SOURCE_CONFIG)),y)
 LINUX_DEPENDENCIES += host-lzop
@@ -178,6 +177,7 @@ endif
 ifeq ($(call KCONFIG_GET_OPT,CONFIG_RD_LZO,$(KERNEL_SOURCE_CONFIG)),y)
 LINUX_DEPENDENCIES += host-lzop
 endif
+endif
 
 define LINUX_CONFIGURE_CMDS
 	$(INSTALL) -m 0644 $(KERNEL_SOURCE_CONFIG) $(KERNEL_ARCH_PATH)/configs/buildroot_defconfig
