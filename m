From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Dec 2014 22:33:18 +0100
Subject: [Buildroot] [git commit] vsftpd: use <pkg>_INSTALL_INIT_SYSV and
	rename init script
Message-ID: <20141201221140.215148002F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6b1c75cbdc8ffe825c3954bb57bd14320d5cb693
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit changes the vsftpd package to use the
<pkg>_INSTALL_INIT_SYSV mechanism to install its init script, and
renames the init script in the Buildroot source tree to match how it's
named on the target.

Also, the init script is now installed unconditionally, as is done in
most packages.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/vsftpd/{vsftpd-init => S70vsftpd} |    0
 package/vsftpd/vsftpd.mk                  |    7 ++++---
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/vsftpd/vsftpd-init b/package/vsftpd/S70vsftpd
similarity index 100%
rename from package/vsftpd/vsftpd-init
rename to package/vsftpd/S70vsftpd
diff --git a/package/vsftpd/vsftpd.mk b/package/vsftpd/vsftpd.mk
index cab5afb..1c468ed 100644
--- a/package/vsftpd/vsftpd.mk
+++ b/package/vsftpd/vsftpd.mk
@@ -43,15 +43,16 @@ define VSFTPD_BUILD_CMDS
 		LDFLAGS="$(TARGET_LDFLAGS)" LIBS="$(VSFTPD_LIBS)" -C $(@D)
 endef
 
+define VSFTPD_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 755 package/vsftpd/S70vsftpd $(TARGET_DIR)/etc/init.d/S70vsftpd
+endef
+
 define VSFTPD_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 755 $(@D)/vsftpd $(TARGET_DIR)/usr/sbin/vsftpd
 	$(INSTALL) -D -m 644 $(@D)/vsftpd.8 \
 		$(TARGET_DIR)/usr/share/man/man8/vsftpd.8
 	$(INSTALL) -D -m 644 $(@D)/vsftpd.conf.5 \
 		$(TARGET_DIR)/usr/share/man/man5/vsftpd.conf.5
-	test -f $(TARGET_DIR)/etc/init.d/S70vsftpd || \
-		$(INSTALL) -D -m 755 package/vsftpd/vsftpd-init \
-			$(TARGET_DIR)/etc/init.d/S70vsftpd
 	test -f $(TARGET_DIR)/etc/vsftpd.conf || \
 		$(INSTALL) -D -m 644 $(@D)/vsftpd.conf \
 			$(TARGET_DIR)/etc/vsftpd.conf
