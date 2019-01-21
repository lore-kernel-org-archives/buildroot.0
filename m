From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Mon, 21 Jan 2019 14:50:59 +0100
Subject: [Buildroot] [PATCH v4 05/17] package/fftw: break fftw-double into a
 dedicated package
In-Reply-To: <1548078671-63318-4-git-send-email-gwenj@trabucayre.com>
References: <1548078671-63318-1-git-send-email-gwenj@trabucayre.com>
 <1548078671-63318-2-git-send-email-gwenj@trabucayre.com>
 <1548078671-63318-3-git-send-email-gwenj@trabucayre.com>
 <1548078671-63318-4-git-send-email-gwenj@trabucayre.com>
Message-ID: <1548078671-63318-5-git-send-email-gwenj@trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

fftw's library name depends on the precision option. Consequently,
it's possible to install multiple flavor on the same target.

This patch breaks fftw double precision into a new package and:

- makes BR2_PACKAGE_FFTW_PRECISION_DOUBLE select BR2_PACKAGE_FFTW_DOUBLE
  to keep compatibility with packages that use
  BR2_PACKAGE_FFTW_PRECISION_DOUBLE. This option will be removed in a
  follow-up commit;
- removes BR2_PACKAGE_FFTW_USE_SSE2 since it is only used for single
  and double precision. The corresponding options are directly handled in
  fftw-double package;
- makes fftw depend on fftw-double when this package is enabled;
- turns fftw itself into a generic-package instead of an
  autotools-package: it no longer builds anything and only allows to
  trigger the build of the appropriate fftw-* sub-packages, as a
  temporary compatibility mechanism.

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
[Yann/Thomas:
 - Use FFTW_DOUBLE_DL_SUBDIR to avoid downloading fftw multiple times
 - Minor reformatting tweaks in fftw-double.mk
 - Drop from fftw.mk FFTW_CONF_ENV/FFTW_CONF_OPTS which are no
   longer used
 - Make fftw a generic package so that its dependencies are built
 - Do not deprecate BR2_PACKAGE_FFTW_PRECISION_DOUBLE and instead
   make it select BR2_PACKAGE_FFTW_DOUBLE, so that packages using
   BR2_PACKAGE_FFTW_PRECISION_QUAD continue to work.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/fftw/Config.in                    |  6 ++----
 package/fftw/fftw-double/Config.in        |  5 +++++
 package/fftw/fftw-double/fftw-double.hash |  1 +
 package/fftw/fftw-double/fftw-double.mk   | 22 ++++++++++++++++++++++
 package/fftw/fftw.mk                      | 17 +++++------------
 5 files changed, 35 insertions(+), 16 deletions(-)

diff --git a/package/fftw/Config.in b/package/fftw/Config.in
index 8699d9c350..ed87de1a70 100644
--- a/package/fftw/Config.in
+++ b/package/fftw/Config.in
@@ -12,9 +12,6 @@ config BR2_PACKAGE_FFTW
 
 if BR2_PACKAGE_FFTW
 
-config BR2_PACKAGE_FFTW_USE_SSE2
-	bool
-
 choice
 	prompt "fftw precision"
 	default BR2_PACKAGE_FFTW_PRECISION_DOUBLE
@@ -30,7 +27,7 @@ config BR2_PACKAGE_FFTW_PRECISION_SINGLE
 
 config BR2_PACKAGE_FFTW_PRECISION_DOUBLE
 	bool "double"
-	select BR2_PACKAGE_FFTW_USE_SSE2 if BR2_X86_CPU_HAS_SSE2
+	select BR2_PACKAGE_FFTW_DOUBLE
 	help
 	  Compile fftw in double precision (the default), i.e. use
 	  'double' for floating point type.
@@ -57,6 +54,7 @@ config BR2_PACKAGE_FFTW_PRECISION_QUAD
 endchoice
 
 source "package/fftw/fftw-single/Config.in"
+source "package/fftw/fftw-double/Config.in"
 source "package/fftw/fftw-long-double/Config.in"
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
index 0000000000..4bacb26e56
--- /dev/null
+++ b/package/fftw/fftw-double/fftw-double.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# fftw-double
+#
+################################################################################
+
+FFTW_DOUBLE_VERSION = $(FFTW_VERSION)
+FFTW_DOUBLE_SOURCE = fftw-$(FFTW_VERSION).tar.gz
+FFTW_DOUBLE_SITE = $(FFTW_SITE)
+FFTW_DOUBLE_DL_SUBDIR = fftw
+FFTW_DOUBLE_INSTALL_STAGING = $(FFTW_INSTALL_STAGING)
+FFTW_DOUBLE_LICENSE = $(FFTW_LICENSE)
+FFTW_DOUBLE_LICENSE_FILES = $(FFTW_LICENSE_FILES)
+
+FFTW_DOUBLE_CONF_ENV = $(FFTW_COMMON_CONF_ENV)
+
+FFTW_DOUBLE_CONF_OPTS = \
+	$(FFTW_COMMON_CONF_OPTS) \
+	CFLAGS="$(FFTW_COMMON_CFLAGS)" \
+	$(if $(BR2_X86_CPU_HAS_SSE2),--enable,--disable)-sse2
+
+$(eval $(autotools-package))
diff --git a/package/fftw/fftw.mk b/package/fftw/fftw.mk
index ccec0e0f2d..862ad5edc0 100644
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
@@ -36,9 +40,6 @@ ifeq ($(BR2_PACKAGE_FFTW_FAST),y)
 FFTW_COMMON_CFLAGS += -O3 -ffast-math
 endif
 
-# x86 optimisations
-FFTW_COMMON_CONF_OPTS += $(if $(BR2_PACKAGE_FFTW_USE_SSE2),--enable,--disable)-sse2
-
 # Generic optimisations
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
 FFTW_COMMON_CONF_OPTS += --enable-threads
@@ -48,14 +49,6 @@ FFTW_COMMON_CONF_OPTS += --disable-threads
 endif
 FFTW_COMMON_CONF_OPTS += $(if $(BR2_GCC_ENABLE_OPENMP),--enable,--disable)-openmp
 
-FFTW_CONF_ENV = $(FFTW_COMMON_CONF_ENV)
-FFTW_CONF_OPTS += \
-	$(FFTW_COMMON_CONF_OPTS) \
-	--disable-single \
-	--disable-long-double \
-	--disable-quad-precision \
-	CFLAGS="$(FFTW_COMMON_CFLAGS)"
-
-$(eval $(autotools-package))
+$(eval $(generic-package))
 
 include $(sort $(wildcard package/fftw/*/*.mk))
-- 
2.19.2
