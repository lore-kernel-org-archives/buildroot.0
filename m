From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Oct 2015 10:43:54 +0200
Subject: [Buildroot] [git commit] liquid-dsp: pass the supported x86 CPU
	extensions
Message-ID: <20151014084524.9C96781E79@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=30d7ed2077d70deebdb56c5c34cee2989e8a1a74
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

By default, the liquid-dsp configure script looks at the current CPU
to find which x86 CPU extensions are supported. Those checks use
AC_TRY_RUN(), which cannot work in a cross-compilation environment,
and would anyway be wrong.

To fix this, we explicitly pass the appropriate ac_cv_have_<foo>_ext
autoconf cache variables.

Fixes:

  http://autobuild.buildroot.org/results/eb0/eb002463ed82de461fae11211415c07883a95386/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/liquid-dsp/liquid-dsp.mk |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/package/liquid-dsp/liquid-dsp.mk b/package/liquid-dsp/liquid-dsp.mk
index 98b23a5..8bb8d54 100644
--- a/package/liquid-dsp/liquid-dsp.mk
+++ b/package/liquid-dsp/liquid-dsp.mk
@@ -11,6 +11,16 @@ LIQUID_DSP_LICENSE_FILES = LICENSE
 LIQUID_DSP_INSTALL_STAGING = YES
 LIQUID_DSP_AUTORECONF = YES
 
+LIQUID_DSP_CONF_ENV = \
+	ax_cv_have_mmx_ext=$(if $(BR2_X86_CPU_HAS_MMX),yes,no) \
+	ax_cv_have_sse_ext=$(if $(BR2_X86_CPU_HAS_SSE),yes,no) \
+	ax_cv_have_sse2_ext=$(if $(BR2_X86_CPU_HAS_SSE2),yes,no) \
+	ax_cv_have_sse3_ext=$(if $(BR2_X86_CPU_HAS_SSE3),yes,no) \
+	ax_cv_have_ssse3_ext=$(if $(BR2_X86_CPU_HAS_SSSE3),yes,no) \
+	ax_cv_have_sse41_ext=$(if $(BR2_X86_CPU_HAS_SSE4),yes,no) \
+	ax_cv_have_sse42_ext=$(if $(BR2_X86_CPU_HAS_SSE42),yes,no) \
+	ax_cv_have_avx_ext=$(if $(BR2_X86_CPU_HAS_AVX),yes,no)
+
 LIQUID_DSP_CFLAGS = $(TARGET_CFLAGS)
 LIQUID_DSP_LDFLAGS = $(TARGET_LDFLAGS)
 
