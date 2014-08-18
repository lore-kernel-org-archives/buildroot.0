From: Romain Naour <romain.naour@openwide.fr>
Date: Mon, 18 Aug 2014 23:35:42 +0200
Subject: [Buildroot] [PATCH 1/1] package/xmlstarlet: fix static linking
Message-ID: <1408397742-9051-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The static linking with libxml2 and lib(e)xslt (--enable-static-libs)
need to be enabled when BR2_PREFER_STATIC_LIB is set.

Fixes:
http://autobuild.buildroot.net/results/0fd/0fd4a65ab98a4cf3fe893c29628608a71e96ecbc/build-end.log

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/xmlstarlet/xmlstarlet.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/xmlstarlet/xmlstarlet.mk b/package/xmlstarlet/xmlstarlet.mk
index 16f736e..7a8451f 100644
--- a/package/xmlstarlet/xmlstarlet.mk
+++ b/package/xmlstarlet/xmlstarlet.mk
@@ -12,9 +12,15 @@ XMLSTARLET_LICENSE_FILES = COPYING
 XMLSTARLET_DEPENDENCIES += libxml2 libxslt \
 	$(if $(BR2_PACKAGE_LIBICONV),libiconv)
 
-XMLSTARLET_CONF_OPT += --disable-static-libs \
+XMLSTARLET_CONF_OPT += \
 	--with-libxml-prefix=${STAGING_DIR}/usr \
 	--with-libxslt-prefix=${STAGING_DIR}/usr \
 	--with-libiconv-prefix=${STAGING_DIR}/usr
 
+ifeq ($(BR2_PREFER_STATIC_LIB),y)
+XMLSTARLET_CONF_OPT += --enable-static-libs
+else
+XMLSTARLET_CONF_OPT += --disable-static-libs
+endif
+
 $(eval $(autotools-package))
-- 
1.9.3
