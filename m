From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  2 Jul 2016 21:25:05 +0200
Subject: [Buildroot] [PATCH 1/4] package/libaacs: new package
Message-ID: <1467487508-30061-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/Config.in            |  1 +
 package/libaacs/Config.in    | 14 ++++++++++++++
 package/libaacs/libaacs.hash |  2 ++
 package/libaacs/libaacs.mk   | 24 ++++++++++++++++++++++++
 4 files changed, 41 insertions(+)
 create mode 100644 package/libaacs/Config.in
 create mode 100644 package/libaacs/libaacs.hash
 create mode 100644 package/libaacs/libaacs.mk

diff --git a/package/Config.in b/package/Config.in
index 3d6d1f0..abbdac1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1116,6 +1116,7 @@ endmenu
 
 menu "Multimedia"
 	source "package/bitstream/Config.in"
+	source "package/libaacs/Config.in"
 	source "package/libass/Config.in"
 	source "package/libbluray/Config.in"
 	source "package/libdcadec/Config.in"
diff --git a/package/libaacs/Config.in b/package/libaacs/Config.in
new file mode 100644
index 0000000..d7da406
--- /dev/null
+++ b/package/libaacs/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_LIBAACS
+	bool "libaacs"
+	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_LIBGCRYPT
+	help
+	  libaacs is a research project to implement the Advanced Access
+	  Content System specification.
+	  NB: this project doesn't offer any key or certificate that
+	  could be used to decode encrypted copyrighted material.
+
+	  http://www.videolan.org/developers/libaacs.html
+
+comment "libaacs needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
diff --git a/package/libaacs/libaacs.hash b/package/libaacs/libaacs.hash
new file mode 100644
index 0000000..7160c6a
--- /dev/null
+++ b/package/libaacs/libaacs.hash
@@ -0,0 +1,2 @@
+# From http://download.videolan.org/pub/videolan/libaacs/0.8.1/libaacs-0.8.1.tar.bz2.sha512
+sha512	dd677627f073460b719b9f836b026acc3e23b166c7b16bd205cf2ca97c376095980532fb15087c0d77b30c712cd5a5dd90b2cc2ae3128da717621ebd825afcc4	libaacs-0.8.1.tar.bz2
diff --git a/package/libaacs/libaacs.mk b/package/libaacs/libaacs.mk
new file mode 100644
index 0000000..df61154
--- /dev/null
+++ b/package/libaacs/libaacs.mk
@@ -0,0 +1,24 @@
+################################################################################
+#
+# libaacs
+#
+################################################################################
+
+LIBAACS_VERSION = 0.8.1
+LIBAACS_SITE = http://download.videolan.org/pub/videolan/libaacs/$(LIBAACS_VERSION)
+LIBAACS_SOURCE = libaacs-$(LIBAACS_VERSION).tar.bz2
+LIBAACS_LICENSE = LGPLv2.1+
+LIBAACS_LICENSE_FILES = COPYING
+LIBAACS_INSTALL_STAGING = YES
+LIBAACS_DEPENDENCIES = host-bison host-flex libgcrypt
+LIBAACS_CONF_OPTS = \
+	--disable-werror \
+	--disable-extra-warnings \
+	--disable-optimizations \
+	--disable-examples \
+	--disable-debug \
+	--with-gnu-ld \
+	--with-libgcrypt-prefix=$(STAGING_DIR)/usr \
+	--with-gpg-error-prefix=$(STAGING_DIR)/usr
+
+$(eval $(autotools-package))
-- 
2.8.1
