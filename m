From: Steve Calfee <stevecalfee@gmail.com>
Date: Mon, 29 Sep 2014 18:08:00 -0700
Subject: [Buildroot] [PATCH 1/1] Fix nfs server for a read only rootfs
Message-ID: <1412039280-14763-1-git-send-email-stevecalfee@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I like to run from ro root filesystem. This patch puts the nfs temp stuff in a
subdirectory of tmp. The standard buildroot /var is read only, so the build
must agree with the runtime startup to use a /tmp/nfs writeable dir.

Also create the desired subsys subdirectory in /var/lock for nfs.

Signed-off-by: Steve Calfee <stevecalfee@gmail.com>
---
 package/nfs-utils/S60nfs       | 3 +++
 package/nfs-utils/nfs-utils.mk | 4 ++++
 2 files changed, 7 insertions(+)

diff --git a/package/nfs-utils/S60nfs b/package/nfs-utils/S60nfs
index 49dab70..0497396 100755
--- a/package/nfs-utils/S60nfs
+++ b/package/nfs-utils/S60nfs
@@ -14,6 +14,8 @@
     { echo "/etc/exports does not exist" ; exit 0 ; }
     
 # The /var/lib/nfs directory is actually on a tmpfs filesystem.
+# to reduce clutter put it in a subdir of /tmp
+mkdir -p /tmp/nfs
 mkdir -p /var/lib/nfs/sm
 mkdir -p /var/lib/nfs/sm.bak
 touch /var/lib/nfs/etab
@@ -25,6 +27,7 @@ start() {
 	# Start daemons.
 	echo -n "Starting NFS statd: "
 	rpc.statd
+	mkdir -p /var/lock/subsys
 	touch /var/lock/subsys/nfslock
 	echo "done"
 
diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
index 68772ef..3b54051 100644
--- a/package/nfs-utils/nfs-utils.mk
+++ b/package/nfs-utils/nfs-utils.mk
@@ -37,6 +37,10 @@ endif
 define NFS_UTILS_INSTALL_FIXUP
 	$(INSTALL) -m 0755 package/nfs-utils/S60nfs \
 		$(TARGET_DIR)/etc/init.d/S60nfs
+	rm -rf $(TARGET_DIR)/var/lib/nfs
+	mkdir -p $(TARGET_DIR)/tmp/nfs
+	$(INSTALL) -d -m 0755 $(TARGET_DIR)/var/lib
+	ln -s ../../tmp/nfs $(TARGET_DIR)/var/lib/nfs
 	rm -f $(NFS_UTILS_TARGETS_)
 endef
 
-- 
1.8.3.2
