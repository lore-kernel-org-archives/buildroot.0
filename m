From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 21 Apr 2017 15:00:26 +0200
Subject: [Buildroot] [PATCH v3 1/2] package/libpng: Cleanup neon support
	options
Message-ID: <20170421130027.28379-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Suggested by Thomas:
http://lists.busybox.net/pipermail/buildroot/2017-April/189086.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v3: removed "=yes" from -enable-arm-neon (Thomas)
v2: initial version

 package/libpng/libpng.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index 249115702..7ae1dd59f 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -14,7 +14,12 @@ LIBPNG_INSTALL_STAGING = YES
 LIBPNG_DEPENDENCIES = host-pkgconf zlib
 HOST_LIBPNG_DEPENDENCIES = host-pkgconf host-zlib
 LIBPNG_CONFIG_SCRIPTS = libpng$(LIBPNG_SERIES)-config libpng-config
-LIBPNG_CONF_OPTS = $(if $(BR2_ARM_CPU_HAS_NEON),--enable-arm-neon=yes,--enable-arm-neon=no)
+
+ifeq ($(BR2_ARM_CPU_HAS_NEON),y)
+LIBPNG_CONF_OPTS += --enable-arm-neon
+else
+LIBPNG_CONF_OPTS += --disable-arm-neon
+endif
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.11.0
