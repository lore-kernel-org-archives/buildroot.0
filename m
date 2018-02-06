From: Chris Lesiak <chris.lesiak@licor.com>
Date: Tue,  6 Feb 2018 10:21:02 -0600
Subject: [Buildroot] [PATCH v2] package/openssh: Add tmpfiles.d snippet to
 create /var/empty
Message-ID: <20180206162102.4322-1-chris.lesiak@licor.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is useful in volatile or stateless systems in which /var is empty.

Signed-off-by: Chris Lesiak <chris.lesiak@licor.com>
---
Changes v1 --> v2
  - Use 0755 as the permission of /var/empty as suggested by
    Samual Martin <s.martin49@gmail.com> and the README.privsep
    included with openssh-7.6p1.
---
 package/openssh/openssh.mk        | 2 ++
 package/openssh/ssh_tmpfiles.conf | 1 +
 2 files changed, 3 insertions(+)
 create mode 100644 package/openssh/ssh_tmpfiles.conf

diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index fc82300ab7..bb43b2edec 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -73,6 +73,8 @@ define OPENSSH_INSTALL_INIT_SYSTEMD
 	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
 	ln -fs ../../../../usr/lib/systemd/system/sshd.service \
 		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/sshd.service
+	$(INSTALL) -m 0644 -D package/openssh/ssh_tmpfiles.conf \
+		$(TARGET_DIR)/usr/lib/tmpfiles.d/ssh.conf
 	$(OPENSSH_INSTALL_SYSTEMD_SYSUSERS)
 endef
 
diff --git a/package/openssh/ssh_tmpfiles.conf b/package/openssh/ssh_tmpfiles.conf
new file mode 100644
index 0000000000..ca2a393542
--- /dev/null
+++ b/package/openssh/ssh_tmpfiles.conf
@@ -0,0 +1 @@
+d /var/empty 0755 root root
-- 
2.13.6
