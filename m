From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 10 Nov 2016 15:27:11 +0200
Subject: [Buildroot] [PATCH v2 1/3] toolchain: workaround musl/kernel
	headers conflict
Message-ID: <b2085612a223f59a2f7ef18a9bd97603226aa03d.1478784433.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Rick Felker suggested[1] this hack as a workaround to musl libc conflict with
kernel headers:

  The problem is linux/libc-compat.h, which should fix this, only works
  on glibc, by design. See:

  #ifndef _LIBC_COMPAT_H
  #define _LIBC_COMPAT_H

  /* We have included glibc headers... */
  #if defined(__GLIBC__)

  /* Coordinate with glibc netinet/in.h header. */
  #if defined(_NETINET_IN_H)

  If you patch it like this:

  -#if defined(__GLIBC__)
  +#if 1

  then it should mostly work but it's still all a big hack. I think
  that's what distros are doing. The problem is that the same header is
  trying to do two different things:

  1. Provide extra linux-kernel-API stuff that's not in the
     libc/userspace headers.

  2. Provide definitions of the standard types and constants for uClibc
     and klibc, which don't have complete libc headers and rely on the
     kernel headers for definitions.

  These two uses really should be separated out into separate headers so
  that the latter only get included explicitly by uClibc and klibc and
  otherwise remain completely unused. But that would require coordinated
  changes/upgrades which are unlikely to happen. :(

Upstream musl still evaluates[2][3] a permanent solution.

With this in place we can revert (at least) commits a167081c5d (bridge-utils:
fix build with musl) and e74d4fc4932 (norm: add patch to fix musl build).

[1] http://www.openwall.com/lists/musl/2015/10/08/2
[2] http://git.musl-libc.org/cgit/musl/commit/?id=04983f2272382af92eb8f8838964ff944fbb8258
[3] http://www.openwall.com/lists/musl/2016/11/09/2

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
v2:
  * Add Rick's explanation in the commit log (Arnout)
  * Link to more recent upstream changes
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
