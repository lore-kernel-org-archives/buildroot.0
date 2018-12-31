From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 31 Dec 2018 14:30:16 +0100
Subject: [Buildroot] [PATCH v3 03/17] package/fftw: break fftw-long-double
 into a dedicated package
In-Reply-To: <20181231133030.25991-1-thomas.petazzoni@bootlin.com>
References: <20181231133030.25991-1-thomas.petazzoni@bootlin.com>
Message-ID: <20181231133030.25991-4-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

fftw's library name depends on the precision option. Consequently,
it's possible to install multiple flavor on the same target.

This patch breaks fftw long double precision into a new package and:

- makes BR2_PACKAGE_FFTW_PRECISION_LONG_DOUBLE select
  BR2_PACKAGE_FFTW_LONG_DOUBLE to keep compatibility with packages
  that use BR2_PACKAGE_FFTW_PRECISION_LONG_DOUBLE. This option will be
  removed in a follow-up commit;

- makes fftw depend on fftw-long-double when this package is enabled.

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
[Yann/Thomas:
 - Force --disable-long-double in FFTW_CONF_OPTS, just for the sake of
   clarity (fftw is no longer going to build the long double variant)
 - Use FFTW_LONG_DOUBLE_DL_SUBDIR to avoid downloading fftw multiple times
 - Minor reformatting tweaks in fftw-long-double.mk
 - Do not deprecate BR2_PACKAGE_FFTW_PRECISION_LONG_DOUBLE and instead
   make it select BR2_PACKAGE_FFTW_LONG_DOUBLE, so that packages using
   BR2_PACKAGE_FFTW_PRECISION_LONG_DOUBLE continue to work.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/fftw/Config.in                        |  2 ++
 package/fftw/fftw-long-double/Config.in       |  8 +++++++
 .../fftw-long-double/fftw-long-double.hash    |  1 +
 .../fftw/fftw-long-double/fftw-long-double.mk | 22 +++++++++++++++++++
 package/fftw/fftw.mk                          |  6 ++++-
 5 files changed, 38 insertions(+), 1 deletion(-)
 create mode 100644 package/fftw/fftw-long-double/Config.in
 create mode 120000 package/fftw/fftw-long-double/fftw-long-double.hash
 create mode 100644 package/fftw/fftw-long-double/fftw-long-double.mk

diff --git a/package/fftw/Config.in b/package/fftw/Config.in
index f61784de50..4f37b43a60 100644
--- a/package/fftw/Config.in
+++ b/package/fftw/Config.in
@@ -40,6 +40,7 @@ config BR2_PACKAGE_FFTW_PRECISION_LONG_DOUBLE
 	# long-double precision require long-double trigonometric routines
 	depends on !(BR2_TOOLCHAIN_BUILDROOT_UCLIBC && \
 		(BR2_arm || BR2_mips || BR2_mipsel))
+	select BR2_PACKAGE_FFTW_LONG_DOUBLE
 	help
 	  Compile fftw in long double precision, i.e. use 'long double'
 	  for floating point type.
@@ -55,6 +56,7 @@ config BR2_PACKAGE_FFTW_PRECISION_QUAD
 endchoice
 
 source "package/fftw/fftw-single/Config.in"
+source "package/fftw/fftw-long-double/Config.in"
 
 config BR2_PACKAGE_FFTW_FAST
 	bool "optimise for speed over accuracy"
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
index 0000000000..173050446c
--- /dev/null
+++ b/package/fftw/fftw-long-double/fftw-long-double.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# fftw-long-double
+#
+################################################################################
+
+FFTW_LONG_DOUBLE_VERSION = $(FFTW_VERSION)
+FFTW_LONG_DOUBLE_SOURCE = fftw-$(FFTW_VERSION).tar.gz
+FFTW_LONG_DOUBLE_SITE = $(FFTW_SITE)
+FFTW_LONG_DOUBLE_DL_SUBDIR = fftw
+FFTW_LONG_DOUBLE_INSTALL_STAGING = $(FFTW_INSTALL_STAGING)
+FFTW_LONG_DOUBLE_LICENSE = $(FFTW_LICENSE)
+FFTW_LONG_DOUBLE_LICENSE_FILES = $(FFTW_LICENSE_FILES)
+
+FFTW_LONG_DOUBLE_CONF_ENV = $(FFTW_COMMON_CONF_ENV)
+
+FFTW_LONG_DOUBLE_CONF_OPTS = \
+	$(FFTW_COMMON_CONF_OPTS) \
+	CFLAGS="$(FFTW_COMMON_CFLAGS)" \
+	--enable-long-double
+
+$(eval $(autotools-package))
diff --git a/package/fftw/fftw.mk b/package/fftw/fftw.mk
index b738928032..26137b9f7c 100644
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
@@ -44,7 +48,7 @@ FFTW_CONF_ENV = $(FFTW_COMMON_CONF_ENV)
 FFTW_CONF_OPTS += \
 	$(FFTW_COMMON_CONF_OPTS) \
 	--disable-single \
-	$(if $(BR2_PACKAGE_FFTW_PRECISION_LONG_DOUBLE),--enable,--disable)-long-double \
+	--disable-long-double \
 	$(if $(BR2_PACKAGE_FFTW_PRECISION_QUAD),--enable,--disable)-quad-precision \
 	CFLAGS="$(FFTW_COMMON_CFLAGS)"
 
-- 
2.20.1
