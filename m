From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Mar 2017 15:49:12 +0200
Subject: [Buildroot] [git commit] arch/xtensa: add definitions for the
	Xtensa overlay
Message-ID: <20170326135524.41125825E0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bcecbed654c517cf9349c7e108d014a0831d3aed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, we have four packages that need to use the Xtensa overlay:
binutils, gcc-initial, gcc-final and gdb. However, they all use three
different ways to check for, and use the overlay. Furthermore, two of
them define the same variable: XTENSA_CORE_NAME is defined both by
binutils and gdb

In order to sanitise that, have the Xtensa architecture export the
appropriate variables: the name of the core and the path to the overlay
tarball. Packages can then check and use those variables.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 arch/arch.mk.xtensa | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

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
