From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 13 Nov 2015 22:48:48 +0100
Subject: [Buildroot] [PATCH 2/6] package/mysql: unconditionally define host
	variables
In-Reply-To: <cover.1447449754.git.yann.morin.1998@free.fr>
References: <cover.1447449754.git.yann.morin.1998@free.fr>
Message-ID: <70800f7df3d1c437d4368d764e26e0e87fa583f3.1447449754.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

To build the host-mysql, we only build parts of the source, just the
strictly minimum required to then cross-compile it.

However, the host variables (conf opts, build and install cmds) are only
defined when the mysql server is enabled in the configuration.

So, this breaks:
    make defconfig; make host-mysql

Even though it is not much use to have that partial host-mysql on its
own, it is still very interesting to be able to build it, if at least
for testing changes in the core package infrastructures (like new step
hooks or the likes...)

Move the definitions of the host variant out of the server conditional
block.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Marcelo Guti?rrez(UTN/FRH) <kuyurix@gmail.com>
---
 package/mysql/mysql.mk | 39 ++++++++++++++++++++-------------------
 1 file changed, 20 insertions(+), 19 deletions(-)

diff --git a/package/mysql/mysql.mk b/package/mysql/mysql.mk
index c6d9f3a..00fab85 100644
--- a/package/mysql/mysql.mk
+++ b/package/mysql/mysql.mk
@@ -33,6 +33,26 @@ MYSQL_CONF_OPTS = \
 	--enable-thread-safe-client \
 	--disable-mysql-maintainer-mode
 
+HOST_MYSQL_DEPENDENCIES = host-zlib host-ncurses
+
+HOST_MYSQL_CONF_OPTS = \
+	--with-embedded-server \
+	--disable-mysql-maintainer-mode
+
+define HOST_MYSQL_BUILD_CMDS
+	$(MAKE) -C $(@D)/include my_config.h
+	$(MAKE) -C $(@D)/mysys libmysys.a
+	$(MAKE) -C $(@D)/strings libmystrings.a
+	$(MAKE) -C $(@D)/vio libvio.a
+	$(MAKE) -C $(@D)/dbug libdbug.a
+	$(MAKE) -C $(@D)/regex libregex.a
+	$(MAKE) -C $(@D)/sql gen_lex_hash
+endef
+
+define HOST_MYSQL_INSTALL_CMDS
+	$(INSTALL) -m 0755  $(@D)/sql/gen_lex_hash $(HOST_DIR)/usr/bin/
+endef
+
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 MYSQL_DEPENDENCIES += openssl
 endif
@@ -43,11 +63,6 @@ endif
 
 ifeq ($(BR2_PACKAGE_MYSQL_SERVER),y)
 MYSQL_DEPENDENCIES += host-mysql host-bison
-HOST_MYSQL_DEPENDENCIES = host-zlib host-ncurses
-
-HOST_MYSQL_CONF_OPTS = \
-	--with-embedded-server \
-	--disable-mysql-maintainer-mode
 
 MYSQL_CONF_OPTS += \
 	--localstatedir=/var/mysql \
@@ -74,20 +89,6 @@ else
 MYSQL_CONF_OPTS += --without-debug
 endif
 
-define HOST_MYSQL_BUILD_CMDS
-	$(MAKE) -C $(@D)/include my_config.h
-	$(MAKE) -C $(@D)/mysys libmysys.a
-	$(MAKE) -C $(@D)/strings libmystrings.a
-	$(MAKE) -C $(@D)/vio libvio.a
-	$(MAKE) -C $(@D)/dbug libdbug.a
-	$(MAKE) -C $(@D)/regex libregex.a
-	$(MAKE) -C $(@D)/sql gen_lex_hash
-endef
-
-define HOST_MYSQL_INSTALL_CMDS
-	$(INSTALL) -m 0755  $(@D)/sql/gen_lex_hash  $(HOST_DIR)/usr/bin/
-endef
-
 define MYSQL_USERS
 	mysql -1 nogroup -1 * /var/mysql - - MySQL daemon
 endef
-- 
1.9.1
