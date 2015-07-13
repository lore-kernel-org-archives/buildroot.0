From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 13 Jul 2015 12:31:59 +0200
Subject: [Buildroot] [PATCH 2/7 v2] package/linux: don't enforce check for
	DTS when not building
In-Reply-To: <cover.1436783490.git.yann.morin.1998@free.fr>
References: <cover.1436783490.git.yann.morin.1998@free.fr>
Message-ID: <b57d3a1773d4395ea2e55c50f7b36a1b51b15752.1436783490.git.yann.morin.1998@free.fr>
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
Changes v1 -> v2:
  - use BR_BUILDING in its own ifeq, do not coalesce with the existing
    ifeq  (Thomas)
---
 linux/linux.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/linux/linux.mk b/linux/linux.mk
index eca1450..24bca7d 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -88,6 +88,8 @@ else ifeq ($(BR2_LINUX_KERNEL_USE_CUSTOM_DTS),y)
 KERNEL_DTS_NAME = $(basename $(filter %.dts,$(notdir $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH)))))
 endif
 
+ifeq ($(BR_BUILDING),y)
+
 ifeq ($(BR2_LINUX_KERNEL_DTS_SUPPORT)$(KERNEL_DTS_NAME),y)
 $(error No kernel device tree source specified, check your \
 BR2_LINUX_KERNEL_USE_INTREE_DTS / BR2_LINUX_KERNEL_USE_CUSTOM_DTS settings)
@@ -100,6 +102,8 @@ $(error Kernel with appended device tree needs exactly one DTS source. \
 endif
 endif
 
+endif # BR_BUILDING
+
 KERNEL_DTBS = $(addsuffix .dtb,$(KERNEL_DTS_NAME))
 
 ifeq ($(BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM),y)
-- 
1.9.1
