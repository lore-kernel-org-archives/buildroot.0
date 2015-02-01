From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 1 Feb 2015 11:43:56 +0100
Subject: [Buildroot] [git commit] libserialport: new package
Message-ID: <20150201104454.A0E6C803D2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e38e894f4d9b59d9abe1b02f49bfd0b5a2dee27c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: needs host-pkgconf, simplify pre configure hook]
Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in                      |    1 +
 package/libserialport/Config.in        |    8 ++++++++
 package/libserialport/libserialport.mk |   23 +++++++++++++++++++++++
 3 files changed, 32 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 88a37d7..fe3966e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -734,6 +734,7 @@ menu "Hardware handling"
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
index 0000000..2e57653
--- /dev/null
+++ b/package/libserialport/libserialport.mk
@@ -0,0 +1,23 @@
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
+LIBSERIALPORT_DEPENDENCIES = host-pkgconf
+
+define LIBSERIALPORT_ADD_MISSING
+	mkdir -p $(@D)/autostuff
+endef
+
+LIBSERIALPORT_PRE_CONFIGURE_HOOKS += LIBSERIALPORT_ADD_MISSING
+
+$(eval $(autotools-package))
