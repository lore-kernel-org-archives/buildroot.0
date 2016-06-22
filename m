From: =?UTF-8?q?Andr=C3=A9=20Hentschel?= <nerv@dawncrow.de>
Date: Wed, 22 Jun 2016 19:00:16 +0200
Subject: [Buildroot] [PATCH v2] fftw: Disable combined threads when building
	with OpenMP support
Message-ID: <1466614816-24785-1-git-send-email-nerv@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Otherwise fftw fails to configure:
configure: error: --with-combined-threads incompatible with --enable-openmp

Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
---
 package/fftw/fftw.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/fftw/fftw.mk b/package/fftw/fftw.mk
index 5045ab6..e89671f 100644
--- a/package/fftw/fftw.mk
+++ b/package/fftw/fftw.mk
@@ -31,7 +31,8 @@ FFTW_CFLAGS += $(if $(BR2_PACKAGE_FFTW_USE_NEON),-mfpu=neon)
 
 # Generic optimisations
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
-FFTW_CONF_OPTS += --enable-threads --with-combined-threads
+FFTW_CONF_OPTS += --enable-threads
+FFTW_CONF_OPTS += $(if $(BR2_GCC_ENABLE_OPENMP),--without,--with)-combined-threads
 else
 FFTW_CONF_OPTS += --disable-threads
 endif
-- 
2.7.4
