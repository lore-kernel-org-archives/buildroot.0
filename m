From: spdawson at gmail.com <spdawson@gmail.com>
Date: Fri,  9 Nov 2012 11:05:04 +0000
Subject: [Buildroot] [PATCH 1/2] neard: new package
In-Reply-To: <1352459105-13590-1-git-send-email-spdawson@gmail.com>
References: <1352459105-13590-1-git-send-email-spdawson@gmail.com>
Message-ID: <1352459105-13590-2-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/Config.in       |    1 +
 package/neard/Config.in |   15 +++++++++++++++
 package/neard/neard.mk  |   16 ++++++++++++++++
 3 files changed, 32 insertions(+)
 create mode 100644 package/neard/Config.in
 create mode 100644 package/neard/neard.mk

diff --git a/package/Config.in b/package/Config.in
index 2ab6b6e..ffc08ab 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -236,6 +236,7 @@ source "package/mdadm/Config.in"
 source "package/memtester/Config.in"
 source "package/minicom/Config.in"
 source "package/nanocom/Config.in"
+source "package/neard/Config.in"
 source "package/ofono/Config.in"
 source "package/open2300/Config.in"
 source "package/openocd/Config.in"
diff --git a/package/neard/Config.in b/package/neard/Config.in
new file mode 100644
index 0000000..f973fdd
--- /dev/null
+++ b/package/neard/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_NEARD
+	bool "neard"
+	depends on BR2_LINUX_KERNEL
+	select BR2_PACKAGE_DBUS
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_LIBNL
+	help
+	  Near Field Communication (NFC) manager
+
+	  http://git.kernel.org/?p=network/nfc/neard.git;a=summary
+
+	  https://01.org/linux-nfc/documentation/how-start-linux-nfc-code...
+
+comment "neard requires a Linux kernel"
+	depends on !BR2_LINUX_KERNEL
diff --git a/package/neard/neard.mk b/package/neard/neard.mk
new file mode 100644
index 0000000..3d73932
--- /dev/null
+++ b/package/neard/neard.mk
@@ -0,0 +1,16 @@
+#############################################################
+#
+# neard
+#
+#############################################################
+NEARD_VERSION = 0.7
+NEARD_SITE = $(BR2_KERNEL_MIRROR)/linux/network/nfc
+NEARD_INSTALL_STAGING = YES
+NEARD_LICENSE = GPLv2
+NEARD_LICENSE_FILES = COPYING
+
+NEARD_DEPENDENCIES = linux dbus libglib2 libnl
+NEARD_AUTORECONF = YES
+NEARD_CONF_OPT = --disable-traces
+
+$(eval $(autotools-package))
-- 
1.7.10.4
