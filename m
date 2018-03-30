From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 30 Mar 2018 18:42:27 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] toolchain: limit
 musl/kernel headers conflict workaround
Message-ID: <20180330193200.B3C1E83EC7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c3f7138f137af747ca443c0b88ceb946b8ba9883
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

The musl/kernel headers workaround was added in commit 196932cd91
(toolchain: workaround musl/kernel headers conflict) to fix definition
collisions in networking related headers between musl headers and kernel
headers. Kernel headers from version 4.15 and newer do not need this
workaround anymore since kernel commit c0bace798436bc (uapi libc compat:
add fallback for unsupported libcs). The C library does not have to
define the __GLIBC__ macro to make the __UAPI_DEF_* macros effective.

Updated the comment to accordingly.

Tested with the xl2tp package. This package fails to build with older
kernel headers without the workaround (struct in_pktinfo redefinition,
among others). With 4.15 headers, xl2tp builds fine with this patch
applied. That is, no workaround needed.

Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 6afee03e3cc3b9afa4861cc0a9bbc6be03a16be8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/toolchain/toolchain.mk | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/toolchain/toolchain/toolchain.mk b/toolchain/toolchain/toolchain.mk
index b55b0c712c..179c09edf1 100644
--- a/toolchain/toolchain/toolchain.mk
+++ b/toolchain/toolchain/toolchain.mk
@@ -13,18 +13,18 @@ endif
 TOOLCHAIN_ADD_TOOLCHAIN_DEPENDENCY = NO
 
 # Apply a hack that Rick Felker suggested[1] to avoid conflicts between libc
-# headers and kernel headers. This is a temporary measure until musl finds a
-# better solution.
+# headers and kernel headers. This is needed for kernel headers older than
+# 4.15. Kernel headers 4.15 and newer don't require __GLIBC__ to be defined.
 #
 # Augment the original suggestion with __USE_MISC since recent kernels
-# require this glibc internal macro. Also, as musl defines IFF_LOWER_UP,
-# IFF_DORMANT and IFF_ECHO, add another macro to suppress them in the
-# kernel header, and avoid macro/enum conflict.
+# (older than 4.15) require this glibc internal macro. Also, as musl defines
+# IFF_LOWER_UP, IFF_DORMANT and IFF_ECHO, add another macro to suppress
+# them in the kernel header, and avoid macro/enum conflict.
 #
 # Kernel version 3.12 introduced the libc-compat.h header.
 #
 # [1] http://www.openwall.com/lists/musl/2015/10/08/2
-ifeq ($(BR2_TOOLCHAIN_USES_MUSL)$(BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12),yy)
+ifeq ($(BR2_TOOLCHAIN_USES_MUSL)$(BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12):$(BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_15),yy:)
 define TOOLCHAIN_MUSL_KERNEL_HEADERS_COMPATIBILITY_HACK
 	$(SED) 's/^#if defined(__GLIBC__)$$/#if 1/' \
 		$(STAGING_DIR)/usr/include/linux/libc-compat.h
