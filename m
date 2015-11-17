From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 Nov 2015 09:58:50 +0100
Subject: [Buildroot] [git commit] package/mysql: unconditionally define host
	variables
Message-ID: <20151117091039.4366181801@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=292cc2a20ac839a7ec1c5931728d9caf7611977b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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

[Peter: add comment about what we build and why as suggested by Arnout]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Marcelo Guti??rrez(UTN/FRH) <kuyurix@gmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mysql/mysql.mk |   42 +++++++++++++++++++++++-------------------
 1 files changed, 23 insertions(+), 19 deletions(-)

diff --git a/package/mysql/mysql.mk b/package/mysql/mysql.mk
index c6d9f3a..1aad831 100644
--- a/package/mysql/mysql.mk
+++ b/package/mysql/mysql.mk
@@ -33,6 +33,29 @@ MYSQL_CONF_OPTS = \
 	--enable-thread-safe-client \
 	--disable-mysql-maintainer-mode
 
+# host-mysql only installs what is needed to build mysql, i.e. the
+# gen_lex_hash tool, and it only builds the parts that are needed to
+# create this tool
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
@@ -43,11 +66,6 @@ endif
 
 ifeq ($(BR2_PACKAGE_MYSQL_SERVER),y)
 MYSQL_DEPENDENCIES += host-mysql host-bison
-HOST_MYSQL_DEPENDENCIES = host-zlib host-ncurses
-
-HOST_MYSQL_CONF_OPTS = \
-	--with-embedded-server \
-	--disable-mysql-maintainer-mode
 
 MYSQL_CONF_OPTS += \
 	--localstatedir=/var/mysql \
@@ -74,20 +92,6 @@ else
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
