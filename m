From: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Date: Tue,  2 Aug 2016 17:38:03 -0400
Subject: [Buildroot] [PATCH v2] initscripts: add newline to network stop
	message
Message-ID: <20160802213803.27953-1-vivien.didelot@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The output of "/etc/init.d/S40network stop" was lacking a newline due to
the usage of printf. Fix it by echoing the status.

v1 -> v2: echo OK/FAIL instead of s/printf/echo/.

Signed-off-by: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
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
-- 
2.9.2
