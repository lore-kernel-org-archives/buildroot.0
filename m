From: Andreas Ehmanns <universeII@gmx.de>
Date: Thu, 17 Dec 2015 20:45:05 +0100
Subject: [Buildroot] [PATCH 1/1] Add config to nfsd to set number of threads
Message-ID: <1450381505-3796-1-git-send-email-universeII@gmx.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Andreas Ehmanns <universeII@gmx.de>
---
 package/nfs-utils/S60nfs | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/package/nfs-utils/S60nfs b/package/nfs-utils/S60nfs
index ec7c909..5639b8f 100755
--- a/package/nfs-utils/S60nfs
+++ b/package/nfs-utils/S60nfs
@@ -13,6 +13,14 @@ mkdir -p /run/nfs/sm
 mkdir -p /run/nfs/sm.bak
 touch /run/nfs/rmtab
 
+CFG_FILE=/etc/default/nfsd
+
+NR_THREADS=2
+if [ -f "${CFG_FILE}" ]; then
+    . "${CFG_FILE}"
+fi
+
+
 start() {
 	# Start daemons.
 	printf "Starting NFS statd: "
@@ -25,7 +33,7 @@ start() {
 	echo "done"
 
 	printf "Starting NFS daemon: "
-	rpc.nfsd 2
+	rpc.nfsd ${NR_THREADS}
 	echo "done"
 
 	printf "Starting NFS mountd: "
@@ -40,7 +48,7 @@ stop() {
 	killall -q rpc.mountd
 	echo "done"
 
-	echo "Shutting down NFS daemon: "
+	printf "Shutting down NFS daemon: "
 	kill -9 `pidof nfsd` 2>/dev/null
 	echo "done"
 
-- 
2.1.4
