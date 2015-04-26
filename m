From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 26 Apr 2015 17:00:51 +0200
Subject: [Buildroot] [PATCH 3/3] package/libspandsp: new package
In-Reply-To: <1430060451-4075-1-git-send-email-bernd.kuhls@t-online.de>
References: <1430060451-4075-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1430060451-4075-4-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/Config.in                               |    1 +
 package/libspandsp/0001-fix-compiler-opts.patch |   23 +++++++++++++++++++++
 package/libspandsp/Config.in                    |    9 ++++++++
 package/libspandsp/libspandsp.hash              |    2 ++
 package/libspandsp/libspandsp.mk                |   25 +++++++++++++++++++++++
 5 files changed, 60 insertions(+)
 create mode 100644 package/libspandsp/0001-fix-compiler-opts.patch
 create mode 100644 package/libspandsp/Config.in
 create mode 100644 package/libspandsp/libspandsp.hash
 create mode 100644 package/libspandsp/libspandsp.mk

diff --git a/package/Config.in b/package/Config.in
index 2a06a3d..d47b787 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -682,6 +682,7 @@ menu "Audio/Sound"
 	source "package/libsidplay2/Config.in"
 	source "package/libsndfile/Config.in"
 	source "package/libsoxr/Config.in"
+	source "package/libspandsp/Config.in"
 	source "package/libvorbis/Config.in"
 	source "package/mp4v2/Config.in"
 	source "package/opencore-amr/Config.in"
diff --git a/package/libspandsp/0001-fix-compiler-opts.patch b/package/libspandsp/0001-fix-compiler-opts.patch
new file mode 100644
index 0000000..c3bd800
--- /dev/null
+++ b/package/libspandsp/0001-fix-compiler-opts.patch
@@ -0,0 +1,23 @@
+Fix bfin compilation
+
+cc1: error: unrecognized command line option "-Wunused-but-set-variable"
+
+using this defconfig
+
+BR2_bfin=y
+BR2_PACKAGE_LIBSPANDSP=y
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -uNr spandsp-0.0.6.org/configure.ac spandsp-0.0.6/configure.ac
+--- spandsp-0.0.6.org/configure.ac	2014-08-09 10:19:27.000000000 +0200
++++ spandsp-0.0.6/configure.ac	2015-04-25 17:46:27.717349873 +0200
+@@ -337,7 +337,7 @@
+ 
+ case "${ax_cv_c_compiler_vendor}" in
+ gnu)
+-    COMP_VENDOR_CFLAGS="-std=gnu99 -ffast-math -Wall -Wunused-variable -Wunused-but-set-variable -Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes $COMP_VENDOR_CFLAGS"
++    COMP_VENDOR_CFLAGS="-std=gnu99 -ffast-math -Wall -Wunused-variable -Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes $COMP_VENDOR_CFLAGS"
+     if test "$enable_neon" = "yes" ; then
+         COMP_VENDOR_CFLAGS="-mfpu=neon -mfloat-abi=hard $COMP_VENDOR_CFLAGS"
+     fi
diff --git a/package/libspandsp/Config.in b/package/libspandsp/Config.in
new file mode 100644
index 0000000..9a22209
--- /dev/null
+++ b/package/libspandsp/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_LIBSPANDSP
+	bool "libspandsp"
+	select BR2_PACKAGE_TIFF
+	help
+	  Spandsp is a library of many DSP functions for telephony.
+	  These range from simple modules, such as DTMF detection, to a
+	  complete software FAX machine.
+
+	  http://www.soft-switch.org
diff --git a/package/libspandsp/libspandsp.hash b/package/libspandsp/libspandsp.hash
new file mode 100644
index 0000000..3bd7fa6
--- /dev/null
+++ b/package/libspandsp/libspandsp.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256	6a86ccf68c2af46c1f98334b8e300c75df1be39b5620d689285c35167737c913	spandsp-20140809.tar.gz
diff --git a/package/libspandsp/libspandsp.mk b/package/libspandsp/libspandsp.mk
new file mode 100644
index 0000000..b543a1d
--- /dev/null
+++ b/package/libspandsp/libspandsp.mk
@@ -0,0 +1,25 @@
+################################################################################
+#
+# libspandsp
+#
+################################################################################
+
+LIBSPANDSP_VERSION = 20140809
+LIBSPANDSP_SOURCE = spandsp-$(LIBSPANDSP_VERSION).tar.gz
+LIBSPANDSP_SITE = http://www.soft-switch.org/downloads/spandsp/snapshots
+LIBSPANDSP_LICENSE = LGPL-2.1
+LIBSPANDSP_LICENSE_FILES = COPYING
+LIBSPANDSP_INSTALL_STAGING = YES
+LIBSPANDSP_AUTORECONF = YES
+
+# Fixes broken gcc
+# http://thread.gmane.org/gmane.linux.lib.musl.general/2468/
+LIBSPANDSP_CONF_ENV = ac_cv_header_tgmath_h=no
+
+LIBSPANDSP_DEPENDENCIES = tiff
+
+ifeq ($(BR2_PACKAGE_JPEG),y)
+LIBSPANDSP_DEPENDENCIES += jpeg
+endif
+
+$(eval $(autotools-package))
-- 
1.7.10.4
