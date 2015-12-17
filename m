From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Dec 2015 21:51:42 +0100
Subject: [Buildroot] [git commit] nfsd: accept config to set number of
	threads
Message-ID: <20151217205200.16B7182563@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=af3befec827fcda0e2578e099f8c1a89533f3323
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: tweak commit title and author.]

Signed-off-by: Andreas Ehmanns <universeII@gmx.de>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
 
