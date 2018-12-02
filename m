From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 02 Dec 2018 07:19:27 -0000
Subject: [Buildroot] [git commit] iucode-tool: rewrite init script
Message-ID: <20181202071554.A47AC8A3F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9e323088cb179f6b3d8bcb9ec388eb41c1d018e4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Indent with tabs.
- Use a function for start.
- Pass "-q" to iucode_tool to inhibit usual output that would otherwise
  interfere with the operation status report.

Signed-off-by: Carlos Santos <casantos@datacom.com.br>
[Peter: drop dummy function with sed invocation not compatible with busybox]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/iucode-tool/S00iucode-tool | 33 +++++++++++++++++++--------------
 1 file changed, 19 insertions(+), 14 deletions(-)

diff --git a/package/iucode-tool/S00iucode-tool b/package/iucode-tool/S00iucode-tool
index a97b33c045..393c903b41 100644
--- a/package/iucode-tool/S00iucode-tool
+++ b/package/iucode-tool/S00iucode-tool
@@ -5,19 +5,24 @@
 
 MICROCODE_DIR="/lib/firmware/intel-ucode"
 
+start() {
+	printf 'Starting iucode-tool: '
+	/usr/sbin/iucode_tool -q -k "$MICROCODE_DIR"
+	status="$?"
+	if [ "$status" = 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	return "$status"
+}
+
 case "$1" in
-  start)
-	echo "Starting iucode-tool:"
-	/usr/sbin/iucode_tool -k "$MICROCODE_DIR"
-	echo "done"
-	;;
-  stop)
-	;;
-  restart|reload)
-	;;
-  *)
-	echo "Usage: $0 {start|stop|restart}"
-	exit 1
+	start)
+		start;;
+	stop|restart|reload)
+		;;
+	*)
+		echo "Usage: $0 {start|stop|restart|reload}"
+		exit 1
 esac
-
-exit $?
