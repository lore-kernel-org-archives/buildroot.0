From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 23 Oct 2016 00:04:22 +0200
Subject: [Buildroot] [PATCH 1/1] package/gcc: disable libmpx for gcc6-based
	musl builds
Message-ID: <20161022220422.14839-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Building this minimal defconfig

BR2_TOOLCHAIN_BUILDROOT_MUSL=y
BR2_GCC_VERSION_6_X=y

fails:

In file included from ../../../../libmpx/mpxrt/mpxrt.c:54:0:
../../../../libmpx/mpxrt/mpxrt.c: In function 'read_mpx_status_sig':
../../../../libmpx/mpxrt/mpxrt.h:52:42: error: invalid application of
'sizeof' to incomplete type 'struct _libc_fpstate'
 #define XSAVE_OFFSET_IN_FPMEM    sizeof (struct _libc_fpstate)

To fix disable libmpx for musl builds, other projects did the same:

https://github.com/crosstool-ng/crosstool-ng/commit/3ec2211548a853203e070af6810f49825ec46a6a
http://git.alpinelinux.org/cgit/aports/commit/main/gcc/APKBUILD?id=1830e485126ea9a95d763317fb0c508c1ff297d2

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/gcc/gcc.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index c971151..464e4c9 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -116,6 +116,11 @@ ifeq ($(BR2_sparc_v8)$(BR2_sparc_leon3),y)
 HOST_GCC_COMMON_CONF_OPTS += --disable-libitm
 endif
 
+# libmpx uses secure_getenv and struct _libc_fpstate not present in musl
+ifeq ($(BR2_TOOLCHAIN_BUILDROOT_MUSL)$(BR2_TOOLCHAIN_GCC_AT_LEAST_6),yy)
+HOST_GCC_COMMON_CONF_OPTS += --disable-libmpx
+endif
+
 # quadmath support requires wchar
 ifeq ($(BR2_USE_WCHAR)$(BR2_TOOLCHAIN_HAS_LIBQUADMATH),yy)
 HOST_GCC_COMMON_CONF_OPTS += --enable-libquadmath
-- 
2.9.3
