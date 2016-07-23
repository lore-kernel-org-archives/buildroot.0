From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 23 Jul 2016 17:02:52 +0200
Subject: [Buildroot] [git commit] lighttpd: webdav locks require libuuid
Message-ID: <20160723150304.4A5E4817EE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a9b6c76560042cc99a545aa88dbecd25823728d4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since 1.4.40 webdav locks require libuuid from util-linux, so make it an
automatic dependency. Fixes:
http://autobuild.buildroot.net/results/b14/b14484300b4acfcaa18593b097167cef14330898/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
