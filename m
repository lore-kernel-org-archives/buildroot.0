From: Martin Hicks <mort@bork.org>
Date: Tue,  1 Mar 2011 09:34:25 -0500
Subject: [Buildroot] [PATCH] nfs-utils: initscript support for nfsv4 and
	idmapd config file
In-Reply-To: <1298990065-648-3-git-send-email-mort@bork.org>
References: <1298990065-648-1-git-send-email-mort@bork.org>
	<1298990065-648-2-git-send-email-mort@bork.org>
	<1298990065-648-3-git-send-email-mort@bork.org>
Message-ID: <1298990065-648-4-git-send-email-mort@bork.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This adds a variable to enable NFSv4 to the nfs initscript.  It mounts
additional pseudo filesystems required and starts the idmapd daemon.

Signed-off-by: Martin Hicks <mort@bork.org>
---
 package/nfs-utils/S60nfs       |   16 ++++++++++++++++
 package/nfs-utils/idmapd.conf  |   10 ++++++++++
 package/nfs-utils/nfs-utils.mk |    8 ++++++++
 3 files changed, 34 insertions(+), 0 deletions(-)
 create mode 100644 package/nfs-utils/idmapd.conf

diff --git a/package/nfs-utils/S60nfs b/package/nfs-utils/S60nfs
index 49dab70..fe472f1 100755
--- a/package/nfs-utils/S60nfs
+++ b/package/nfs-utils/S60nfs
@@ -3,10 +3,15 @@
 # nfs           This shell script takes care of starting and stopping
 #               the NFS services. Stolen from RedHat FC5.
 
+ENABLEv4=no
+
 [ -x /usr/sbin/rpc.statd ] || exit 0
 [ -x /usr/sbin/rpc.nfsd ] || exit 0
 [ -x /usr/sbin/rpc.mountd ] || exit 0
 [ -x /usr/sbin/exportfs ] || exit 0
+if [ $ENABLEv4 == "yes" ]; then
+	[ -x /usr/sbin/rpc.idmapd ] || exit 0
+fi
 
 # Don't fail if /etc/exports doesn't exist; create a bare-bones version and continue.
 [ -r /etc/exports ] || \
@@ -20,6 +25,13 @@ touch /var/lib/nfs/etab
 touch /var/lib/nfs/rmtab
 touch /var/lib/nfs/state
 touch /var/lib/nfs/xtab
+if [ $ENABLEv4 == "yes" ]; then
+  [ -d /var/lib/nfs/v4recovery ] || mkdir -p /var/lib/nfs/v4recovery
+  [ -d /var/lib/nfs/rpc_pipefs ] || mkdir -p /var/lib/nfs/rpc_pipefs
+  if ! ( grep -q rpc_pipefs /proc/mounts ); then
+    mount -t rpc_pipefs none /var/lib/nfs/rpc_pipefs
+  fi
+fi
 
 start() {
 	# Start daemons.
@@ -31,6 +43,9 @@ start() {
 	echo -n "Starting NFS services: "
 	/usr/sbin/exportfs -r
 	rpc.statd
+	if [ $ENABLEv4 == "yes" ]; then
+		/usr/sbin/rpc.idmapd
+	fi
 	echo "done"
 
 	echo -n "Starting NFS daemon: "
@@ -57,6 +72,7 @@ stop() {
 	/usr/sbin/exportfs -au
 	rm -f /var/lock/subsys/nfs
 	killall -q rpc.statd
+	killall -q rpc.idmapd
 	echo "done"
 
 	echo -n "Stopping NFS statd: "
diff --git a/package/nfs-utils/idmapd.conf b/package/nfs-utils/idmapd.conf
new file mode 100644
index 0000000..8325982
--- /dev/null
+++ b/package/nfs-utils/idmapd.conf
@@ -0,0 +1,10 @@
+[General]
+
+Verbosity = 0
+Pipefs-Directory = /var/lib/nfs/rpc_pipefs
+Domain = localdomain
+
+[Mapping]
+
+Nobody-User = nobody
+Nobody-Group = nogroup
diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
index e82c2b0..2673e02 100644
--- a/package/nfs-utils/nfs-utils.mk
+++ b/package/nfs-utils/nfs-utils.mk
@@ -32,6 +32,14 @@ define NFS_UTILS_INSTALL_FIXUP
 	rm -f $(NFS_UTILS_TARGETS_)
 endef
 
+define NFS_UTILS_INSTALL_IDMAPD_CONF
+	$(INSTALL) -m 0644 package/nfs-utils/idmapd.conf \
+		$(TARGET_DIR)/etc/idmapd.conf
+endef
+
 NFS_UTILS_POST_INSTALL_TARGET_HOOKS += NFS_UTILS_INSTALL_FIXUP
+ifeq ($(BR2_PACKAGE_NFS_UTILS_NFS4),y)
+  NFS_UTILS_POST_INSTALL_TARGET_HOOKS += NFS_UTILS_INSTALL_IDMAPD_CONF
+endif
 
 $(eval $(call AUTOTARGETS,package,nfs-utils))
-- 
1.5.6.5
