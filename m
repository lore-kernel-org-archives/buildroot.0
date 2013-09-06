From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Thu, 5 Sep 2013 20:04:20 -0500
Subject: [Buildroot] [PATCH 06/10] openssh: add support for SELinux
In-Reply-To: <1378429464-12546-1-git-send-email-rjbarnet@rockwellcollins.com>
References: <1378429464-12546-1-git-send-email-rjbarnet@rockwellcollins.com>
Message-ID: <1378429464-12546-7-git-send-email-rjbarnet@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adding configuration options for SELinux along with install
configuration of Linux-PAM for SSHd when the linux-pam packages is
selected

Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
---
 package/openssh/openssh.mk |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index 4a5b125..6324ef8 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -12,9 +12,21 @@ OPENSSH_CONF_OPT = --disable-lastlog --disable-utmp \
 
 OPENSSH_DEPENDENCIES = zlib openssl
 
+define OPENSSH_INSTALL_PAM_CONF
+	$(INSTALL) -D -m 644 $(@D)/contrib/sshd.pam.generic $(TARGET_DIR)/etc/pam.d/sshd
+	sed -i '/password   required     \/lib\/security\/pam_cracklib.so/d' $(TARGET_DIR)/etc/pam.d/sshd
+	sed -i -e 's/\#UsePAM no/UsePAM yes/' $(TARGET_DIR)/etc/sshd_config
+endef
+
 ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
 OPENSSH_DEPENDENCIES += linux-pam
 OPENSSH_CONF_OPT += --with-pam
+OPENSSH_POST_INSTALL_TARGET_HOOKS += OPENSSH_INSTALL_PAM_CONF
+endif
+
+ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
+OPENSSH_DEPENDENCIES += libselinux
+OPENSSH_CONF_OPT += --with-selinux
 endif
 
 define OPENSSH_INSTALL_INITSCRIPT
-- 
1.7.1
