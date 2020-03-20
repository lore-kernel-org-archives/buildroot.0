From: unixmania at gmail.com <unixmania@gmail.com>
Date: Fri, 20 Mar 2020 20:35:44 -0300
Subject: [Buildroot] [[PATCH RFC] 3/6] linux: run depmod in a
 target-finalize hook
In-Reply-To: <20200320233547.28586-1-unixmania@gmail.com>
References: <20200320233547.28586-1-unixmania@gmail.com>
Message-ID: <20200320233547.28586-4-unixmania@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <unixmania@gmail.com>

If a package installs a kernel module then it's necessary to run depmod
afterwards, otherwise modprobe fails at run-time, because the module is
not included in /lib/modules/<kernel-version>/modules.dep.

Pass a dummy depmod (/dev/null) to the kernel build, since we don't want
to run depmod after installing the kernel.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
---
 linux/linux.mk | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index f8c34c3dca..a5756148cc 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -127,12 +127,14 @@ LINUX_POST_EXTRACT_HOOKS += LINUX_XTENSA_OVERLAY_EXTRACT
 LINUX_EXTRA_DOWNLOADS += $(ARCH_XTENSA_OVERLAY_URL)
 endif
 
+# We don't want to run depmod after installing the kernel. It's done in a
+# target-finalize hook, to encompass modules installed by packages.
 LINUX_MAKE_FLAGS = \
 	HOSTCC="$(HOSTCC) $(HOST_CFLAGS) $(HOST_LDFLAGS)" \
 	ARCH=$(KERNEL_ARCH) \
 	INSTALL_MOD_PATH=$(TARGET_DIR) \
 	CROSS_COMPILE="$(TARGET_CROSS)" \
-	DEPMOD=$(HOST_DIR)/sbin/depmod
+	DEPMOD="/dev/null"
 
 ifeq ($(BR2_REPRODUCIBLE),y)
 LINUX_MAKE_ENV += \
@@ -534,6 +536,13 @@ define LINUX_INSTALL_TARGET_CMDS
 	$(LINUX_INSTALL_HOST_TOOLS)
 endef
 
+# Run depmod in a target-finalize hook, to encompass modules installed by
+# packages.
+define LINUX_RUN_DEPMOD
+	$(HOST_DIR)/sbin/depmod -a -b $(TARGET_DIR) $(LINUX_VERSION_PROBED)
+endef
+LINUX_TARGET_FINALIZE_HOOKS += LINUX_RUN_DEPMOD
+
 # Include all our extensions.
 #
 # Note: our package infrastructure uses the full-path of the last-scanned
-- 
2.18.2
