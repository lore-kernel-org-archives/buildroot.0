From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Jul 2015 14:30:18 +0200
Subject: [Buildroot] [git commit] package/lame: Fix compile on 32bit Intel
Message-ID: <20150711123314.904637FE36@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f512b4efdba5d9ed28c64b8980ef817ca295fcf2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In file included from xmm_quantize_sub.c:37:0:
/home/br/br5/output/host/usr/lib/gcc/i586-buildroot-linux-uclibc/4.9.2/include/xmmintrin.h:929:1: error: inlining failed in call to always_inline '_mm_loadu_ps': target specific option mismatch
 _mm_loadu_ps (float const *__P)
 ^
xmm_quantize_sub.c:65:18: error: called from here
     const __m128 vec_fabs_mask = _mm_loadu_ps(&fabs_mask._float[0]);
                  ^

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lame/0003-msse.patch |   24 ++++++++++++++++++++++++
 1 files changed, 24 insertions(+), 0 deletions(-)

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
