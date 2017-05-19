From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 19 May 2017 07:20:37 +0300
Subject: [Buildroot] [PATCH] toolchain: limit musl workaround to kernel
	headers 3.12+
Message-ID: <9f5573bb9c8401ad32d34c22c69e062e14b834de.1495167637.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The libc-compat.h first appeared in kernel version 3.12. Trying to build a
musl toolchain using earlier headers leads to the following failure:

/bin/sed: can't read .../output/host/usr/arm-buildroot-linux-musleabi/sysroot/usr/include/linux/libc-compat.h: No such file or directory
package/pkg-generic.mk:266: recipe for target '.../output/build/toolchain/.stamp_staging_installed' failed

Don't apply the sed patch to older headers.

Reported-by: Florent Jacquet <florent.jacquet@free-electrons.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 toolchain/toolchain/toolchain.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/toolchain/toolchain/toolchain.mk b/toolchain/toolchain/toolchain.mk
index e29837357a27..e15ceeb426fa 100644
--- a/toolchain/toolchain/toolchain.mk
+++ b/toolchain/toolchain/toolchain.mk
@@ -21,8 +21,10 @@ TOOLCHAIN_ADD_TOOLCHAIN_DEPENDENCY = NO
 # IFF_DORMANT and IFF_ECHO, add another macro to suppress them in the
 # kernel header, and avoid macro/enum conflict.
 #
+# Kernel version 3.12 introduced the libc-compat.h header.
+#
 # [1] http://www.openwall.com/lists/musl/2015/10/08/2
-ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
+ifeq ($(BR2_TOOLCHAIN_USES_MUSL)$(BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12),yy)
 define TOOLCHAIN_MUSL_KERNEL_HEADERS_COMPATIBILITY_HACK
 	$(SED) 's/^#if defined(__GLIBC__)$$/#if 1/' \
 		$(STAGING_DIR)/usr/include/linux/libc-compat.h
-- 
2.11.0
