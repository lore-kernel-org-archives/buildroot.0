From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 11 Apr 2015 11:57:37 +0200
Subject: [Buildroot] [PATCH 2/2] package/lame: Fix compile on 32bit Intel
In-Reply-To: <1428746257-29810-1-git-send-email-bernd.kuhls@t-online.de>
References: <1428746257-29810-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1428746257-29810-3-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In file included from xmm_quantize_sub.c:37:0:
/home/br/br5/output/host/usr/lib/gcc/i586-buildroot-linux-uclibc/4.9.2/include/xmmintrin.h:929:1: error: inlining failed in call to always_inline '_mm_loadu_ps': target specific option mismatch
 _mm_loadu_ps (float const *__P)
 ^
xmm_quantize_sub.c:65:18: error: called from here
     const __m128 vec_fabs_mask = _mm_loadu_ps(&fabs_mask._float[0]);
                  ^

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/lame/0003-msse.patch |   24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 package/lame/0003-msse.patch

diff --git a/package/lame/0003-msse.patch b/package/lame/0003-msse.patch
new file mode 100644
index 0000000..ca4f65f
--- /dev/null
+++ b/package/lame/0003-msse.patch
@@ -0,0 +1,24 @@
+Fix compile on 32bit Intel
+
+Downloaded from
+http://anonscm.debian.org/cgit/pkg-multimedia/lame.git/tree/debian/patches/msse.patch
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+Description: Build xmm_quantize_sub.c with -msse
+Author: Sebastian Ramacher <sramacher@debian.org>
+Bug: http://sourceforge.net/p/lame/bugs/443/
+Bug-Debian: https://bugs.debian.org/760047
+Forwarded: http://sourceforge.net/p/lame/bugs/443/
+Last-Update: 2014-08-31
+
+--- lame-3.99.5+repack1.orig/libmp3lame/vector/Makefile.am
++++ lame-3.99.5+repack1/libmp3lame/vector/Makefile.am
+@@ -20,6 +20,7 @@ xmm_sources = xmm_quantize_sub.c
+ 
+ if WITH_XMM
+ liblamevectorroutines_la_SOURCES = $(xmm_sources)
++liblamevectorroutines_la_CFLAGS = -msse
+ endif
+ 
+ noinst_HEADERS = lame_intrin.h
-- 
1.7.10.4
