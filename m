From: Martin Bark <martin@barkynet.com>
Date: Wed,  8 Jan 2014 17:15:30 +0000
Subject: [Buildroot] [PATCH v2] ca-certificates: new package
Message-ID: <1389201330-2420-1-git-send-email-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

CA certificates used for SSL based applications.  The package installs CA
certificates to /usr/share/ca-certificates and creates symbolic links under
/etc/ssl/certs.  For example, the existing libcurl package will use these
certificates for https urls.  Based on the debian ca-certifcates package.

Signed-off-by: Martin Bark <martin@barkynet.com>
---
Changes v1 -> v2
    - Change CA_CERTIFICATES_SITE to use $(BR2_DEBIAN_MIRROR) (suggested by Baruch Siach)
    - Clarify license usage in CA_CERTIFICATES_LICENSE (suggested by Baruch Siach)
---
 package/Config.in                          |    1 +
 package/ca-certificates/Config.in          |    9 +++++++
 package/ca-certificates/ca-certificates.mk |   39 ++++++++++++++++++++++++++++
 3 files changed, 49 insertions(+)
 create mode 100644 package/ca-certificates/Config.in
 create mode 100644 package/ca-certificates/ca-certificates.mk

diff --git a/package/Config.in b/package/Config.in
index e502cde..28ad4f4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -471,6 +471,7 @@ endmenu
 
 menu "Crypto"
 source "package/beecrypt/Config.in"
+source "package/ca-certificates/Config.in"
 source "package/cryptodev/Config.in"
 source "package/gnutls/Config.in"
 source "package/libassuan/Config.in"
diff --git a/package/ca-certificates/Config.in b/package/ca-certificates/Config.in
new file mode 100644
index 0000000..0e52bc1
--- /dev/null
+++ b/package/ca-certificates/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_CA_CERTIFICATES
+    bool "CA Certificates"
+    help
+      This package includes PEM files of CA certificates to allow
+      SSL-based applications to check for the authenticity of SSL
+      connections.
+
+      It includes, among others, certificate authorities used by the
+      Debian infrastructure and those shipped with Mozilla's browsers.
diff --git a/package/ca-certificates/ca-certificates.mk b/package/ca-certificates/ca-certificates.mk
new file mode 100644
index 0000000..6cf2e7a
--- /dev/null
+++ b/package/ca-certificates/ca-certificates.mk
@@ -0,0 +1,39 @@
+################################################################################
+#
+# ca-certificates
+#
+################################################################################
+
+CA_CERTIFICATES_VERSION = 20130906
+CA_CERTIFICATES_SOURCE = ca-certificates_$(CA_CERTIFICATES_VERSION).tar.gz
+CA_CERTIFICATES_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/c/ca-certificates
+CA_CERTIFICATES_DEPENDENCIES = host-openssl host-python
+CA_CERTIFICATES_LICENSE = GPLv2+ (script), MPLv2.0 (data)
+CA_CERTIFICATES_LICENSE_FILES = debian/copyright
+
+define CA_CERTIFICATES_BUILD_CMDS
+    PATH=$(HOST_PATH) $(MAKE) -C $(@D) all
+endef
+
+define CA_CERTIFICATES_INSTALL_TARGET_CMDS
+    $(INSTALL) -d -m 0755 $(TARGET_DIR)/usr/share/ca-certificates
+    $(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/ssl/certs
+    $(MAKE) -C $(@D) install DESTDIR=$(TARGET_DIR)
+    rm -f $(TARGET_DIR)/usr/sbin/update-ca-certificates
+
+    #remove any existing certificates under /etc/ssl/certs
+    rm -f  $(TARGET_DIR)/etc/ssl/certs/*
+
+    #generate symlinks to certificates under /etc/ssl/certs
+    ( \
+      cd $(TARGET_DIR) ;\
+      for i in `find usr/share/ca-certificates -name "*.crt"` ; do \
+            ln -sf ../../../$$i etc/ssl/certs/`basename $${i%.crt}.pem` ;\
+      done ;\
+    )
+
+    #create symbolic links to the certificates by their hash values
+    $(HOST_DIR)/usr/bin/c_rehash $(TARGET_DIR)/etc/ssl/certs
+endef
+
+$(eval $(generic-package))
-- 
1.7.9.5
