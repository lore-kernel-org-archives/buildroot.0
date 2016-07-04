From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Jul 2016 17:34:09 +0200
Subject: [Buildroot] [git commit] openblas: pass ONLY_CBLAS=1 only when
	Fortran is not available
Message-ID: <20160704153822.263EC80797@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d125e8d4d3929cbfa2a7b3dd10514cf1bac87816
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/openblas/openblas.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/openblas/openblas.mk b/package/openblas/openblas.mk
index d07d09d..baeef05 100644
--- a/package/openblas/openblas.mk
+++ b/package/openblas/openblas.mk
@@ -19,9 +19,10 @@ OPENBLAS_MAKE_OPTS += CROSS=1
 # Set OpenBLAS target
 OPENBLAS_MAKE_OPTS += TARGET=$(BR2_PACKAGE_OPENBLAS_TARGET)
 
-# Disable fortran by default until we add BR2_TOOLCHAIN_HAS_FORTRAN
-# hidden symbol to our toolchain infrastructure
+# When Fortran is not available, only build the C version of BLAS
+ifeq ($(BR2_TOOLCHAIN_HAS_FORTRAN),)
 OPENBLAS_MAKE_OPTS += ONLY_CBLAS=1
+endif
 
 # Enable/Disable multi-threading (not for static-only since it uses dlfcn.h)
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS):$(BR2_STATIC_LIBS),y:)
