From: Michael Trimarchi <michael@amarulasolutions.com>
Date: Wed, 12 Sep 2018 21:58:32 +0200
Subject: [Buildroot] [RFC PATCH] linux: let to work with xenomai in override
 mode
Message-ID: <1536782312-12240-1-git-send-email-michael@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We would like to patch xenomai in override mode. Xenomai create
symlink in order to build the kernel and those links are absolute
one. The adeos patch is not applied if it is found so we
can change the connect hook from PRE_PATCH to PRE_CONFIGURE.
The xenomi dependence should be explicit set

Change-Id: Idc5189047451bb9ac3019d3f35674d5332159918
Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
---
 linux/linux.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 675e790..2303923 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -351,6 +351,10 @@ define LINUX_KCONFIG_FIXUP_CMDS
 		$(call KCONFIG_DISABLE_OPT,CONFIG_MXC_GPU_VIV,$(@D)/.config))
 endef
 
+ifneq ($(BR2_LINUX_KERNEL_EXT_XENOMAI_ADEOS_PATCH),)
+LINUX_DEPENDENCIES += xenomai
+endif
+
 ifeq ($(BR2_LINUX_KERNEL_DTS_SUPPORT),y)
 # Starting with 4.17, the generated dtc parser code is no longer
 # shipped with the kernel sources, so we need flex and bison. For
@@ -485,7 +489,7 @@ include $(sort $(wildcard linux/linux-ext-*.mk))
 LINUX_PATCH_DEPENDENCIES += $(foreach ext,$(LINUX_EXTENSIONS),\
 	$(if $(BR2_LINUX_KERNEL_EXT_$(call UPPERCASE,$(ext))),$(ext)))
 
-LINUX_PRE_PATCH_HOOKS += $(foreach ext,$(LINUX_EXTENSIONS),\
+LINUX_PRE_CONFIGURE_HOOKS += $(foreach ext,$(LINUX_EXTENSIONS),\
 	$(if $(BR2_LINUX_KERNEL_EXT_$(call UPPERCASE,$(ext))),\
 		$(call UPPERCASE,$(ext))_PREPARE_KERNEL))
 
-- 
2.7.4
