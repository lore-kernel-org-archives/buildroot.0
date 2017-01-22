From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Sun, 22 Jan 2017 22:00:20 +0100
Subject: [Buildroot] [PATCH v2 1/2] bctoolbox: new package
Message-ID: <20170122210021.9463-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

bctoolbox is a utilities library used by Belledonne Communications
softwares like belle-sip, mediastreamer2 and linphone.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
Changes v1 -> v2 (suggested by Romain Naour):
 * depend on threads support
 * properly wrap help text
 * add comment about mbedtls being preferred over polarssl
 * add -DGIT_EXECUTABLE=OFF to remove an ignored error message
---
 package/Config.in                |  1 +
 package/bctoolbox/Config.in      | 12 ++++++++++++
 package/bctoolbox/bctoolbox.hash |  2 ++
 package/bctoolbox/bctoolbox.mk   | 31 +++++++++++++++++++++++++++++++
 4 files changed, 46 insertions(+)
 create mode 100644 package/bctoolbox/Config.in
 create mode 100644 package/bctoolbox/bctoolbox.hash
 create mode 100644 package/bctoolbox/bctoolbox.mk

diff --git a/package/Config.in b/package/Config.in
index 1766089b0..17e53602e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1290,6 +1290,7 @@ menu "Other"
 	source "package/argp-standalone/Config.in"
 	source "package/armadillo/Config.in"
 	source "package/atf/Config.in"
+	source "package/bctoolbox/Config.in"
 	source "package/bdwgc/Config.in"
 	source "package/boost/Config.in"
 	source "package/clapack/Config.in"
diff --git a/package/bctoolbox/Config.in b/package/bctoolbox/Config.in
new file mode 100644
index 000000000..ee0757856
--- /dev/null
+++ b/package/bctoolbox/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_BCTOOLBOX
+	bool "bctoolbox"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_MBEDTLS # mbedtls is preferred over polarssl
+	help
+	  Utilities library used by Belledonne Communications
+	  softwares like belle-sip, mediastreamer2 and linphone.
+
+	  https://github.com/BelledonneCommunications/bctoolbox
+
+comment "bctoolbox needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/bctoolbox/bctoolbox.hash b/package/bctoolbox/bctoolbox.hash
new file mode 100644
index 000000000..70be55c3d
--- /dev/null
+++ b/package/bctoolbox/bctoolbox.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  da7df7ff359a9829e9e6ef98dfe9fead0cf735b8a4a5da1b1047f467dee1b2a9  bctoolbox-0.4.0.tar.gz
diff --git a/package/bctoolbox/bctoolbox.mk b/package/bctoolbox/bctoolbox.mk
new file mode 100644
index 000000000..ce30832b2
--- /dev/null
+++ b/package/bctoolbox/bctoolbox.mk
@@ -0,0 +1,31 @@
+################################################################################
+#
+# bctoolbox
+#
+################################################################################
+
+BCTOOLBOX_VERSION = 0.4.0
+BCTOOLBOX_SITE = $(call github,BelledonneCommunications,bctoolbox,$(BCTOOLBOX_VERSION))
+BCTOOLBOX_LICENSE = GPLv2+
+BCTOOLBOX_LICENSE_FILES = COPYING
+BCTOOLBOX_DEPENDENCIES = mbedtls
+BCTOOLBOX_INSTALL_STAGING = YES
+
+BCTOOLBOX_CONF_OPTS = \
+	-DENABLE_STRICT=OFF \
+	-DENABLE_TESTS_COMPONENT=OFF \
+	-DENABLE_TESTS=OFF \
+	-DGIT_EXECUTABLE=OFF
+
+ifeq ($(BR2_STATIC_LIBS),y)
+BCTOOLBOX_CONF_OPTS += \
+	-DENABLE_SHARED=OFF -DENABLE_STATIC=ON
+else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
+BCTOOLBOX_CONF_OPTS += \
+	-DENABLE_SHARED=ON -DENABLE_STATIC=ON
+else ifeq ($(BR2_SHARED_LIBS),y)
+BCTOOLBOX_CONF_OPTS += \
+	-DENABLE_SHARED=ON -DENABLE_STATIC=OFF
+endif
+
+$(eval $(cmake-package))
-- 
2.11.0
