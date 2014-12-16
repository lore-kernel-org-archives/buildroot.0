From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 15 Dec 2014 21:54:17 -0600
Subject: [Buildroot] [PATCH 25/30] openssh: selinux and pam support
In-Reply-To: <1418702062-61039-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1418702062-61039-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1418702062-61039-26-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
---
 package/openssh/openssh.mk | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index d08b468..2488e59 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -23,9 +23,21 @@ endif
 
 OPENSSH_DEPENDENCIES = zlib openssl
 
+define OPENSSH_INSTALL_PAM_CONF
+	$(INSTALL) -D -m 644 $(@D)/contrib/sshd.pam.generic $(TARGET_DIR)/etc/pam.d/sshd
+	sed -i '/password   required     \/lib\/security\/pam_cracklib.so/d' $(TARGET_DIR)/etc/pam.d/sshd
+	sed -i -e 's/\#UsePAM no/UsePAM yes/' $(TARGET_DIR)/etc/ssh/sshd_config
+endef
+
 ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
 OPENSSH_DEPENDENCIES += linux-pam
 OPENSSH_CONF_OPTS += --with-pam
+OPENSSH_POST_INSTALL_TARGET_HOOKS += OPENSSH_INSTALL_PAM_CONF
+endif
+
+ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
+OPENSSH_DEPENDENCIES += libselinux
+OPENSSH_CONF_OPTS += --with-selinux
 endif
 
 define OPENSSH_INSTALL_INIT_SYSTEMD
-- 
1.9.1
