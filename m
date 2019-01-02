From: aduskett at gmail.com <aduskett@gmail.com>
Date: Wed,  2 Jan 2019 11:54:11 -0500
Subject: [Buildroot] [PATCH 1/1] glib-networking: depend on target
 ca-certificates.
Message-ID: <20190102165411.60822-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Currently, glib-networking uses the hosts ca-certificates, which, if not
installed or if they are installed in a different directory will cause a
configuration error.

Instead, select and depend on ca-certificates, and add $(TARGET_DIR) to the
-Dca_certificates_path option.

Fixes:
http://autobuild.buildroot.net/results/cc0/cc094e0a7c130c60641d32e9f4cbc46b0eba0852/build-end.log

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/glib-networking/Config.in          | 1 +
 package/glib-networking/glib-networking.mk | 5 +++--
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/glib-networking/Config.in b/package/glib-networking/Config.in
index b84a739460..a5fe7a8d65 100644
--- a/package/glib-networking/Config.in
+++ b/package/glib-networking/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_GLIB_NETWORKING
 	depends on !BR2_STATIC_LIBS # gnutls
 	select BR2_PACKAGE_GNUTLS
 	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_CA_CERTIFICATES
 	help
 	  Network-related GIO modules for glib.
 
diff --git a/package/glib-networking/glib-networking.mk b/package/glib-networking/glib-networking.mk
index 2852f90121..5b96847f24 100644
--- a/package/glib-networking/glib-networking.mk
+++ b/package/glib-networking/glib-networking.mk
@@ -14,10 +14,11 @@ GLIB_NETWORKING_DEPENDENCIES = \
 	host-pkgconf \
 	host-intltool \
 	libglib2 \
-	gnutls
+	gnutls \
+	ca-certificates
 
 GLIB_NETWORKING_CONF_OPTS = \
-	-Dca_certificates_path=/etc/ssl/certs/ca-certificates.crt \
+	-Dca_certificates_path=$(TARGET_DIR)/etc/ssl/certs/ca-certificates.crt \
 	-Dlibproxy_support=false \
 	-Dgnome_proxy_support=false \
 	-Dpkcs11_support=false
-- 
2.20.1
