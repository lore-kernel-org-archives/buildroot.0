From: Max Filippov <jcmvbkbc@gmail.com>
Date: Sun,  9 Jul 2017 05:22:00 -0700
Subject: [Buildroot] [PATCH v2 6/7] linux: apply xtensa overlay
In-Reply-To: <1499602921-25097-1-git-send-email-jcmvbkbc@gmail.com>
References: <1499602921-25097-1-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <1499602921-25097-7-git-send-email-jcmvbkbc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Xtensa core configuration must be added to linux before it can be
built for that xtensa CPU variant. Extract configuration files from the
xtensa overlay as is done for other packages that need to be configured
for a specific xtensa core.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
Changes v1->v2:
- replace ARCH_XTENSA_CORE_NAME with ARCH_XTENSA_OVERLAY_FILE in overlay
  application conditions in package makefile;
- add ARCH_XTENSA_OVERLAY_URL to EXTRA_DOWNLOADS in package makefile.

 arch/arch.mk.xtensa | 2 +-
 linux/linux.mk      | 8 ++++++++
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/arch.mk.xtensa b/arch/arch.mk.xtensa
index ba3e3025b7d0..8841b4f9d363 100644
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
index b0e974774af9..032d64fc22e3 100644
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
-- 
2.1.4
