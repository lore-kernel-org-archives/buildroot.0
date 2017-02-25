From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 25 Feb 2017 15:31:23 +0100
Subject: [Buildroot] [PATCH] package/oracle-mysql: fix path to systemd
	service file
Message-ID: <1488033083-7295-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The path is a remnant from before the rename of the package.

Rather than hard-code the path, use the available variable. Also use
that variable when copying the Sys-V init script.

Fixes:
    http://autobuild.buildroot.org/results/767/767f0be3894c45c1e6d18bc4528d0da7b50e3757/
    http://autobuild.buildroot.org/results/e93/e934683ebcb33c9cc8fe9de7b1d5dcd7866f3bce/
    http://autobuild.buildroot.org/results/5d0/5d04163de80f7900d4aed14cff75b2e0761f101d/

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Ryan Coe <bluemrp9@gmail.com>
---
 package/oracle-mysql/oracle-mysql.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/oracle-mysql/oracle-mysql.mk b/package/oracle-mysql/oracle-mysql.mk
index ed3c0ea..f0f0649 100644
--- a/package/oracle-mysql/oracle-mysql.mk
+++ b/package/oracle-mysql/oracle-mysql.mk
@@ -108,12 +108,12 @@ endef
 ORACLE_MYSQL_POST_INSTALL_TARGET_HOOKS += ORACLE_MYSQL_ADD_FOLDER
 
 define ORACLE_MYSQL_INSTALL_INIT_SYSV
-	$(INSTALL) -D -m 0755 package/oracle-mysql/S97mysqld \
+	$(INSTALL) -D -m 0755 $(ORACLE_MYSQL_PKGDIR)/S97mysqld \
 		$(TARGET_DIR)/etc/init.d/S97mysqld
 endef
 
 define ORACLE_MYSQL_INSTALL_INIT_SYSTEMD
-	$(INSTALL) -D -m 644 package/mysql/mysqld.service \
+	$(INSTALL) -D -m 644 $(ORACLE_MYSQL_PKGDIR)/mysqld.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/mysqld.service
 	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
 	ln -sf ../../../../usr/lib/systemd/system/mysqld.service \
-- 
2.7.4
