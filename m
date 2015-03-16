From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 16 Mar 2015 14:54:00 +0100
Subject: [Buildroot] [PATCH 2/7 v6] package/fftw: add x86 optimisations
In-Reply-To: <cover.1426513949.git.yann.morin.1998@free.fr>
References: <cover.1426513949.git.yann.morin.1998@free.fr>
Message-ID: <cef3c674d08007636f5df8ee3e72edc23840efcf.1426513949.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Cc: guillaume william brs <guillaume.bressaix@gmail.com>

---
Changes v5 -> v6:
  - SSE/SSE2 can't be enabled for all precisions  (Gwenhael)
---
 package/fftw/Config.in | 10 +++++++++-
 package/fftw/fftw.mk   |  4 ++++
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/package/fftw/Config.in b/package/fftw/Config.in
index 7fa2c4c..30c395f 100644
--- a/package/fftw/Config.in
+++ b/package/fftw/Config.in
@@ -12,6 +12,12 @@ config BR2_PACKAGE_FFTW
 
 if BR2_PACKAGE_FFTW
 
+config BR2_PACKAGE_FFTW_USE_SSE
+	bool
+
+config BR2_PACKAGE_FFTW_USE_SSE2
+	bool
+
 choice
 	prompt "fftw precision"
 	default BR2_PACKAGE_FFTW_PRECISION_NONE
@@ -25,6 +31,8 @@ config BR2_PACKAGE_FFTW_PRECISION_NONE
 
 config BR2_PACKAGE_FFTW_PRECISION_SINGLE
 	bool "single precision"
+	select BR2_PACKAGE_FFTW_USE_SSE if BR2_X86_CPU_HAS_SSE
+	select BR2_PACKAGE_FFTW_USE_SSE2 if BR2_X86_CPU_HAS_SSE2
 	help
 	  compile fftw in single precision
 
@@ -33,7 +41,7 @@ config BR2_PACKAGE_FFTW_PRECISION_LONG_DOUBLE
 	# long-double precision require long-double trigonometric routines
 	depends on !(BR2_TOOLCHAIN_BUILDROOT_UCLIBC && \
 		(BR2_arm || BR2_mips || BR2_mipsel))
-
+	select BR2_PACKAGE_FFTW_USE_SSE2 if BR2_X86_CPU_HAS_SSE2
 	help
 	  compile fftw in long-double precision
 
diff --git a/package/fftw/fftw.mk b/package/fftw/fftw.mk
index 78d36e9..18239e8 100644
--- a/package/fftw/fftw.mk
+++ b/package/fftw/fftw.mk
@@ -14,4 +14,8 @@ FFTW_CONF_OPTS += $(if $(BR2_PACKAGE_FFTW_PRECISION_SINGLE),--enable,--disable)-
 FFTW_CONF_OPTS += $(if $(BR2_PACKAGE_FFTW_PRECISION_LONG_DOUBLE),--enable,--disable)-long-double
 FFTW_CONF_OPTS += $(if $(BR2_PACKAGE_FFTW_PRECISION_QUAD),--enable,--disable)-quad-precision
 
+# x86 optimisations
+FFTW_CONF_OPTS += $(if $(BR2_PACKAGE_FFTW_USE_SSE),--enable,--disable)-sse
+FFTW_CONF_OPTS += $(if $(BR2_PACKAGE_FFTW_USE_SSE2),--enable,--disable)-sse2
+
 $(eval $(autotools-package))
-- 
1.9.1
