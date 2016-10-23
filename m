From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 23 Oct 2016 14:47:07 +0200
Subject: [Buildroot] [git commit] package/gcc: disable libmpx for gcc6-based
	musl builds
Message-ID: <20161023124710.CB9148183F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=873d4019f7fb00f6a80592224236b3ba7d657865
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
