From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Fri,  3 Feb 2012 15:27:27 +0100
Subject: [Buildroot] [PATCH 5/5] Add the systemd units files to openssh
In-Reply-To: <1328279247-7277-1-git-send-email-maxime.ripard@free-electrons.com>
References: <1328279247-7277-1-git-send-email-maxime.ripard@free-electrons.com>
Message-ID: <1328279247-7277-6-git-send-email-maxime.ripard@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 package/openssh/openssh.mk    |   19 ++++++++++++++++---
 package/openssh/sshd.socket   |    9 +++++++++
 package/openssh/sshd at .service |    7 +++++++
 3 files changed, 32 insertions(+), 3 deletions(-)
 create mode 100644 package/openssh/sshd.socket
 create mode 100644 package/openssh/sshd at .service

diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index 08bb499..652e1d1 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -12,10 +12,23 @@ OPENSSH_CONF_OPT = --libexecdir=/usr/lib --disable-lastlog --disable-utmp \
 
 OPENSSH_DEPENDENCIES = zlib openssl
 
-define OPENSSH_INSTALL_INITSCRIPT
-	$(INSTALL) -D -m 755 package/openssh/S50sshd $(TARGET_DIR)/etc/init.d/S50sshd
+define OPENSSH_INSTALL_INIT_SYSV
+if [! -f $(TARGET_DIR)/etc/init.d/S50sshd ]; then \
+	$(INSTALL) -D -m 755 package/openssh/S50sshd $(TARGET_DIR)/etc/init.d/S50sshd; \
+fi;
 endef
 
-OPENSSH_POST_INSTALL_TARGET_HOOKS += OPENSSH_INSTALL_INITSCRIPT
+define OPENSSH_INSTALL_INIT_SYSTEMD
+[ -f $(TARGET_DIR)/etc/systemd/system/sshd.socket ] || \
+	$(INSTALL) -D -m 755 package/openssh/sshd.socket \
+		$(TARGET_DIR)/etc/systemd/system/sshd.socket
+
+[ -f $(TARGET_DIR)/etc/systemd/system/sshd at .service ] || \
+	$(INSTALL) -D -m 755 package/openssh/sshd at .service \
+		$(TARGET_DIR)/etc/systemd/system/sshd at .service
+
+mkdir -p $(TARGET_DIR)/etc/systemd/system/sockets.target.wants
+ln -fs ../sshd.socket $(TARGET_DIR)/etc/systemd/system/sockets.target.wants/sshd.socket
+endef
 
 $(eval $(call AUTOTARGETS))
diff --git a/package/openssh/sshd.socket b/package/openssh/sshd.socket
new file mode 100644
index 0000000..fd68407
--- /dev/null
+++ b/package/openssh/sshd.socket
@@ -0,0 +1,9 @@
+[Unit]
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
index 0000000..b81d471
--- /dev/null
+++ b/package/openssh/sshd at .service
@@ -0,0 +1,7 @@
+[Unit]
+Description=SSH Per-Connection Server
+After=syslog.target
+
+[Service]
+ExecStart=/usr/sbin/sshd -i
+StandardInput=socket
-- 
1.7.5.4
