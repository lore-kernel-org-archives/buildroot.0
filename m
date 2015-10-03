From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sat,  3 Oct 2015 21:29:09 +0200
Subject: [Buildroot] [PATCH 2/2] nfs-utils: systemd support
In-Reply-To: <1443900549-9696-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1443900549-9696-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1443900549-9696-2-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Aur?lien Chabot <aurelien@chabot.fr>

nfs-utils has been patched to install only the needed systemd unit files
supported.
Also tmpfiles was needed because the folder /run/nfs is a tmpfs
and nfs-utils need some files to be there to work correctly.

Signed-off-by: Aur?lien Chabot <aurelien@chabot.fr>
[Maxime: Remove patches included originally in the patch as they have
have been merged upstream in v1.3.3]
Signed-off-by Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
v1 -> v2:
    - Remove the added patch since the previous patch bump nfs_utils
      which have them already in the tree.
---
 package/nfs-utils/nfs-utils.mk            | 27 +++++++++++++++++++++++++++
 package/nfs-utils/nfs-utils_env.sh        |  1 +
 package/nfs-utils/nfs-utils_tmpfiles.conf |  4 ++++
 3 files changed, 32 insertions(+)
 create mode 100755 package/nfs-utils/nfs-utils_env.sh
 create mode 100644 package/nfs-utils/nfs-utils_tmpfiles.conf

diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
index 8c06d8e..ccc73c5 100644
--- a/package/nfs-utils/nfs-utils.mk
+++ b/package/nfs-utils/nfs-utils.mk
@@ -41,11 +41,38 @@ define NFS_UTILS_INSTALL_FIXUP
 endef
 NFS_UTILS_POST_INSTALL_TARGET_HOOKS += NFS_UTILS_INSTALL_FIXUP
 
+ifeq ($(BR2_INIT_SYSTEMD),y)
+	NFS_UTILS_CONF_OPTS += --with-systemd=/usr/lib/systemd/system
+	NFS_UTILS_DEPENDENCIES += systemd
+else
+	NFS_UTILS_CONF_OPTS += --without-systemd
+endif
+
 define NFS_UTILS_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 0755 package/nfs-utils/S60nfs \
 		$(TARGET_DIR)/etc/init.d/S60nfs
 endef
 
+define NFS_UTILS_INSTALL_INIT_SYSTEMD
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+
+	ln -fs ../../../../usr/lib/systemd/system/nfs-server.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/nfs-server.service
+	ln -fs ../../../../usr/lib/systemd/system/nfs-client.target \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/nfs-client.target
+
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/remote-fs.target.wants
+
+	ln -fs ../../../../usr/lib/systemd/system/nfs-client.target \
+		$(TARGET_DIR)/etc/systemd/system/remote-fs.target.wants/nfs-client.target
+
+	$(INSTALL) -D -m 0755 package/nfs-utils/nfs-utils_env.sh \
+		$(TARGET_DIR)/usr/lib/systemd/scripts/nfs-utils_env.sh
+
+	$(INSTALL) -D -m 0644 package/nfs-utils/nfs-utils_tmpfiles.conf \
+		$(TARGET_DIR)/usr/lib/tmpfiles.d/nfs-utils.conf
+endef
+
 define NFS_UTILS_REMOVE_NFSIOSTAT
 	rm -f $(TARGET_DIR)/usr/sbin/nfsiostat
 endef
diff --git a/package/nfs-utils/nfs-utils_env.sh b/package/nfs-utils/nfs-utils_env.sh
new file mode 100755
index 0000000..1a24852
--- /dev/null
+++ b/package/nfs-utils/nfs-utils_env.sh
@@ -0,0 +1 @@
+#!/bin/sh
diff --git a/package/nfs-utils/nfs-utils_tmpfiles.conf b/package/nfs-utils/nfs-utils_tmpfiles.conf
new file mode 100644
index 0000000..f87939f
--- /dev/null
+++ b/package/nfs-utils/nfs-utils_tmpfiles.conf
@@ -0,0 +1,4 @@
+d /run/nfs/sm 0700 root root -
+d /run/nfs/sm.bak 0700 root root -
+f /run/nfs/rmtab 0644 root root -
+f /run/nfs/etab 0644 root root -
-- 
2.5.3
