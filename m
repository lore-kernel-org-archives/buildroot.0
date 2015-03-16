From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 16 Mar 2015 14:54:01 +0100
Subject: [Buildroot] [PATCH 3/7 v6] package/fftw: add ARM optimisations
In-Reply-To: <cover.1426513949.git.yann.morin.1998@free.fr>
References: <cover.1426513949.git.yann.morin.1998@free.fr>
Message-ID: <930765fdc259da928cc44c19eb191f71d5132eef.1426513949.git.yann.morin.1998@free.fr>
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
Changes v5 -> v6:
  - NEON can't be used by all precisions  (Gwenhael)
---
 package/fftw/Config.in | 4 ++++
 package/fftw/fftw.mk   | 3 +++
 2 files changed, 7 insertions(+)

diff --git a/package/fftw/Config.in b/package/fftw/Config.in
index 30c395f..a0f353c 100644
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
 	default BR2_PACKAGE_FFTW_PRECISION_NONE
@@ -33,6 +36,7 @@ config BR2_PACKAGE_FFTW_PRECISION_SINGLE
 	bool "single precision"
 	select BR2_PACKAGE_FFTW_USE_SSE if BR2_X86_CPU_HAS_SSE
 	select BR2_PACKAGE_FFTW_USE_SSE2 if BR2_X86_CPU_HAS_SSE2
+	select BR2_PACKAGE_FFTW_USE_NEON if BR2_ARM_FPU_NEON
 	help
 	  compile fftw in single precision
 
diff --git a/package/fftw/fftw.mk b/package/fftw/fftw.mk
index 18239e8..be99210 100644
--- a/package/fftw/fftw.mk
+++ b/package/fftw/fftw.mk
@@ -18,4 +18,7 @@ FFTW_CONF_OPTS += $(if $(BR2_PACKAGE_FFTW_PRECISION_QUAD),--enable,--disable)-qu
 FFTW_CONF_OPTS += $(if $(BR2_PACKAGE_FFTW_USE_SSE),--enable,--disable)-sse
 FFTW_CONF_OPTS += $(if $(BR2_PACKAGE_FFTW_USE_SSE2),--enable,--disable)-sse2
 
+# ARM optimisations
+FFTW_CONF_OPTS += $(if $(BR2_PACKAGE_FFTW_USE_NEON),--enable,--disable)-neon
+
 $(eval $(autotools-package))
-- 
1.9.1
