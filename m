From: Max Filippov <jcmvbkbc@gmail.com>
Date: Tue, 14 Mar 2017 11:30:51 -0700
Subject: [Buildroot] [PATCH 22/23] uboot: apply xtensa overlay
In-Reply-To: <1489516252-3803-1-git-send-email-jcmvbkbc@gmail.com>
References: <1489516252-3803-1-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <1489516252-3803-23-git-send-email-jcmvbkbc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Xtensa core configuration must be added to U-Boot before it can be
built for that xtensa CPU variant. Extract configuration files from the
xtensa overlay as is done for other packages that need to be configured
for a specific xtensa core.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 arch/arch.mk.xtensa | 5 +++--
 boot/uboot/uboot.mk | 3 +++
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arch.mk.xtensa b/arch/arch.mk.xtensa
index e09d487..4e9d33a 100644
--- a/arch/arch.mk.xtensa
+++ b/arch/arch.mk.xtensa
@@ -23,7 +23,8 @@ endif
 # arch-xtensa-overlay-extract -- extract an extensa overlay
 #
 # argument 1 is the path in which to extract
-# argument 2 is the component to extract, one of: gcc, binutils, gdb, linux
+# argument 2 is the component to extract, one of: gcc, binutils, gdb, linux,
+#            u-boot
 #
 # Example:
 #   $(call arch-xtensa-overlay-extract,/path/to/overlay.tar,$(@D),gcc)
@@ -43,7 +44,7 @@ endef
 #
 # Packages that call that macro shall define FOO_ARCH_XTENSA_OVERLAY_COMPONENT
 # and set it to one of the component to extract, one of: binutils, gcc, gdb,
-# linux
+# linux, u-boot
 #
 ################################################################################
 define arch-xtensa-overlay-inner
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 1e22eaa..8cabc17 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -153,6 +153,9 @@ endef
 UBOOT_POST_EXTRACT_HOOKS += UBOOT_COPY_OLD_LICENSE_FILE
 UBOOT_POST_RSYNC_HOOKS += UBOOT_COPY_OLD_LICENSE_FILE
 
+UBOOT_ARCH_XTENSA_OVERLAY_COMPONENT = u-boot
+$(eval $(arch-xtensa-overlay))
+
 # Analogous code exists in linux/linux.mk. Basically, the generic
 # package infrastructure handles downloading and applying remote
 # patches. Local patches are handled depending on whether they are
-- 
2.1.4
