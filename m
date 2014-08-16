From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 17 Aug 2014 00:18:14 +0200
Subject: [Buildroot] [PATCH] package/lame: Fix compile on 32bit Intel with
	gcc-4.9.x
Message-ID: <1408227494-20770-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In file included from xmm_quantize_sub.c:37:0:
/home/br/br/output/host/usr/lib/gcc/i586-buildroot-linux-uclibc/4.9.1/include/xmmintrin.h:205:1: error:
 inlining failed in call to always_inline '_mm_sqrt_ps': target specific option mismatch
 _mm_sqrt_ps (__m128 __A)

To reproduce use this defconfig:

BR2_GCC_VERSION_4_9_X=y
BR2_PACKAGE_LAME=y

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/lame/lame.mk |   10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/lame/lame.mk b/package/lame/lame.mk
index 938b759..eac4367 100644
--- a/package/lame/lame.mk
+++ b/package/lame/lame.mk
@@ -23,6 +23,16 @@ ifeq ($(BR2_PACKAGE_NCURSES),y)
 LAME_DEPENDENCIES += ncurses
 endif
 
+# cross compiling on 32bit Intel is broken with gcc-4.9.x, for details see
+# http://lists.linuxfromscratch.org/pipermail/blfs-dev/2014-April/027259.html
+# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=56145
+ifeq ($(BR2_i386)$(BR2_GCC_VERSION_4_9_X),yy)
+define LAME_COMPILE_FIX
+	$(SED) '/xmmintrin\.h/d' $(@D)/configure
+endef
+LAME_PRE_CONFIGURE_HOOKS += LAME_COMPILE_FIX
+endif
+
 ifeq ($(BR2_ENDIAN),"BIG")
 define LAME_BIGENDIAN_ARCH
 	echo "#define WORDS_BIGENDIAN 1" >>$(@D)/config.h
-- 
1.7.10.4
