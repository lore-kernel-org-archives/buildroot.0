From: Heiko Stuebner <heiko@sntech.de>
Date: Fri, 12 Jun 2020 13:31:53 +0200
Subject: [Buildroot] [PATCH] package/libwebsockets: Add support for
 unix-domain-sockets
Message-ID: <20200612113153.3220089-1-heiko@sntech.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Martin Elshuber <martin.elshuber@theobroma-systems.com>

libwebsockets allows the usage of unix-domain-sockets since 2016,
so add an option to enable its usage.

Signed-off-by: Martin Elshuber <martin.elshuber@theobroma-systems.com>
Signed-off-by: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
---
 package/libwebsockets/Config.in        | 4 ++++
 package/libwebsockets/libwebsockets.mk | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/package/libwebsockets/Config.in b/package/libwebsockets/Config.in
index 2b350bf389..78a659fd35 100644
--- a/package/libwebsockets/Config.in
+++ b/package/libwebsockets/Config.in
@@ -8,3 +8,7 @@ config BR2_PACKAGE_LIBWEBSOCKETS
 	  in both directions.
 
 	  http://libwebsockets.org/
+
+config BR2_PACKAGE_LIBWEBSOCKETS_INCLUDE_UNIX_SOCK
+       bool "include support for unix-sockets"
+       depends on BR2_PACKAGE_LIBWEBSOCKETS
diff --git a/package/libwebsockets/libwebsockets.mk b/package/libwebsockets/libwebsockets.mk
index dedd03347d..3f6ab1408d 100644
--- a/package/libwebsockets/libwebsockets.mk
+++ b/package/libwebsockets/libwebsockets.mk
@@ -59,4 +59,8 @@ ifeq ($(BR2_SHARED_LIBS),y)
 LIBWEBSOCKETS_CONF_OPTS += -DLWS_WITH_STATIC=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_LIBWEBSOCKETS_INCLUDE_UNIX_SOCK),y)
+LIBWEBSOCKETS_CONF_OPTS += -DLWS_UNIX_SOCK=ON
+endif
+
 $(eval $(cmake-package))
-- 
2.26.2
