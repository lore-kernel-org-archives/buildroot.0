From: Philipp Skadorov <philipp.skadorov@savoirfairelinux.com>
Date: Wed,  8 Mar 2017 15:43:31 -0500
Subject: [Buildroot] [PATCH v2 1/2] lighttpd: carry common keywords out to
	variables
In-Reply-To: <20170308211124.50d94081@free-electrons.com>
References: <20170308211124.50d94081@free-electrons.com>
Message-ID: <20170308204332.11313-1-philipp.skadorov@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

S50lighttpd contains repeating keywords that are worth carrying out as
variables: pid file name, daemon name, config file name.

Signed-off-by: Philipp Skadorov <philipp.skadorov@savoirfairelinux.com>
---
 package/lighttpd/S50lighttpd | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/lighttpd/S50lighttpd b/package/lighttpd/S50lighttpd
index 44ac257c1..7a14ec8a9 100644
--- a/package/lighttpd/S50lighttpd
+++ b/package/lighttpd/S50lighttpd
@@ -2,15 +2,19 @@
 #
 # Starts lighttpd.
 #
+NAME=lighttpd
+DAEMON=/usr/sbin/$NAME
+PID_FILE="/var/run/$NAME.pid"
+CONF_FILE="/etc/$NAME/$NAME.conf"
 
 start() {
 	printf "Starting lighttpd: "
-	start-stop-daemon -S -q -p /var/run/lighttpd.pid --exec /usr/sbin/lighttpd -- -f /etc/lighttpd/lighttpd.conf
+	start-stop-daemon -S -q -p $PID_FILE --exec $DAEMON -- -f $CONF_FILE
 	echo "OK"
 }
 stop() {
 	printf "Stopping lighttpd: "
-	start-stop-daemon -K -q -p /var/run/lighttpd.pid
+	start-stop-daemon -K -q -p $PID_FILE
 	echo "OK"
 }
 restart() {
-- 
2.11.0
