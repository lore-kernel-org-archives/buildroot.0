From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 27 Feb 2020 17:30:42 +0100
Subject: [Buildroot] [PATCH/next 1/1] package/bearssl: new package
Message-ID: <20200227163042.3723042-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

BearSSL is an implementation of the SSL/TLS protocol (RFC 5246) written
in C

https://bearssl.org

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 DEVELOPERS                   |  1 +
 package/Config.in            |  1 +
 package/bearssl/Config.in    |  7 +++++++
 package/bearssl/bearssl.hash |  3 +++
 package/bearssl/bearssl.mk   | 39 ++++++++++++++++++++++++++++++++++++
 5 files changed, 51 insertions(+)
 create mode 100644 package/bearssl/Config.in
 create mode 100644 package/bearssl/bearssl.hash
 create mode 100644 package/bearssl/bearssl.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 1700b138d0..16e81cbba7 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -823,6 +823,7 @@ F:	package/libmaxminddb/
 F:	package/openzwave/
 
 N:	Fabrice Fontaine <fontaine.fabrice@gmail.com>
+F:	package/bearssl/
 F:	package/boinc/
 F:	package/cairo/
 F:	package/daq3/
diff --git a/package/Config.in b/package/Config.in
index deb1b32aff..09c5c2dd57 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1276,6 +1276,7 @@ menu "Compression and decompression"
 endmenu
 
 menu "Crypto"
+	source "package/bearssl/Config.in"
 	source "package/beecrypt/Config.in"
 	source "package/botan/Config.in"
 	source "package/ca-certificates/Config.in"
diff --git a/package/bearssl/Config.in b/package/bearssl/Config.in
new file mode 100644
index 0000000000..b10ce6025a
--- /dev/null
+++ b/package/bearssl/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_BEARSSL
+	bool "bearssl"
+	help
+	  BearSSL is an implementation of the SSL/TLS protocol
+	  (RFC 5246) written in C.
+
+	  https://bearssl.org
diff --git a/package/bearssl/bearssl.hash b/package/bearssl/bearssl.hash
new file mode 100644
index 0000000000..e000762668
--- /dev/null
+++ b/package/bearssl/bearssl.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256  6705bba1714961b41a728dfc5debbe348d2966c117649392f8c8139efc83ff14  bearssl-0.6.tar.gz
+sha256  771bf18c8633ea69ec9b07d2e604c4b99b7bef41b0f5ce6385d24df4448f61ca  LICENSE.txt
diff --git a/package/bearssl/bearssl.mk b/package/bearssl/bearssl.mk
new file mode 100644
index 0000000000..32e41db81e
--- /dev/null
+++ b/package/bearssl/bearssl.mk
@@ -0,0 +1,39 @@
+################################################################################
+#
+# bearssl
+#
+################################################################################
+
+BEARSSL_VERSION = 0.6
+BEARSSL_SITE = https://bearssl.org
+BEARSSL_LICENSE = MIT
+BEARSSL_LICENSE_FILES = LICENSE.txt
+BEARSSL_INSTALL_STAGING = YES
+
+BEARSSL_MAKE_OPTS = \
+	$(TARGET_CONFIGURE_OPTS) \
+	LDDLL=$(TARGET_CC)
+
+ifeq ($(BR2_SHARED_LIBS),y)
+BEARSSL_TARGETS += dll
+else ifeq ($(BR2_STATIC_LIBS),y)
+BEARSSL_TARGETS += lib
+else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
+BEARSSL_TARGETS += dll lib
+endif
+
+define BEARSSL_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(BEARSSL_MAKE_OPTS) -C $(@D) \
+		$(BEARSSL_TARGETS)
+endef
+
+define BEARSSL_INSTALL_STAGING_CMDS
+	$(INSTALL) -D -m 0644 $(@D)/inc/*.h $(STAGING_DIR)/usr/include
+	$(INSTALL) -D -m 0644 $(@D)/build/lib* $(STAGING_DIR)/usr/lib
+endef
+
+define BEARSSL_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0644 $(@D)/build/lib* $(TARGET_DIR)/usr/lib
+endef
+
+$(eval $(generic-package))
-- 
2.25.0
