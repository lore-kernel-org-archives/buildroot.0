From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 2 Aug 2016 23:52:56 +0200
Subject: [Buildroot] [git commit] initscripts: show status in S40network
Message-ID: <20160802215313.D267680E3D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e8c18f2d19f59d313a56c6bb1c1826d70263b4b4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The output of "/etc/init.d/S40network start/stop" was lacking a
newline due to the usage of printf. Fix it by echoing the status, like
we do in other init scripts.

Signed-off-by: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/initscripts/init.d/S40network | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/initscripts/init.d/S40network b/package/initscripts/init.d/S40network
index 7b11d8b..642c501 100755
--- a/package/initscripts/init.d/S40network
+++ b/package/initscripts/init.d/S40network
@@ -8,12 +8,14 @@ mkdir -p /run/network
 
 case "$1" in
   start)
- 	echo "Starting network..."
+	printf "Starting network: "
 	/sbin/ifup -a
+	[ $? = 0 ] && echo "OK" || echo "FAIL"
 	;;
   stop)
-	printf "Stopping network..."
+	printf "Stopping network: "
 	/sbin/ifdown -a
+	[ $? = 0 ] && echo "OK" || echo "FAIL"
 	;;
   restart|reload)
 	"$0" stop
