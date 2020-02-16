From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 16 Feb 2020 15:52:04 +0100
Subject: [Buildroot] [PATCH 1/1] package/libupnpp: remove unneeded static
 workaround
Message-ID: <20200216145204.272998-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libupnpp uses pkg-config since version 0.15.1 and
https://opensourceprojects.eu/p/libupnpp/code/ci/3dc44417e868b9b4417cbc15f8173e0a2e142b17
so remove unneeded static workaround

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libupnpp/libupnpp.mk | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/package/libupnpp/libupnpp.mk b/package/libupnpp/libupnpp.mk
index 53dc9f6c36..c9c103d9b5 100644
--- a/package/libupnpp/libupnpp.mk
+++ b/package/libupnpp/libupnpp.mk
@@ -9,15 +9,7 @@ LIBUPNPP_SITE = http://www.lesbonscomptes.com/upmpdcli/downloads
 LIBUPNPP_LICENSE = LGPL-2.1+
 LIBUPNPP_LICENSE_FILES = COPYING
 LIBUPNPP_INSTALL_STAGING = YES
-LIBUPNPP_DEPENDENCIES = expat libcurl \
+LIBUPNPP_DEPENDENCIES = host-pkgconf expat libcurl \
 	$(if $(BR2_PACKAGE_LIBUPNP),libupnp,libupnp18)
 
-# configure script fails to link against the dependencies of libupnp
-# and libcurl causing detection to fail when statically linking
-ifeq ($(BR2_STATIC_LIBS),y)
-LIBUPNPP_DEPENDENCIES += host-pkgconf
-LIBUPNPP_CONF_ENV += \
-	LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs libupnp libcurl`"
-endif
-
 $(eval $(autotools-package))
-- 
2.24.1
