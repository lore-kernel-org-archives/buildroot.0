From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 9 May 2020 22:05:46 +0200
Subject: [Buildroot] [git commit branch/next] package/openssh: allow
 separate selection of client, server, keyutils
Message-ID: <20200509195010.B0A1B91210@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f37a5438affc0207cd44d93708cf2f424eee7eac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The openssh package comprises three separate entities: the SSH client, SSH
server, and some SSH key utilities. One may want the client but not the
server, the server but not the client, or maybe only the key utilities.

Add separate options for each entity and update the files installed on
target accordingly.

On an ARM Cortex-A53 configuration, size of stripped binaries are:

Client programs: 2213118 bytes (2161 KB)
usr/bin/ssh,657180
usr/bin/scp,99836
usr/bin/ssh-add,312800
usr/bin/ssh-agent,296428
usr/libexec/ssh-keysign,398908
usr/libexec/ssh-pkcs11-helper,292316
usr/bin/sftp,144992
usr/bin/ssh-copy-id,10658

Server programs: 806840 bytes (787 KB)
usr/libexec/sftp-server,112140
usr/sbin/sshd,694168
etc/init.d/S50sshd,532

Key utilities: 789648 bytes (771 KB)
usr/bin/ssh-keygen,398924
usr/bin/ssh-keyscan,390724

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/openssh/Config.in  | 23 +++++++++++++++++++++++
 package/openssh/openssh.mk | 36 ++++++++++++++++++++++++++++++++----
 2 files changed, 55 insertions(+), 4 deletions(-)

diff --git a/package/openssh/Config.in b/package/openssh/Config.in
index 683a9c0e51..cc5998742e 100644
--- a/package/openssh/Config.in
+++ b/package/openssh/Config.in
@@ -9,3 +9,26 @@ config BR2_PACKAGE_OPENSSH
 	  friends.
 
 	  http://www.openssh.com/
+
+if BR2_PACKAGE_OPENSSH
+
+config BR2_PACKAGE_OPENSSH_CLIENT
+	bool "client"
+	default y
+	help
+	  Client programs: ssh, scp, sftp, ssh-agent, ssh-add,
+	  ssh-copy-id.
+
+config BR2_PACKAGE_OPENSSH_SERVER
+	bool "server"
+	default y
+	help
+	  Server programs: sshd, sftp-server
+
+config BR2_PACKAGE_OPENSSH_KEY_UTILS
+	bool "key utilities"
+	default y
+	help
+	  Key utilities: ssh-keygen, ssh-keyscan.
+
+endif
diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index d50572128a..2b9027818d 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -71,6 +71,31 @@ define OPENSSH_USERS
 endef
 endif
 
+# Let the default install rule only install the configuration file.
+# The programs will be installed based on the config options selected.
+OPENSSH_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) install-sysconf
+
+ifeq ($(BR2_PACKAGE_OPENSSH_CLIENT),y)
+define OPENSSH_INSTALL_CLIENT_PROGRAMS
+	$(INSTALL) -D -m 0755 $(@D)/ssh $(TARGET_DIR)/usr/bin/ssh
+	$(INSTALL) -D -m 0755 $(@D)/scp $(TARGET_DIR)/usr/bin/scp
+	$(INSTALL) -D -m 0755 $(@D)/sftp $(TARGET_DIR)/usr/bin/sftp
+	$(INSTALL) -D -m 0755 $(@D)/ssh-agent $(TARGET_DIR)/usr/bin/ssh-agent
+	$(INSTALL) -D -m 0755 $(@D)/ssh-add $(TARGET_DIR)/usr/bin/ssh-add
+	$(INSTALL) -D -m 4711 $(@D)/ssh-keysign $(TARGET_DIR)/usr/libexec/ssh-keysign
+	$(INSTALL) -D -m 0755 $(@D)/ssh-pkcs11-helper $(TARGET_DIR)/usr/libexec/ssh-pkcs11-helper
+	$(INSTALL) -D -m 0755 $(@D)/contrib/ssh-copy-id $(TARGET_DIR)/usr/bin/ssh-copy-id
+endef
+OPENSSH_POST_INSTALL_TARGET_HOOKS += OPENSSH_INSTALL_CLIENT_PROGRAMS
+endif
+
+ifeq ($(BR2_PACKAGE_OPENSSH_SERVER),y)
+define OPENSSH_INSTALL_SERVER_PROGRAMS
+	$(INSTALL) -D -m 0755 $(@D)/sshd $(TARGET_DIR)/usr/sbin/sshd
+	$(INSTALL) -D -m 0755 $(@D)/sftp-server $(TARGET_DIR)/usr/libexec/sftp-server
+endef
+OPENSSH_POST_INSTALL_TARGET_HOOKS += OPENSSH_INSTALL_SERVER_PROGRAMS
+
 define OPENSSH_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 644 package/openssh/sshd.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/sshd.service
@@ -81,11 +106,14 @@ define OPENSSH_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 755 package/openssh/S50sshd \
 		$(TARGET_DIR)/etc/init.d/S50sshd
 endef
+endif
 
-define OPENSSH_INSTALL_SSH_COPY_ID
-	$(INSTALL) -D -m 755 $(@D)/contrib/ssh-copy-id $(TARGET_DIR)/usr/bin/ssh-copy-id
+ifeq ($(BR2_PACKAGE_OPENSSH_KEY_UTILS),y)
+define OPENSSH_INSTALL_KEY_UTILS
+	$(INSTALL) -D -m 0755 $(@D)/ssh-keygen $(TARGET_DIR)/usr/bin/ssh-keygen
+	$(INSTALL) -D -m 0755 $(@D)/ssh-keyscan $(TARGET_DIR)/usr/bin/ssh-keyscan
 endef
-
-OPENSSH_POST_INSTALL_TARGET_HOOKS += OPENSSH_INSTALL_SSH_COPY_ID
+OPENSSH_POST_INSTALL_TARGET_HOOKS += OPENSSH_INSTALL_KEY_UTILS
+endif
 
 $(eval $(autotools-package))
