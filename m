From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 May 2016 13:24:53 +0200
Subject: [Buildroot] [git commit] package/mplayer: fix aarch64 compilation
Message-ID: <20160528113346.37A8181841@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5468ce85d58af2f2b85bf0ac01ba9af49cf56c8f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added code to define HAVE_ARMV8 when needed.

Fixes
http://autobuild.buildroot.net/results/5f8/5f85c32eb89aac48ae8da892d9800bd13274cd3e/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mplayer/0003-configure-armv8.patch | 43 ++++++++++++++++++++++++++++++
 package/mplayer/mplayer.mk                 |  4 +++
 2 files changed, 47 insertions(+)

diff --git a/package/mplayer/0003-configure-armv8.patch b/package/mplayer/0003-configure-armv8.patch
new file mode 100644
index 0000000..9868643
--- /dev/null
+++ b/package/mplayer/0003-configure-armv8.patch
@@ -0,0 +1,43 @@
+Fix aarch64 compile by adding HAVE_ARMV8 define
+
+Fixes build errors seen on the buildroot autobuilders:
+http://autobuild.buildroot.net/results/5f8/5f85c32eb89aac48ae8da892d9800bd13274cd3e/build-end.log
+
+libavutil/aarch64/cpu.c: In function 'ff_get_cpu_flags_aarch64':
+libavutil/aarch64/cpu.c:25:32: error: 'HAVE_ARMV8' undeclared (first use in this function)
+     return AV_CPU_FLAG_ARMV8 * HAVE_ARMV8 |
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+(patch sent upstream:
+ http://lists.mplayerhq.hu/pipermail/mplayer-dev-eng/2016-May/073496.html)
+
+Index: configure
+===================================================================
+--- a/configure	(revision 37871)
++++ b/configure	(working copy)
+@@ -1445,6 +1445,8 @@
+   --disable-armv6) _armv6=no ;;
+   --enable-armv6t2) _armv6t2=yes ;;
+   --disable-armv6t2) _armv6t2=no ;;
++  --enable-armv8) _armv8=yes ;;
++  --disable-armv8) _armv8=no ;;
+   --enable-armvfp) _armvfp=yes ;;
+   --disable-armvfp) _armvfp=no ;;
+   --enable-vfpv3) vfpv3=yes ;;
+@@ -3261,7 +3263,7 @@
+   echores "$_iwmmxt"
+ fi
+ 
+-cpuexts_all='ALTIVEC XOP AVX AVX2 FMA3 FMA4 MMX MMX2 MMXEXT AMD3DNOW AMD3DNOWEXT SSE SSE2 SSE3 SSSE3 SSE4 SSE42 FAST_CMOV I686 FAST_CLZ ARMV5TE ARMV6 ARMV6T2 VFP VFPV3 SETEND NEON IWMMXT MMI VIS MVI'
++cpuexts_all='ALTIVEC XOP AVX AVX2 FMA3 FMA4 MMX MMX2 MMXEXT AMD3DNOW AMD3DNOWEXT SSE SSE2 SSE3 SSSE3 SSE4 SSE42 FAST_CMOV I686 FAST_CLZ ARMV5TE ARMV6 ARMV6T2 ARMV8 VFP VFPV3 SETEND NEON IWMMXT MMI VIS MVI'
+ test "$_altivec"   = yes && cpuexts="ALTIVEC $cpuexts"
+ test "$_mmx"       = yes && cpuexts="MMX $cpuexts"
+ test "$_mmxext"    = yes && cpuexts="MMX2 $cpuexts"
+@@ -3285,6 +3287,7 @@
+ test "$_armv5te"   = yes && cpuexts="ARMV5TE $cpuexts"
+ test "$_armv6"     = yes && cpuexts="ARMV6 $cpuexts"
+ test "$_armv6t2"   = yes && cpuexts="ARMV6T2 $cpuexts"
++test "$_armv8"     = yes && cpuexts="ARMV8 $cpuexts"
+ test "$_armvfp"    = yes && cpuexts="VFP $cpuexts"
+ test "$vfpv3"      = yes && cpuexts="VFPV3 $cpuexts"
+ test "$setend"     = yes && cpuexts="SETEND $cpuexts"
diff --git a/package/mplayer/mplayer.mk b/package/mplayer/mplayer.mk
index 41a52b0..33eba38 100644
--- a/package/mplayer/mplayer.mk
+++ b/package/mplayer/mplayer.mk
@@ -254,6 +254,10 @@ ifeq ($(BR2_ARM_CPU_ARMV6)$(BR2_ARM_CPU_ARMV7A),y)
 MPLAYER_CONF_OPTS += --enable-armv6
 endif
 
+ifeq ($(BR2_aarch64),y)
+MPLAYER_CONF_OPTS += --enable-armv8
+endif
+
 ifeq ($(BR2_ARM_SOFT_FLOAT),)
 ifeq ($(BR2_ARM_CPU_HAS_NEON),y)
 MPLAYER_CONF_OPTS += --enable-neon
