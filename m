From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed,  1 Apr 2015 20:35:54 +0200
Subject: [Buildroot] [PATCH/RFC 01/27] package/libsquish: New package
In-Reply-To: <1427913380-14808-1-git-send-email-bernd.kuhls@t-online.de>
References: <1427913380-14808-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1427913380-14808-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Needed for Kodi 15.0

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/Config.in              |    1 +
 package/libsquish/Config.in    |   11 +++++++++++
 package/libsquish/libsquish.mk |   24 ++++++++++++++++++++++++
 3 files changed, 36 insertions(+)
 create mode 100644 package/libsquish/Config.in
 create mode 100644 package/libsquish/libsquish.mk

diff --git a/package/Config.in b/package/Config.in
index 8cd0cb1..ce67c8a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -645,6 +645,7 @@ endmenu
 menu "Compression and decompression"
 	source "package/libarchive/Config.in"
 	source "package/libzip/Config.in"
+	source "package/libsquish/Config.in"
 	source "package/lzo/Config.in"
 	source "package/snappy/Config.in"
 	source "package/szip/Config.in"
diff --git a/package/libsquish/Config.in b/package/libsquish/Config.in
new file mode 100644
index 0000000..10af979
--- /dev/null
+++ b/package/libsquish/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_LIBSQUISH
+	bool "libsquish"
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  The squish library (abbreviated to libsquish) is an open source DXT
+	  compression library written in C++
+
+	  https://code.google.com/p/libsquish
+
+comment "libsquish needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/libsquish/libsquish.mk b/package/libsquish/libsquish.mk
new file mode 100644
index 0000000..d381370
--- /dev/null
+++ b/package/libsquish/libsquish.mk
@@ -0,0 +1,24 @@
+################################################################################
+#
+# libsquish
+#
+################################################################################
+
+LIBSQUISH_VERSION = 1.10-openelec
+LIBSQUISH_SOURCE = libsquish-$(LIBSQUISH_VERSION).tar.gz
+LIBSQUISH_SITE = http://sources.openelec.tv/devel
+LIBSQUISH_INSTALL_STAGING = YES
+LIBSQUISH_LICENSE = MIT
+LIBSQUISH_LICENSE_FILES = README
+
+define LIBSQUISH_INSTALL_STAGING_CMDS
+	CXX=$(TARGET_CXX) CXXFLAGS="$(TARGET_CXXFLAGS)" \
+	$(MAKE) -C $(@D) install PREFIX=/usr INSTALL_DIR=$(STAGING_DIR)/usr
+endef
+
+define LIBSQUISH_INSTALL_TARGET_CMDS
+	CXX=$(TARGET_CXX) CXXFLAGS="$(TARGET_CXXFLAGS)" \
+	$(MAKE) -C $(@D) install PREFIX=/usr INSTALL_DIR=$(TARGET_DIR)/usr
+endef
+
+$(eval $(generic-package))
-- 
1.7.10.4
