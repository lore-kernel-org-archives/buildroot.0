From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  1 Aug 2018 23:23:40 +0200
Subject: [Buildroot] [PATCH 3/3 v2] linux: kconfig needs the toolchain
In-Reply-To: <cover.1533158588.git.yann.morin.1998@free.fr>
References: <cover.1533158588.git.yann.morin.1998@free.fr>
Message-ID: <c524705de894ee785cb185668ab2d84a48a7218f.1533158588.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Starting with linux-4.18, the kconfig from the kernel can call
to the compiler to test its capabilities; see:

    https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/scripts/Kconfig.include

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@mind.be>

---
Changes v1 -> v2:
  - take advantage of the kconfig-package infra  (Thomas)
---
 linux/linux.mk | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 14a9e148cf..6fba92fb94 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -66,7 +66,10 @@ LINUX_DEPENDENCIES += host-kmod
 
 # Starting with 4.16, the generated kconfig code is no longer
 # shipped with the kernel sources, so we need flex and bison.
-LINUX_KCONFIG_DEPENDENCIES = host-bison host-flex
+# Starting with 4.18, the kconfig in the kernel calls the
+# cross-compiler to check its capabilities. So we need the
+# toolchain before we can call the configurators.
+LINUX_KCONFIG_DEPENDENCIES = host-bison host-flex toolchain
 
 # host tools needed for kernel compression
 ifeq ($(BR2_LINUX_KERNEL_LZ4),y)
@@ -514,6 +517,13 @@ endif # BR_BUILDING
 
 $(eval $(kconfig-package))
 
+# Starting with linux-4.18, the kconfig in the kernel calls
+# the cross-compiler to check its capabilities. So we need
+# the toolchain before we can call our configurators.
+# Also, since we need LINUX_DIR, we must be after the call
+# to kconfig-package, above.
+$(LINUX_DIR)/.config: | toolchain
+
 # Support for rebuilding the kernel after the cpio archive has
 # been generated.
 .PHONY: linux-rebuild-with-initramfs
-- 
2.14.1
