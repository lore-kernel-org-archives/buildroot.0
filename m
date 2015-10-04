From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun,  4 Oct 2015 15:31:33 +0200
Subject: [Buildroot] [PATCH 1/3] proftpd: Add ftp user creation
Message-ID: <1443965495-12774-1-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In order to remove '/home/ftp' and the ftp user from the 'skeleton'
package, we need to add the creation of the ftp users to the package so
it still work out of the box (with an anonymous user).

Signed-off-by Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/proftpd/proftpd.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/proftpd/proftpd.mk b/package/proftpd/proftpd.mk
index dec243d..d040b8c 100644
--- a/package/proftpd/proftpd.mk
+++ b/package/proftpd/proftpd.mk
@@ -51,6 +51,10 @@ define PROFTPD_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0644 -D $(@D)/sample-configurations/basic.conf $(TARGET_DIR)/etc/proftpd.conf
 endef
 
+define PROFTPD_USERS
+	ftp -1 ftp -1 * /home/ftp - - Anonymous FTP User
+endef
+
 define PROFTPD_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 0755 package/proftpd/S50proftpd $(TARGET_DIR)/etc/init.d/S50proftpd
 endef
-- 
2.5.3
