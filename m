From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Wed, 12 Dec 2018 08:45:27 +0100
Subject: [Buildroot] [PATCH v2 02/14] fftw: breaks fftw-long-double into a
 dedicated package
In-Reply-To: <20181212074539.11656-1-gwenj@trabucayre.com>
References: <20181212074539.11656-1-gwenj@trabucayre.com>
Message-ID: <20181212074539.11656-2-gwenj@trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

fftw's library name depends on the precision option. Consequently,
it's possible to install multiple flavor on the same target.

This patch breaks fftw long double precision into a new package and:
- deprecates BR2_PACKAGE_FFTW_PRECISION_LONG_DOUBLE,
  BR2_PACKAGE_FFTW_LONG_DOUBLE must be used instead;
- do fftw depends on fftw-long-double when this package is enabled.

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
---
Changes v1 -> v2:
 * BR2_PACKAGE_FFTW_PRECISION_LONG_DOUBLE -> BR2_PACKAGE_FFTW_LONG_DOUBLE (Arnout)
 * old symbol deprecation (Arnout)
 * split big monolithic patch into a serie (Arnout)
 * add dependency between fftw and fftw-long-double (Yann)
---
 Config.in.legacy                              |  9 ++++++++
 package/fftw/Config.in                        | 10 +--------
 package/fftw/fftw-long-double/Config.in       |  8 +++++++
 .../fftw-long-double/fftw-long-double.hash    |  1 +
 .../fftw/fftw-long-double/fftw-long-double.mk | 21 +++++++++++++++++++
 package/fftw/fftw.mk                          |  5 ++++-
 6 files changed, 44 insertions(+), 10 deletions(-)
 create mode 100644 package/fftw/fftw-long-double/Config.in
 create mode 120000 package/fftw/fftw-long-double/fftw-long-double.hash
 create mode 100644 package/fftw/fftw-long-double/fftw-long-double.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 1eef04923e..b376a88217 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,15 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2019.02"
 
+config BR2_PACKAGE_FFTW_PRECISION_LONG_DOUBLE
+	bool "fftw long double precision option was replaced by package"
+	select BR2_LEGACY
+	select BR2_PACKAGE_FFTW
+	select BR2_PACKAGE_FFTW_LONG_DOUBLE
+	help
+	  fftw long double precision option was replaced by dedicated
+	  package.
+
 config BR2_PACKAGE_FFTW_PRECISION_SINGLE
 	bool "fftw single precision option was replaced by package"
 	select BR2_LEGACY
diff --git a/package/fftw/Config.in b/package/fftw/Config.in
index 97b1c8a6dc..5c87babed9 100644
--- a/package/fftw/Config.in
+++ b/package/fftw/Config.in
@@ -28,15 +28,6 @@ config BR2_PACKAGE_FFTW_PRECISION_DOUBLE
 	  Compile fftw in double precision (the default), i.e. use
 	  'double' for floating point type.
 
-config BR2_PACKAGE_FFTW_PRECISION_LONG_DOUBLE
-	bool "long double"
-	# long-double precision require long-double trigonometric routines
-	depends on !(BR2_TOOLCHAIN_BUILDROOT_UCLIBC && \
-		(BR2_arm || BR2_mips || BR2_mipsel))
-	help
-	  Compile fftw in long double precision, i.e. use 'long double'
-	  for floating point type.
-
 config BR2_PACKAGE_FFTW_PRECISION_QUAD
 	bool "quad"
 	# quad-precision needs to have a gcc with libquadmath
@@ -47,6 +38,7 @@ config BR2_PACKAGE_FFTW_PRECISION_QUAD
 
 endchoice
 
+source "package/fftw/fftw-long-double/Config.in"
 source "package/fftw/fftw-single/Config.in"
 
 config BR2_PACKAGE_FFTW_FAST
diff --git a/package/fftw/fftw-long-double/Config.in b/package/fftw/fftw-long-double/Config.in
new file mode 100644
index 0000000000..3ee1762850
--- /dev/null
+++ b/package/fftw/fftw-long-double/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_FFTW_LONG_DOUBLE
+	bool "fftw-long-double"
+	# long-double precision require long-double trigonometric routines
+	depends on !(BR2_TOOLCHAIN_USES_UCLIBC && \
+		(BR2_arm || BR2_mips || BR2_mipsel))
+	help
+	  Compile fftw in long double precision, i.e. use 'long double'
+	  for floating point type.
diff --git a/package/fftw/fftw-long-double/fftw-long-double.hash b/package/fftw/fftw-long-double/fftw-long-double.hash
new file mode 120000
index 0000000000..3ee7ecb3ba
--- /dev/null
+++ b/package/fftw/fftw-long-double/fftw-long-double.hash
@@ -0,0 +1 @@
+../fftw.hash
\ No newline at end of file
diff --git a/package/fftw/fftw-long-double/fftw-long-double.mk b/package/fftw/fftw-long-double/fftw-long-double.mk
new file mode 100644
index 0000000000..dfbf198e85
--- /dev/null
+++ b/package/fftw/fftw-long-double/fftw-long-double.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# fftw-long-double
+#
+################################################################################
+
+FFTW_LONG_DOUBLE_VERSION = $(FFTW_VERSION)
+FFTW_LONG_DOUBLE_SOURCE = fftw-$(FFTW_VERSION).tar.gz
+FFTW_LONG_DOUBLE_SITE = $(FFTW_SITE)
+FFTW_LONG_DOUBLE_INSTALL_STAGING = $(FFTW_INSTALL_STAGING)
+FFTW_LONG_DOUBLE_LICENSE = $(FFTW_LICENSE)
+FFTW_LONG_DOUBLE_LICENSE_FILES = $(FFTW_LICENSE_FILES)
+
+FFTW_LONG_DOUBLE_CONF_ENV = $(FFTW_CONF_ENV)
+
+FFTW_LONG_DOUBLE_CONF_OPTS = $(FFTW_CONF_OPTS)
+FFTW_LONG_DOUBLE_CONF_OPTS += --enable-long-double
+
+FFTW_LONG_DOUBLE_CFLAGS = $(FFTW_CFLAGS)
+
+$(eval $(autotools-package))
diff --git a/package/fftw/fftw.mk b/package/fftw/fftw.mk
index 0c11c6a720..4e30778a78 100644
--- a/package/fftw/fftw.mk
+++ b/package/fftw/fftw.mk
@@ -10,6 +10,10 @@ FFTW_INSTALL_STAGING = YES
 FFTW_LICENSE = GPL-2.0+
 FFTW_LICENSE_FILES = COPYING
 
+ifeq ($(BR2_PACKAGE_FFTW_LONG_DOUBLE),y)
+FFTW_DEPENDENCIES += fftw-long-double
+endif
+
 ifeq ($(BR2_PACKAGE_FFTW_SINGLE),y)
 FFTW_DEPENDENCIES += fftw-single
 endif
@@ -22,7 +26,6 @@ else
 FFTW_CONF_OPTS += --disable-fortran
 endif
 
-FFTW_CONF_OPTS += $(if $(BR2_PACKAGE_FFTW_PRECISION_LONG_DOUBLE),--enable,--disable)-long-double
 FFTW_CONF_OPTS += $(if $(BR2_PACKAGE_FFTW_PRECISION_QUAD),--enable,--disable)-quad-precision
 
 FFTW_CFLAGS = $(TARGET_CFLAGS)
-- 
2.19.2
