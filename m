From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Wed,  2 Apr 2014 00:24:38 +0200
Subject: [Buildroot] [PATCH 1/2] infozip: Add a host variant
Message-ID: <1396391079-28455-1-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adding a host variant to the package infozip.
It will be used by XBMC.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/infozip/infozip.mk | 13 +++++++++++++
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
1.9.1
