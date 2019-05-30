From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 30 May 2019 14:01:38 +0200
Subject: [Buildroot] [PATCH/next v2 2/3] package/pugixml: enable install of
 pugixml.pc
In-Reply-To: <20190530120139.21740-1-bernd.kuhls@t-online.de>
References: <20190530120139.21740-1-bernd.kuhls@t-online.de>
Message-ID: <20190530120139.21740-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Needed for waylandpp >= 0.2.4 to detect pugixml:
https://github.com/NilsBrause/waylandpp/commit/0a61175003a0a34038e39092918768360d2dd1da#diff-af3b638bc2a3e6c650974192a53c7291R39

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: changed variables for HOST_PUGIXML_CONF_OPTS (Thomas)

 package/pugixml/pugixml.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/pugixml/pugixml.mk b/package/pugixml/pugixml.mk
index 6f214c4de8..368f958920 100644
--- a/package/pugixml/pugixml.mk
+++ b/package/pugixml/pugixml.mk
@@ -15,6 +15,7 @@ PUGIXML_INSTALL_STAGING = YES
 # force-enable this option to support older gcc versions. See also:
 # https://gcc.gnu.org/onlinedocs/gcc/Long-Long.html
 PUGIXML_BUILD_DEFINES += PUGIXML_HAS_LONG_LONG
+HOST_PUGIXML_BUILD_DEFINES += PUGIXML_HAS_LONG_LONG
 
 ifeq ($(BR2_PACKAGE_PUGIXML_XPATH_SUPPORT),)
 PUGIXML_BUILD_DEFINES += PUGIXML_NO_XPATH
@@ -30,5 +31,9 @@ ifdef PUGIXML_BUILD_DEFINES
 PUGIXML_CONF_OPTS += -DBUILD_DEFINES="$(subst $(space),;,$(PUGIXML_BUILD_DEFINES))"
 endif
 
+HOST_PUGIXML_CONF_OPTS += \
+	-DBUILD_PKGCONFIG=ON \
+	-DBUILD_DEFINES="$(subst $(space),;,$(HOST_PUGIXML_BUILD_DEFINES))"
+
 $(eval $(cmake-package))
 $(eval $(host-cmake-package))
-- 
2.20.1
