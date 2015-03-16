From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 16 Mar 2015 19:44:02 +0100
Subject: [Buildroot] [git commit] package/fftw: add x86 optimisations
Message-ID: <20150316184431.8F7BD7FA25@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=20b741da4cf90a321ce51fa0c48c07d7b5ae574e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Cc: guillaume william brs <guillaume.bressaix@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/fftw/Config.in |    9 +++++++++
 package/fftw/fftw.mk   |    4 ++++
 2 files changed, 13 insertions(+), 0 deletions(-)

diff --git a/package/fftw/Config.in b/package/fftw/Config.in
index 4a0706a..7feadd8 100644
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
 	default BR2_PACKAGE_FFTW_PRECISION_DOUBLE
@@ -20,12 +26,15 @@ choice
 
 config BR2_PACKAGE_FFTW_PRECISION_SINGLE
 	bool "single"
+	select BR2_PACKAGE_FFTW_USE_SSE if BR2_X86_CPU_HAS_SSE
+	select BR2_PACKAGE_FFTW_USE_SSE2 if BR2_X86_CPU_HAS_SSE2
 	help
 	  Compile fftw in single precision, i.e. use 'float' for floating
 	  point type.
 
 config BR2_PACKAGE_FFTW_PRECISION_DOUBLE
 	bool "double"
+	select BR2_PACKAGE_FFTW_USE_SSE2 if BR2_X86_CPU_HAS_SSE2
 	help
 	  Compile fftw in double precision (the default), i.e. use 'double'
 	  for floating point type.
diff --git a/package/fftw/fftw.mk b/package/fftw/fftw.mk
index c05012a..daa3cc2 100644
--- a/package/fftw/fftw.mk
+++ b/package/fftw/fftw.mk
@@ -19,6 +19,10 @@ ifeq ($(BR2_PACKAGE_FFTW_FAST),y)
 FFTW_CFLAGS += -Ofast
 endif
 
+# x86 optimisations
+FFTW_CONF_OPTS += $(if $(BR2_PACKAGE_FFTW_USE_SSE),--enable,--disable)-sse
+FFTW_CONF_OPTS += $(if $(BR2_PACKAGE_FFTW_USE_SSE2),--enable,--disable)-sse2
+
 FFTW_CONF_OPTS += CFLAGS="$(FFTW_CFLAGS)"
 
 $(eval $(autotools-package))
