From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 31 Jul 2018 22:16:17 +0200
Subject: [Buildroot] [PATCH] linux: kconfig needs the toolchain
Message-ID: <20180731201617.20829-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Starting with linux-4.18, the kconfig from the kernel can call
to the compiler to test its capabilities; see:

    https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/scripts/Kconfig.include

Like is done in the kconfig-package infra for the dependency on
$(1)-patch, we use an order-only prerequisites on the toolchain,
to guarantee the compiler is available before we can display the
kconfig of the kernel.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
 linux/linux.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/linux/linux.mk b/linux/linux.mk
index 7527b11673..63c649ce83 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -510,6 +510,13 @@ endif # BR_BUILDING
 
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
