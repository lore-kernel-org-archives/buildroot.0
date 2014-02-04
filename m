From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue,  4 Feb 2014 16:41:59 +0100
Subject: [Buildroot] [PATCH 2/2] package/mysql: fix debugging options
In-Reply-To: <cover.1391528463.git.yann.morin.1998@free.fr>
References: <cover.1391528463.git.yann.morin.1998@free.fr>
Message-ID: <dc37044121be9bede48bd4fe75816f30c9051ee4.1391528463.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Marcelo Guti?rrez <kuyurix@gmail.com>

The usual --{en,dis}able-debug passed by the infrastructure are not
recognised by mysql's ./configure, as it uses unusual options.

Also, debugging is only meaningfull to the server, not the client.

Signed-off-by: Marcelo Guti?rrez <kuyurix@gmail.com>
[yann.morin.1998 at free.fr: actually add the options, move in server if-block]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
 package/mysql/mysql.mk | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/package/mysql/mysql.mk b/package/mysql/mysql.mk
index 9bcbf4f..29a2abd 100644
--- a/package/mysql/mysql.mk
+++ b/package/mysql/mysql.mk
@@ -30,8 +30,7 @@ MYSQL_CONF_OPT = \
 	--without-libedit \
 	--without-readline \
 	--with-low-memory \
-	--enable-thread-safe-client \
-	$(ENABLE_DEBUG)
+	--enable-thread-safe-client
 
 ifeq ($(BR2_PACKAGE_MYSQL_SERVER),y)
 MYSQL_DEPENDENCIES += host-mysql
@@ -57,6 +56,14 @@ MYSQL_CONF_OPT += \
 	--without-plugin-innodb_plugin \
 	--without-plugin-ndbcluster
 
+# Debugging is only available for the server, so no need for
+# this if-block outside of the server if-block
+ifeq ($(BR2_ENABLE_DEBUG),y)
+MYSQL_CONF_OPT += --with-debug=full
+else
+MYSQL_CONF_OPT += --without-debug
+endif
+
 define HOST_MYSQL_BUILD_CMDS
 	$(MAKE) -C $(@D)/include my_config.h
 	$(MAKE) -C $(@D)/mysys libmysys.a
-- 
1.8.1.2
