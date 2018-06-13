From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 13 Jun 2018 18:28:21 +0200
Subject: [Buildroot] [PATCH v3 1/6] package/speexdsp: new package
Message-ID: <20180613162826.3490-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Quoting speex release notes from https://www.speex.org

"Speex 1.2rc2 and SpeexDSP 1.2rc2 are out
 December 6, 2014
 This release splits the speex codec library and the speex DSP library
 into separate source trees."

After bumping speex to 1.2.0 this new package is necessary to provide
speex-based DSP support for packages like Freeswitch and Asterisk.

We use current git HEAD which received 21 commits since the 1.2rc3
tarball was released in 2015, including a fix for building on arm.

We still need another patch which was not committed to git master to
fix building on aarch64.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v3: updated package description and patch description (Peter)
v2: no changes

 package/Config.in                             |   1 +
 .../0001-port-resample-neon-to-aarch64.patch  | 250 ++++++++++++++++++
 package/speexdsp/Config.in                    |   6 +
 package/speexdsp/speexdsp.hash                |   3 +
 package/speexdsp/speexdsp.mk                  |  22 ++
 5 files changed, 282 insertions(+)
 create mode 100644 package/speexdsp/0001-port-resample-neon-to-aarch64.patch
 create mode 100644 package/speexdsp/Config.in
 create mode 100644 package/speexdsp/speexdsp.hash
 create mode 100644 package/speexdsp/speexdsp.mk

diff --git a/package/Config.in b/package/Config.in
index f622b89bab..5756a37f72 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1044,6 +1044,7 @@ menu "Audio/Sound"
 	source "package/portaudio/Config.in"
 	source "package/sbc/Config.in"
 	source "package/speex/Config.in"
+	source "package/speexdsp/Config.in"
 	source "package/taglib/Config.in"
 	source "package/tinyalsa/Config.in"
 	source "package/tremor/Config.in"
diff --git a/package/speexdsp/0001-port-resample-neon-to-aarch64.patch b/package/speexdsp/0001-port-resample-neon-to-aarch64.patch
new file mode 100644
index 0000000000..7f3da9c407
--- /dev/null
+++ b/package/speexdsp/0001-port-resample-neon-to-aarch64.patch
@@ -0,0 +1,250 @@
+From: Frank Barchard <fbarchard@google.com>
+Date: Thu, 21 Jul 2016 23:01:19 +0000 (-0700)
+Subject: resample: port resample_neon.h to aarch64
+X-Git-Url: https://git.xiph.org/?p=speexdsp.git;a=commitdiff_plain;h=3282cc7c3cd30cd1c092ad1e7ff03bd20d75c088
+
+resample: port resample_neon.h to aarch64
+
+port optimized inner_product_single and WORD2INT(x) for fixed
+and floating point from 32 bit armv7 NEON to aarch64 NEON.
+
+Patch downloaded from upstream repo to fix aarch64 build error:
+https://git.xiph.org/?p=speexdsp.git;a=commitdiff;h=3282cc7c3cd30cd1c092ad1e7ff03bd20d75c088#patch1
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+
+diff --git a/libspeexdsp/resample_neon.h b/libspeexdsp/resample_neon.h
+index 0acbd27..e14ffe1 100644
+--- a/libspeexdsp/resample_neon.h
++++ b/libspeexdsp/resample_neon.h
+@@ -36,14 +36,24 @@
+    SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+ */
+ 
+-#include <arm_neon.h>
+-
+ #ifdef FIXED_POINT
+-#ifdef __thumb2__
++#if defined(__aarch64__)
++static inline int32_t saturate_32bit_to_16bit(int32_t a) {
++    int32_t ret;
++    asm ("fmov s0, %w[a]\n"
++         "sqxtn h0, s0\n"
++         "sxtl v0.4s, v0.4h\n"
++         "fmov %w[ret], s0\n"
++         : [ret] "=r" (ret)
++         : [a] "r" (a)
++         : "v0" );
++    return ret;
++}
++#elif defined(__thumb2__)
+ static inline int32_t saturate_32bit_to_16bit(int32_t a) {
+     int32_t ret;
+     asm ("ssat %[ret], #16, %[a]"
+-         : [ret] "=&r" (ret)
++         : [ret] "=r" (ret)
+          : [a] "r" (a)
+          : );
+     return ret;
+@@ -54,7 +64,7 @@ static inline int32_t saturate_32bit_to_16bit(int32_t a) {
+     asm ("vmov.s32 d0[0], %[a]\n"
+          "vqmovn.s32 d0, q0\n"
+          "vmov.s16 %[ret], d0[0]\n"
+-         : [ret] "=&r" (ret)
++         : [ret] "=r" (ret)
+          : [a] "r" (a)
+          : "q0");
+     return ret;
+@@ -64,7 +74,63 @@ static inline int32_t saturate_32bit_to_16bit(int32_t a) {
+ #define WORD2INT(x) (saturate_32bit_to_16bit(x))
+ 
+ #define OVERRIDE_INNER_PRODUCT_SINGLE
+-/* Only works when len % 4 == 0 */
++/* Only works when len % 4 == 0 and len >= 4 */
++#if defined(__aarch64__)
++static inline int32_t inner_product_single(const int16_t *a, const int16_t *b, unsigned int len)
++{
++    int32_t ret;
++    uint32_t remainder = len % 16;
++    len = len - remainder;
++
++    asm volatile ("	 cmp %w[len], #0\n"
++		  "	 b.ne 1f\n"
++		  "	 ld1 {v16.4h}, [%[b]], #8\n"
++		  "	 ld1 {v20.4h}, [%[a]], #8\n"
++		  "	 subs %w[remainder], %w[remainder], #4\n"
++		  "	 smull v0.4s, v16.4h, v20.4h\n"
++		  "      b.ne 4f\n"
++		  "	 b 5f\n"
++		  "1:"
++		  "	 ld1 {v16.4h, v17.4h, v18.4h, v19.4h}, [%[b]], #32\n"
++		  "	 ld1 {v20.4h, v21.4h, v22.4h, v23.4h}, [%[a]], #32\n"
++		  "	 subs %w[len], %w[len], #16\n"
++		  "	 smull v0.4s, v16.4h, v20.4h\n"
++		  "	 smlal v0.4s, v17.4h, v21.4h\n"
++		  "	 smlal v0.4s, v18.4h, v22.4h\n"
++		  "	 smlal v0.4s, v19.4h, v23.4h\n"
++		  "	 b.eq 3f\n"
++		  "2:"
++		  "	 ld1 {v16.4h, v17.4h, v18.4h, v19.4h}, [%[b]], #32\n"
++		  "	 ld1 {v20.4h, v21.4h, v22.4h, v23.4h}, [%[a]], #32\n"
++		  "	 subs %w[len], %w[len], #16\n"
++		  "	 smlal v0.4s, v16.4h, v20.4h\n"
++		  "	 smlal v0.4s, v17.4h, v21.4h\n"
++		  "	 smlal v0.4s, v18.4h, v22.4h\n"
++		  "	 smlal v0.4s, v19.4h, v23.4h\n"
++		  "	 b.ne 2b\n"
++		  "3:"
++		  "	 cmp %w[remainder], #0\n"
++		  "	 b.eq 5f\n"
++		  "4:"
++		  "	 ld1 {v18.4h}, [%[b]], #8\n"
++		  "	 ld1 {v22.4h}, [%[a]], #8\n"
++		  "	 subs %w[remainder], %w[remainder], #4\n"
++		  "	 smlal v0.4s, v18.4h, v22.4h\n"
++		  "	 b.ne 4b\n"
++		  "5:"
++		  "	 saddlv d0, v0.4s\n"
++		  "	 sqxtn s0, d0\n"
++		  "	 sqrshrn h0, s0, #15\n"
++		  "	 sxtl v0.4s, v0.4h\n"
++		  "	 fmov %w[ret], s0\n"
++		  : [ret] "=r" (ret), [a] "+r" (a), [b] "+r" (b),
++		    [len] "+r" (len), [remainder] "+r" (remainder)
++		  :
++		  : "cc", "v0",
++		    "v16", "v17", "v18", "v19", "v20", "v21", "v22", "v23");
++    return ret;
++}
++#else
+ static inline int32_t inner_product_single(const int16_t *a, const int16_t *b, unsigned int len)
+ {
+     int32_t ret;
+@@ -112,33 +178,104 @@ static inline int32_t inner_product_single(const int16_t *a, const int16_t *b, u
+ 		  "	 vqmovn.s64 d0, q0\n"
+ 		  "	 vqrshrn.s32 d0, q0, #15\n"
+ 		  "	 vmov.s16 %[ret], d0[0]\n"
+-		  : [ret] "=&r" (ret), [a] "+r" (a), [b] "+r" (b),
++		  : [ret] "=r" (ret), [a] "+r" (a), [b] "+r" (b),
+ 		    [len] "+r" (len), [remainder] "+r" (remainder)
+ 		  :
+ 		  : "cc", "q0",
+-		    "d16", "d17", "d18", "d19",
+-		    "d20", "d21", "d22", "d23");
++		    "d16", "d17", "d18", "d19", "d20", "d21", "d22", "d23");
+ 
+     return ret;
+ }
+-#elif defined(FLOATING_POINT)
++#endif  // !defined(__aarch64__)
+ 
++#elif defined(FLOATING_POINT)
++#if defined(__aarch64__)
++static inline int32_t saturate_float_to_16bit(float a) {
++    int32_t ret;
++    asm ("fcvtas s1, %s[a]\n"
++         "sqxtn h1, s1\n"
++         "sxtl v1.4s, v1.4h\n"
++         "fmov %w[ret], s1\n"
++         : [ret] "=r" (ret)
++         : [a] "w" (a)
++         : "v1");
++    return ret;
++}
++#else
+ static inline int32_t saturate_float_to_16bit(float a) {
+     int32_t ret;
+     asm ("vmov.f32 d0[0], %[a]\n"
+          "vcvt.s32.f32 d0, d0, #15\n"
+          "vqrshrn.s32 d0, q0, #15\n"
+          "vmov.s16 %[ret], d0[0]\n"
+-         : [ret] "=&r" (ret)
++         : [ret] "=r" (ret)
+          : [a] "r" (a)
+          : "q0");
+     return ret;
+ }
++#endif
++
+ #undef WORD2INT
+ #define WORD2INT(x) (saturate_float_to_16bit(x))
+ 
+ #define OVERRIDE_INNER_PRODUCT_SINGLE
+-/* Only works when len % 4 == 0 */
++/* Only works when len % 4 == 0 and len >= 4 */
++#if defined(__aarch64__)
++static inline float inner_product_single(const float *a, const float *b, unsigned int len)
++{
++    float ret;
++    uint32_t remainder = len % 16;
++    len = len - remainder;
++
++    asm volatile ("	 cmp %w[len], #0\n"
++		  "	 b.ne 1f\n"
++		  "	 ld1 {v16.4s}, [%[b]], #16\n"
++		  "	 ld1 {v20.4s}, [%[a]], #16\n"
++		  "	 subs %w[remainder], %w[remainder], #4\n"
++		  "	 fmul v1.4s, v16.4s, v20.4s\n"
++		  "      b.ne 4f\n"
++		  "	 b 5f\n"
++		  "1:"
++		  "	 ld1 {v16.4s, v17.4s, v18.4s, v19.4s}, [%[b]], #64\n"
++		  "	 ld1 {v20.4s, v21.4s, v22.4s, v23.4s}, [%[a]], #64\n"
++		  "	 subs %w[len], %w[len], #16\n"
++		  "	 fmul v1.4s, v16.4s, v20.4s\n"
++		  "	 fmul v2.4s, v17.4s, v21.4s\n"
++		  "	 fmul v3.4s, v18.4s, v22.4s\n"
++		  "	 fmul v4.4s, v19.4s, v23.4s\n"
++		  "	 b.eq 3f\n"
++		  "2:"
++		  "	 ld1 {v16.4s, v17.4s, v18.4s, v19.4s}, [%[b]], #64\n"
++		  "	 ld1 {v20.4s, v21.4s, v22.4s, v23.4s}, [%[a]], #64\n"
++		  "	 subs %w[len], %w[len], #16\n"
++		  "	 fmla v1.4s, v16.4s, v20.4s\n"
++		  "	 fmla v2.4s, v17.4s, v21.4s\n"
++		  "	 fmla v3.4s, v18.4s, v22.4s\n"
++		  "	 fmla v4.4s, v19.4s, v23.4s\n"
++		  "	 b.ne 2b\n"
++		  "3:"
++		  "	 fadd v16.4s, v1.4s, v2.4s\n"
++		  "	 fadd v17.4s, v3.4s, v4.4s\n"
++		  "	 cmp %w[remainder], #0\n"
++		  "	 fadd v1.4s, v16.4s, v17.4s\n"
++		  "	 b.eq 5f\n"
++		  "4:"
++		  "	 ld1 {v18.4s}, [%[b]], #16\n"
++		  "	 ld1 {v22.4s}, [%[a]], #16\n"
++		  "	 subs %w[remainder], %w[remainder], #4\n"
++		  "	 fmla v1.4s, v18.4s, v22.4s\n"
++		  "	 b.ne 4b\n"
++		  "5:"
++		  "	 faddp v1.4s, v1.4s, v1.4s\n"
++		  "	 faddp %[ret].4s, v1.4s, v1.4s\n"
++		  : [ret] "=w" (ret), [a] "+r" (a), [b] "+r" (b),
++		    [len] "+r" (len), [remainder] "+r" (remainder)
++		  :
++		  : "cc", "v1", "v2", "v3", "v4",
++		    "v16", "v17", "v18", "v19", "v20", "v21", "v22", "v23");
++    return ret;
++}
++#else
+ static inline float inner_product_single(const float *a, const float *b, unsigned int len)
+ {
+     float ret;
+@@ -191,11 +328,12 @@ static inline float inner_product_single(const float *a, const float *b, unsigne
+ 		  "	 vadd.f32 d0, d0, d1\n"
+ 		  "	 vpadd.f32 d0, d0, d0\n"
+ 		  "	 vmov.f32 %[ret], d0[0]\n"
+-		  : [ret] "=&r" (ret), [a] "+r" (a), [b] "+r" (b),
++		  : [ret] "=r" (ret), [a] "+r" (a), [b] "+r" (b),
+ 		    [len] "+l" (len), [remainder] "+l" (remainder)
+ 		  :
+-		  : "cc", "q0", "q1", "q2", "q3", "q4", "q5", "q6", "q7", "q8",
+-                    "q9", "q10", "q11");
++		  : "cc", "q0", "q1", "q2", "q3",
++		    "q4", "q5", "q6", "q7", "q8", "q9", "q10", "q11");
+     return ret;
+ }
++#endif  // defined(__aarch64__)
+ #endif
diff --git a/package/speexdsp/Config.in b/package/speexdsp/Config.in
new file mode 100644
index 0000000000..2ae5b59d02
--- /dev/null
+++ b/package/speexdsp/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_SPEEXDSP
+	bool "speexdsp"
+	help
+	  DSP library derived from speex.
+
+	  https://www.speex.org
diff --git a/package/speexdsp/speexdsp.hash b/package/speexdsp/speexdsp.hash
new file mode 100644
index 0000000000..5c3d6b96f3
--- /dev/null
+++ b/package/speexdsp/speexdsp.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256 e896489e045d11933723a94b9dd6f8e7d3d4e0d4b34c9612bcb2f4204261130c  speexdsp-20ed3452074664ad07e380e51321b148acebdf20.tar.gz
+sha256 671bb5d8fd3c6b05a2e831d90f978ac27965c92bd8ea6d16b3df76e3440c0e9f  COPYING
diff --git a/package/speexdsp/speexdsp.mk b/package/speexdsp/speexdsp.mk
new file mode 100644
index 0000000000..e4b2ce5112
--- /dev/null
+++ b/package/speexdsp/speexdsp.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# speexdsp
+#
+################################################################################
+
+SPEEXDSP_VERSION = 20ed3452074664ad07e380e51321b148acebdf20
+SPEEXDSP_SITE = https://git.xiph.org/speexdsp.git
+SPEEXDSP_SITE_METHOD = git
+SPEEXDSP_LICENSE = BSD-3-Clause
+SPEEXDSP_LICENSE_FILES = COPYING
+SPEEXDSP_INSTALL_STAGING = YES
+SPEEXDSP_DEPENDENCIES = host-pkgconf
+SPEEXDSP_AUTORECONF = YES
+
+# Autoreconf step fails due to missing m4 directory
+define SPEEXDSP_PRECONFIGURE
+	mkdir -p $(@D)/m4
+endef
+SPEEXDSP_PRE_CONFIGURE_HOOKS += SPEEXDSP_PRECONFIGURE
+
+$(eval $(autotools-package))
-- 
2.17.1
