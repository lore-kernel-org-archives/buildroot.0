From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 1 Jun 2017 16:01:13 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] toolchain: limit musl
	workaround to kernel headers 3.12+
Message-ID: <20170601144622.F3F157FC9E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9ebf2c4848a49f402a977469fd2a7d99dc65bf94
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

The libc-compat.h first appeared in kernel version 3.12. Trying to build a
musl toolchain using earlier headers leads to the following failure:

/bin/sed: can't read .../output/host/usr/arm-buildroot-linux-musleabi/sysroot/usr/include/linux/libc-compat.h: No such file or directory
package/pkg-generic.mk:266: recipe for target '.../output/build/toolchain/.stamp_staging_installed' failed

Don't apply the sed patch to older headers.

Reported-by: Florent Jacquet <florent.jacquet@free-electrons.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 4d1c2c82e8945a5847d636458f3825c55529835b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/toolchain/toolchain.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/toolchain/toolchain/toolchain.mk b/toolchain/toolchain/toolchain.mk
index b16db01..68babc3 100644
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
