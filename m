From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  8 Mar 2020 12:18:12 +0100
Subject: [Buildroot] [PATCH 1/1] package/samba4: needs host-python3
Message-ID: <20200308111812.3065154-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

host-python3 is a mandatory dependency since bump to version 4.10.0 and
https://gitlab.com/samba-team/devel/samba/-/commit/5ddff307b4af5c82d5064745f5bd2c33bd340ced
because buildtools/bin/waf shebang is set to "/usr/bin/env python3"

Fixes:
 - http://autobuild.buildroot.org/results/2634eb7824beb34f485cf40670f6959515f008ad

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/samba4/samba4.mk | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 005296ea74..3048cb9a63 100644
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
@@ -25,14 +25,11 @@ SAMBA4_CONF_ENV = \
 	XSLTPROC=false \
 	WAF_NO_PREFORK=1
 
+SAMBA4_PYTHON = PYTHON="$(HOST_DIR)/bin/python3"
 ifeq ($(BR2_PACKAGE_PYTHON3),y)
-SAMBA4_PYTHON = \
-	PYTHON="$(HOST_DIR)/bin/python3" \
-	PYTHON_CONFIG="$(STAGING_DIR)/usr/bin/python3-config"
-SAMBA4_DEPENDENCIES += host-python3 python3
+SAMBA4_PYTHON += PYTHON_CONFIG="$(STAGING_DIR)/usr/bin/python3-config"
+SAMBA4_DEPENDENCIES += python3
 else
-SAMBA4_PYTHON = PYTHON="$(HOST_DIR)/bin/python2"
-SAMBA4_DEPENDENCIES += host-python
 SAMBA4_CONF_OPTS += --disable-python
 endif
 
-- 
2.25.0
