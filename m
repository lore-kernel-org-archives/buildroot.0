From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 8 Mar 2020 16:20:22 +0100
Subject: [Buildroot] [git commit] package/bearssl: new package
Message-ID: <20200309140910.A67708E780@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4ebb58a6551febee74dda7a36847bc5e9a7d43a3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

BearSSL is an implementation of the SSL/TLS protocol (RFC 5246) written
in C

https://bearssl.org

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                   |  1 +
 package/Config.in            |  1 +
 package/bearssl/Config.in    |  7 +++++++
 package/bearssl/bearssl.hash |  3 +++
 package/bearssl/bearssl.mk   | 42 ++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 54 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 8085cfb83d..e25e563ea3 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -826,6 +826,7 @@ F:	package/libmaxminddb/
 F:	package/openzwave/
 
 N:	Fabrice Fontaine <fontaine.fabrice@gmail.com>
+F:	package/bearssl/
 F:	package/boinc/
 F:	package/cairo/
 F:	package/duktape/
diff --git a/package/Config.in b/package/Config.in
index 5be5f3726b..3da42ba78f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1279,6 +1279,7 @@ menu "Compression and decompression"
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
index 0000000000..549b000916
--- /dev/null
+++ b/package/bearssl/bearssl.mk
@@ -0,0 +1,42 @@
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
+ifeq ($(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
+BEARSSL_TARGETS = dll
+endif
+
+ifeq ($(BR2_STATIC_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
+BEARSSL_TARGETS = lib
+endif
+
+define BEARSSL_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(BEARSSL_MAKE_OPTS) -C $(@D) \
+		$(BEARSSL_TARGETS)
+endef
+
+define BEARSSL_INSTALL_STAGING_CMDS
+	mkdir -p $(STAGING_DIR)/usr/include
+	cp -dpfr $(@D)/inc/*.h $(STAGING_DIR)/usr/include
+	mkdir -p $(STAGING_DIR)/usr/lib
+	cp -dpfr $(@D)/build/lib* $(STAGING_DIR)/usr/lib
+endef
+
+define BEARSSL_INSTALL_TARGET_CMDS
+	mkdir -p $(TARGET_DIR)/usr/lib
+	cp -dpfr $(@D)/build/lib* $(TARGET_DIR)/usr/lib
+endef
+
+$(eval $(generic-package))
