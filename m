From: Adrian Perez de Castro <aperez@igalia.com>
Date: Mon, 18 Feb 2019 19:17:19 +0200
Subject: [Buildroot] [PATCH RFC/next 4/4] package/webkit: factor out check
 for woff2
In-Reply-To: <20190218171719.18721-1-aperez@igalia.com>
References: <20190218171719.18721-1-aperez@igalia.com>
Message-ID: <20190218171719.18721-5-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Usage of woff2 os configurable at build time for both wpewebkit
and webkitgtk.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/webkit/webkit.mk              | 7 +++++++
 package/webkit/webkitgtk/webkitgtk.mk | 5 ++---
 package/webkit/wpewebkit/wpewebkit.mk | 7 -------
 3 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/package/webkit/webkit.mk b/package/webkit/webkit.mk
index 96ca7a109d..8dda16854a 100644
--- a/package/webkit/webkit.mk
+++ b/package/webkit/webkit.mk
@@ -18,4 +18,11 @@ else
 WEBKIT_CONF_OPTS += -DENABLE_JIT=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_WOFF2),y)
+WEBKIT_CONF_OPTS += -DUSE_WOFF2=ON
+WEBKIT_DEPENDENCIES += woff2
+else
+WEBKIT_CONF_OPTS += -DUSE_WOFF2=OFF
+endif
+
 include $(sort $(wildcard package/webkit/*/*.mk))
diff --git a/package/webkit/webkitgtk/webkitgtk.mk b/package/webkit/webkitgtk/webkitgtk.mk
index fefb52eeaa..3009249762 100644
--- a/package/webkit/webkitgtk/webkitgtk.mk
+++ b/package/webkit/webkitgtk/webkitgtk.mk
@@ -13,7 +13,7 @@ WEBKITGTK_LICENSE_FILES = \
 	Source/WebCore/LICENSE-APPLE \
 	Source/WebCore/LICENSE-LGPL-2.1
 WEBKITGTK_DEPENDENCIES = $(WEBKIT_DEPENDENCIES) \
-	enchant libgtk3 libsecret woff2
+	enchant libgtk3 libsecret
 WEBKITGTK_CONF_OPTS = \
 	$(WEBKIT_CONF_OPTS)
 	-DENABLE_GEOLOCATION=OFF \
@@ -21,8 +21,7 @@ WEBKITGTK_CONF_OPTS = \
 	-DENABLE_SPELLCHECK=ON \
 	-DPORT=GTK \
 	-DUSE_LIBNOTIFY=OFF \
-	-DUSE_LIBHYPHEN=OFF \
-	-DUSE_WOFF2=ON
+	-DUSE_LIBHYPHEN=OFF
 
 ifeq ($(BR2_PACKAGE_WEBKITGTK_MULTIMEDIA),y)
 WEBKITGTK_CONF_OPTS += \
diff --git a/package/webkit/wpewebkit/wpewebkit.mk b/package/webkit/wpewebkit/wpewebkit.mk
index e36dadd359..b8f35e605c 100644
--- a/package/webkit/wpewebkit/wpewebkit.mk
+++ b/package/webkit/wpewebkit/wpewebkit.mk
@@ -43,11 +43,4 @@ else
 WPEWEBKIT_CONF_OPTS += -DENABLE_WEBDRIVER=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_WOFF2),y)
-WPEWEBKIT_CONF_OPTS += -DUSE_WOFF2=ON
-WPEWEBKIT_DEPENDENCIES += woff2
-else
-WPEWEBKIT_CONF_OPTS += -DUSE_WOFF2=OFF
-endif
-
 $(eval $(cmake-package))
-- 
2.20.1
