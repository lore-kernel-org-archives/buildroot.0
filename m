From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Apr 2014 22:40:21 +0200
Subject: [Buildroot] [git commit] toolchain-external: Introduce kernel
	headers sanitization
Message-ID: <20140414204029.615979C7A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e48ef3f5227709b768247671197b0aea29b48ea9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The Nios-II Sourcery external toolchain (the only Nios-II we currently
support) exports broken kernel headers. In particular, these kernels should
be exported using the "headers_install" rule which applies a set of fixes
on the kernel headers so they are suitable for userspace usage.

In order to fix this, add a post-install hook to perform the header fixes
ourselves. The result is equivalent to apply the "headers_install" rule.

Fixes:
http://autobuild.buildroot.net/results/c32/c32ad4bac5f651502e551f7733f702afaa0e742a/

Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/toolchain-external.mk |   13 +++++++++++++
 1 files changed, 13 insertions(+), 0 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 1424c23..2309e9f 100644
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
