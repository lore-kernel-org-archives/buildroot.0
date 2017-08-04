From: Adam Duskett <aduskett@gmail.com>
Date: Fri,  4 Aug 2017 14:55:19 -0400
Subject: [Buildroot] [PATCH 08/10] libssl: fix make files for libressl
In-Reply-To: <20170804185521.12320-1-Adamduskett@outlook.com>
References: <20170804185521.12320-1-Adamduskett@outlook.com>
Message-ID: <20170804185521.12320-9-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Two packages need a slight change to get them to build with libressl.

ca-certificates uses the c_rehash script from openssl to create
symlinks to the certificates by their hash value.
LibreSSL moved this functionality into the openssl binary itself.

mosquitto has tls_psk enabled by default, which libressl does not support.
This is fixed with passing WITH_TLS_PSK=no to the make opts.

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
---
 package/ca-certificates/ca-certificates.mk | 14 +++++++++++++-
 package/mosquitto/mosquitto.mk             |  3 +++
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/package/ca-certificates/ca-certificates.mk b/package/ca-certificates/ca-certificates.mk
index 7221afb00..384c1ecf5 100644
--- a/package/ca-certificates/ca-certificates.mk
+++ b/package/ca-certificates/ca-certificates.mk
@@ -19,6 +19,18 @@ define CA_CERTIFICATES_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) all
 endef
 
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+define CA_CERTIFICATES_CREATE_SYMLINKS
+	$(HOST_DIR)/bin/c_rehash $(TARGET_DIR)/etc/ssl/certs
+endef
+endif
+
+ifeq ($(BR2_PACKAGE_LIBRESSL),y)
+define CA_CERTIFICATES_CREATE_SYMLINKS
+	$(HOST_DIR)/bin/openssl certhash $(TARGET_DIR)/etc/ssl/certs
+endef
+endif
+
 define CA_CERTIFICATES_INSTALL_TARGET_CMDS
 	$(INSTALL) -d -m 0755 $(TARGET_DIR)/usr/share/ca-certificates
 	$(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/ssl/certs
@@ -37,7 +49,7 @@ define CA_CERTIFICATES_INSTALL_TARGET_CMDS
 	done
 
 	# Create symlinks to the certificates by their hash values
-	$(HOST_DIR)/bin/c_rehash $(TARGET_DIR)/etc/ssl/certs
+	$(CA_CERTIFICATES_CREATE_SYMLINKS)
 endef
 
 $(eval $(generic-package))
diff --git a/package/mosquitto/mosquitto.mk b/package/mosquitto/mosquitto.mk
index 29e252161..05052c7c3 100644
--- a/package/mosquitto/mosquitto.mk
+++ b/package/mosquitto/mosquitto.mk
@@ -33,6 +33,9 @@ endif
 ifeq ($(BR2_PACKAGE_LIBSSL),y)
 MOSQUITTO_DEPENDENCIES += libssl
 MOSQUITTO_MAKE_OPTS += WITH_TLS=yes
+ifeq ($(BR2_PACKAGE_LIBRESSL),y)
+MOSQUITTO_MAKE_OPTS += WITH_TLS_PSK=no
+endif
 else
 MOSQUITTO_MAKE_OPTS += WITH_TLS=no
 endif
-- 
2.13.3
