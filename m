From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 19 Feb 2019 08:31:01 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] package/openssh: Add
 sysusers.d snippet
Message-ID: <20190219073000.E998E8B6D6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8df0a10c51ed855ccda68a17594f5cedd3aa654c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Whether using the new sysusers.d snippet, or adding an entry to
/etc/password, set the service's home directory to /var/empty.
See README.privsep included as part of the openssh distribution.

Signed-off-by: Chris Lesiak <chris.lesiak@licor.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 9acbf811cd7028dba17a26ee23e8494b083b8cab)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openssh/openssh.mk         | 16 ++++++++++++----
 package/openssh/sshd-sysusers.conf |  1 +
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index 9175f9589d..cbf2e92920 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -18,10 +18,6 @@ OPENSSH_CONF_OPTS = \
 	--disable-wtmpx \
 	--disable-strip
 
-define OPENSSH_USERS
-	sshd -1 sshd -1 * - - - SSH drop priv user
-endef
-
 define OPENSSH_PERMISSIONS
 	/var/empty d 755 root root - - - - -
 endef
@@ -60,12 +56,24 @@ else
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
