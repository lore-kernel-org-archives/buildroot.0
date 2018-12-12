From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Wed, 12 Dec 2018 08:45:28 +0100
Subject: [Buildroot] [PATCH v2 03/14] fftw: breaks fftw-quad into a
 dedicated package
In-Reply-To: <20181212074539.11656-1-gwenj@trabucayre.com>
References: <20181212074539.11656-1-gwenj@trabucayre.com>
Message-ID: <20181212074539.11656-3-gwenj@trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

fftw's library name depends on the precision option. Consequently,
it's possible to install multiple flavor on the same target.

This patch breaks fftw quad precision into a new package and:
- deprecates BR2_PACKAGE_FFTW_PRECISION_QUAD, BR2_PACKAGE_FFTW_QUAD
  must be used instead;
- do fftw depends on fftw-long-quad when this package is enabled.

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
---
Changes v1 -> v2:
 * BR2_PACKAGE_FFTW_PRECISION_QUAD -> BR2_PACKAGE_FFTW_QUAD (Arnout)
 * old symbol deprecation (Arnout)
 * split big monolithic patch into a serie (Arnout)
 * add dependency between fftw and fftw-long-double (Yann)
---
 Config.in.legacy                      |  9 +++++++++
 package/fftw/Config.in                |  9 +--------
 package/fftw/fftw-quad/Config.in      |  7 +++++++
 package/fftw/fftw-quad/fftw-quad.hash |  1 +
 package/fftw/fftw-quad/fftw-quad.mk   | 21 +++++++++++++++++++++
 package/fftw/fftw.mk                  |  6 ++++--
 6 files changed, 43 insertions(+), 10 deletions(-)
 create mode 100644 package/fftw/fftw-quad/Config.in
 create mode 120000 package/fftw/fftw-quad/fftw-quad.hash
 create mode 100644 package/fftw/fftw-quad/fftw-quad.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index b376a88217..06a5803ff5 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -154,6 +154,15 @@ config BR2_PACKAGE_FFTW_PRECISION_LONG_DOUBLE
 	  fftw long double precision option was replaced by dedicated
 	  package.
 
+config BR2_PACKAGE_FFTW_PRECISION_QUAD
+	bool "fftw quad precision option was replaced by package"
+	select BR2_LEGACY
+	select BR2_PACKAGE_FFTW
+	select BR2_PACKAGE_FFTW_QUAD
+	help
+	  fftw quad precision option was replaced by dedicated
+	  package.
+
 config BR2_PACKAGE_FFTW_PRECISION_SINGLE
 	bool "fftw single precision option was replaced by package"
 	select BR2_LEGACY
diff --git a/package/fftw/Config.in b/package/fftw/Config.in
index 5c87babed9..945fd5d173 100644
--- a/package/fftw/Config.in
+++ b/package/fftw/Config.in
@@ -28,18 +28,11 @@ config BR2_PACKAGE_FFTW_PRECISION_DOUBLE
 	  Compile fftw in double precision (the default), i.e. use
 	  'double' for floating point type.
 
-config BR2_PACKAGE_FFTW_PRECISION_QUAD
-	bool "quad"
-	# quad-precision needs to have a gcc with libquadmath
-	depends on (BR2_i386 || BR2_x86_64) && BR2_USE_WCHAR
-	help
-	  Compile fftw in quadruple precision, i.e. use '__float128' for
-	  floating point type.
-
 endchoice
 
 source "package/fftw/fftw-long-double/Config.in"
 source "package/fftw/fftw-single/Config.in"
+source "package/fftw/fftw-quad/Config.in"
 
 config BR2_PACKAGE_FFTW_FAST
 	bool "optimise for speed over accuracy"
diff --git a/package/fftw/fftw-quad/Config.in b/package/fftw/fftw-quad/Config.in
new file mode 100644
index 0000000000..bb724bc260
--- /dev/null
+++ b/package/fftw/fftw-quad/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_FFTW_QUAD
+	bool "fftw-quad"
+	# quad-precision needs to have a gcc with libquadmath
+	depends on (BR2_i386 || BR2_x86_64) && BR2_USE_WCHAR
+	help
+	  Compile fftw in quadruple precision, i.e. use '__float128' for
+	  floating point type.
diff --git a/package/fftw/fftw-quad/fftw-quad.hash b/package/fftw/fftw-quad/fftw-quad.hash
new file mode 120000
index 0000000000..3ee7ecb3ba
--- /dev/null
+++ b/package/fftw/fftw-quad/fftw-quad.hash
@@ -0,0 +1 @@
+../fftw.hash
\ No newline at end of file
diff --git a/package/fftw/fftw-quad/fftw-quad.mk b/package/fftw/fftw-quad/fftw-quad.mk
new file mode 100644
index 0000000000..4eb2a1a441
--- /dev/null
+++ b/package/fftw/fftw-quad/fftw-quad.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# fftw-quad
+#
+################################################################################
+
+FFTW_QUAD_VERSION = $(FFTW_VERSION)
+FFTW_QUAD_SOURCE = fftw-$(FFTW_VERSION).tar.gz
+FFTW_QUAD_SITE = $(FFTW_SITE)
+FFTW_QUAD_INSTALL_STAGING = $(FFTW_INSTALL_STAGING)
+FFTW_QUAD_LICENSE = $(FFTW_LICENSE)
+FFTW_QUAD_LICENSE_FILES = $(FFTW_LICENSE_FILES)
+
+FFTW_QUAD_CONF_ENV = $(FFTW_CONF_ENV)
+
+FFTW_QUAD_CONF_OPTS = $(FFTW_CONF_OPTS)
+FFTW_QUAD_CONF_OPTS += --enable-quad-precision
+
+FFTW_QUAD_CFLAGS = $(FFTW_CFLAGS)
+
+$(eval $(autotools-package))
diff --git a/package/fftw/fftw.mk b/package/fftw/fftw.mk
index 4e30778a78..499e0ed1ad 100644
--- a/package/fftw/fftw.mk
+++ b/package/fftw/fftw.mk
@@ -14,6 +14,10 @@ ifeq ($(BR2_PACKAGE_FFTW_LONG_DOUBLE),y)
 FFTW_DEPENDENCIES += fftw-long-double
 endif
 
+ifeq ($(BR2_PACKAGE_FFTW_QUAD),y)
+FFTW_DEPENDENCIES += fftw-quad
+endif
+
 ifeq ($(BR2_PACKAGE_FFTW_SINGLE),y)
 FFTW_DEPENDENCIES += fftw-single
 endif
@@ -26,8 +30,6 @@ else
 FFTW_CONF_OPTS += --disable-fortran
 endif
 
-FFTW_CONF_OPTS += $(if $(BR2_PACKAGE_FFTW_PRECISION_QUAD),--enable,--disable)-quad-precision
-
 FFTW_CFLAGS = $(TARGET_CFLAGS)
 ifeq ($(BR2_PACKAGE_FFTW_FAST),y)
 FFTW_CFLAGS += -O3 -ffast-math
-- 
2.19.2
