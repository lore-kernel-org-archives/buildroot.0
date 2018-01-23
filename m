From: Chris Lesiak <chris.lesiak@licor.com>
Date: Tue, 23 Jan 2018 17:22:21 -0600
Subject: [Buildroot] [PATCH] package/openssh: Add sysusers.d snippet
Message-ID: <20180123232221.6106-1-chris.lesiak@licor.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Chris Lesiak <chris.lesiak@licor.com>
---
 package/openssh/openssh.mk | 8 ++++++++
 package/openssh/sshd.conf  | 5 +++++
 2 files changed, 13 insertions(+)
 create mode 100644 package/openssh/sshd.conf

diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index 6b7ac22c19..fc82300ab7 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -60,12 +60,20 @@ else
 OPENSSH_CONF_OPTS += --without-selinux
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD_SYSUSERS),y)
+define OPENSSH_INSTALL_SYSTEMD_SYSUSERS
+	$(INSTALL) -m 0644 -D package/openssh/sshd.conf \
+		$(TARGET_DIR)/usr/lib/sysusers.d/sshd.conf
+endef
+endif
+
 define OPENSSH_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 644 package/openssh/sshd.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/sshd.service
 	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
 	ln -fs ../../../../usr/lib/systemd/system/sshd.service \
 		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/sshd.service
+	$(OPENSSH_INSTALL_SYSTEMD_SYSUSERS)
 endef
 
 define OPENSSH_INSTALL_INIT_SYSV
diff --git a/package/openssh/sshd.conf b/package/openssh/sshd.conf
new file mode 100644
index 0000000000..3ea46f65c6
--- /dev/null
+++ b/package/openssh/sshd.conf
@@ -0,0 +1,5 @@
+# sysusers.d snippet for creating the sshd system user automatically
+# at boot on systemd-based systems that ship with an unpopulated
+# /etc. See sysusers.d(5) for details.
+
+u sshd - "Privilege-separated SSH"
-- 
2.13.6
