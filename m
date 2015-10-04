From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun,  4 Oct 2015 15:31:34 +0200
Subject: [Buildroot] [PATCH 2/3] vsftpd: Add ftp user creation
In-Reply-To: <1443965495-12774-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1443965495-12774-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1443965495-12774-2-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In order to remove '/home/ftp' and the ftp user from the 'skeleton'
package, we need to add the creation of the ftp users to the package so
it still work out of the box (with an anonymous user).

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/vsftpd/vsftpd.mk | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/package/vsftpd/vsftpd.mk b/package/vsftpd/vsftpd.mk
index 1e48264..976d397 100644
--- a/package/vsftpd/vsftpd.mk
+++ b/package/vsftpd/vsftpd.mk
@@ -43,9 +43,22 @@ define VSFTPD_BUILD_CMDS
 		LDFLAGS="$(TARGET_LDFLAGS)" LIBS="$(VSFTPD_LIBS)" -C $(@D)
 endef
 
+define VSFTPD_USERS
+	ftp -1 ftp -1 * /home/ftp - - Anonymous FTP User
+endef
+
 define VSFTPD_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 755 package/vsftpd/S70vsftpd $(TARGET_DIR)/etc/init.d/S70vsftpd
 endef
+#
+# VSFTPD won't work if the jail directory is writable, it has to be readable
+# only
+# Otherwise you get the following error:
+# 500 OOPS: vsftpd: refusing to run with writable root inside chroot()
+# That's why we have to chmod /home/ftp
+define VSFTPD_FIX_HOME_PERMISSIONS
+	$(INSTALL) -d -m 555 $(TARGET_DIR)/home/ftp
+endef
 
 define VSFTPD_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 755 $(@D)/vsftpd $(TARGET_DIR)/usr/sbin/vsftpd
@@ -53,6 +66,7 @@ define VSFTPD_INSTALL_TARGET_CMDS
 		$(INSTALL) -D -m 644 $(@D)/vsftpd.conf \
 			$(TARGET_DIR)/etc/vsftpd.conf
 	$(INSTALL) -d -m 700 $(TARGET_DIR)/usr/share/empty
+	$(VSFTPD_FIX_HOME_PERMISSIONS)
 endef
 
 $(eval $(generic-package))
-- 
2.5.3
