From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 3 Mar 2014 23:32:16 +0100
Subject: [Buildroot] [git commit] mysql: fix debugging options
Message-ID: <20140303223229.64668903D5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ce3044ec1b68a65e41b030e120ae0213dc24cda8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The usual --{en,dis}able-debug passed by the infrastructure are not
recognised by mysql's ./configure, as it uses unusual options.

Also, debugging is only meaningful to the server, not the client.

Signed-off-by: Marcelo Gutierrez (UTN/FRH) <kuyurix@gmail.com>
[yann.morin.1998 at free.fr: actually add the options, move in server if-block]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mysql/mysql.mk |   11 +++++++++--
 1 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/package/mysql/mysql.mk b/package/mysql/mysql.mk
index 27afc9f..95b30b7 100644
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
 MYSQL_DEPENDENCIES += host-mysql host-bison
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
