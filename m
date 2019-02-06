From: Chris Lesiak <chris.lesiak@licor.com>
Date: Wed, 6 Feb 2019 16:36:39 +0000
Subject: [Buildroot] [PATCH v3] package/openssh: Add sysusers.d snippet
Message-ID: <20190206163629.30683-1-chris.lesiak@licor.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Whether using the new sysusers.d snippet, or adding an entry to
/etc/password, set the service's home directory to /var/empty.
See README.privsep included as part of the openssh distribution.

Signed-off-by: Chris Lesiak <chris.lesiak@licor.com>
---
Changes v2 -> v3:
  - Define OPENSSH_USERS or install snippet, but not both
  - Configure home directory to /var/empty
  - Rename snippet sshd-sysusers.conf
---
 package/openssh/openssh.mk         | 16 ++++++++++++----
 package/openssh/sshd-sysusers.conf |  1 +
 2 files changed, 13 insertions(+), 4 deletions(-)
 create mode 100644 package/openssh/sshd-sysusers.conf

diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index 4781cd3fbc..4fef5caedb 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -19,10 +19,6 @@ OPENSSH_CONF_OPTS = \
 	--disable-wtmpx \
 	--disable-strip
 
-define OPENSSH_USERS
-	sshd -1 sshd -1 * - - - SSH drop priv user
-endef
-
 define OPENSSH_PERMISSIONS
 	/var/empty d 755 root root - - - - -
 endef
@@ -61,12 +57,24 @@ else
 OPENSSH_CONF_OPTS += --without-selinux
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD_SYSUSERS),y)
+define OPENSSH_INSTALL_SYSTEMD_SYSUSERS
+	$(INSTALL) -m 0644 -D package/openssh/sshd-sysusers.conf \
+		$(TARGET_DIR)/usr/lib/sysusers.d/sshd.conf
+endef
+else
+define OPENSSH_USERS
+	sshd -1 sshd -1 * /var/empty - - SSH drop priv user
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
diff --git a/package/openssh/sshd-sysusers.conf b/package/openssh/sshd-sysusers.conf
new file mode 100644
index 0000000000..ac77aec065
--- /dev/null
+++ b/package/openssh/sshd-sysusers.conf
@@ -0,0 +1 @@
+u sshd - "SSH drop priv user" /var/empty
-- 
2.17.2
