From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed,  7 Mar 2018 22:18:42 +0100
Subject: [Buildroot] [PATCH 1/1] jsoncpp: do not always build static library
Message-ID: <20180307211842.27111-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, static libray is always built as BUILD_STATIC_LIBS is ON by
default so correctly set BUILD_STATIC_LIBS and BUILD_SHARED_LIBS
depending on BR2_xxx_LIBS variables

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/jsoncpp/jsoncpp.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/jsoncpp/jsoncpp.mk b/package/jsoncpp/jsoncpp.mk
index 3a2ee087b3..eb471561f0 100644
--- a/package/jsoncpp/jsoncpp.mk
+++ b/package/jsoncpp/jsoncpp.mk
@@ -15,4 +15,12 @@ JSONCPP_CONF_OPTS += \
 	-DJSONCPP_WITH_TESTS=OFF \
 	-DJSONCPP_WITH_STRICT_ISO=OFF
 
+ifeq ($(BR2_STATIC_LIBS),y)
+JSONCPP_CONF_OPTS += -DBUILD_STATIC_LIBS=ON -DBUILD_SHARED_LIBS=OFF
+else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
+JSONCPP_CONF_OPTS += -DBUILD_STATIC_LIBS=ON -DBUILD_SHARED_LIBS=ON
+else ifeq ($(BR2_SHARED_LIBS),y)
+JSONCPP_CONF_OPTS += -DBUILD_STATIC_LIBS=OFF -DBUILD_SHARED_LIBS=ON
+endif
+
 $(eval $(cmake-package))
-- 
2.14.1
