From: Ed Blake <ed.blake@sondrel.com>
Date: Tue, 26 Mar 2019 12:30:47 +0000
Subject: [Buildroot] [PATCH v2 4/4] package: use BR2_TOOLCHAIN_HAS_OPENMP
In-Reply-To: <20190326123032.9905-1-ed.blake@sondrel.com>
References: <20190326123032.9905-1-ed.blake@sondrel.com>
Message-ID: <20190326123032.9905-5-ed.blake@sondrel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Switch from using BR2_GCC_ENABLE_OPENMP to BR2_TOOLCHAIN_HAS_OPENMP to
determine OpenMP support in the following packages:

fftw
flann
opencv3

Signed-off-by: Ed Blake <ed.blake@sondrel.com>
---
 package/fftw/fftw.mk       | 4 ++--
 package/flann/flann.mk     | 2 +-
 package/opencv3/opencv3.mk | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/fftw/fftw.mk b/package/fftw/fftw.mk
index bcfdb9c96a..279244a5dc 100644
--- a/package/fftw/fftw.mk
+++ b/package/fftw/fftw.mk
@@ -27,10 +27,10 @@ endif
 # Generic optimisations
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
 FFTW_COMMON_CONF_OPTS += --enable-threads
-FFTW_COMMON_CONF_OPTS += $(if $(BR2_GCC_ENABLE_OPENMP),--without,--with)-combined-threads
+FFTW_COMMON_CONF_OPTS += $(if $(BR2_TOOLCHAIN_HAS_OPENMP),--without,--with)-combined-threads
 else
 FFTW_COMMON_CONF_OPTS += --disable-threads
 endif
-FFTW_COMMON_CONF_OPTS += $(if $(BR2_GCC_ENABLE_OPENMP),--enable,--disable)-openmp
+FFTW_COMMON_CONF_OPTS += $(if $(BR2_TOOLCHAIN_HAS_OPENMP),--enable,--disable)-openmp
 
 include $(sort $(wildcard package/fftw/*/*.mk))
diff --git a/package/flann/flann.mk b/package/flann/flann.mk
index ef61815bba..d091ec18a0 100644
--- a/package/flann/flann.mk
+++ b/package/flann/flann.mk
@@ -14,7 +14,7 @@ FLANN_CONF_OPTS = \
 	-DBUILD_PYTHON_BINDINGS=OFF \
 	-DBUILD_MATLAB_BINDINGS=OFF \
 	-DBUILD_EXAMPLES=$(if $(BR2_PACKAGE_FLANN_EXAMPLES),ON,OFF) \
-	-DUSE_OPENMP=$(if $(BR2_GCC_ENABLE_OPENMP),ON,OFF) \
+	-DUSE_OPENMP=$(if $(BR2_TOOLCHAIN_HAS_OPENMP),ON,OFF) \
 	-DPYTHON_EXECUTABLE=OFF \
 	-DCMAKE_DISABLE_FIND_PACKAGE_HDF5=TRUE
 
diff --git a/package/opencv3/opencv3.mk b/package/opencv3/opencv3.mk
index 3a2594b584..292ce81432 100644
--- a/package/opencv3/opencv3.mk
+++ b/package/opencv3/opencv3.mk
@@ -279,7 +279,7 @@ else
 OPENCV3_CONF_OPTS += -DWITH_OPENGL=OFF
 endif
 
-OPENCV3_CONF_OPTS += -DWITH_OPENMP=$(if $(BR2_GCC_ENABLE_OPENMP),ON,OFF)
+OPENCV3_CONF_OPTS += -DWITH_OPENMP=$(if $(BR2_TOOLCHAIN_HAS_OPENMP),ON,OFF)
 
 ifeq ($(BR2_PACKAGE_OPENCV3_WITH_PNG),y)
 OPENCV3_CONF_OPTS += -DWITH_PNG=ON
-- 
2.17.1
