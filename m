From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 29 Aug 2019 23:29:46 +0200
Subject: [Buildroot] [git commit branch/2019.05.x] package/python-numpy: fix
 run-time failure with clapack
Message-ID: <20190829212557.07A0488532@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=923120cd76a4562873645639cd2627aba30e79d5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

The numpy build system attempts to find lapack/blas at build time. It
tries a lot of different implementations, e.g. lapack, openblas, atlas,
... It is possible to help this automatic discovery by specifying
libraries to load in site.cfg and/or by setting environment variables
BLAS and LAPACK.

Unfortunately, the build system's logic is really hard to understand and
it's fragile. For example, regardless of what is specified as libraries
to load, it *will* try to find libblas.so and liblapack.so. However,
when something is specified explicitly in site.cfg, it will use a
different code path.

It turns out that when we specified the blas and lapack libraries
explicitly, as is done now, the build system logic will assume (without
checking) that cblas is used. This causes calls to cblas_* to be linked
in - again without checking, because numpy contains a copy of the header
and it uses dlopen to load it. clapack, however, does *not* provide
cblas (although it does provide a library libblas.so, but no
libcblas.so). Therefore, when importing numpy at runtime, we get an
error like:

ImportError: /usr/lib/python3.7/site-packages/numpy/core/_multiarray_umath.cpython-37m-arm-linux-gnueabihf.so: undefined symbol: cblas_sgemm

The initial attempt to fix this added cblas to the libraries. This
happens to work because apparently the entire libraries line is ignored
when a non-existing library is added to it (remember, clapack does not
provide libcblas).

Another attempt was to set BLAS=None in the environment. This didn't
have any effect. Setting both BLAS=None and LAPACK=None does disable
lapack and blas, but then we don't use clapack at all.

In fact, it is not necessary to provide a libraries line at all: the
build system will attempt to find liblapack, libblas and libcblas
without any help.

Therefore, remove the libraries line from site.cfg and remove
PYTHON_NUMPY_SITE_CFG_LIBS.

Note that the paths to staging's /usr/include and /usr/lib need to be
specified explicitly. Indeed, the numpy build system doesn't use the
compiler to check the presence/absence of includes and libraries; it
searches the paths itself. It also hardcodes paths to /usr/lib etc, but
this is something that will be tackled in a separate commit.

Note that there is another problem: both lapack and clapack provide
libblas.so and liblapack.so. This will be handled in a later commit.

Also, openblas provides a cblas implementation in libopenblas.so, so
there should be a dependency on openblas to make sure numpy can find it.
This part is not entirely clear yet, so it will also be handled in a
separate commit.

Runtime testing is essential to be able to track this kind of issue, so
that is something that will be added in a separate commit as well.

Fixes:
http://lists.busybox.net/pipermail/buildroot/2019-June/252380.html

Initial patch from Giulio Benetti :
[v1] http://patchwork.ozlabs.org/patch/1100100/
[v2] http://patchwork.ozlabs.org/patch/1100208/

Signed-off-by: Alexandre PAYEN <alexandre.payen@smile.fr>
Cc: Giulio Benetti <giulio.benetti@micronovasrl.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 4c2b6978f6439138870720c85be99a4eb056fc3c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-numpy/python-numpy.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/python-numpy/python-numpy.mk b/package/python-numpy/python-numpy.mk
index 28dccf8be5..303f6b25cd 100644
--- a/package/python-numpy/python-numpy.mk
+++ b/package/python-numpy/python-numpy.mk
@@ -17,7 +17,6 @@ PYTHON_NUMPY_SETUP_TYPE = setuptools
 
 ifeq ($(BR2_PACKAGE_CLAPACK),y)
 PYTHON_NUMPY_DEPENDENCIES += clapack
-PYTHON_NUMPY_SITE_CFG_LIBS += blas lapack
 else
 PYTHON_NUMPY_ENV += BLAS=None LAPACK=None
 endif
@@ -29,7 +28,6 @@ define PYTHON_NUMPY_CONFIGURE_CMDS
 	echo "[DEFAULT]" >> $(@D)/site.cfg
 	echo "library_dirs = $(STAGING_DIR)/usr/lib" >> $(@D)/site.cfg
 	echo "include_dirs = $(STAGING_DIR)/usr/include" >> $(@D)/site.cfg
-	echo "libraries =" $(subst $(space),$(comma),$(PYTHON_NUMPY_SITE_CFG_LIBS)) >> $(@D)/site.cfg
 endef
 
 # Some package may include few headers from NumPy, so let's install it
