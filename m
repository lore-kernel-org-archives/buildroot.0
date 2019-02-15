From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Fri, 15 Feb 2019 23:02:57 +0100
Subject: [Buildroot] [PATCH] package/openssh: adding a way to install only
 sftp-server
Message-ID: <20190215220257.12430-1-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds a way to install only sftp-server in case it is
needed by other packages (like dropbear) or a full openssh installation is
not needed.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/openssh/Config.in  |  9 +++++++++
 package/openssh/openssh.mk | 10 ++++++++++
 2 files changed, 19 insertions(+)

diff --git a/package/openssh/Config.in b/package/openssh/Config.in
index 683a9c0e51..ba0dc62f83 100644
--- a/package/openssh/Config.in
+++ b/package/openssh/Config.in
@@ -9,3 +9,12 @@ config BR2_PACKAGE_OPENSSH
 	  friends.
 
 	  http://www.openssh.com/
+
+if BR2_PACKAGE_OPENSSH
+
+config BR2_PACKAGE_OPENSSH_SFTP_ONLY
+	bool "install only sftp"
+	help
+	  Install only sftp binary (ex: dropbear sftp support)
+
+endif
diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index 4fef5caedb..bfd93845d9 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -88,4 +88,14 @@ endef
 
 OPENSSH_POST_INSTALL_TARGET_HOOKS += OPENSSH_INSTALL_SSH_COPY_ID
 
+ifeq ($(BR2_PACKAGE_OPENSSH_SFTP_ONLY),y)
+define OPENSSH_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 755 $(@D)/sftp-server \
+		$(TARGET_DIR)/usr/libexec/sftp-server
+endef
+undefine OPENSSH_INSTALL_INIT_SYSTEMD
+undefine OPENSSH_INSTALL_INIT_SYSV
+undefine OPENSSH_POST_INSTALL_TARGET_HOOKS
+endif
+
 $(eval $(autotools-package))
-- 
2.17.1
