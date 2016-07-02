From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  2 Jul 2016 21:25:07 +0200
Subject: [Buildroot] [PATCH 3/4] package/libbdplus: new package
In-Reply-To: <1467487508-30061-1-git-send-email-bernd.kuhls@t-online.de>
References: <1467487508-30061-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1467487508-30061-3-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/Config.in                |  1 +
 package/libbdplus/Config.in      | 17 +++++++++++++++++
 package/libbdplus/libbdplus.hash |  2 ++
 package/libbdplus/libbdplus.mk   | 31 +++++++++++++++++++++++++++++++
 4 files changed, 51 insertions(+)
 create mode 100644 package/libbdplus/Config.in
 create mode 100644 package/libbdplus/libbdplus.hash
 create mode 100644 package/libbdplus/libbdplus.mk

diff --git a/package/Config.in b/package/Config.in
index abbdac1..9b062c4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1118,6 +1118,7 @@ menu "Multimedia"
 	source "package/bitstream/Config.in"
 	source "package/libaacs/Config.in"
 	source "package/libass/Config.in"
+	source "package/libbdplus/Config.in"
 	source "package/libbluray/Config.in"
 	source "package/libdcadec/Config.in"
 	source "package/libdvbcsa/Config.in"
diff --git a/package/libbdplus/Config.in b/package/libbdplus/Config.in
new file mode 100644
index 0000000..19170a6
--- /dev/null
+++ b/package/libbdplus/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_LIBBDPLUS
+	bool "libbdplus"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_STATIC_LIBS
+	help
+	  libbdplus is a research project to implement the BD+ System
+	  Specifications.
+	  This research project provides, through an open-source
+	  library, a way to understand how the BD+ works.
+	  NB: this project doesn't offer any key, configuration file or
+	  certificate that could be used to decode encrypted copyrighted
+	  material.
+
+	  http://www.videolan.org/developers/libbdplus.html
+
+comment "libbdplus needs a toolchain w/ threads, dynamic library"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/libbdplus/libbdplus.hash b/package/libbdplus/libbdplus.hash
new file mode 100644
index 0000000..552cd71
--- /dev/null
+++ b/package/libbdplus/libbdplus.hash
@@ -0,0 +1,2 @@
+# From http://download.videolan.org/pub/videolan/libbdplus/0.1.2/libbdplus-0.1.2.tar.bz2.sha512
+sha512	e00e7bc9f52b9275646593b753ba646b052255be94a7241965f4dbe4734f8f6a072973ed4b9997957f939236b0633897c295749f79e232188430795be5b5087b	libbdplus-0.1.2.tar.bz2
diff --git a/package/libbdplus/libbdplus.mk b/package/libbdplus/libbdplus.mk
new file mode 100644
index 0000000..45913ed
--- /dev/null
+++ b/package/libbdplus/libbdplus.mk
@@ -0,0 +1,31 @@
+################################################################################
+#
+# libbdplus
+#
+################################################################################
+
+LIBBDPLUS_VERSION = 0.1.2
+LIBBDPLUS_SITE = http://download.videolan.org/pub/videolan/libbdplus/$(LIBBDPLUS_VERSION)
+LIBBDPLUS_SOURCE = libbdplus-$(LIBBDPLUS_VERSION).tar.bz2
+LIBBDPLUS_LICENSE = LGPLv2.1+
+LIBBDPLUS_LICENSE_FILES = COPYING
+LIBBDPLUS_INSTALL_STAGING = YES
+LIBBDPLUS_DEPENDENCIES = libgcrypt
+LIBBDPLUS_CONF_OPTS = \
+	--disable-werror \
+	--disable-extra-warnings \
+	--disable-optimizations \
+	--disable-examples \
+	--disable-debug \
+	--with-gnu-ld \
+	--with-libgcrypt-prefix=$(STAGING_DIR)/usr \
+	--with-gpg-error-prefix=$(STAGING_DIR)/usr
+
+ifeq ($(BR2_PACKAGE_LIBAACS),y)
+LIBBDPLUS_DEPENDENCIES += libaacs
+LIBBDPLUS_CONF_OPTS += --with-libaacs
+else
+LIBBDPLUS_CONF_OPTS += --without-libaacs
+endif
+
+$(eval $(autotools-package))
-- 
2.8.1
