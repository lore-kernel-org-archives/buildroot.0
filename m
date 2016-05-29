From: =?UTF-8?q?Andr=C3=A9=20Hentschel?= <nerv@dawncrow.de>
Date: Sun, 29 May 2016 18:28:19 +0200
Subject: [Buildroot] [PATCH] [PATCH v2] p7zip: New package
Message-ID: <1464539299-3853-1-git-send-email-nerv@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
---
 package/Config.in        |  1 +
 package/p7zip/Config.in  | 15 +++++++++++++++
 package/p7zip/p7zip.hash |  3 +++
 package/p7zip/p7zip.mk   | 25 +++++++++++++++++++++++++
 4 files changed, 44 insertions(+)
 create mode 100644 package/p7zip/Config.in
 create mode 100644 package/p7zip/p7zip.hash
 create mode 100644 package/p7zip/p7zip.mk

diff --git a/package/Config.in b/package/Config.in
index 9d668bf..073b88e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -59,6 +59,7 @@ endif
 	source "package/lz4/Config.in"
 	source "package/lzip/Config.in"
 	source "package/lzop/Config.in"
+	source "package/p7zip/Config.in"
 	source "package/unrar/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/unzip/Config.in"
diff --git a/package/p7zip/Config.in b/package/p7zip/Config.in
new file mode 100644
index 0000000..1a6a4df
--- /dev/null
+++ b/package/p7zip/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_P7ZIP
+	bool "p7zip"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_i386 || BR2_x86_64 || \
+		BR2_aarch64 || BR2_arm || BR2_armeb
+	help
+	  p7zip is a quick port of the command line version of 7-zip for Unix.
+	  (see http://www.7-zip.org)
+
+	  7-Zip is a file archiver with highest compression ratio.
+
+	  http://sourceforge.net/projects/p7zip
+
+comment "p7zip needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/p7zip/p7zip.hash b/package/p7zip/p7zip.hash
new file mode 100644
index 0000000..ead6d87
--- /dev/null
+++ b/package/p7zip/p7zip.hash
@@ -0,0 +1,3 @@
+# From https://sourceforge.net/projects/p7zip/files/p7zip/
+md5	92cca093312b5a71a7be7dc7d1d32509	p7zip_15.14.1_src_all.tar.bz2
+sha1	9b15a79f94230fab9b9d4f9f532c723117145c7a	p7zip_15.14.1_src_all.tar.bz2
diff --git a/package/p7zip/p7zip.mk b/package/p7zip/p7zip.mk
new file mode 100644
index 0000000..95d47d2
--- /dev/null
+++ b/package/p7zip/p7zip.mk
@@ -0,0 +1,25 @@
+################################################################################
+#
+# p7zip
+#
+################################################################################
+
+P7ZIP_VERSION = 15.14.1
+P7ZIP_SOURCE = p7zip_$(P7ZIP_VERSION)_src_all.tar.bz2
+P7ZIP_SITE = http://downloads.sourceforge.net/project/p7zip/p7zip/$(P7ZIP_VERSION)
+P7ZIP_LICENSE = LGPLv2.1+
+P7ZIP_LICENSE_FILES = DOC/License.txt
+
+# Note that the build system of p7zip is a mess, so we can't use TARGET_CONFIGURE_OPTS
+define P7ZIP_BUILD_CMDS
+	$(MAKE) CC="$(TARGET_CC)" ALLFLAGS_C="$(TARGET_CFLAGS)" \
+		CXX="$(TARGET_CXX)" ALLFLAGS_CPP="$(TARGET_CXXFLAGS)" \
+		LDFLAGS="$(TARGET_LDFLAGS)" \
+		-C $(@D) 7zr
+endef
+
+define P7ZIP_INSTALL_TARGET_CMDS
+	cp -dpf $(@D)/bin/7zr $(TARGET_DIR)/usr/bin/
+endef
+
+$(eval $(generic-package))
-- 
1.9.1
