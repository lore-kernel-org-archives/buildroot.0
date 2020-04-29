From: Ramon Fried <rfried.dev@gmail.com>
Date: Wed, 29 Apr 2020 15:41:38 +0300
Subject: [Buildroot] [PATCH] package/openssh: Add option to populate keys on
 build
Message-ID: <20200429124138.180628-1-rfried.dev@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

During development phase and on targets with read-only
file systems, generating SSH keys on boot is not an option.

Add option to generate and populate SSH keys during build.

Signed-off-by: Ramon Fried <rfried.dev@gmail.com>
---
 package/openssh/Config.in  | 12 ++++++++++++
 package/openssh/openssh.mk | 11 +++++++++++
 2 files changed, 23 insertions(+)

diff --git a/package/openssh/Config.in b/package/openssh/Config.in
index 683a9c0e51..21bdd40435 100644
--- a/package/openssh/Config.in
+++ b/package/openssh/Config.in
@@ -9,3 +9,15 @@ config BR2_PACKAGE_OPENSSH
 	  friends.
 
 	  http://www.openssh.com/
+
+if BR2_PACKAGE_OPENSSH
+
+config BR2_PACKAGE_OPENSSH_POPULATE_KEYS
+	bool "Populate device keys"
+	help
+	  Populate the image with device keys instead
+		of generating them on each boot.
+		This option has security implications, and
+		should be only used in development or on target
+		with read-only root file-system.
+endif
diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index d50572128a..908eccf6cd 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -86,6 +86,17 @@ define OPENSSH_INSTALL_SSH_COPY_ID
 	$(INSTALL) -D -m 755 $(@D)/contrib/ssh-copy-id $(TARGET_DIR)/usr/bin/ssh-copy-id
 endef
 
+define OPENSSH_POPULATE_KEYS
+	ssh-keygen -q -f ${TARGET_DIR}/etc/ssh/ssh_host_rsa_key -N '' -t rsa
+	ssh-keygen -q -f ${TARGET_DIR}/etc/ssh/ssh_host_ecdsa_key -N '' -t ecdsa
+	ssh-keygen -q -f ${TARGET_DIR}/etc/ssh/ssh_host_dsa_key -N '' -t dsa
+	ssh-keygen -q -f ${TARGET_DIR}/etc/ssh/ssh_host_ed25519_key -N '' -t ed25519
+endef
+
+ifeq ($(BR2_PACKAGE_OPENSSH_POPULATE_KEYS),y)
+OPENSSH_POST_INSTALL_TARGET_HOOKS += OPENSSH_POPULATE_KEYS
+endif
+
 OPENSSH_POST_INSTALL_TARGET_HOOKS += OPENSSH_INSTALL_SSH_COPY_ID
 
 $(eval $(autotools-package))
-- 
2.26.2
