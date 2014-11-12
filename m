From: =?UTF-8?q?Peter=20K=C3=BCmmel?= <syntheticpp@gmx.net>
Date: Wed, 12 Nov 2014 11:28:05 +0100
Subject: [Buildroot] [PATCH v2] binutils/gcc: add options to enable lto
	support
Message-ID: <1415788085-7263-1-git-send-email-syntheticpp@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When -flto is used the compiler and binutils have to support lto.
ar/ranlib needs to be called with the lto plugin. The wrappers
*-gcc-ar and *-gcc-ranlib provided by GCC could be used as
drop-in for makefiles without lto support.

Signed-off-by: Peter K?mmel <syntheticpp@gmx.net>
---
 package/binutils/Config.in   | 5 +++++
 package/binutils/binutils.mk | 8 ++++++++
 package/gcc/Config.in.host   | 6 ++++++
 package/gcc/gcc.mk           | 4 ++++
 4 files changed, 23 insertions(+)

diff --git a/package/binutils/Config.in b/package/binutils/Config.in
index 50c38b6..f7b8f54 100644
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
index b8dab5d..a9a57a0 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -95,5 +95,13 @@ BINUTILS_PRE_PATCH_HOOKS += BINUTILS_XTENSA_PRE_PATCH
 HOST_BINUTILS_PRE_PATCH_HOOKS += BINUTILS_XTENSA_PRE_PATCH
 endif
 
+ifeq ($(BR2_PACKAGE_BINUTILS_ENABLE_LTO),y)
+BINUTILS_CONF_OPTS += --enable-plugins --enable-lto
+endif
+
+ifeq ($(BR2_GCC_ENABLE_LTO),y)
+HOST_GCC_COMMON_CONF_OPTS += --enable-plugins --enable-lto
+endif
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index de40c63..c3e50a2 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -145,6 +145,12 @@ config BR2_GCC_ENABLE_TLS
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
-- 
1.9.1
