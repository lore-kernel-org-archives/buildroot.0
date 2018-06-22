From: Roman Gorbenkov <roman.gorbenkov@ens2m.org>
Date: Fri, 22 Jun 2018 15:33:25 +0200
Subject: [Buildroot] [PATCH 1/2] davfs2: new package
Message-ID: <20180622133326.7528-1-roman.gorbenkov@ens2m.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

davfs2 is a Linux file system driver that allows to
mount a WebDAV resource. WebDAV is an extension to HTTP/1.1
that allows remote collaborative authoring of Web resources.

Signed-off-by: Roman Gorbenkov <roman.gorbenkov@ens2m.org>
---
 package/Config.in          |  1 +
 package/davfs2/Config.in   | 17 +++++++++++++++++
 package/davfs2/davfs2.hash |  5 +++++
 package/davfs2/davfs2.mk   | 19 +++++++++++++++++++
 4 files changed, 42 insertions(+)
 create mode 100644 package/davfs2/Config.in
 create mode 100644 package/davfs2/davfs2.hash
 create mode 100644 package/davfs2/davfs2.mk

diff --git a/package/Config.in b/package/Config.in
index a5ecfecbf9..c8e35fd99e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -175,6 +175,7 @@ menu "Filesystem and flash utilities"
 	source "package/cpio/Config.in"
 	source "package/cramfs/Config.in"
 	source "package/curlftpfs/Config.in"
+	source "package/davfs2/Config.in"
 	source "package/dosfstools/Config.in"
 	source "package/e2fsprogs/Config.in"
 	source "package/e2tools/Config.in"
diff --git a/package/davfs2/Config.in b/package/davfs2/Config.in
new file mode 100644
index 0000000000..9a2e20586c
--- /dev/null
+++ b/package/davfs2/Config.in
@@ -0,0 +1,17 @@
+comment "DAVFS2 needs a toolchain w/ regular stack smashing protection support"
+	depends on !BR2_TOOLCHAIN_BUILDROOT_USE_SSP || !BR2_SSP_REGULAR
+
+config BR2_PACKAGE_DAVFS2
+	bool "davfs2"
+	depends on BR2_TOOLCHAIN_BUILDROOT_USE_SSP
+	depends on BR2_SSP_REGULAR
+	select BR2_PACKAGE_NEON
+	select BR2_PACKAGE_NEON_XML
+	help
+	  davfs2 is a Linux file system driver that allows to
+	  mount a WebDAV resource. WebDAV is an extension to HTTP/1.1
+	  that allows remote collaborative authoring of Web resources.
+	  To use davfs2 via /etc/fstab, FEATURE_MOUNT_HELPERS
+	  must be selected in busybox configuration.
+
+	  http://savannah.nongnu.org/projects/davfs2
diff --git a/package/davfs2/davfs2.hash b/package/davfs2/davfs2.hash
new file mode 100644
index 0000000000..97ce80bfe0
--- /dev/null
+++ b/package/davfs2/davfs2.hash
@@ -0,0 +1,5 @@
+# Calculated based on the hash above
+#Locally calculated
+sha256 c9c4e0f0912a782386216b2147eb9c36c47f193b8fcf3d637719e0b9fe7c96e0  davfs2-1.5.4.tar.gz
+#License file, locally calculated
+sha256 0ae0485a5bd37a63e63603596417e4eb0e653334fa6c7f932ca3a0e85d4af227  COPYING
diff --git a/package/davfs2/davfs2.mk b/package/davfs2/davfs2.mk
new file mode 100644
index 0000000000..da5ea530a0
--- /dev/null
+++ b/package/davfs2/davfs2.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# davfs2
+#
+################################################################################
+
+DAVFS2_VERSION = 1.5.4
+DAVFS2_SITE = http://download.savannah.nongnu.org/releases/davfs2/davfs2-$(DAVFS2_VERSION).tar.gz
+DAVFS2_LICENSE = GPL-3.0+
+DAVFS2_LICENSE_FILES = COPYING
+
+DAVFS2_DEPENDENCIES = neon
+
+DAVFS2_AUTORECONF = YES
+
+DAVFS2_CONF_ENV += \
+    ac_cv_path_NEON_CONFIG=$(STAGING_DIR)/usr/bin/neon-config
+
+$(eval $(autotools-package))
-- 
2.13.6
