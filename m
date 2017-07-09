From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 9 Jul 2017 17:03:37 +0200
Subject: [Buildroot] [git commit] linux: apply xtensa overlay
Message-ID: <20170709151526.E908481D36@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b7310c8d07a415f50c34a159bd93ddd0c4476ed7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Xtensa core configuration must be added to linux before it can be
built for that xtensa CPU variant. Extract configuration files from the
xtensa overlay as is done for other packages that need to be configured
for a specific xtensa core.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 arch/arch.mk.xtensa | 2 +-
 linux/linux.mk      | 8 ++++++++
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/arch.mk.xtensa b/arch/arch.mk.xtensa
index 1bc700a..7eb6715 100644
--- a/arch/arch.mk.xtensa
+++ b/arch/arch.mk.xtensa
@@ -23,7 +23,7 @@ endif
 # arch-xtensa-overlay-extract -- extract an extensa overlay
 #
 # argument 1 is the path in which to extract
-# argument 2 is the component to extract, one of: gcc, binutils, gdb
+# argument 2 is the component to extract, one of: gcc, binutils, gdb, linux
 #
 # Example:
 #   $(call arch-xtensa-overlay-extract,/path/to/overlay.tar,$(@D),gcc)
diff --git a/linux/linux.mk b/linux/linux.mk
index b0e9747..032d64f 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -86,6 +86,14 @@ ifeq ($(BR2_PACKAGE_HOST_UBOOT_TOOLS),y)
 LINUX_DEPENDENCIES += host-uboot-tools
 endif
 
+ifneq ($(ARCH_XTENSA_OVERLAY_FILE),)
+define LINUX_XTENSA_OVERLAY_EXTRACT
+	$(call arch-xtensa-overlay-extract,$(@D),linux)
+endef
+LINUX_POST_EXTRACT_HOOKS += LINUX_XTENSA_OVERLAY_EXTRACT
+LINUX_EXTRA_DOWNLOADS += $(ARCH_XTENSA_OVERLAY_URL)
+endif
+
 LINUX_MAKE_FLAGS = \
 	HOSTCC="$(HOSTCC)" \
 	HOSTCFLAGS="$(HOSTCFLAGS)" \
