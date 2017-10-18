From: Adam Duskett <aduskett@gmail.com>
Date: Tue, 17 Oct 2017 22:32:38 -0400
Subject: [Buildroot] [PATCH 11/13] ca-certificates: fix installation against
	libressl
In-Reply-To: <20171018023240.22724-1-Adamduskett@outlook.com>
References: <20171018023240.22724-1-Adamduskett@outlook.com>
Message-ID: <20171018023240.22724-12-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ca-certificates uses the c_rehash script from openssl to create
symlinks to the certificates by their hash value.
LibreSSL moved this functionality into the openssl binary itself.

Check to see if LibreSSL is installed, and if so, call the host openssl
itself instead of the c_rehash script.

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
---
 package/ca-certificates/ca-certificates.mk | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/package/ca-certificates/ca-certificates.mk b/package/ca-certificates/ca-certificates.mk
index f712e7988e..735284c7a3 100644
--- a/package/ca-certificates/ca-certificates.mk
+++ b/package/ca-certificates/ca-certificates.mk
@@ -19,6 +19,18 @@ define CA_CERTIFICATES_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) all
 endef
 
+ifeq ($(BR2_PACKAGE_LIBOPENSSL),y)
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
-- 
2.13.6
