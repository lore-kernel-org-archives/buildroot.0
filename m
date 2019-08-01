From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 1 Aug 2019 16:54:04 +0200
Subject: [Buildroot] [git commit] package/netsurf: add optional dependency
 on webp
Message-ID: <20190801145202.5A6998A4C5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=152e160bf6fcbb8f73c60944107e3a82f91edf50
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

new feature of version 3.9

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/netsurf/netsurf.mk | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/package/netsurf/netsurf.mk b/package/netsurf/netsurf.mk
index f82f3b5da8..0077adde28 100644
--- a/package/netsurf/netsurf.mk
+++ b/package/netsurf/netsurf.mk
@@ -64,11 +64,23 @@ define NETSURF_CURL_CONFIGURE_CMDS
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
