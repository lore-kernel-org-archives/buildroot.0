From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  3 Jul 2016 00:18:12 +0200
Subject: [Buildroot] [PATCH 2/3] libnatpmp: New package
In-Reply-To: <1467497893-16126-1-git-send-email-bernd.kuhls@t-online.de>
References: <1467497893-16126-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1467497893-16126-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/Config.in                |  1 +
 package/libnatpmp/Config.in      | 16 ++++++++++++++++
 package/libnatpmp/libnatpmp.hash |  2 ++
 package/libnatpmp/libnatpmp.mk   | 31 +++++++++++++++++++++++++++++++
 4 files changed, 50 insertions(+)
 create mode 100644 package/libnatpmp/Config.in
 create mode 100644 package/libnatpmp/libnatpmp.hash
 create mode 100644 package/libnatpmp/libnatpmp.mk

diff --git a/package/Config.in b/package/Config.in
index cfa26ee..9b062c4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1182,6 +1182,7 @@ menu "Networking"
 	source "package/libminiupnpc/Config.in"
 	source "package/libmnl/Config.in"
 	source "package/libmodbus/Config.in"
+	source "package/libnatpmp/Config.in"
 	source "package/libndp/Config.in"
 	source "package/libnet/Config.in"
 	source "package/libnetfilter_acct/Config.in"
diff --git a/package/libnatpmp/Config.in b/package/libnatpmp/Config.in
new file mode 100644
index 0000000..9de0b74
--- /dev/null
+++ b/package/libnatpmp/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_LIBNATPMP
+	bool "libnatpmp"
+	depends on !BR2_BINFMT_FLAT
+	depends on !BR2_STATIC_LIBS
+	help
+	  libnatpmp is an attempt to make a portable and fully compliant
+	  implementation of the NAT-PMP protocol for the client side. It
+	  is based on non blocking sockets and all calls of the API are
+	  asynchronous. It is therefore very easy to integrate the
+	  NAT-PMP code to any event driven code.
+
+	  http://miniupnp.free.fr/libnatpmp.html
+
+comment "libnatpmp needs a toolchain dynamic library"
+	depends on BR2_STATIC_LIBS
+	depends on !BR2_BINFMT_FLAT
diff --git a/package/libnatpmp/libnatpmp.hash b/package/libnatpmp/libnatpmp.hash
new file mode 100644
index 0000000..a5cab3c
--- /dev/null
+++ b/package/libnatpmp/libnatpmp.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 e1aa9c4c4219bc06943d6b2130f664daee213fb262fcb94dd355815b8f4536b0  libnatpmp-20150609.tar.gz
diff --git a/package/libnatpmp/libnatpmp.mk b/package/libnatpmp/libnatpmp.mk
new file mode 100644
index 0000000..cdd65e9
--- /dev/null
+++ b/package/libnatpmp/libnatpmp.mk
@@ -0,0 +1,31 @@
+################################################################################
+#
+# libnatpmp
+#
+################################################################################
+
+LIBNATPMP_VERSION = 20150609
+LIBNATPMP_SITE = http://miniupnp.free.fr/files
+LIBNATPMP_INSTALL_STAGING = YES
+LIBNATPMP_LICENSE = BSD-3c
+LIBNATPMP_LICENSE_FILES = LICENSE
+
+define LIBNATPMP_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
+		CC="$(TARGET_CC)"
+endef
+
+define LIBNATPMP_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
+		PREFIX=$(STAGING_DIR) \
+		HEADERS='declspec.h natpmp.h' \
+		$(TARGET_CONFIGURE_OPTS) install
+endef
+
+define LIBNATPMP_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
+		PREFIX=$(TARGET_DIR) \
+		$(TARGET_CONFIGURE_OPTS) install
+endef
+
+$(eval $(generic-package))
-- 
2.8.1
