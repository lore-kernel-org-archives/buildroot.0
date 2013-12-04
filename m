From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 4 Dec 2013 11:50:51 +0100
Subject: [Buildroot] [git commit] openssh: add systemd unit file
Message-ID: <20131204105202.5DBA79BEE0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c19308020bb8c7646dddb351f4070edc2dcbfe8f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And only install sysV-style script when appropiate.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openssh/openssh.mk   |   13 ++++++++++---
 package/openssh/sshd.service |   11 +++++++++++
 2 files changed, 21 insertions(+), 3 deletions(-)

diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index 8ab2b47..60b65af 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -17,10 +17,17 @@ OPENSSH_DEPENDENCIES += linux-pam
 OPENSSH_CONF_OPT += --with-pam
 endif
 
-define OPENSSH_INSTALL_INITSCRIPT
-	$(INSTALL) -D -m 755 package/openssh/S50sshd $(TARGET_DIR)/etc/init.d/S50sshd
+define OPENSSH_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 package/openssh/sshd.service \
+		$(TARGET_DIR)/etc/systemd/system/sshd.service
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -fs ../sshd.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/sshd.service
 endef
 
-OPENSSH_POST_INSTALL_TARGET_HOOKS += OPENSSH_INSTALL_INITSCRIPT
+define OPENSSH_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 755 package/openssh/S50sshd \
+		$(TARGET_DIR)/etc/init.d/S50sshd
+endef
 
 $(eval $(autotools-package))
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
