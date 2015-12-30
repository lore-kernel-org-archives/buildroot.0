From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 30 Dec 2015 13:51:04 -0300
Subject: [Buildroot] [PATCH] bind: disable libjson support
Message-ID: <1451494264-2399-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It conflicts with jsoncpp, bind probes for json/json.h first, but that
header is installed by jsoncpp, which is completely different from
json-c.
Since it's not clear who's correct here (there might be some other
json-c predecessor/version that installs there as well) and the same
functionality (stats channel) is provided by libxml2 as well, just
disable libjson support completely.

Fixes:
http://autobuild.buildroot.net/results/226/2262c9b46663ea7a45e128a5fd7ff30417c2c2a7/build-end.log
(indirectly, it was probing aboslute directories while searching for it)

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/bind/bind.mk | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 6dfcca8..ad2a90f 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -22,6 +22,7 @@ BIND_CONF_ENV = \
 	BUILD_CC="$(TARGET_CC)" \
 	BUILD_CFLAGS="$(TARGET_CFLAGS)"
 BIND_CONF_OPTS = \
+	--with-libjson=no \
 	--with-randomdev=/dev/urandom \
 	--enable-epoll \
 	--with-libtool \
@@ -36,13 +37,6 @@ else
 BIND_CONF_OPTS += --disable-linux-caps
 endif
 
-ifeq ($(BR2_PACKAGE_JSON_C),y)
-BIND_CONF_OPTS += --with-libjson=yes
-BIND_DEPENDENCIES += json-c
-else
-BIND_CONF_OPTS += --with-libjson=no
-endif
-
 ifeq ($(BR2_PACKAGE_LIBXML2),y)
 BIND_CONF_OPTS += --with-libxml2=$(STAGING_DIR)/usr --enable-newstats
 BIND_DEPENDENCIES += libxml2
-- 
2.4.10
