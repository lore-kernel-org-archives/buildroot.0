From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date: Thu, 29 Jan 2015 12:35:37 +0100
Subject: [Buildroot] [PATCH v2 2/5] libserialport: new package
In-Reply-To: <1422531340-24883-1-git-send-email-bgolaszewski@baylibre.com>
References: <1422531340-24883-1-git-send-email-bgolaszewski@baylibre.com>
Message-ID: <1422531340-24883-3-git-send-email-bgolaszewski@baylibre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 package/Config.in                      |  1 +
 package/libserialport/Config.in        |  8 ++++++++
 package/libserialport/libserialport.mk | 25 +++++++++++++++++++++++++
 3 files changed, 34 insertions(+)
 create mode 100644 package/libserialport/Config.in
 create mode 100644 package/libserialport/libserialport.mk

diff --git a/package/Config.in b/package/Config.in
index 7312255..32d8e8a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -732,6 +732,7 @@ menu "Hardware handling"
 	source "package/libraw1394/Config.in"
 	source "package/librtlsdr/Config.in"
 	source "package/libserial/Config.in"
+	source "package/libserialport/Config.in"
 	source "package/libsoc/Config.in"
 	source "package/libusb/Config.in"
 	source "package/libusb-compat/Config.in"
diff --git a/package/libserialport/Config.in b/package/libserialport/Config.in
new file mode 100644
index 0000000..1e2935f
--- /dev/null
+++ b/package/libserialport/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_LIBSERIALPORT
+	bool "libserialport"
+	help
+	  Serial port access library.
+
+	  This library is a part of the sigrok software suite.
+
+	  http://sigrok.org/wiki/Libserialport
diff --git a/package/libserialport/libserialport.mk b/package/libserialport/libserialport.mk
new file mode 100644
index 0000000..9a14ba1
--- /dev/null
+++ b/package/libserialport/libserialport.mk
@@ -0,0 +1,25 @@
+################################################################################
+#
+# libserialport
+#
+################################################################################
+
+LIBSERIALPORT_VERSION = e31f2c6b8b8f2b7e554df911cc9a3482b99632b4
+# No https access on upstream git
+LIBSERIALPORT_SITE = git://sigrok.org/libserialport
+LIBSERIALPORT_LICENSE = LGPLv3+
+LIBSERIALPORT_LICENSE_FILES = COPYING
+# Git checkout has no configure script
+LIBSERIALPORT_AUTORECONF = YES
+LIBSERIALPORT_INSTALL_STAGING = YES
+
+define LIBSERIALPORT_ADD_MISSING
+	cd $(@D); \
+	mkdir -p autostuff; \
+	automake --add-missing; \
+	cd -;
+endef
+
+LIBSERIALPORT_PRE_CONFIGURE_HOOKS += LIBSERIALPORT_ADD_MISSING
+
+$(eval $(autotools-package))
-- 
2.1.4
