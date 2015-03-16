From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 16 Mar 2015 17:31:23 +0100
Subject: [Buildroot] [PATCH 4/7 v7] package/fftw: add ARM optimisations
In-Reply-To: <cover.1426523417.git.yann.morin.1998@free.fr>
References: <cover.1426523417.git.yann.morin.1998@free.fr>
Message-ID: <a647a966d5c57b425d4843b5aa9d4406671e1298.1426523417.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
[based on a patch by Guillaume]
Cc: guillaume william brs <guillaume.bressaix@gmail.com>
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

---
Changes v6 -> v7:
  - force NEON FPU when available, not when user-selected  (Thomas)

Changes v5 -> v6:
  - NEON can't be used by all precisions  (Gwenhael)
---
 package/fftw/Config.in | 4 ++++
 package/fftw/fftw.mk   | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/package/fftw/Config.in b/package/fftw/Config.in
index 7feadd8..d9a65d5 100644
--- a/package/fftw/Config.in
+++ b/package/fftw/Config.in
@@ -18,6 +18,9 @@ config BR2_PACKAGE_FFTW_USE_SSE
 config BR2_PACKAGE_FFTW_USE_SSE2
 	bool
 
+config BR2_PACKAGE_FFTW_USE_NEON
+	bool
+
 choice
 	prompt "fftw precision"
 	default BR2_PACKAGE_FFTW_PRECISION_DOUBLE
@@ -28,6 +31,7 @@ config BR2_PACKAGE_FFTW_PRECISION_SINGLE
 	bool "single"
 	select BR2_PACKAGE_FFTW_USE_SSE if BR2_X86_CPU_HAS_SSE
 	select BR2_PACKAGE_FFTW_USE_SSE2 if BR2_X86_CPU_HAS_SSE2
+	select BR2_PACKAGE_FFTW_USE_NEON if BR2_ARM_CPU_HAS_NEON && !BR2_ARM_SOFT_FLOAT
 	help
 	  Compile fftw in single precision, i.e. use 'float' for floating
 	  point type.
diff --git a/package/fftw/fftw.mk b/package/fftw/fftw.mk
index daa3cc2..154f522 100644
--- a/package/fftw/fftw.mk
+++ b/package/fftw/fftw.mk
@@ -23,6 +23,10 @@ endif
 FFTW_CONF_OPTS += $(if $(BR2_PACKAGE_FFTW_USE_SSE),--enable,--disable)-sse
 FFTW_CONF_OPTS += $(if $(BR2_PACKAGE_FFTW_USE_SSE2),--enable,--disable)-sse2
 
+# ARM optimisations
+FFTW_CONF_OPTS += $(if $(BR2_PACKAGE_FFTW_USE_NEON),--enable,--disable)-neon
+FFTW_CFLAGS += $(if $(BR2_PACKAGE_FFTW_USE_NEON),-mfpu=neon)
+
 FFTW_CONF_OPTS += CFLAGS="$(FFTW_CFLAGS)"
 
 $(eval $(autotools-package))
-- 
1.9.1
