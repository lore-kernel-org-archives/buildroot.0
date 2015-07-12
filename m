From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 12 Jul 2015 14:11:24 +0200
Subject: [Buildroot] [PATCH 2/7] package/linux: don't enforce check for DTS
	when not building
In-Reply-To: <cover.1436702899.git.yann.morin.1998@free.fr>
References: <cover.1436702899.git.yann.morin.1998@free.fr>
Message-ID: <ff5a9ea519a5c72dd917369e6409674b9d4a340f.1436702899.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, this is triggering the error message:
    make randconfig
    make source

Limit the checks that enforce a DTS is set and at most one DTB is
appended to when we are actually building, like is done for the
configuration-file variables.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 linux/linux.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index eca1450..b2c9481 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -88,12 +88,12 @@ else ifeq ($(BR2_LINUX_KERNEL_USE_CUSTOM_DTS),y)
 KERNEL_DTS_NAME = $(basename $(filter %.dts,$(notdir $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH)))))
 endif
 
-ifeq ($(BR2_LINUX_KERNEL_DTS_SUPPORT)$(KERNEL_DTS_NAME),y)
+ifeq ($(BR_BUILDING)$(BR2_LINUX_KERNEL_DTS_SUPPORT)$(KERNEL_DTS_NAME),yy)
 $(error No kernel device tree source specified, check your \
 BR2_LINUX_KERNEL_USE_INTREE_DTS / BR2_LINUX_KERNEL_USE_CUSTOM_DTS settings)
 endif
 
-ifeq ($(BR2_LINUX_KERNEL_APPENDED_DTB),y)
+ifeq ($(BR_BUILDING)$(BR2_LINUX_KERNEL_APPENDED_DTB),yy)
 ifneq ($(words $(KERNEL_DTS_NAME)),1)
 $(error Kernel with appended device tree needs exactly one DTS source. \
 	Check BR2_LINUX_KERNEL_INTREE_DTS_NAME or BR2_LINUX_KERNEL_CUSTOM_DTS_PATH.)
-- 
1.9.1
