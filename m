From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 23 Sep 2009 09:34:08 +0200
Subject: [Buildroot] [git commit master] Add a config option for gcc tls
	support, rather than disabling it blindly
Message-ID: <20090923073605.CF54F777AB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=3ab4b632a068728516bea29831f7b24b73faa5a1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Defaulted to yes, but blocked it from gcc 4.4.x since the disable was
originally added because of problems with its c++ support reportedly.

Signed-off-by: Austin Foxley <austinf@cetoncorp.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/gcc/Config.in         |    7 +++++++
 toolchain/gcc/gcc-uclibc-4.x.mk |   12 +++++++++---
 2 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/toolchain/gcc/Config.in b/toolchain/gcc/Config.in
index 279e101..db7e32e 100644
--- a/toolchain/gcc/Config.in
+++ b/toolchain/gcc/Config.in
@@ -175,3 +175,10 @@ config BR2_GCC_SHARED_LIBGCC
 	help
 	  Build/install a shared libgcc library
 
+config BR2_GCC_ENABLE_TLS
+	bool "Enable compiler tls support"
+	default y
+	depends on !BR2_GCC_VERSION_4_4_X
+	help
+	  Enable the compiler to generate code for accessing
+	  thread local storage variables
diff --git a/toolchain/gcc/gcc-uclibc-4.x.mk b/toolchain/gcc/gcc-uclibc-4.x.mk
index 98295e3..49e9a70 100644
--- a/toolchain/gcc/gcc-uclibc-4.x.mk
+++ b/toolchain/gcc/gcc-uclibc-4.x.mk
@@ -137,6 +137,12 @@ else
 GCC_SHARED_LIBGCC:=--disable-shared
 endif
 
+ifeq ($(BR2_GCC_ENABLE_TLS),y)
+GCC_TLS:=--enable-tls
+else
+GCC_TLS:=--disable-tls
+endif
+
 ifeq ($(BR2_KERNEL_HURD),y)
 EXTRA_GCC1_CONFIG_OPTIONS+=--without-headers
 endif
@@ -219,7 +225,7 @@ $(GCC_BUILD_DIR1)/.configured: $(GCC_DIR)/.patched
 		--with-gnu-ld \
 		--disable-shared \
 		--disable-libssp \
-		--disable-tls \
+		$(GCC_TLS) \
 		$(GCC_WITH_HOST_GMP) \
 		$(GCC_WITH_HOST_MPFR) \
 		$(DISABLE_NLS) \
@@ -295,7 +301,7 @@ $(GCC_BUILD_DIR2)/.configured: $(GCC_SRC_DIR)/.patched $(GCC_STAGING_PREREQ)
 		--enable-target-optspace \
 		--with-gnu-ld \
 		--disable-libssp \
-		--disable-tls \
+		$(GCC_TLS) \
 		$(GCC_SHARED_LIBGCC) \
 		$(GCC_WITH_HOST_GMP) \
 		$(GCC_WITH_HOST_MPFR) \
@@ -422,7 +428,7 @@ $(GCC_BUILD_DIR3)/.configured: $(GCC_BUILD_DIR3)/.prepared
 		--disable-__cxa_atexit \
 		--with-gnu-ld \
 		--disable-libssp \
-		--disable-tls \
+		$(GCC_TLS) \
 		$(GCC_SHARED_LIBGCC) \
 		$(GCC_WITH_TARGET_GMP) \
 		$(GCC_WITH_TARGET_MPFR) \
-- 
1.6.3.3
