From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 31 Dec 2018 14:30:17 +0100
Subject: [Buildroot] [PATCH v3 04/17] package/fftw: break fftw-quad into a
 dedicated package
In-Reply-To: <20181231133030.25991-1-thomas.petazzoni@bootlin.com>
References: <20181231133030.25991-1-thomas.petazzoni@bootlin.com>
Message-ID: <20181231133030.25991-5-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

fftw's library name depends on the precision option. Consequently,
it's possible to install multiple flavor on the same target.

This patch breaks fftw quad precision into a new package and:

- makes BR2_PACKAGE_FFTW_PRECISION_QUAD select BR2_PACKAGE_FFTW_QUAD
  to keep compatibility with packages that use
  BR2_PACKAGE_FFTW_PRECISION_QUAD. This option will be removed in a
  follow-up commit;

- makes fftw depend on fftw-quad when this package is enabled.

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
[Yann/Thomas:
 - Force --disable-quad in FFTW_CONF_OPTS, just for the sake of
   clarity (fftw is no longer going to build the quad variant)
 - Use FFTW_QUAD_DL_SUBDIR to avoid downloading fftw multiple times
 - Minor reformatting tweaks in fftw-quad.mk
 - Do not deprecate BR2_PACKAGE_FFTW_PRECISION_QUAD and instead
   make it select BR2_PACKAGE_FFTW_QUAD, so that packages using
   BR2_PACKAGE_FFTW_PRECISION_QUAD continue to work.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/fftw/Config.in                |  2 ++
 package/fftw/fftw-quad/Config.in      |  7 +++++++
 package/fftw/fftw-quad/fftw-quad.hash |  1 +
 package/fftw/fftw-quad/fftw-quad.mk   | 22 ++++++++++++++++++++++
 package/fftw/fftw.mk                  |  6 +++++-
 5 files changed, 37 insertions(+), 1 deletion(-)
 create mode 100644 package/fftw/fftw-quad/Config.in
 create mode 120000 package/fftw/fftw-quad/fftw-quad.hash
 create mode 100644 package/fftw/fftw-quad/fftw-quad.mk

diff --git a/package/fftw/Config.in b/package/fftw/Config.in
index 4f37b43a60..8699d9c350 100644
--- a/package/fftw/Config.in
+++ b/package/fftw/Config.in
@@ -49,6 +49,7 @@ config BR2_PACKAGE_FFTW_PRECISION_QUAD
 	bool "quad"
 	# quad-precision needs to have a gcc with libquadmath
 	depends on (BR2_i386 || BR2_x86_64) && BR2_USE_WCHAR
+	select BR2_PACKAGE_FFTW_QUAD
 	help
 	  Compile fftw in quadruple precision, i.e. use '__float128' for
 	  floating point type.
@@ -57,6 +58,7 @@ endchoice
 
 source "package/fftw/fftw-single/Config.in"
 source "package/fftw/fftw-long-double/Config.in"
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
index 0000000000..5ff79b1d46
--- /dev/null
+++ b/package/fftw/fftw-quad/fftw-quad.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# fftw-quad
+#
+################################################################################
+
+FFTW_QUAD_VERSION = $(FFTW_VERSION)
+FFTW_QUAD_SOURCE = fftw-$(FFTW_VERSION).tar.gz
+FFTW_QUAD_SITE = $(FFTW_SITE)
+FFTW_QUAD_DL_SUBDIR = fftw
+FFTW_QUAD_INSTALL_STAGING = $(FFTW_INSTALL_STAGING)
+FFTW_QUAD_LICENSE = $(FFTW_LICENSE)
+FFTW_QUAD_LICENSE_FILES = $(FFTW_LICENSE_FILES)
+
+FFTW_QUAD_CONF_ENV = $(FFTW_COMMON_CONF_ENV)
+
+FFTW_QUAD_CONF_OPTS = \
+	$(FFTW_COMMON_CONF_OPTS) \
+	CFLAGS="$(FFTW_COMMON_CFLAGS)" \
+	--enable-quad-precision
+
+$(eval $(autotools-package))
diff --git a/package/fftw/fftw.mk b/package/fftw/fftw.mk
index 26137b9f7c..ccec0e0f2d 100644
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
@@ -49,7 +53,7 @@ FFTW_CONF_OPTS += \
 	$(FFTW_COMMON_CONF_OPTS) \
 	--disable-single \
 	--disable-long-double \
-	$(if $(BR2_PACKAGE_FFTW_PRECISION_QUAD),--enable,--disable)-quad-precision \
+	--disable-quad-precision \
 	CFLAGS="$(FFTW_COMMON_CFLAGS)"
 
 $(eval $(autotools-package))
-- 
2.20.1
