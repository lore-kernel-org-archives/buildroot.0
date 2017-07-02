From: Vincent Stehle <vincent.stehle@laposte.net>
Date: Sun,  2 Jul 2017 18:11:50 +0200
Subject: [Buildroot] [PATCH] pixz: new package
Message-ID: <20170702161150.10160-1-vincent.stehle@laposte.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Vincent Stehl? <vincent.stehle@laposte.net>

Add a package for pixz (pronounced pixie), a parallel, indexing version of
xz.

See https://github.com/vasi/pixz

Signed-off-by: Vincent Stehl? <vincent.stehle@laposte.net>
---
 DEVELOPERS             |  1 +
 package/Config.in      |  1 +
 package/pixz/Config.in | 12 ++++++++++++
 package/pixz/pixz.hash |  2 ++
 package/pixz/pixz.mk   | 18 ++++++++++++++++++
 5 files changed, 34 insertions(+)
 create mode 100644 package/pixz/Config.in
 create mode 100644 package/pixz/pixz.hash
 create mode 100644 package/pixz/pixz.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index f9e617ba3..3aaf29bfb 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1715,6 +1715,7 @@ F:	package/trinity/
 N:	Vincent Stehl? <vincent.stehle@laposte.net>
 F:	package/i7z/
 F:	package/msr-tools/
+F:	package/pixz/
 F:	package/uftrace/
 
 N:	Vinicius Tinti <viniciustinti@gmail.com>
diff --git a/package/Config.in b/package/Config.in
index 84e23ea63..3c7719278 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -64,6 +64,7 @@ menu "Compressors and decompressors"
 	source "package/lzip/Config.in"
 	source "package/lzop/Config.in"
 	source "package/p7zip/Config.in"
+	source "package/pixz/Config.in"
 	source "package/unrar/Config.in"
 	source "package/unzip/Config.in"
 	source "package/xz/Config.in"
diff --git a/package/pixz/Config.in b/package/pixz/Config.in
new file mode 100644
index 000000000..e5b1b095e
--- /dev/null
+++ b/package/pixz/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_PIXZ
+	bool "pixz"
+	depends on BR2_PACKAGE_LIBARCHIVE
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_XZ
+	help
+	  Pixz (pronounced pixie) is a parallel, indexing version of xz.
+
+	  https://github.com/vasi/pixz
+
+comment "pixz needs a toolchain w/ threads, and libarchive"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_PACKAGE_LIBARCHIVE
diff --git a/package/pixz/pixz.hash b/package/pixz/pixz.hash
new file mode 100644
index 000000000..3089bcd90
--- /dev/null
+++ b/package/pixz/pixz.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256 02c50746b134fa1b1aae41fcc314d7c6f1919b3d48bcdea01bf11769f83f72e8 pixz-1.0.6.tar.xz
diff --git a/package/pixz/pixz.mk b/package/pixz/pixz.mk
new file mode 100644
index 000000000..04dba2985
--- /dev/null
+++ b/package/pixz/pixz.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# pixz
+#
+################################################################################
+
+PIXZ_VERSION = 1.0.6
+PIXZ_SITE = https://github.com/vasi/pixz/releases/download/v$(PIXZ_VERSION)
+PIXZ_SOURCE = pixz-$(PIXZ_VERSION).tar.xz
+PIXZ_DEPENDENCIES = host-pkgconf libarchive xz
+PIXZ_LICENSE = BSD-2-Clause
+PIXZ_LICENSE_FILES = LICENSE
+
+# The configure script does not know how to test for the manpage presence when
+# cross-compiling; help it a bit.
+PIXZ_CONF_ENV = ac_cv_file_src_pixz_1=yes
+
+$(eval $(autotools-package))
-- 
2.11.0
