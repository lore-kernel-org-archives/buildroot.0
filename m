From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date: Thu, 29 Jan 2015 12:35:38 +0100
Subject: [Buildroot] [PATCH v2 3/5] libsigrok: new package
In-Reply-To: <1422531340-24883-1-git-send-email-bgolaszewski@baylibre.com>
References: <1422531340-24883-1-git-send-email-bgolaszewski@baylibre.com>
Message-ID: <1422531340-24883-4-git-send-email-bgolaszewski@baylibre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 package/Config.in              |  1 +
 package/libsigrok/Config.in    | 22 +++++++++++++++++++++
 package/libsigrok/libsigrok.mk | 45 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 68 insertions(+)
 create mode 100644 package/libsigrok/Config.in
 create mode 100644 package/libsigrok/libsigrok.mk

diff --git a/package/Config.in b/package/Config.in
index 32d8e8a..686f343 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -733,6 +733,7 @@ menu "Hardware handling"
 	source "package/librtlsdr/Config.in"
 	source "package/libserial/Config.in"
 	source "package/libserialport/Config.in"
+	source "package/libsigrok/Config.in"
 	source "package/libsoc/Config.in"
 	source "package/libusb/Config.in"
 	source "package/libusb-compat/Config.in"
diff --git a/package/libsigrok/Config.in b/package/libsigrok/Config.in
new file mode 100644
index 0000000..09077fb
--- /dev/null
+++ b/package/libsigrok/Config.in
@@ -0,0 +1,22 @@
+config BR2_PACKAGE_LIBSIGROK
+	bool "libsigrok"
+	select BR2_PACKAGE_LIBSERIALPORT
+	select BR2_PACKAGE_LIBZIP
+	select BR2_PACKAGE_LIBGLIB2
+	# libglib2
+	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU
+	help
+	  Libsigrok is a shared library written in C, which provides
+	  the basic hardware access drivers for logic analyzers and
+	  other supported devices, as well as input/output file format
+	  support.
+
+	  This library is a part of the sigrok software suite.
+
+	  http://sigrok.org/wiki/Libsigrok
+
+comment "libsigrok needs a toolchain w/ wchar, threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libsigrok/libsigrok.mk b/package/libsigrok/libsigrok.mk
new file mode 100644
index 0000000..f922ff9
--- /dev/null
+++ b/package/libsigrok/libsigrok.mk
@@ -0,0 +1,45 @@
+################################################################################
+#
+# libsigrok
+#
+################################################################################
+
+LIBSIGROK_VERSION = 8656a71790133d4de42252a1e75b4209c03b4983
+# No https access on upstream git
+LIBSIGROK_SITE = git://sigrok.org/libsigrok
+LIBSIGROK_LICENSE = GPLv3+
+LIBSIGROK_LICENSE_FILES = COPYING
+# Git checkout has no configure script
+LIBSIGROK_AUTORECONF = YES
+LIBSIGROK_INSTALL_STAGING = YES
+LIBSIGROK_DEPENDENCIES = libglib2 libzip
+LIBSIGROK_CONF_OPTS = --disable-libudev --disable-bindings --disable-glibtest
+
+define LIBSIGROK_ADD_MISSING
+	cd $(@D); \
+	mkdir -p autostuff; \
+	automake --add-missing; \
+	cd -;
+endef
+
+LIBSIGROK_PRE_CONFIGURE_HOOKS += LIBSIGROK_ADD_MISSING
+
+ifeq ($(BR2_PACKAGE_LIBFTDI),y)
+LIBSIGROK_CONF_OPTS += --enable-libftdi
+LIBSIGROK_DEPENDENCIES += libftdi
+else
+LIBSIGROK_CONF_OPTS += --disable-libftdi
+endif
+
+ifeq ($(BR2_PACKAGE_LIBUSB),y)
+LIBSIGROK_CONF_OPTS += --enable-libusb
+LIBSIGROK_DEPENDENCIES += libusb
+else
+LIBSIGROK_CONF_OPTS += --disable-libusb
+endif
+
+ifeq ($(BR2_PACKAGE_GLIBMM),y)
+LIBSIGROK_DEPENDENCIES += glibmm
+endif
+
+$(eval $(autotools-package))
-- 
2.1.4
