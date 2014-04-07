From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Mon,  7 Apr 2014 10:12:42 -0300
Subject: [Buildroot] [PATCH] toolchain-external: Introduce kernel headers
	sanitization
Message-ID: <1396876362-32296-1-git-send-email-ezequiel@vanguardiasur.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The Nios-II Sourcery external toolchain (the only Nios-II we currently
support) exports broken kernel headers. In particular, these kernels should
be exported using the "headers_install" rule which applies a set of fixes
on the kernel headers so they are suitable for userspace usage.

In order to fix this, let's introduce a compile-time hidden option, to be
selected by such broken toolchains, and perform the header fixes ourselves.
The result is equivalent to apply the "headers_install" rule.

Fixes:
http://autobuild.buildroot.net/results/c32/c32ad4bac5f651502e551f7733f702afaa0e742a/

Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
---
/me hopes this is not too ugly!

 toolchain/toolchain-external/Config.in             |  7 +++++++
 toolchain/toolchain-external/toolchain-external.mk | 15 +++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 3990336..9a3ab6f 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -434,6 +434,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
+	select BR2_TOOLCHAIN_HEADERS_SANITIZE_NEEDED
 	help
 	  Sourcery CodeBench toolchain for the Nios-II architecture,
 	  from Mentor Graphics. It uses gcc 4.7.3, binutils 2.23.52,
@@ -1206,4 +1207,10 @@ config BR2_BFIN_INSTALL_FLAT_SHARED
 	  into a buildroot rootfs image built with binary format that is not
 	  shared FLAT.
 
+# Some toolchains have their headers broken and need to be sanitized.
+# Currently, this is only needed on Nios-II external Sourcery toolchain,
+# to fix the Linux headers.
+config BR2_TOOLCHAIN_HEADERS_SANITIZE_NEEDED
+	bool
+
 endif # BR2_TOOLCHAIN_EXTERNAL
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 547d55d..db1bd5c 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -630,6 +630,20 @@ define TOOLCHAIN_EXTERNAL_INSTALL_WRAPPER
 		-o $(HOST_DIR)/usr/bin/ext-toolchain-wrapper
 endef
 
+# This sed magic is taken from Linux headers_install.sh script.
+ifeq ($(BR2_TOOLCHAIN_HEADERS_SANITIZE_NEEDED),y)
+define TOOLCHAIN_EXTERNAL_SANITIZE_KERNEL_HEADERS
+	$(Q)$(call MESSAGE,"Sanitizing kernel headers");
+	find ${STAGING_DIR}/usr/include/linux/ -name "*.h" | xargs sed -r -i \
+		-e 's/([ \t(])(__user|__force|__iomem)[ \t]/\1/g' \
+		-e 's/__attribute_const__([ \t]|$$)/\1/g' \
+		-e 's@^#include <linux/compiler.h>@@' \
+		-e 's/(^|[^a-zA-Z0-9])__packed([^a-zA-Z0-9_]|$$)/\1__attribute__((packed))\2/g' \
+		-e 's/(^|[ \t(])(inline|asm|volatile)([ \t(]|$$)/\1__\2__\3/g' \
+		-e 's@#(ifndef|define|endif[ \t]*/[*])[ \t]*_UAPI@#\1 @'
+endef
+endif
+
 # Even though we're installing things in both the staging, the host
 # and the target directory, we do everything within the
 # install-staging step, arbitrarily.
@@ -638,6 +652,7 @@ define TOOLCHAIN_EXTERNAL_INSTALL_STAGING_CMDS
 	$(TOOLCHAIN_EXTERNAL_INSTALL_BFIN_FDPIC)
 	$(TOOLCHAIN_EXTERNAL_INSTALL_BFIN_FLAT)
 	$(TOOLCHAIN_EXTERNAL_INSTALL_WRAPPER)
+	$(TOOLCHAIN_EXTERNAL_SANITIZE_KERNEL_HEADERS)
 endef
 
 $(eval $(generic-package))
-- 
1.9.1
