From: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
Date: Fri, 10 Jul 2015 18:27:55 -0500
Subject: [Buildroot] [PATCH v8 09/16] openssh: selinux and pam support
In-Reply-To: <1436570882-56442-1-git-send-email-clayton.shotwell@rockwellcollins.com>
References: <1436570882-56442-1-git-send-email-clayton.shotwell@rockwellcollins.com>
Message-ID: <1436570882-56442-10-git-send-email-clayton.shotwell@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Matt Weber <matthew.weber@rockwellcollins.com>

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>

---
Changes v7 -> v8:
  - Fixed sed calls to use macro (Suggested by Samuel)

Changes v6 -> v7:
  - No changes

Changes v5 -> v6:
  - No changes

Changes v4 -> v5:
  - New patch
  - Added without assignments (Matt W.)
  - Moved install pam define in conditional (Matt W.)
---
 package/openssh/openssh.mk | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index 11a844e..a4f4c94 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -30,8 +30,24 @@ endif
 OPENSSH_DEPENDENCIES = zlib openssl
 
 ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
+define OPENSSH_INSTALL_PAM_CONF
+	$(INSTALL) -D -m 644 $(@D)/contrib/sshd.pam.generic $(TARGET_DIR)/etc/pam.d/sshd
+	$(SED) '/password   required     \/lib\/security\/pam_cracklib.so/d' $(TARGET_DIR)/etc/pam.d/sshd
+	$(SED) 's/\#UsePAM no/UsePAM yes/' $(TARGET_DIR)/etc/ssh/sshd_config
+endef
+
 OPENSSH_DEPENDENCIES += linux-pam
 OPENSSH_CONF_OPTS += --with-pam
+OPENSSH_POST_INSTALL_TARGET_HOOKS += OPENSSH_INSTALL_PAM_CONF
+else
+OPENSSH_CONF_OPTS += --without-pam
+endif
+
+ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
+OPENSSH_DEPENDENCIES += libselinux
+OPENSSH_CONF_OPTS += --with-selinux
+else
+OPENSSH_CONF_OPTS += --without-selinux
 endif
 
 define OPENSSH_INSTALL_INIT_SYSTEMD
-- 
1.9.1
