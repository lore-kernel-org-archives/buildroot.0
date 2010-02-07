From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Sun,  7 Feb 2010 19:07:54 +0100
Subject: [Buildroot] [PATCH 12/14] openssh: added empty login option
In-Reply-To: <1265566076-10628-1-git-send-email-llandwerlin@gmail.com>
References: <1265566076-10628-1-git-send-email-llandwerlin@gmail.com>
Message-ID: <1265566076-10628-13-git-send-email-llandwerlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Lionel Landwerlin <llandwerlin@gmail.com>

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
---
 package/openssh/Config.in  |    4 ++++
 package/openssh/openssh.mk |    8 ++++++++
 2 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/package/openssh/Config.in b/package/openssh/Config.in
index 0c3d993..fb5daf8 100644
--- a/package/openssh/Config.in
+++ b/package/openssh/Config.in
@@ -7,3 +7,7 @@ config BR2_PACKAGE_OPENSSH
 	  tools.  The standard 'ssh', 'sshd', 'scp', and friends.
 
 	  http://www.openssh.com/
+
+config BR2_PACKAGE_OPENSSH_EMPTY_PASSWORDS
+	bool "allow empty passwords"
+        depends on BR2_PACKAGE_OPENSSH
diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index 9a06d12..b499075 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -14,6 +14,14 @@ OPENSSH_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
 OPENSSH_DEPENDENCIES = zlib openssl
 
+define OPENSSH_CONFIG_EMPTY_PASSWORDS
+	$(SED) "s/^.*PermitEmptyPasswords.*/PermitEmptyPasswords yes/;" $(TARGET_DIR)/etc/sshd_config
+endef
+
+ifeq ($(BR2_PACKAGE_OPENSSH_EMPTY_PASSWORDS),y)
+OPENSSH_POST_INSTALL_TARGET_HOOKS += OPENSSH_CONFIG_EMPTY_PASSWORDS
+endif
+
 $(eval $(call AUTOTARGETS,package,openssh))
 
 $(OPENSSH_HOOK_POST_INSTALL):
-- 
1.6.6
