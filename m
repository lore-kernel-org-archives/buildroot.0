From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Jul 2016 15:42:16 +0200
Subject: [Buildroot] [git commit] fftw: Disable combined threads when
	building with OpenMP support
Message-ID: <20160702134336.3D9CA81999@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0f163c819c4d8ee76c317ce45e71c9267bae28c1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Otherwise fftw fails to configure:
configure: error: --with-combined-threads incompatible with --enable-openmp

Signed-off-by: Andr?? Hentschel <nerv@dawncrow.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
