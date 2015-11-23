From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 23 Nov 2015 15:47:59 +0100
Subject: [Buildroot] [PATCH 29/51] arch/xtensa: add definitions for the
	Xtensa overlay
In-Reply-To: <cover.1448289515.git.yann.morin.1998@free.fr>
References: <cover.1448289515.git.yann.morin.1998@free.fr>
Message-ID: <4c372d76860963d216171e24eb1ca58b9c05b751.1448289515.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, we have four packages that need to use the Xtensa overlay:
binutils, gcc-initial, gcc and gdb. However, they all use three
different ways to check for, and use the overlay. Furthermore, two of
them define the same variable: XTENSA_CORE_NAME is defined both by
binutils and gdb

In order to sanitise that, have the Xtensa architecture export the
appropriate variables: the name of the core and the path to the overlay
tarball. Packages can then check and use those variables.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 arch/arch.mk.xtensa | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 arch/arch.mk.xtensa

diff --git a/arch/arch.mk.xtensa b/arch/arch.mk.xtensa
new file mode 100644
index 0000000..7c8beb1
--- /dev/null
+++ b/arch/arch.mk.xtensa
@@ -0,0 +1,15 @@
+################################################################################
+# Those two variables can be used by packages that need to extract the overlay.
+#
+# ARCH_XTENSA_CORE_NAME   is the name of the Xtensa core; empty if none or the
+#                         standard 'fsf' core.
+# ARCH_XTENSA_OVERLAY_TAR is the path to the overlay tarball; only valid when
+#                         ARCH_XTENSA_CORE_NAME is not empty.
+#
+# Example:
+#   ifneq ($(ARCH_XTENSA_CORE_NAME),)
+#       tar xf $(ARCH_XTENSA_OVERLAY_TAR) -C $(@D) --strip-components=1 gcc
+#   endif
+################################################################################
+ARCH_XTENSA_CORE_NAME = $(call qstrip,$(BR2_XTENSA_CORE_NAME))
+ARCH_XTENSA_OVERLAY_TAR = $(call qstrip,$(BR2_XTENSA_OVERLAY_DIR))/xtensa_$(ARCH_XTENSA_CORE_NAME).tar
-- 
1.9.1
