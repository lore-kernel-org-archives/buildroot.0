From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Wed, 12 Dec 2018 08:45:29 +0100
Subject: [Buildroot] [PATCH v2 04/14] fftw: breaks fftw-double into a
 dedicated package
In-Reply-To: <20181212074539.11656-1-gwenj@trabucayre.com>
References: <20181212074539.11656-1-gwenj@trabucayre.com>
Message-ID: <20181212074539.11656-4-gwenj@trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

fftw's library name depends on the precision option. Consequently,
it's possible to install multiple flavor on the same target.

This patch breaks fftw double precision into a new package and:
- deprecates BR2_PACKAGE_FFTW_PRECISION_DOUBLE, BR2_PACKAGE_FFTW_DOUBLE must be
  used instead;
- suppress BR2_PACKAGE_FFTW_USE_SSE2 since option is only available on single and
  double precision. Corresponding options are directly
  handled in fftw-double package;
- do fftw depends on fftw-double when this package is enabled.
- select this option when fftw is enabled and no precision is enabled

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
---
Changes v1 -> v2:
 * BR2_PACKAGE_FFTW_PRECISION_DOUBLE -> BR2_PACKAGE_FFTW_DOUBLE (Arnout)
 * old symbol deprecation (Arnout)
 * split big monolithic patch into a serie (Arnout)
 * add dependency between fftw and fftw-double (Yann)
---
 Config.in.legacy                          |  9 +++++++++
 package/fftw/Config.in                    | 23 +++++------------------
 package/fftw/fftw-double/Config.in        |  5 +++++
 package/fftw/fftw-double/fftw-double.hash |  1 +
 package/fftw/fftw-double/fftw-double.mk   | 23 +++++++++++++++++++++++
 package/fftw/fftw.mk                      |  9 ++++-----
 6 files changed, 47 insertions(+), 23 deletions(-)
 create mode 100644 package/fftw/fftw-double/Config.in
 create mode 120000 package/fftw/fftw-double/fftw-double.hash
 create mode 100644 package/fftw/fftw-double/fftw-double.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 06a5803ff5..fa157dc4ec 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,15 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2019.02"
 
+config BR2_PACKAGE_FFTW_PRECISION_DOUBLE
+	bool "fftw double precision option was replaced by package"
+	select BR2_LEGACY
+	select BR2_PACKAGE_FFTW
+	select BR2_PACKAGE_FFTW_DOUBLE
+	help
+	  fftw double precision option was replaced by dedicated
+	  package.
+
 config BR2_PACKAGE_FFTW_PRECISION_LONG_DOUBLE
 	bool "fftw long double precision option was replaced by package"
 	select BR2_LEGACY
diff --git a/package/fftw/Config.in b/package/fftw/Config.in
index 945fd5d173..3f04f16454 100644
--- a/package/fftw/Config.in
+++ b/package/fftw/Config.in
@@ -1,5 +1,9 @@
 config BR2_PACKAGE_FFTW
 	bool "fftw"
+	select BR2_PACKAGE_FFTW_DOUBLE if \
+		!BR2_PACKAGE_FFTW_SINGLE && \
+		!BR2_PACKAGE_FFTW_QUAD && \
+		!BR2_PACKAGE_FFTW_LONG_DOUBLE
 	help
 	  Library for computing Fast Fourier Transforms.
 
@@ -12,24 +16,7 @@ config BR2_PACKAGE_FFTW
 
 if BR2_PACKAGE_FFTW
 
-config BR2_PACKAGE_FFTW_USE_SSE2
-	bool
-
-choice
-	prompt "fftw precision"
-	default BR2_PACKAGE_FFTW_PRECISION_DOUBLE
-	help
-	  Selects fftw precision
-
-config BR2_PACKAGE_FFTW_PRECISION_DOUBLE
-	bool "double"
-	select BR2_PACKAGE_FFTW_USE_SSE2 if BR2_X86_CPU_HAS_SSE2
-	help
-	  Compile fftw in double precision (the default), i.e. use
-	  'double' for floating point type.
-
-endchoice
-
+source "package/fftw/fftw-double/Config.in"
 source "package/fftw/fftw-long-double/Config.in"
 source "package/fftw/fftw-single/Config.in"
 source "package/fftw/fftw-quad/Config.in"
diff --git a/package/fftw/fftw-double/Config.in b/package/fftw/fftw-double/Config.in
new file mode 100644
index 0000000000..cfcd1ef997
--- /dev/null
+++ b/package/fftw/fftw-double/Config.in
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_FFTW_DOUBLE
+	bool "fftw-double"
+	help
+	  Compile fftw in double precision (the default), i.e. use
+	  'double' for floating point type.
diff --git a/package/fftw/fftw-double/fftw-double.hash b/package/fftw/fftw-double/fftw-double.hash
new file mode 120000
index 0000000000..3ee7ecb3ba
--- /dev/null
+++ b/package/fftw/fftw-double/fftw-double.hash
@@ -0,0 +1 @@
+../fftw.hash
\ No newline at end of file
diff --git a/package/fftw/fftw-double/fftw-double.mk b/package/fftw/fftw-double/fftw-double.mk
new file mode 100644
index 0000000000..2923a86783
--- /dev/null
+++ b/package/fftw/fftw-double/fftw-double.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# fftw-double
+#
+################################################################################
+
+FFTW_DOUBLE_VERSION = $(FFTW_VERSION)
+FFTW_DOUBLE_SOURCE = fftw-$(FFTW_VERSION).tar.gz
+FFTW_DOUBLE_SITE = $(FFTW_SITE)
+FFTW_DOUBLE_INSTALL_STAGING = $(FFTW_INSTALL_STAGING)
+FFTW_DOUBLE_LICENSE = $(FFTW_LICENSE)
+FFTW_DOUBLE_LICENSE_FILES = $(FFTW_LICENSE_FILES)
+
+FFTW_DOUBLE_CONF_ENV = $(FFTW_CONF_ENV)
+
+FFTW_DOUBLE_CONF_OPTS= $(FFTW_CONF_OPTS)
+
+FFTW_DOUBLE_CFLAGS = $(FFTW_CFLAGS)
+
+# x86 optimisations
+FFTW_DOUBLE_CONF_OPTS += $(if $(BR2_X86_CPU_HAS_SSE2),--enable,--disable)-sse2
+
+$(eval $(autotools-package))
diff --git a/package/fftw/fftw.mk b/package/fftw/fftw.mk
index 499e0ed1ad..69db09dcd4 100644
--- a/package/fftw/fftw.mk
+++ b/package/fftw/fftw.mk
@@ -10,6 +10,10 @@ FFTW_INSTALL_STAGING = YES
 FFTW_LICENSE = GPL-2.0+
 FFTW_LICENSE_FILES = COPYING
 
+ifeq ($(BR2_PACKAGE_FFTW_DOUBLE),y)
+FFTW_DEPENDENCIES += fftw-double
+endif
+
 ifeq ($(BR2_PACKAGE_FFTW_LONG_DOUBLE),y)
 FFTW_DEPENDENCIES += fftw-long-double
 endif
@@ -35,9 +39,6 @@ ifeq ($(BR2_PACKAGE_FFTW_FAST),y)
 FFTW_CFLAGS += -O3 -ffast-math
 endif
 
-# x86 optimisations
-FFTW_CONF_OPTS += $(if $(BR2_PACKAGE_FFTW_USE_SSE2),--enable,--disable)-sse2
-
 # Generic optimisations
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
 FFTW_CONF_OPTS += --enable-threads
@@ -49,6 +50,4 @@ FFTW_CONF_OPTS += $(if $(BR2_GCC_ENABLE_OPENMP),--enable,--disable)-openmp
 
 FFTW_CONF_OPTS += CFLAGS="$(FFTW_CFLAGS)"
 
-$(eval $(autotools-package))
-
 include $(sort $(wildcard package/fftw/*/*.mk))
-- 
2.19.2
