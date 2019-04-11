From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 11 Apr 2019 23:12:49 +0200
Subject: [Buildroot] [PATCH 1/2] package/stunnel: fix static build with
 openssl and atomic
Message-ID: <20190411211250.9402-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use pkg-config to find openssl dependencies such as lz or latomic

Fixes:
 - http://autobuild.buildroot.org/results/28a466b98f813edb6402686cc4706766e73e1ff3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/stunnel/stunnel.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/stunnel/stunnel.mk b/package/stunnel/stunnel.mk
index 4a5d2a0335..9a81373a54 100644
--- a/package/stunnel/stunnel.mk
+++ b/package/stunnel/stunnel.mk
@@ -7,12 +7,12 @@
 STUNNEL_VERSION_MAJOR = 5
 STUNNEL_VERSION = $(STUNNEL_VERSION_MAJOR).44
 STUNNEL_SITE = http://www.usenix.org.uk/mirrors/stunnel/archive/$(STUNNEL_VERSION_MAJOR).x
-STUNNEL_DEPENDENCIES = openssl
+STUNNEL_DEPENDENCIES = host-pkgconf openssl
 STUNNEL_CONF_OPTS = --with-ssl=$(STAGING_DIR)/usr --with-threads=fork \
 	--disable-libwrap
 STUNNEL_CONF_ENV = \
 	ax_cv_check_cflags___fstack_protector=$(if $(BR2_TOOLCHAIN_HAS_SSP),yes,no) \
-	LIBS=$(if $(BR2_STATIC_LIBS),-lz)
+	LIBS=`$(PKG_CONFIG_HOST_BINARY) --libs openssl`
 STUNNEL_LICENSE = GPL-2.0+
 STUNNEL_LICENSE_FILES = COPYING COPYRIGHT.GPL
 
-- 
2.20.1
