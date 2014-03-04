From: =?UTF-8?q?Marcelo=20Guti=C3=A9rrez?= <kuyurix@gmail.com>
Date: Tue,  4 Mar 2014 14:50:00 +0000
Subject: [Buildroot] [PATCH 1/4] mysql: fix missing directory
Message-ID: <1393944603-3104-1-git-send-email-kuyurix@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Marcelo Guti?rrez <kuyurix@gmail.com>
---
 package/mysql/mysql.mk |    7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/mysql/mysql.mk b/package/mysql/mysql.mk
index 95b30b7..eb3a70e 100644
--- a/package/mysql/mysql.mk
+++ b/package/mysql/mysql.mk
@@ -40,6 +40,7 @@ HOST_MYSQL_CONF_OPT = \
 	--with-embedded-server
 
 MYSQL_CONF_OPT += \
+	--localstatedir=/var/mysql \
 	--disable-dependency-tracking \
 	--with-atomic-ops=up \
 	--with-embedded-server \
@@ -78,6 +79,12 @@ define HOST_MYSQL_INSTALL_CMDS
 	$(INSTALL) -m 0755  $(@D)/sql/gen_lex_hash  $(HOST_DIR)/usr/bin/
 endef
 
+define MYSQL_ADD_FOLDER
+	$(INSTALL) -d $(TARGET_DIR)/var/mysql
+endef
+
+MYSQL_POST_INSTALL_TARGET_HOOKS += MYSQL_ADD_FOLDER
+
 else
 MYSQL_CONF_OPT += \
 	--without-server
-- 
1.7.10.4
