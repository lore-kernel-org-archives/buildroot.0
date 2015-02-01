From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 1 Feb 2015 14:49:43 +0100
Subject: [Buildroot] [git commit] libsigrok: new package
Message-ID: <20150201135502.0A23980489@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=73789f14e49c91b7e423eacb6a119908caf01595
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: needs host-pkgconf, simplify pre configure hook]
Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in              |    1 +
 package/libsigrok/Config.in    |   22 ++++++++++++++++++++
 package/libsigrok/libsigrok.mk |   42 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 65 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index fe3966e..d3e5ac8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -735,6 +735,7 @@ menu "Hardware handling"
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
index 0000000..f91b8cb
--- /dev/null
+++ b/package/libsigrok/libsigrok.mk
@@ -0,0 +1,42 @@
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
+LIBSIGROK_DEPENDENCIES = libglib2 libzip host-pkgconf
+LIBSIGROK_CONF_OPTS = --disable-libudev --disable-bindings --disable-glibtest
+
+define LIBSIGROK_ADD_MISSING
+	mkdir -p $(@D)/autostuff
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
