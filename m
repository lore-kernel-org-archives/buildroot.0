From: Gilad Ben-Yossef <gilad@benyossef.com>
Date: Tue, 18 Apr 2017 11:47:56 +0300
Subject: [Buildroot] [PATCH 1/1] openssh: add support for HW SSL engines
Message-ID: <1492505276-25285-1-git-send-email-gilad@benyossef.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add support for OpenSSH to use a hardware SSL engine if cryptodev-linux is
included.

Signed-off-by: Gilad Ben-Yossef <gilad@benyossef.com>
---
 package/openssh/openssh.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index f971e99..4a6c516 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -28,6 +28,11 @@ endif
 
 OPENSSH_DEPENDENCIES = zlib openssl
 
+ifeq ($(BR2_PACKAGE_CRYPTODEV_LINUX), y)
+OPENSSH_DEPENDENCIES += cryptodev-linux
+OPENSSH_CONF_OPTS += --with-ssl-engine
+endif
+
 ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
 define OPENSSH_INSTALL_PAM_CONF
 	$(INSTALL) -D -m 644 $(@D)/contrib/sshd.pam.generic $(TARGET_DIR)/etc/pam.d/sshd
-- 
2.1.4
