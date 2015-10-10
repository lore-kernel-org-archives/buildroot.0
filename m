From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Oct 2015 19:31:25 +0200
Subject: [Buildroot] [git commit] vsftpd: Add ftp user creation
Message-ID: <20151010173637.D291E7F9BC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4e175f75e53d7b2a1df63a731eaf6617b54082d2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In order to remove '/home/ftp' and the ftp user from the 'skeleton'
package, we need to add the creation of the ftp users to the package so
it still work out of the box (with an anonymous user).

[Thomas:
 - remove the VSFTPD_FIX_HOME_PERMISSIONS variable, and simply put the
   additional command in VSFTPD_INSTALL_TARGET_CMDS.
 - slightly tweak the comment.]

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/vsftpd/vsftpd.mk |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/package/vsftpd/vsftpd.mk b/package/vsftpd/vsftpd.mk
index 1e48264..db969f4 100644
--- a/package/vsftpd/vsftpd.mk
+++ b/package/vsftpd/vsftpd.mk
@@ -43,16 +43,25 @@ define VSFTPD_BUILD_CMDS
 		LDFLAGS="$(TARGET_LDFLAGS)" LIBS="$(VSFTPD_LIBS)" -C $(@D)
 endef
 
+define VSFTPD_USERS
+	ftp -1 ftp -1 * /home/ftp - - Anonymous FTP User
+endef
+
 define VSFTPD_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 755 package/vsftpd/S70vsftpd $(TARGET_DIR)/etc/init.d/S70vsftpd
 endef
 
+# vsftpd won't work if the jail directory is writable, it has to be
+# readable only otherwise you get the following error:
+# 500 OOPS: vsftpd: refusing to run with writable root inside chroot()
+# That's why we have to adjust the permissions of /home/ftp
 define VSFTPD_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 755 $(@D)/vsftpd $(TARGET_DIR)/usr/sbin/vsftpd
 	test -f $(TARGET_DIR)/etc/vsftpd.conf || \
 		$(INSTALL) -D -m 644 $(@D)/vsftpd.conf \
 			$(TARGET_DIR)/etc/vsftpd.conf
 	$(INSTALL) -d -m 700 $(TARGET_DIR)/usr/share/empty
+	$(INSTALL) -d -m 555 $(TARGET_DIR)/home/ftp
 endef
 
 $(eval $(generic-package))
