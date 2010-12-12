From: Mike Frysinger <vapier@gentoo.org>
Date: Sun, 12 Dec 2010 11:25:23 -0500
Subject: [Buildroot] [PATCH] toolchain-external: check sysroot *after*
	copying
Message-ID: <1292171123-32551-1-git-send-email-vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The current toolchain checking code will probe the files in the sysroot to
make sure things are sane, but it does this *before* it actually copies
the files in question over.  Thus from a clean build, it's impossible to
actually use the external toolchain option.

So re-order things so we initialize the local sysroot first and then check
the result.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 toolchain/toolchain-external/ext-tool.mk |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index 53ad636..a913162 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -93,11 +93,6 @@ endif
 ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
 	$(Q)$(call check_cplusplus)
 endif
-ifeq ($(BR2_TOOLCHAIN_EXTERNAL_UCLIBC),y)
-	$(Q)$(call check_uclibc,$(SYSROOT_DIR))
-else
-	$(Q)$(call check_glibc,$(SYSROOT_DIR))
-endif
 	mkdir -p $(TARGET_DIR)/lib
 	@echo "Copy external toolchain libraries to target..."
 	$(Q)for libs in $(LIB_EXTERNAL_LIBS); do \
@@ -112,4 +107,9 @@ endif
 	$(Q)if [ -L $(ARCH_SYSROOT_DIR)/lib64 ] ; then \
 		$(call create_lib64_symlinks) ; \
 	fi
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_UCLIBC),y)
+	$(Q)$(call check_uclibc,$(SYSROOT_DIR))
+else
+	$(Q)$(call check_glibc,$(SYSROOT_DIR))
+endif
 	@touch $@
-- 
1.7.3.3
