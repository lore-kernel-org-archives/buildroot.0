From: Romain Naour <romain.naour@gmail.com>
Date: Thu, 31 Aug 2017 00:40:10 +0200
Subject: [Buildroot] [PATCH] package/xmlstarlet: fix host build
Message-ID: <20170830224010.15658-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Provide the path to HOST_DIR for libxml, libxslt and libiconv like for
the target variant.

Fixes:
src/xml_C14N.c:12:31: erreur fatale?: libxml/xmlversion.h : No such file or directory
 #include <libxml/xmlversion.h>
                               ^
In file included from src/trans.c:4:0:
src/trans.h:32:30: erreur fatale?: libxml/xmlmemory.h : No such file or directory
 #include <libxml/xmlmemory.h>

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/xmlstarlet/xmlstarlet.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/xmlstarlet/xmlstarlet.mk b/package/xmlstarlet/xmlstarlet.mk
index 9920dcf..673eedb 100644
--- a/package/xmlstarlet/xmlstarlet.mk
+++ b/package/xmlstarlet/xmlstarlet.mk
@@ -26,5 +26,10 @@ endif
 
 HOST_XMLSTARLET_DEPENDENCIES += host-libxml2 host-libxslt
 
+HOST_XMLSTARLET_CONF_OPTS += \
+	--with-libxml-prefix=$(HOST_DIR)/usr \
+	--with-libxslt-prefix=$(HOST_DIR)/usr \
+	--with-libiconv-prefix=$(HOST_DIR)/usr
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.9.5
