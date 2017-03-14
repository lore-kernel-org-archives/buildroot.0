From: Max Filippov <jcmvbkbc@gmail.com>
Date: Tue, 14 Mar 2017 11:30:50 -0700
Subject: [Buildroot] [PATCH 21/23] linux: apply xtensa overlay
In-Reply-To: <1489516252-3803-1-git-send-email-jcmvbkbc@gmail.com>
References: <1489516252-3803-1-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <1489516252-3803-22-git-send-email-jcmvbkbc@gmail.com>
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
 arch/arch.mk.xtensa | 5 +++--
 linux/linux.mk      | 3 +++
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arch.mk.xtensa b/arch/arch.mk.xtensa
index 9edbcfb..e09d487 100644
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
@@ -42,7 +42,8 @@ endef
 #            for host packages
 #
 # Packages that call that macro shall define FOO_ARCH_XTENSA_OVERLAY_COMPONENT
-# and set it to one of the component to extract, one of: binutils, gcc, gdb.
+# and set it to one of the component to extract, one of: binutils, gcc, gdb,
+# linux
 #
 ################################################################################
 define arch-xtensa-overlay-inner
diff --git a/linux/linux.mk b/linux/linux.mk
index 7f4432e..81f3d7e 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -82,6 +82,9 @@ ifeq ($(BR2_LINUX_KERNEL_UBOOT_IMAGE),y)
 LINUX_DEPENDENCIES += host-uboot-tools
 endif
 
+LINUX_ARCH_XTENSA_OVERLAY_COMPONENT = linux
+$(eval $(arch-xtensa-overlay))
+
 LINUX_MAKE_FLAGS = \
 	HOSTCC="$(HOSTCC)" \
 	HOSTCFLAGS="$(HOSTCFLAGS)" \
-- 
2.1.4
