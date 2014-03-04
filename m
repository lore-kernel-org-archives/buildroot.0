From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Mar 2014 19:16:36 +0100
Subject: [Buildroot] [git commit] Revert "linux: check the configuration
	file exists"
Message-ID: <20140304181827.3C11690409@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=69628fc16f429d5eedc2b7dfe03fd328c7b282be
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit b4cacbf5b15db06132b5f401d39b4c8d4e79158e. The
whole host-lzop optional dependency logic cannot work, since the
configuration file will only be known after the kernel sources are
extracted, if an internal kernel defconfig is used, which is quite
common.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 linux/linux.mk |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index ec7dfc3..cf728aa 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -166,10 +166,6 @@ else ifeq ($(BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG),y)
 KERNEL_SOURCE_CONFIG = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE))
 endif
 
-ifeq ($(wildcard $(KERNEL_SOURCE_CONFIG)),)
-$(error Configuration file '$(KERNEL_SOURCE_CONFIG)' not found.)
-endif
-
 ifeq ($(call KCONFIG_GET_OPT,CONFIG_KERNEL_LZO,$(KERNEL_SOURCE_CONFIG)),y)
 LINUX_DEPENDENCIES += host-lzop
 endif
