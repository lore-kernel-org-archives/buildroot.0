From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 3 Mar 2014 22:22:18 +0100
Subject: [Buildroot] [git commit] linux: check the configuration file exists
Message-ID: <20140303212321.1E6199B9F2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b4cacbf5b15db06132b5f401d39b4c8d4e79158e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

... and abort early, before we even use it.

Reported-by: Peter Korsgaard <jacmet@uclibc.org>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 linux/linux.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index cf728aa..ec7dfc3 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -166,6 +166,10 @@ else ifeq ($(BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG),y)
 KERNEL_SOURCE_CONFIG = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE))
 endif
 
+ifeq ($(wildcard $(KERNEL_SOURCE_CONFIG)),)
+$(error Configuration file '$(KERNEL_SOURCE_CONFIG)' not found.)
+endif
+
 ifeq ($(call KCONFIG_GET_OPT,CONFIG_KERNEL_LZO,$(KERNEL_SOURCE_CONFIG)),y)
 LINUX_DEPENDENCIES += host-lzop
 endif
