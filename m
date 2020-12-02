From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed,  2 Dec 2020 15:50:24 +0100
Subject: [Buildroot] [PATCH] package/openblas: allow disabling multithreading
Message-ID: <20201202145024.13436-1-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Buildroot would automatically enable multithreading in OpenBLAS if the
architecture supports it. However, one may want to avoid OpenBLAS creating
threads itself and configure single-threaded operation. To accommodate this
use case, add a config option for multithreading.

When multithreading is disabled, but OpenBLAS functions are called in the
same application by multiple threads, then locking is mandatory. The
USE_LOCKING flag was added in version 0.3.7 with following release note:

    a new option USE_LOCKING was added to ensure thread safety when OpenBLAS
    itself is built without multithreading but will be called from multiple
    threads.

However, if one knows that OpenBLAS will only be called from single-threaded
applications, then passing USE_LOCKING is not necessary, so make it a config
option too.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---

This patch was sent earlier but had no response.


 package/openblas/Config.in   | 21 +++++++++++++++++++++
 package/openblas/openblas.mk |  8 +++++++-
 2 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/package/openblas/Config.in b/package/openblas/Config.in
index 3f658c862a..e09f3d0c5a 100644
--- a/package/openblas/Config.in
+++ b/package/openblas/Config.in
@@ -73,4 +73,25 @@ config BR2_PACKAGE_OPENBLAS_TARGET
 	string "OpenBLAS target CPU"
 	default BR2_PACKAGE_OPENBLAS_DEFAULT_TARGET
 
+config BR2_PACKAGE_OPENBLAS_USE_THREAD
+	bool "use multithreading"
+	default y
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_STATIC_LIBS
+	help
+	  Tell OpenBLAS to use multithreading, by passing USE_THREAD=1.
+
+config BR2_PACKAGE_OPENBLAS_USE_LOCKING
+	bool "use locking"
+	default y
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	help
+	  Tell OpenBLAS to use locking, by passing USE_LOCKING=1.
+	  Locking is implicitly enabled when USE_THREAD=1, in which case
+	  disabling this option will not have an effect.
+	  However, if USE_THREAD=0 (i.e. OpenBLAS itself will run in
+	  single-threaded mode) but an application makes OpenBLAS
+	  function calls from multiple threads, then locking is
+	  mandatory for correct operation.
+
 endif
diff --git a/package/openblas/openblas.mk b/package/openblas/openblas.mk
index 9701df9148..0fd761c89c 100644
--- a/package/openblas/openblas.mk
+++ b/package/openblas/openblas.mk
@@ -25,12 +25,18 @@ OPENBLAS_MAKE_OPTS += ONLY_CBLAS=1
 endif
 
 # Enable/Disable multi-threading (not for static-only since it uses dlfcn.h)
-ifeq ($(BR2_TOOLCHAIN_HAS_THREADS):$(BR2_STATIC_LIBS),y:)
+ifeq ($(BR2_PACKAGE_OPENBLAS_USE_THREAD),y)
 OPENBLAS_MAKE_OPTS += USE_THREAD=1
 else
 OPENBLAS_MAKE_OPTS += USE_THREAD=0
 endif
 
+ifeq ($(BR2_PACKAGE_OPENBLAS_USE_LOCKING),y)
+OPENBLAS_MAKE_OPTS += USE_LOCKING=1
+else
+OPENBLAS_MAKE_OPTS += USE_LOCKING=0
+endif
+
 # We don't know if OpenMP is available or not, so disable
 OPENBLAS_MAKE_OPTS += USE_OPENMP=0
 
-- 
2.26.2
