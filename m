From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Dec 2016 15:26:11 +0100
Subject: [Buildroot] [git commit] toolchain: extend musl workaround for
	recent kernels
Message-ID: <20161217142642.42BBA80F63@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4470dd9b1bdbb9b39e9fb13f27bcaa044719de6d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Kernels v4.7 and newer[1] require the __USE_MISC macro for libc-compat.h
suppressions to be effective. musl does not define this macros, so add an
unconditional definition of __USE_MISC to libc-compat.h.

In addition, since musl define IFF_LOWER_UP and friends as macros (instead of
enums), define __UAPI_DEF_IF_NET_DEVICE_FLAGS_LOWER_UP_DORMANT_ECHO to
suppress the kernel corresponding definitions to avoid conflict.

Fixes (xl2tp):
http://autobuild.buildroot.net/results/0b9/0b9384c4beaac85f3a17c3245c8a7418c2e2e296/
http://autobuild.buildroot.net/results/657/657bc5687cf01aee38d32d45ba57fb62b2bd56d0/
http://autobuild.buildroot.net/results/bcd/bcd81618de2f745a19c923c66d787b5182bb54aa/

[1] Since commit f0a3fdca79 (uapi glibc compat: fix compilation when
    !__USE_MISC in glibc)

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain/toolchain.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/toolchain/toolchain/toolchain.mk b/toolchain/toolchain/toolchain.mk
index d317e91..b16db01 100644
--- a/toolchain/toolchain/toolchain.mk
+++ b/toolchain/toolchain/toolchain.mk
@@ -16,11 +16,20 @@ TOOLCHAIN_ADD_TOOLCHAIN_DEPENDENCY = NO
 # headers and kernel headers. This is a temporary measure until musl finds a
 # better solution.
 #
+# Augment the original suggestion with __USE_MISC since recent kernels
+# require this glibc internal macro. Also, as musl defines IFF_LOWER_UP,
+# IFF_DORMANT and IFF_ECHO, add another macro to suppress them in the
+# kernel header, and avoid macro/enum conflict.
+#
 # [1] http://www.openwall.com/lists/musl/2015/10/08/2
 ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
 define TOOLCHAIN_MUSL_KERNEL_HEADERS_COMPATIBILITY_HACK
 	$(SED) 's/^#if defined(__GLIBC__)$$/#if 1/' \
 		$(STAGING_DIR)/usr/include/linux/libc-compat.h
+	$(SED) '1s/^/#define __USE_MISC\n/' \
+		$(STAGING_DIR)/usr/include/linux/libc-compat.h
+	$(SED) '1s/^/#define __UAPI_DEF_IF_NET_DEVICE_FLAGS_LOWER_UP_DORMANT_ECHO 0\n/' \
+		$(STAGING_DIR)/usr/include/linux/libc-compat.h
 endef
 TOOLCHAIN_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_MUSL_KERNEL_HEADERS_COMPATIBILITY_HACK
 TOOLCHAIN_INSTALL_STAGING = YES
