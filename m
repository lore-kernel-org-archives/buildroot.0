From: Adam Duskett <aduskett@gmail.com>
Date: Thu,  3 Aug 2017 21:05:31 -0400
Subject: [Buildroot] [PATCH 1/1] xmlstarlet: fix host package build errors.
Message-ID: <20170804010531.31789-1-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The host version of xmlstarlet doesn't have any conf opts.
As such, if the host PC doesn't have libxml header files installed,
a build error will occure because host-xmlstarlet won't be able to find
libxml/xmlstring.h: No such file or directory.

Add HOST_XMLSTARLET_CONF_OPTS to fix this issue.

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
---
 package/xmlstarlet/xmlstarlet.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/xmlstarlet/xmlstarlet.mk b/package/xmlstarlet/xmlstarlet.mk
index 9920dcfc7..54ed36bc8 100644
--- a/package/xmlstarlet/xmlstarlet.mk
+++ b/package/xmlstarlet/xmlstarlet.mk
@@ -17,6 +17,11 @@ XMLSTARLET_CONF_OPTS += \
 	--with-libxslt-prefix=$(STAGING_DIR)/usr \
 	--with-libiconv-prefix=$(STAGING_DIR)/usr
 
+HOST_XMLSTARLET_CONF_OPTS += \
+	--with-libxml-prefix=$(HOST_DIR)/usr \
+	--with-libxslt-prefix=$(HOST_DIR)/usr \
+	--with-libiconv-prefix=$(HOST_DIR)/usr
+
 ifeq ($(BR2_STATIC_LIBS),y)
 XMLSTARLET_CONF_OPTS += --enable-static-libs
 XMLSTARLET_CONF_ENV = LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs libxml-2.0 libexslt`"
-- 
2.13.3
