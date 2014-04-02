From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed,  2 Apr 2014 21:46:46 +0200
Subject: [Buildroot] [PATCH v2 32/41] infozip: Add a host variant
In-Reply-To: <1396468015-1724-1-git-send-email-bernd.kuhls@t-online.de>
References: <1396468015-1724-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1396468015-1724-32-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>

Adding a host variant to the package infozip.
It will be used by XBMC.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/infozip/infozip.mk |   13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/package/infozip/infozip.mk b/package/infozip/infozip.mk
index 8e51224..9648b4f 100644
--- a/package/infozip/infozip.mk
+++ b/package/infozip/infozip.mk
@@ -26,4 +26,17 @@ define INFOZIP_INSTALL_TARGET_CMDS
 		prefix=$(TARGET_DIR)/usr
 endef
 
+define HOST_INFOZIP_BUILD_CMDS
+	$(MAKE) $(HOST_CONFIGURE_OPTS) -C $(@D) \
+		CFLAGS="$(HOST_CFLAGS) -I. -DUNIX" \
+		AS="$(HOST_CC) -c" \
+		-f unix/Makefile generic
+endef
+
+define HOST_INFOZIP_INSTALL_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) -f unix/Makefile install \
+		prefix=$(HOST_DIR)/usr
+endef
+
 $(eval $(generic-package))
+$(eval $(host-generic-package))
-- 
1.7.10.4
