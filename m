From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Oct 2015 17:49:00 +0100
Subject: [Buildroot] [git commit] nfs-utils: systemd support
Message-ID: <20151004164905.D56528082B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9b19438c2c0a89fe4da757571604a7ca2fe0663b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

nfs-utils has been patched to install only the needed systemd unit files
supported.
Also tmpfiles was needed because the folder /run/nfs is a tmpfs
and nfs-utils need some files to be there to work correctly.

Signed-off-by: Aur??lien Chabot <aurelien@chabot.fr>
[Maxime: Remove patches included originally in the patch as they have
have been merged upstream in v1.3.3]
Signed-off-by Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
[Thomas:
  - add comment in nfs-utils_env.sh to explain why an empty script is
    needed.
  - remove incorrect indentation.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/nfs-utils/nfs-utils.mk            |   27 +++++++++++++++++++++++++++
 package/nfs-utils/nfs-utils_env.sh        |    3 +++
 package/nfs-utils/nfs-utils_tmpfiles.conf |    4 ++++
 3 files changed, 34 insertions(+), 0 deletions(-)

diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
index 8c06d8e..30f12fd 100644
--- a/package/nfs-utils/nfs-utils.mk
+++ b/package/nfs-utils/nfs-utils.mk
@@ -41,11 +41,38 @@ define NFS_UTILS_INSTALL_FIXUP
 endef
 NFS_UTILS_POST_INSTALL_TARGET_HOOKS += NFS_UTILS_INSTALL_FIXUP
 
+ifeq ($(BR2_INIT_SYSTEMD),y)
+NFS_UTILS_CONF_OPTS += --with-systemd=/usr/lib/systemd/system
+NFS_UTILS_DEPENDENCIES += systemd
+else
+NFS_UTILS_CONF_OPTS += --without-systemd
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
index 0000000..82284ce
--- /dev/null
+++ b/package/nfs-utils/nfs-utils_env.sh
@@ -0,0 +1,3 @@
+#!/bin/sh
+# This script is empty, it simply needs to exist to make the
+# nfs-config.service happy.
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
