From: Francois Perrad <fperrad@gmail.com>
Date: Sun, 21 Jul 2019 16:11:08 +0200
Subject: [Buildroot] [PATCH] package/netsurf: add optional dependency on webp
Message-ID: <20190721141108.13807-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

new feature of version 3.9

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/netsurf/netsurf.mk | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/package/netsurf/netsurf.mk b/package/netsurf/netsurf.mk
index 30e8dc8b4..d21d522e7 100644
--- a/package/netsurf/netsurf.mk
+++ b/package/netsurf/netsurf.mk
@@ -63,11 +63,23 @@ define NETSURF_CURL_CONFIGURE_CMDS
 endef
 endif
 
+ifeq ($(BR2_PACKAGE_WEBP),y)
+NETSURF_DEPENDENCIES += webp
+define NETSURF_WEBP_CONFIGURE_CMDS
+	echo "override NETSURF_USE_WEBP := YES"         >> $(@D)/netsurf/Makefile.config
+endef
+else
+define NETSURF_WEBP_CONFIGURE_CMDS
+	echo "override NETSURF_USE_WEBP := NO"          >> $(@D)/netsurf/Makefile.config
+endef
+endif
+
 define NETSURF_CONFIGURE_CMDS
 	$(NETSURF_ICONV_CONFIGURE_CMDS)
 	$(NETSURF_SVG_CONFIGURE_CMDS)
 	$(NETSURF_FONTLIB_CONFIGURE_CMDS)
 	$(NETSURF_CURL_CONFIGURE_CMDS)
+	$(NETSURF_WEBP_CONFIGURE_CMDS)
 endef
 
 NETSURF_MAKE_ENV = \
-- 
2.20.1
