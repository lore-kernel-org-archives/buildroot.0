From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri,  3 Jan 2020 12:25:16 +0100
Subject: [Buildroot] [PATCH v2,2/2] package/samba4: drop host-python
In-Reply-To: <20200103112516.1501782-1-fontaine.fabrice@gmail.com>
References: <20200103112516.1501782-1-fontaine.fabrice@gmail.com>
Message-ID: <20200103112516.1501782-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop host-python to always build samba4 with host-python3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/samba4/samba4.mk | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 31a598333c..48c5d42843 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -11,7 +11,7 @@ SAMBA4_INSTALL_STAGING = YES
 SAMBA4_LICENSE = GPL-3.0+
 SAMBA4_LICENSE_FILES = COPYING
 SAMBA4_DEPENDENCIES = \
-	host-e2fsprogs host-heimdal host-nfs-utils \
+	host-e2fsprogs host-heimdal host-nfs-utils host-python3 \
 	cmocka e2fsprogs gnutls popt zlib \
 	$(if $(BR2_PACKAGE_LIBAIO),libaio) \
 	$(if $(BR2_PACKAGE_LIBCAP),libcap) \
@@ -22,17 +22,10 @@ SAMBA4_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
 SAMBA4_CONF_ENV = \
 	CFLAGS="$(SAMBA4_CFLAGS)" \
 	LDFLAGS="$(SAMBA4_LDFLAGS)" \
+	PYTHON="$(HOST_DIR)/bin/python3" \
 	XSLTPROC=false \
 	WAF_NO_PREFORK=1
 
-ifeq ($(BR2_PACKAGE_PYTHON3),y)
-SAMBA4_PYTHON = PYTHON="$(HOST_DIR)/bin/python3"
-SAMBA4_DEPENDENCIES += host-python3
-else
-SAMBA4_PYTHON = PYTHON="$(HOST_DIR)/bin/python2"
-SAMBA4_DEPENDENCIES += host-python
-endif
-
 ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
 SAMBA4_CFLAGS += `$(PKG_CONFIG_HOST_BINARY) --cflags libtirpc`
 SAMBA4_LDFLAGS += `$(PKG_CONFIG_HOST_BINARY) --libs libtirpc`
@@ -99,7 +92,6 @@ define SAMBA4_CONFIGURE_CMDS
 	$(INSTALL) -m 0644 package/samba4/samba4-cache.txt $(@D)/cache.txt;
 	echo 'Checking uname machine type: $(BR2_ARCH)' >>$(@D)/cache.txt;
 	(cd $(@D); \
-		$(SAMBA4_PYTHON) \
 		python_LDFLAGS="" \
 		python_LIBDIR="" \
 		$(TARGET_CONFIGURE_OPTS) \
-- 
2.24.0
