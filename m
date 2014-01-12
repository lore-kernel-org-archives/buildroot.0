From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 12 Jan 2014 21:02:33 +0100
Subject: [Buildroot] [git commit] ca-certificates: new package
Message-ID: <20140112201447.71F199C468@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=beb24ce2b0abea2ac68bd86a0ac2162d98bda6cc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

CA certificates used for SSL based applications.  The package installs CA
certificates to /usr/share/ca-certificates and creates symbolic links under
/etc/ssl/certs.  For example, the existing libcurl package will use these
certificates for https urls.  Based on the debian ca-certifcates package.

[Peter: fixup comments as pointed out by Yann]
Signed-off-by: Martin Bark <martin@barkynet.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in                          |    1 +
 package/ca-certificates/Config.in          |   11 ++++++++
 package/ca-certificates/ca-certificates.mk |   37 ++++++++++++++++++++++++++++
 3 files changed, 49 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index c47f1ad..29e00eb 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -473,6 +473,7 @@ endmenu
 
 menu "Crypto"
 source "package/beecrypt/Config.in"
+source "package/ca-certificates/Config.in"
 source "package/cryptodev/Config.in"
 source "package/gnutls/Config.in"
 source "package/libassuan/Config.in"
diff --git a/package/ca-certificates/Config.in b/package/ca-certificates/Config.in
new file mode 100644
index 0000000..a278a62
--- /dev/null
+++ b/package/ca-certificates/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_CA_CERTIFICATES
+	bool "CA Certificates"
+	help
+	  This package includes PEM files of CA certificates to allow
+	  SSL-based applications to check for the authenticity of SSL
+	  connections.
+
+	  It includes, among others, certificate authorities used by the
+	  Debian infrastructure and those shipped with Mozilla's browsers.
+
+	  http://anonscm.debian.org/gitweb/?p=collab-maint/ca-certificates.git
diff --git a/package/ca-certificates/ca-certificates.mk b/package/ca-certificates/ca-certificates.mk
new file mode 100644
index 0000000..c975a7d
--- /dev/null
+++ b/package/ca-certificates/ca-certificates.mk
@@ -0,0 +1,37 @@
+################################################################################
+#
+# ca-certificates
+#
+################################################################################
+
+CA_CERTIFICATES_VERSION = 20130906
+CA_CERTIFICATES_SOURCE = ca-certificates_$(CA_CERTIFICATES_VERSION).tar.gz
+CA_CERTIFICATES_SITE = http://snapshot.debian.org/archive/debian/20130907T154615Z/pool/main/c/ca-certificates
+CA_CERTIFICATES_DEPENDENCIES = host-openssl host-python
+CA_CERTIFICATES_LICENSE = GPLv2+ (script), MPLv2.0 (data)
+CA_CERTIFICATES_LICENSE_FILES = debian/copyright
+
+define CA_CERTIFICATES_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) all
+endef
+
+define CA_CERTIFICATES_INSTALL_TARGET_CMDS
+	$(INSTALL) -d -m 0755 $(TARGET_DIR)/usr/share/ca-certificates
+	$(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/ssl/certs
+	$(MAKE) -C $(@D) install DESTDIR=$(TARGET_DIR)
+	rm -f $(TARGET_DIR)/usr/sbin/update-ca-certificates
+
+	# Remove any existing certificates under /etc/ssl/certs
+	rm -f  $(TARGET_DIR)/etc/ssl/certs/*
+
+	# Create symlinks to certificates under /etc/ssl/certs
+	cd $(TARGET_DIR) ;\
+	for i in `find usr/share/ca-certificates -name "*.crt"` ; do \
+		ln -sf ../../../$$i etc/ssl/certs/`basename $${i} .crt`.pem ;\
+	done
+
+	# Create symlinks to the certificates by their hash values
+	$(HOST_DIR)/usr/bin/c_rehash $(TARGET_DIR)/etc/ssl/certs
+endef
+
+$(eval $(generic-package))
