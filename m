From: Norbert Lange <nolange79@gmail.com>
Date: Thu, 11 Jun 2020 11:14:06 +0200
Subject: [Buildroot] [PATCH v2 3/3] package/openssh: add sd socket-activated
 ssh daemon services
In-Reply-To: <20200611091407.12688-1-nolange79@gmail.com>
References: <20200611091407.12688-1-nolange79@gmail.com>
Message-ID: <20200611091407.12688-4-nolange79@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 package/openssh/openssh.mk               |  6 +++---
 package/openssh/sshd-host-keygen.service |  2 +-
 package/openssh/sshd.socket              | 11 +++++++++++
 package/openssh/sshd at .service            | 10 ++++++++++
 4 files changed, 25 insertions(+), 4 deletions(-)
 create mode 100644 package/openssh/sshd.socket
 create mode 100644 package/openssh/sshd at .service

diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index 1fcd957299..cbfe8f6f7d 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -116,9 +116,9 @@ endef
 OPENSSH_POST_INSTALL_TARGET_HOOKS += OPENSSH_INSTALL_SERVER_PROGRAMS
 
 define OPENSSH_INSTALL_INIT_SYSTEMD
-	mkdir $(TARGET_DIR)/usr/lib/systemd/system
-	$(INSTALL) -m 644 package/openssh/sshd*.service \
-		$(TARGET_DIR)/usr/lib/systemd/system/
+	mkdir -p $(TARGET_DIR)/usr/lib/systemd/system
+	$(INSTALL) -m 644 package/openssh/sshd*.service package/openssh/sshd.socket \
+		$(TARGET_DIR)/usr/lib/systemd/system/.
 	$(OPENSSH_INSTALL_SYSTEMD_SYSUSERS)
 endef
 
diff --git a/package/openssh/sshd-host-keygen.service b/package/openssh/sshd-host-keygen.service
index 2db1be16c4..0e071c9d8c 100644
--- a/package/openssh/sshd-host-keygen.service
+++ b/package/openssh/sshd-host-keygen.service
@@ -20,4 +20,4 @@ Type=oneshot
 RemainAfterExit=yes
 
 [Install]
-WantedBy=sshd.service
+WantedBy=sshd.service sshd.socket
diff --git a/package/openssh/sshd.socket b/package/openssh/sshd.socket
new file mode 100644
index 0000000000..bbae9ed7aa
--- /dev/null
+++ b/package/openssh/sshd.socket
@@ -0,0 +1,11 @@
+[Unit]
+Description=OpenBSD Secure Shell server socket
+Before=sshd.service
+Conflicts=sshd.service
+
+[Socket]
+ListenStream=22
+Accept=yes
+
+[Install]
+WantedBy=sockets.target
diff --git a/package/openssh/sshd at .service b/package/openssh/sshd at .service
new file mode 100644
index 0000000000..b3a590d9a3
--- /dev/null
+++ b/package/openssh/sshd at .service
@@ -0,0 +1,10 @@
+[Unit]
+Description=OpenBSD Secure Shell server per-connection daemon
+Documentation=man:sshd(8) man:sshd_config(5)
+After=auditd.service
+
+[Service]
+ExecStart=-/usr/sbin/sshd -i
+StandardInput=socket
+RuntimeDirectory=sshd
+RuntimeDirectoryMode=0755
-- 
2.26.2
