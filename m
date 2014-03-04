From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Mar 2014 19:16:30 +0100
Subject: [Buildroot] [git commit] Revert "linux: fix check of configuration
	file existence"
Message-ID: <20140304181827.2BADC9BD19@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d30542712bc8d211466146d642874168479fb3d4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit 477c28cf1d637b224b819dd278103a05fb6f9dbb. The
whole host-lzop optional dependency logic cannot work, since the
configuration file will only be known after the kernel sources are
extracted, if an internal kernel defconfig is used, which is quite
common.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 linux/linux.mk |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 91a5fb8..ec7dfc3 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -166,11 +166,9 @@ else ifeq ($(BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG),y)
 KERNEL_SOURCE_CONFIG = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE))
 endif
 
-ifeq ($(BR2_LINUX_KERNEL),y)
 ifeq ($(wildcard $(KERNEL_SOURCE_CONFIG)),)
 $(error Configuration file '$(KERNEL_SOURCE_CONFIG)' not found.)
 endif
-endif
 
 ifeq ($(call KCONFIG_GET_OPT,CONFIG_KERNEL_LZO,$(KERNEL_SOURCE_CONFIG)),y)
 LINUX_DEPENDENCIES += host-lzop
