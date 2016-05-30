From: Joris Lijssens <joris.lijssens@gmail.com>
Date: Mon, 30 May 2016 16:15:34 +0200
Subject: [Buildroot]  [PATCH v2 1/1] libcoap: new package
Message-ID: <1464617734-24139-1-git-send-email-joris.lijssens@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Joris Lijssens <joris.lijssens@gmail.com>
---
Changes v1 -> v2:
 - Fix typo in libcoap.mk

 package/Config.in            |  1 +
 package/libcoap/Config.in    | 10 ++++++++++
 package/libcoap/libcoap.hash |  2 ++
 package/libcoap/libcoap.mk   | 21 +++++++++++++++++++++
 4 files changed, 34 insertions(+)
 create mode 100644 package/libcoap/Config.in
 create mode 100644 package/libcoap/libcoap.hash
 create mode 100644 package/libcoap/libcoap.mk

diff --git a/package/Config.in b/package/Config.in
index 9d668bf..db78939 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1122,6 +1122,7 @@ menu "Networking"
 	source "package/ibrdtn/Config.in"
 	source "package/libcgi/Config.in"
 	source "package/libcgicc/Config.in"
+	source "package/libcoap/Config.in"
 	source "package/libcurl/Config.in"
 	source "package/libdnet/Config.in"
 	source "package/libeXosip2/Config.in"
diff --git a/package/libcoap/Config.in b/package/libcoap/Config.in
new file mode 100644
index 0000000..7aea348
--- /dev/null
+++ b/package/libcoap/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_LIBCOAP
+	bool "libcoap"
+	help
+	 libcoap is a C implementation of a lightweight application-protocol
+	 for devices that are constrained their resources such as computing
+	 power, RF range, memory, bandwith, or network packet sizes. This
+	 protocol, CoAP, is standardized by the IETF as RFC 7252. For further
+	 information related to CoAP, see <http://coap.technology>.
+
+	 https://github.com/obgm/libcoap
diff --git a/package/libcoap/libcoap.hash b/package/libcoap/libcoap.hash
new file mode 100644
index 0000000..dce491b
--- /dev/null
+++ b/package/libcoap/libcoap.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 f66e91742c2b027fcd7c575d8e7b53d79d3624aad1b3baba481dd88f6e2bc44d libcoap-c909bf802034b7762a2182848304b2530e58444f.tar.gz
diff --git a/package/libcoap/libcoap.mk b/package/libcoap/libcoap.mk
new file mode 100644
index 0000000..320582f
--- /dev/null
+++ b/package/libcoap/libcoap.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# libcoap
+#
+################################################################################
+
+LIBCOAP_VERSION = c909bf802034b7762a2182848304b2530e58444f
+LIBCOAP_SITE = $(call github,obgm,libcoap,$(LIBCOAP_VERSION))
+LIBCOAP_INSTALL_STAGING = YES
+LIBCOAP_LICENSE = GPLv2, BSD-2c
+LIBCOAP_LICENSE_FILES = LICENSE.GPL LICENSE.BSD
+LIBCOAP_CONF_OPTS += --with-shared --disable-examples
+
+# This package uses autoconf, but not automake, so we need to call
+# their special autogen.sh script.
+define LIBCOAP_RUN_AUTOGEN
+	cd $(@D) && PATH=$(BR_PATH) ./autogen.sh
+endef
+LIBCOAP_PRE_CONFIGURE_HOOKS += LIBCOAP_RUN_AUTOGEN
+
+$(eval $(autotools-package))
-- 
1.8.3.1
