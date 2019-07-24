From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Wed, 24 Jul 2019 10:35:38 -0700
Subject: [Buildroot] [RFC PATCH 4/4] Add linker override to config options
In-Reply-To: <20190724173538.22913-1-joseph.kogut@gmail.com>
References: <20190724173538.22913-1-joseph.kogut@gmail.com>
Message-ID: <20190724173538.22913-5-joseph.kogut@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
---
 Config.in                      | 27 +++++++++++++++++++++++++++
 package/gcc/gcc.mk             |  3 ++-
 package/glibc/glibc.mk         |  3 +++
 toolchain/toolchain-wrapper.mk |  4 ++++
 4 files changed, 36 insertions(+), 1 deletion(-)

diff --git a/Config.in b/Config.in
index 757ad1ca40..576d95305d 100644
--- a/Config.in
+++ b/Config.in
@@ -318,6 +318,33 @@ config BR2_JLEVEL
 	  Number of jobs to run simultaneously. If 0, determine
 	  automatically according to number of CPUs on the host system.
 
+choice
+	prompt "Default linker"
+	default BR2_LINKER_BFD
+	help
+	  Choose the default linker
+	  Individual packages may override this choice
+
+config BR2_LINKER_BFD
+	bool "GNU ld"
+	help
+	  GNU GCC linker
+
+config BR2_LINKER_LLD
+	bool "LLVM LLD"
+	select BR2_PACKAGE_HOST_LLD
+	help
+	  Clang/LLVM linker
+
+	  Offers a faster link times compared to GNU linkers such as ld.bfd and
+	  ld.gold.
+
+	  NOTE: This option requires building LLVM, which is time consuming itself.
+
+	  https://lld.llvm.org/
+
+endchoice
+
 config BR2_CCACHE
 	bool "Enable compiler cache"
 	help
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 46ad16df13..aef0038639 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -85,7 +85,8 @@ HOST_GCC_COMMON_DEPENDENCIES = \
 	host-gmp \
 	host-mpc \
 	host-mpfr \
-	$(if $(BR2_BINFMT_FLAT),host-elf2flt)
+	$(if $(BR2_BINFMT_FLAT),host-elf2flt) \
+	$(if $(BR2_LINKER_LLD),host-lld)
 
 HOST_GCC_COMMON_CONF_OPTS = \
 	--target=$(GNU_TARGET_NAME) \
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index f8d8c1bd87..1c06028241 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -32,6 +32,9 @@ GLIBC_LICENSE_FILES = COPYING COPYING.LIB LICENSES
 # glibc is part of the toolchain so disable the toolchain dependency
 GLIBC_ADD_TOOLCHAIN_DEPENDENCY = NO
 
+# Glibc requires ld.bfd
+GLIBC_MAKE_ENV += BR2_NO_LINKER_OVERRIDE=1
+
 # Before glibc is configured, we must have the first stage
 # cross-compiler and the kernel headers
 GLIBC_DEPENDENCIES = host-gcc-initial linux-headers host-bison host-gawk \
diff --git a/toolchain/toolchain-wrapper.mk b/toolchain/toolchain-wrapper.mk
index ca66fa7ba4..ff7a7ab448 100644
--- a/toolchain/toolchain-wrapper.mk
+++ b/toolchain/toolchain-wrapper.mk
@@ -16,6 +16,10 @@ endif
 TOOLCHAIN_WRAPPER_ARGS = $($(PKG)_TOOLCHAIN_WRAPPER_ARGS)
 TOOLCHAIN_WRAPPER_ARGS += -DBR_SYSROOT='"$(STAGING_SUBDIR)"'
 
+ifeq ($(BR2_LINKER_LLD),y)
+TOOLCHAIN_WRAPPER_ARGS += -DBR_LINKER='"lld"'
+endif
+
 TOOLCHAIN_WRAPPER_OPTS = \
 	$(call qstrip,$(BR2_SSP_OPTION)) \
 	$(call qstrip,$(BR2_TARGET_OPTIMIZATION))
-- 
2.22.0
