From: =?UTF-8?q?Peter=20K=C3=BCmmel?= <syntheticpp@gmx.net>
Date: Sat, 20 Dec 2014 16:01:09 +0100
Subject: [Buildroot] [PATCH 1/1] binutils,
	gcc: add support for GCC flag -flto
Message-ID: <1419087669-2365-1-git-send-email-syntheticpp@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter K?mmel <syntheticpp@gmx.net>
---
 package/binutils/Config.in                         | 5 +++++
 package/binutils/binutils.mk                       | 8 ++++++++
 package/gcc/Config.in.host                         | 6 ++++++
 package/gcc/gcc.mk                                 | 4 ++++
 toolchain/toolchain-external/toolchain-external.mk | 3 +++
 5 files changed, 26 insertions(+)

diff --git a/package/binutils/Config.in b/package/binutils/Config.in
index 64d0a09..a5d2cc9 100644
--- a/package/binutils/Config.in
+++ b/package/binutils/Config.in
@@ -19,6 +19,11 @@ config BR2_PACKAGE_BINUTILS_TARGET
 
 	  http://www.gnu.org/software/binutils/
 
+config BR2_PACKAGE_BINUTILS_ENABLE_LTO
+	bool "Enable support for link-time-optimization"
+	help
+	  Enable lto support. Allows passing a lto plugin to ar and ranlib.
+
 endif
 
 comment "binutils needs a toolchain w/ wchar"
diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 9a9bb94..3916cad 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -96,5 +96,13 @@ BINUTILS_PRE_PATCH_HOOKS += BINUTILS_XTENSA_PRE_PATCH
 HOST_BINUTILS_PRE_PATCH_HOOKS += BINUTILS_XTENSA_PRE_PATCH
 endif
 
+ifeq ($(BR2_PACKAGE_BINUTILS_ENABLE_LTO),y)
+BINUTILS_CONF_OPTS += --enable-plugins --enable-lto
+endif
+
+ifeq ($(BR2_GCC_ENABLE_LTO),y)
+HOST_BINUTILS_CONF_OPTS += --enable-plugins --enable-lto
+endif
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 0750807..4e0c2ae 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -128,6 +128,12 @@ config BR2_GCC_ENABLE_TLS
 	  Enable the compiler to generate code for accessing
 	  thread local storage variables
 
+config BR2_GCC_ENABLE_LTO
+	bool "Enable compiler link-time-optimization support"
+	help
+	  Since version 4.5 GCC supports lto. Build GCC with lto support enabled.
+	  Needed when -flto should be used.
+
 config BR2_GCC_ENABLE_OPENMP
 	bool "Enable compiler OpenMP support"
 	depends on !BR2_PTHREADS_NONE && !BR2_avr32 && !BR2_arc && !BR2_microblaze
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index cdd71aa..8eaa91d 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -127,6 +127,10 @@ else
 HOST_GCC_COMMON_CONF_OPTS += --disable-tls
 endif
 
+ifeq ($(BR2_GCC_ENABLE_LTO),y)
+HOST_GCC_COMMON_CONF_OPTS += --enable-plugins --enable-lto
+endif
+
 ifeq ($(BR2_GCC_ENABLE_LIBMUDFLAP),y)
 HOST_GCC_COMMON_CONF_OPTS += --enable-libmudflap
 else
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index b07b16c..8baf561 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -643,6 +643,9 @@ define TOOLCHAIN_EXTERNAL_INSTALL_WRAPPER
 	for i in $(TOOLCHAIN_EXTERNAL_CROSS)*; do \
 		base=$${i##*/}; \
 		case "$$base" in \
+		*-ar|*-ranlib|*-nm) \
+			ln -sf $$(echo $$i | sed 's%^$(HOST_DIR)%../..%') .; \
+			;; \
 		*cc|*cc-*|*++|*++-*|*cpp) \
 			ln -sf ext-toolchain-wrapper $$base; \
 			;; \
-- 
1.9.1
