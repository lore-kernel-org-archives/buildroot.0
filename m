From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Mon, 14 Apr 2014 09:16:56 -0300
Subject: [Buildroot] [PATCH v3] toolchain-external: Introduce kernel headers
	sanitization
Message-ID: <1397477816-6605-1-git-send-email-ezequiel@vanguardiasur.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The Nios-II Sourcery external toolchain (the only Nios-II we currently
support) exports broken kernel headers. In particular, these kernels should
be exported using the "headers_install" rule which applies a set of fixes
on the kernel headers so they are suitable for userspace usage.

In order to fix this, add a post-install hook to perform the header fixes
ourselves. The result is equivalent to apply the "headers_install" rule.

Fixes:
http://autobuild.buildroot.net/results/c32/c32ad4bac5f651502e551f7733f702afaa0e742a/

Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
---
v2 -> v3: Re-worked as per Thomas' suggestion.

v1 -> v2: Yann asked to replace ${STAGING_DIR} with $(STAGING_DIR)

 toolchain/toolchain-external/Config.in             |  7 +++++++
 toolchain/toolchain-external/toolchain-external.mk | 13 +++++++++++++
 2 files changed, 20 insertions(+)

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
index 547d55d..d443ccc 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -294,6 +294,7 @@ TOOLCHAIN_EXTERNAL_SOURCE = mips-2013.11-36-mips-linux-gnu-i686-pc-linux-gnu.tar
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305),y)
 TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/nios2-linux-gnu/
 TOOLCHAIN_EXTERNAL_SOURCE = sourceryg++-2013.05-43-nios2-linux-gnu-i686-pc-linux-gnu.tar.bz2
+TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_SANITIZE_KERNEL_HEADERS
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009),y)
 TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/powerpc-linux-gnu/
 TOOLCHAIN_EXTERNAL_SOURCE = freescale-2010.09-55-powerpc-linux-gnu-i686-pc-linux-gnu.tar.bz2
@@ -630,6 +631,18 @@ define TOOLCHAIN_EXTERNAL_INSTALL_WRAPPER
 		-o $(HOST_DIR)/usr/bin/ext-toolchain-wrapper
 endef
 
+# This sed magic is taken from Linux headers_install.sh script.
+define TOOLCHAIN_EXTERNAL_SANITIZE_KERNEL_HEADERS
+	$(Q)$(call MESSAGE,"Sanitizing kernel headers");
+	find $(STAGING_DIR)/usr/include/linux/ -name "*.h" | xargs sed -r -i \
+		-e 's/([ \t(])(__user|__force|__iomem)[ \t]/\1/g' \
+		-e 's/__attribute_const__([ \t]|$$)/\1/g' \
+		-e 's@^#include <linux/compiler.h>@@' \
+		-e 's/(^|[^a-zA-Z0-9])__packed([^a-zA-Z0-9_]|$$)/\1__attribute__((packed))\2/g' \
+		-e 's/(^|[ \t(])(inline|asm|volatile)([ \t(]|$$)/\1__\2__\3/g' \
+		-e 's@#(ifndef|define|endif[ \t]*/[*])[ \t]*_UAPI@#\1 @'
+endef
+
 # Even though we're installing things in both the staging, the host
 # and the target directory, we do everything within the
 # install-staging step, arbitrarily.
-- 
1.9.1
