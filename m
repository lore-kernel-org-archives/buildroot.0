From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Wed, 12 Dec 2018 08:45:26 +0100
Subject: [Buildroot] [PATCH v2 01/14] fftw: breaks fftw-single into a
 dedicated package
Message-ID: <20181212074539.11656-1-gwenj@trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

fftw's library name depends on the precision option. Consequently,
it's possible to install multiple flavor on the same target.

This patch breaks fftw single precision into a new package and:
- deprecates BR2_PACKAGE_FFTW_PRECISION_SINGLE, BR2_PACKAGE_FFTW_SINGLE must be
  used instead;
- suppress BR2_PACKAGE_FFTW_USE_SSE and BR2_PACKAGE_FFTW_USE_NEON since options
  are only available on single precision. Corresponding options are directly
  handled in fftw-single package;
- do fftw depends on fftw-single when this package is enabled.

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
---
Changes v1 -> v2:
 * BR2_PACKAGE_FFTW_PRECISION_SINGLE -> BR2_PACKAGE_FFTW_SINGLE (Arnout)
 * old symbol deprecation (Arnout)
 * split big monolithic patch into a serie (Arnout)
 * add dependency between fftw and fftw-single (Yann)
---
 Config.in.legacy                          |  9 +++++++
 package/fftw/Config.in                    | 17 ++----------
 package/fftw/fftw-single/Config.in        |  5 ++++
 package/fftw/fftw-single/fftw-single.hash |  1 +
 package/fftw/fftw-single/fftw-single.mk   | 33 +++++++++++++++++++++++
 package/fftw/fftw.mk                      | 12 ++++-----
 6 files changed, 56 insertions(+), 21 deletions(-)
 create mode 100644 package/fftw/fftw-single/Config.in
 create mode 120000 package/fftw/fftw-single/fftw-single.hash
 create mode 100644 package/fftw/fftw-single/fftw-single.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 37119d7e58..1eef04923e 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,15 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2019.02"
 
+config BR2_PACKAGE_FFTW_PRECISION_SINGLE
+	bool "fftw single precision option was replaced by package"
+	select BR2_LEGACY
+	select BR2_PACKAGE_FFTW
+	select BR2_PACKAGE_FFTW_SINGLE
+	help
+	  fftw single precision option was replaced by dedicated
+	  package.
+
 config BR2_PACKAGE_LUA_5_2
 	bool "Lua 5.2.x version removed"
 	select BR2_LEGACY
diff --git a/package/fftw/Config.in b/package/fftw/Config.in
index d51f8f3c51..97b1c8a6dc 100644
--- a/package/fftw/Config.in
+++ b/package/fftw/Config.in
@@ -12,30 +12,15 @@ config BR2_PACKAGE_FFTW
 
 if BR2_PACKAGE_FFTW
 
-config BR2_PACKAGE_FFTW_USE_SSE
-	bool
-
 config BR2_PACKAGE_FFTW_USE_SSE2
 	bool
 
-config BR2_PACKAGE_FFTW_USE_NEON
-	bool
-
 choice
 	prompt "fftw precision"
 	default BR2_PACKAGE_FFTW_PRECISION_DOUBLE
 	help
 	  Selects fftw precision
 
-config BR2_PACKAGE_FFTW_PRECISION_SINGLE
-	bool "single"
-	select BR2_PACKAGE_FFTW_USE_SSE if BR2_X86_CPU_HAS_SSE
-	select BR2_PACKAGE_FFTW_USE_SSE2 if BR2_X86_CPU_HAS_SSE2
-	select BR2_PACKAGE_FFTW_USE_NEON if BR2_ARM_CPU_HAS_NEON && !BR2_ARM_SOFT_FLOAT
-	help
-	  Compile fftw in single precision, i.e. use 'float' for
-	  floating point type.
-
 config BR2_PACKAGE_FFTW_PRECISION_DOUBLE
 	bool "double"
 	select BR2_PACKAGE_FFTW_USE_SSE2 if BR2_X86_CPU_HAS_SSE2
@@ -62,6 +47,8 @@ config BR2_PACKAGE_FFTW_PRECISION_QUAD
 
 endchoice
 
+source "package/fftw/fftw-single/Config.in"
+
 config BR2_PACKAGE_FFTW_FAST
 	bool "optimise for speed over accuracy"
 	help
diff --git a/package/fftw/fftw-single/Config.in b/package/fftw/fftw-single/Config.in
new file mode 100644
index 0000000000..ff1486871d
--- /dev/null
+++ b/package/fftw/fftw-single/Config.in
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_FFTW_SINGLE
+	bool "fftw-single"
+	help
+	  Compile fftw in single precision, i.e. use 'float'
+	  for floating point type.
diff --git a/package/fftw/fftw-single/fftw-single.hash b/package/fftw/fftw-single/fftw-single.hash
new file mode 120000
index 0000000000..3ee7ecb3ba
--- /dev/null
+++ b/package/fftw/fftw-single/fftw-single.hash
@@ -0,0 +1 @@
+../fftw.hash
\ No newline at end of file
diff --git a/package/fftw/fftw-single/fftw-single.mk b/package/fftw/fftw-single/fftw-single.mk
new file mode 100644
index 0000000000..9adfe08f5e
--- /dev/null
+++ b/package/fftw/fftw-single/fftw-single.mk
@@ -0,0 +1,33 @@
+################################################################################
+#
+# fftw-single
+#
+################################################################################
+
+FFTW_SINGLE_VERSION = $(FFTW_VERSION)
+FFTW_SINGLE_SOURCE = fftw-$(FFTW_VERSION).tar.gz
+FFTW_SINGLE_SITE = $(FFTW_SITE)
+FFTW_SINGLE_INSTALL_STAGING = $(FFTW_INSTALL_STAGING)
+FFTW_SINGLE_LICENSE = $(FFTW_LICENSE)
+FFTW_SINGLE_LICENSE_FILES = $(FFTW_LICENSE_FILES)
+
+FFTW_SINGLE_CONF_ENV = $(FFTW_CONF_ENV)
+
+FFTW_SINGLE_CONF_OPTS = $(FFTW_CONF_OPTS)
+FFTW_SINGLE_CONF_OPTS += --enable-single
+
+FFTW_SINGLE_CFLAGS = $(FFTW_CFLAGS)
+
+# x86 optimisations
+FFTW_SINGLE_CONF_OPTS += $(if $(BR2_X86_CPU_HAS_SSE),--enable,--disable)-sse
+FFTW_SINGLE_CONF_OPTS += $(if $(BR2_X86_CPU_HAS_SSE2),--enable,--disable)-sse2
+
+# ARM optimisations
+ifeq ($(BR2_ARM_CPU_HAS_NEON):$(BR2_ARM_SOFT_FLOAT),y:)
+FFTW_SINGLE_CONF_OPTS += --enable-neon
+FFTW_SINGLE_CFLAGS += -mfpu=neon
+else
+FFTW_SINGLE_CONF_OPTS += --disable-neon
+endif
+
+$(eval $(autotools-package))
diff --git a/package/fftw/fftw.mk b/package/fftw/fftw.mk
index b167a2f6f7..0c11c6a720 100644
--- a/package/fftw/fftw.mk
+++ b/package/fftw/fftw.mk
@@ -10,6 +10,10 @@ FFTW_INSTALL_STAGING = YES
 FFTW_LICENSE = GPL-2.0+
 FFTW_LICENSE_FILES = COPYING
 
+ifeq ($(BR2_PACKAGE_FFTW_SINGLE),y)
+FFTW_DEPENDENCIES += fftw-single
+endif
+
 # fortran support only enables generation and installation of fortran sources
 ifeq ($(BR2_TOOLCHAIN_HAS_FORTRAN),y)
 FFTW_CONF_OPTS += --enable-fortran
@@ -18,7 +22,6 @@ else
 FFTW_CONF_OPTS += --disable-fortran
 endif
 
-FFTW_CONF_OPTS += $(if $(BR2_PACKAGE_FFTW_PRECISION_SINGLE),--enable,--disable)-single
 FFTW_CONF_OPTS += $(if $(BR2_PACKAGE_FFTW_PRECISION_LONG_DOUBLE),--enable,--disable)-long-double
 FFTW_CONF_OPTS += $(if $(BR2_PACKAGE_FFTW_PRECISION_QUAD),--enable,--disable)-quad-precision
 
@@ -28,13 +31,8 @@ FFTW_CFLAGS += -O3 -ffast-math
 endif
 
 # x86 optimisations
-FFTW_CONF_OPTS += $(if $(BR2_PACKAGE_FFTW_USE_SSE),--enable,--disable)-sse
 FFTW_CONF_OPTS += $(if $(BR2_PACKAGE_FFTW_USE_SSE2),--enable,--disable)-sse2
 
-# ARM optimisations
-FFTW_CONF_OPTS += $(if $(BR2_PACKAGE_FFTW_USE_NEON),--enable,--disable)-neon
-FFTW_CFLAGS += $(if $(BR2_PACKAGE_FFTW_USE_NEON),-mfpu=neon)
-
 # Generic optimisations
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
 FFTW_CONF_OPTS += --enable-threads
@@ -47,3 +45,5 @@ FFTW_CONF_OPTS += $(if $(BR2_GCC_ENABLE_OPENMP),--enable,--disable)-openmp
 FFTW_CONF_OPTS += CFLAGS="$(FFTW_CFLAGS)"
 
 $(eval $(autotools-package))
+
+include $(sort $(wildcard package/fftw/*/*.mk))
-- 
2.19.2
