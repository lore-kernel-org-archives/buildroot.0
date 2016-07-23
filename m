From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 23 Jul 2016 11:56:44 -0300
Subject: [Buildroot] [PATCH] lighttpd: webdav locks require libuuid
Message-ID: <1469285804-3153-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since 1.4.40 webdav locks require libuuid from util-linux, so make it an
automatic dependency. Fixes:
http://autobuild.buildroot.net/results/b14/b14484300b4acfcaa18593b097167cef14330898/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/lighttpd/lighttpd.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index 4a92a68..29d8634 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -46,7 +46,13 @@ endif
 
 ifeq ($(BR2_PACKAGE_LIGHTTPD_WEBDAV),y)
 LIGHTTPD_DEPENDENCIES += libxml2 sqlite
-LIGHTTPD_CONF_OPTS += --with-webdav-props --with-webdav-locks
+LIGHTTPD_CONF_OPTS += --with-webdav-props
+ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBUUID),y)
+LIGHTTPD_CONF_OPTS += --with-webdav-locks
+LIGHTTPD_DEPENDENCIES += util-linux
+else
+LIGHTTPD_CONF_OPTS += --without-webdav-locks
+endif
 else
 LIGHTTPD_CONF_OPTS += --without-webdav-props --without-webdav-locks
 endif
-- 
2.7.3
