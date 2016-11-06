From: Baruch Siach <baruch@tkos.co.il>
Date: Sun,  6 Nov 2016 20:43:07 +0200
Subject: [Buildroot] [RFC 1/3] toolchain: workaround musl/kernel headers
	conflict
Message-ID: <0cb3afed06c399b9e7d721aa3dafe6ba0eb7e5e5.1478457789.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Rick Felker suggested[1] this hack as a workaround to musl libc conflict with
kernel headers. Upstream musl still evaluates[2] a permanent solution.

With this in place we can revert (at least) commits a167081c5d (bridge-utils:
fix build with musl) and e74d4fc4932 (norm: add patch to fix musl build).

[1] http://www.openwall.com/lists/musl/2015/10/08/2
[2] http://www.openwall.com/lists/musl/2016/10/18/1

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 toolchain/toolchain/toolchain.mk | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/toolchain/toolchain/toolchain.mk b/toolchain/toolchain/toolchain.mk
index c22713bfe349..d317e917d032 100644
--- a/toolchain/toolchain/toolchain.mk
+++ b/toolchain/toolchain/toolchain.mk
@@ -12,6 +12,20 @@ endif
 
 TOOLCHAIN_ADD_TOOLCHAIN_DEPENDENCY = NO
 
+# Apply a hack that Rick Felker suggested[1] to avoid conflicts between libc
+# headers and kernel headers. This is a temporary measure until musl finds a
+# better solution.
+#
+# [1] http://www.openwall.com/lists/musl/2015/10/08/2
+ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
+define TOOLCHAIN_MUSL_KERNEL_HEADERS_COMPATIBILITY_HACK
+	$(SED) 's/^#if defined(__GLIBC__)$$/#if 1/' \
+		$(STAGING_DIR)/usr/include/linux/libc-compat.h
+endef
+TOOLCHAIN_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_MUSL_KERNEL_HEADERS_COMPATIBILITY_HACK
+TOOLCHAIN_INSTALL_STAGING = YES
+endif
+
 $(eval $(virtual-package))
 
 toolchain: $(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake
-- 
2.10.2
