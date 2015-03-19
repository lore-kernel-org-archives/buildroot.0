From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date: Thu, 19 Mar 2015 11:08:28 +0100
Subject: [Buildroot] [PATCH v2] pulseview: new package
Message-ID: <1426759708-4920-1-git-send-email-bgolaszewski@baylibre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
Version 2:
- select BR2_PACKAGE_QT5BASE_PNG in Config.in - this is needed for
  pulseview to properly display .png icons
- don't select libserial port

Version 1:
http://patchwork.ozlabs.org/patch/445288/

 package/Config.in              |  1 +
 package/pulseview/Config.in    | 28 ++++++++++++++++++++++++++++
 package/pulseview/pulseview.mk | 24 ++++++++++++++++++++++++
 3 files changed, 53 insertions(+)
 create mode 100644 package/pulseview/Config.in
 create mode 100644 package/pulseview/pulseview.mk

diff --git a/package/Config.in b/package/Config.in
index a37e519..0cfb365 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -363,6 +363,7 @@ endif
 	source "package/picocom/Config.in"
 	source "package/pifmrds/Config.in"
 	source "package/pps-tools/Config.in"
+	source "package/pulseview/Config.in"
 	source "package/read-edid/Config.in"
 	source "package/rng-tools/Config.in"
 	source "package/rpi-userland/Config.in"
diff --git a/package/pulseview/Config.in b/package/pulseview/Config.in
new file mode 100644
index 0000000..52c9310
--- /dev/null
+++ b/package/pulseview/Config.in
@@ -0,0 +1,28 @@
+config BR2_PACKAGE_PULSEVIEW
+	bool "pulseview"
+	select BR2_PACKAGE_LIBSIGROK
+	select BR2_PACKAGE_LIBSIGROKCXX
+	depends on BR2_PACKAGE_QT5
+	select BR2_PACKAGE_QT5BASE_WIDGETS
+	select BR2_PACKAGE_QT5BASE_PNG
+	select BR2_PACKAGE_QT5SVG
+	select BR2_PACKAGE_BOOST
+	select BR2_PACKAGE_BOOST_FILESYSTEM
+	select BR2_PACKAGE_BOOST_SYSTEM
+	select BR2_PACKAGE_BOOST_THREAD
+	# libsigrok->libglib2:
+	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_BUILDROOT_CXX
+	help
+	  PulseView is a Qt based logic analyzer, oscilloscope
+	  and MSO GUI for sigrok.
+
+	  http://sigrok.org/wiki/PulseView
+
+comment "pulseview needs a toolchain w/ wchar, threads, C++"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_PACKAGE_QT5
+	depends on !BR2_TOOLCHAIN_BUILDROOT_CXX
diff --git a/package/pulseview/pulseview.mk b/package/pulseview/pulseview.mk
new file mode 100644
index 0000000..923459d
--- /dev/null
+++ b/package/pulseview/pulseview.mk
@@ -0,0 +1,24 @@
+################################################################################
+#
+# pulseview
+#
+################################################################################
+
+# TODO Pulseview can be built and linked against Qt4 as well.
+
+# No https access on upstream git
+PULSEVIEW_SITE = git://sigrok.org/pulseview
+PULSEVIEW_VERSION = 19be0af16af83ca10f7ce69cb64f0b0c6f6a0d81
+PULSEVIEW_LICENSE = GPLv3+
+PULSEVIEW_LICENSE_FILES = COPYING
+PULSEVIEW_DEPENDENCIES = libsigrok qt5base qt5svg boost
+PULSEVIEW_CONF_OPTS = -DDISABLE_WERROR=y
+
+ifeq ($(BR2_PACKAGE_LIBSIGROKDECODE),y)
+PULSEVIEW_CONF_OPTS += -DENABLE_DECODE=TRUE
+PULSEVIEW_DEPENDENCIES += libsigrokdecode
+else
+PULSEVIEW_CONF_OPTS += -DENABLE_DECODE=FALSE
+endif
+
+$(eval $(cmake-package))
-- 
2.1.4
