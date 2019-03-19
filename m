From: Esben Haabendal <esben.haabendal@gmail.com>
Date: Tue, 19 Mar 2019 12:41:56 +0100
Subject: [Buildroot] [RFC] openssh: add option to allow login as root
Message-ID: <20190319114156.10696-1-esben.haabendal@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Esben Haabendal <esben@haabendal.dk>

What do you think. Is this kind of micro-management of a configuration
file something that I should keep out of tree?

/Esben
---
 package/openssh/Config.in  | 10 ++++++++++
 package/openssh/openssh.mk |  7 +++++++
 2 files changed, 17 insertions(+)

diff --git a/package/openssh/Config.in b/package/openssh/Config.in
index 683a9c0e5191..bc4f40efa3de 100644
--- a/package/openssh/Config.in
+++ b/package/openssh/Config.in
@@ -9,3 +9,13 @@ config BR2_PACKAGE_OPENSSH
 	  friends.
 
 	  http://www.openssh.com/
+
+if BR2_PACKAGE_OPENSSH
+
+config BR2_PACKAGE_OPENSSH_PERMIT_ROOT_LOGIN
+	bool "Allow SSH root login"
+	help
+	  Modify SSH server configuration to allow login as root.
+	  Warning: This might not be a good idea.  Use at own risk!
+
+endif
diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index 4fef5caedb01..8d1c153a8752 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -88,4 +88,11 @@ endef
 
 OPENSSH_POST_INSTALL_TARGET_HOOKS += OPENSSH_INSTALL_SSH_COPY_ID
 
+ifeq ($(BR2_PACKAGE_OPENSSH_PERMIT_ROOT_LOGIN),y)
+define OPENSSH_INSTALL_PERMIT_ROOT_LOGIN
+	$(SED) 's/\#PermitRootLogin prohibit-password/PermitRootLogin yes/' $(TARGET_DIR)/etc/ssh/sshd_config
+endef
+OPENSSH_POST_INSTALL_TARGET_HOOKS += OPENSSH_INSTALL_PERMIT_ROOT_LOGIN
+endif
+
 $(eval $(autotools-package))
-- 
2.21.0
