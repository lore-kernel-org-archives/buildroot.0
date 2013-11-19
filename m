From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 19 Nov 2013 10:26:30 -0300
Subject: [Buildroot] [PATCHv3] openssh: add systemd unit file
Message-ID: <1384867590-2815-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

And only install sysV-style script when appropiate.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/openssh/openssh.mk   | 13 +++++++++++--
 package/openssh/sshd.service | 11 +++++++++++
 2 files changed, 22 insertions(+), 2 deletions(-)
 create mode 100644 package/openssh/sshd.service

diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index 8ab2b47..8de288a 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -17,8 +17,17 @@ OPENSSH_DEPENDENCIES += linux-pam
 OPENSSH_CONF_OPT += --with-pam
 endif
 
-define OPENSSH_INSTALL_INITSCRIPT
-	$(INSTALL) -D -m 755 package/openssh/S50sshd $(TARGET_DIR)/etc/init.d/S50sshd
+define OPENSSH_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 755 package/openssh/sshd.service \
+		$(TARGET_DIR)/etc/systemd/system/sshd.service
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -fs ../sshd.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/sshd.service
+endef
+
+define OPENSSH_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 755 package/openssh/S50sshd \
+		$(TARGET_DIR)/etc/init.d/S50sshd
 endef
 
 OPENSSH_POST_INSTALL_TARGET_HOOKS += OPENSSH_INSTALL_INITSCRIPT
diff --git a/package/openssh/sshd.service b/package/openssh/sshd.service
new file mode 100644
index 0000000..b5e96b3
--- /dev/null
+++ b/package/openssh/sshd.service
@@ -0,0 +1,11 @@
+[Unit]
+Description=OpenSSH server daemon
+After=syslog.target network.target auditd.service
+
+[Service]
+ExecStartPre=/usr/bin/ssh-keygen -A
+ExecStart=/usr/sbin/sshd -D -e
+ExecReload=/bin/kill -HUP $MAINPID
+
+[Install]
+WantedBy=multi-user.target
-- 
1.8.3.2
