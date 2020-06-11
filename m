From: Norbert Lange <nolange79@gmail.com>
Date: Thu, 11 Jun 2020 11:14:05 +0200
Subject: [Buildroot] [PATCH v2 2/3] package/openssh: seperate sd service for
 host key generation
In-Reply-To: <20200611091407.12688-1-nolange79@gmail.com>
References: <20200611091407.12688-1-nolange79@gmail.com>
Message-ID: <20200611091407.12688-3-nolange79@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

split out generation of host keys into an optional service
that can easily be removed or deactivated.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
Reviewed-by: J?r?my ROSEN <jeremy.rosen@smile.fr>
---
 package/openssh/openssh.mk               |  5 +++--
 package/openssh/sshd-host-keygen.service | 23 +++++++++++++++++++++++
 package/openssh/sshd.service             |  1 -
 3 files changed, 26 insertions(+), 3 deletions(-)
 create mode 100644 package/openssh/sshd-host-keygen.service

diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index 3e0a85ae2e..1fcd957299 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -116,8 +116,9 @@ endef
 OPENSSH_POST_INSTALL_TARGET_HOOKS += OPENSSH_INSTALL_SERVER_PROGRAMS
 
 define OPENSSH_INSTALL_INIT_SYSTEMD
-	$(INSTALL) -D -m 644 package/openssh/sshd.service \
-		$(TARGET_DIR)/usr/lib/systemd/system/sshd.service
+	mkdir $(TARGET_DIR)/usr/lib/systemd/system
+	$(INSTALL) -m 644 package/openssh/sshd*.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/
 	$(OPENSSH_INSTALL_SYSTEMD_SYSUSERS)
 endef
 
diff --git a/package/openssh/sshd-host-keygen.service b/package/openssh/sshd-host-keygen.service
new file mode 100644
index 0000000000..2db1be16c4
--- /dev/null
+++ b/package/openssh/sshd-host-keygen.service
@@ -0,0 +1,23 @@
+[Unit]
+Description=SSH Key Generation
+Before=sshd.service
+
+ConditionPathExists=|!/etc/ssh/ssh_host_dsa_key
+ConditionPathExists=|!/etc/ssh/ssh_host_dsa_key.pub
+ConditionPathExists=|!/etc/ssh/ssh_host_ecdsa_key
+ConditionPathExists=|!/etc/ssh/ssh_host_ecdsa_key.pub
+ConditionPathExists=|!/etc/ssh/ssh_host_ed25519_key
+ConditionPathExists=|!/etc/ssh/ssh_host_ed25519_key.pub
+ConditionPathExists=|!/etc/ssh/ssh_host_rsa_key
+ConditionPathExists=|!/etc/ssh/ssh_host_rsa_key.pub
+
+[Service]
+ExecStart=/usr/bin/ssh-keygen -A
+Type=oneshot
+# systemd changed behaviour in v245 leading to various drawbacks,
+# seems like every one-shot service should use RemainAfterExit
+# https://github.com/systemd/systemd/issues/15091
+RemainAfterExit=yes
+
+[Install]
+WantedBy=sshd.service
diff --git a/package/openssh/sshd.service b/package/openssh/sshd.service
index 715bd3f7eb..797e249d8d 100644
--- a/package/openssh/sshd.service
+++ b/package/openssh/sshd.service
@@ -4,7 +4,6 @@ Documentation=man:sshd(8) man:sshd_config(5)
 After=network.target auditd.service
 
 [Service]
-ExecStartPre=/usr/bin/ssh-keygen -A
 ExecStartPre=/usr/sbin/sshd -t
 ExecStart=/usr/sbin/sshd -D
 ExecReload=/usr/sbin/sshd -t
-- 
2.26.2
