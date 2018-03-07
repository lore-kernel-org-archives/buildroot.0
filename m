From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed,  7 Mar 2018 22:47:03 +0100
Subject: [Buildroot] [PATCH v2,
 1/1] jsoncpp: do not always build static library
Message-ID: <20180307214703.15105-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, static libray is always built as BUILD_STATIC_LIBS is ON by
default so correctly set BUILD_STATIC_LIBS depending on BR2_SHARED_LIBS
variable

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Thomas Petazzoni):
 - Only set BUILD_STATIC_LIBS and not BUILD_SHARED_LIBS as it is already
set by the build system

 package/jsoncpp/jsoncpp.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/jsoncpp/jsoncpp.mk b/package/jsoncpp/jsoncpp.mk
index 3a2ee087b3..2b527fc303 100644
--- a/package/jsoncpp/jsoncpp.mk
+++ b/package/jsoncpp/jsoncpp.mk
@@ -15,4 +15,10 @@ JSONCPP_CONF_OPTS += \
 	-DJSONCPP_WITH_TESTS=OFF \
 	-DJSONCPP_WITH_STRICT_ISO=OFF
 
+ifeq ($(BR2_SHARED_LIBS),y)
+JSONCPP_CONF_OPTS += -DBUILD_STATIC_LIBS=OFF
+else
+JSONCPP_CONF_OPTS += -DBUILD_STATIC_LIBS=ON
+endif
+
 $(eval $(cmake-package))
-- 
2.14.1
