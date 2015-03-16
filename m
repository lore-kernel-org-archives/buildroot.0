From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 16 Mar 2015 19:44:02 +0100
Subject: [Buildroot] [git commit] package/fftw: add ARM optimisations
Message-ID: <20150316184431.986157FA25@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=007d688e5202f2501d8ed9b898735793245f578d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
[based on a patch by Guillaume]
Cc: guillaume william brs <guillaume.bressaix@gmail.com>
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/fftw/Config.in |    4 ++++
 package/fftw/fftw.mk   |    4 ++++
 2 files changed, 8 insertions(+), 0 deletions(-)

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
