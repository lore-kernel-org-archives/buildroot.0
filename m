From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Mar 2020 07:24:49 +0200
Subject: [Buildroot] [git commit] package/procps-ng: use logger in S02sysctl
 only if it is available
Message-ID: <20200330051124.41A388A2E5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4dbea48248b6661e8ba0544b76dd3ebbe4dc8b5d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The script used the logger utility unconditionally but it may not exist
(e.g. busybox-minimal.config is used and BR2_PACKAGE_UTIL_LINUX_LOGGER
is not selected).

Declare two functions to perform the operation, run_logger and run_std,
and use the appropriate one, depending on the existence of logger.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/procps-ng/S02sysctl | 35 +++++++++++++++++++++++++++++------
 1 file changed, 29 insertions(+), 6 deletions(-)

diff --git a/package/procps-ng/S02sysctl b/package/procps-ng/S02sysctl
index fed64e91a6..85d9ed50d0 100644
--- a/package/procps-ng/S02sysctl
+++ b/package/procps-ng/S02sysctl
@@ -25,32 +25,55 @@ SYSCTL_ARGS=""
 # symlinks to it. No attempt is made to prevent this.
 SYSCTL_SOURCES="/etc/sysctl.d/ /usr/local/lib/sysctl.d/ /usr/lib/sysctl.d/ /lib/sysctl.d/ /etc/sysctl.conf"
 
-# The file redirections do the following:
+# If the logger utility is available all messages are sent to syslog, except
+# for the final status. The file redirections do the following:
 #
 # - stdout is redirected to syslog with facility.level "kern.info"
 # - stderr is redirected to syslog with facility.level "kern.err"
 # - file dscriptor 4 is used to pass the result to the "start" function.
 #
-run_program() {
+run_logger() {
 	# shellcheck disable=SC2086 # we need the word splitting
 	find $SYSCTL_SOURCES -maxdepth 1 -name '*.conf' -print0 2> /dev/null | \
 	xargs -0 -r -n 1 readlink -f | {
 		prog_status="OK"
 		while :; do
-			read -r file
-			if [ -z "$file" ]; then
+			read -r file || {
 				echo "$prog_status" >&4
 				break
-			fi
+			}
 			echo "* Applying $file ..."
 			/sbin/sysctl -p "$file" $SYSCTL_ARGS || prog_status="FAIL"
 		done 2>&1 >&3 | /usr/bin/logger -t sysctl -p kern.err
 	} 3>&1 | /usr/bin/logger -t sysctl -p kern.info
 }
 
+# If logger is not available all messages are sent to stdout/stderr.
+run_std() {
+	# shellcheck disable=SC2086 # we need the word splitting
+	find $SYSCTL_SOURCES -maxdepth 1 -name '*.conf' -print0 2> /dev/null | \
+	xargs -0 -r -n 1 readlink -f | {
+		prog_status="OK"
+		while :; do
+			read -r file || {
+				echo "$prog_status" >&4
+				break
+			}
+			echo "* Applying $file ..."
+			/sbin/sysctl -p "$file" $SYSCTL_ARGS || prog_status="FAIL"
+		done
+	}
+}
+
+if [ -x /usr/bin/logger ]; then
+	run_program="run_logger"
+else
+	run_program="run_std"
+fi
+
 start() {
 	printf '%s %s: ' "$1" "$PROGRAM"
-	status=$(run_program 4>&1)
+	status=$("$run_program" 4>&1)
 	echo "$status"
 	if [ "$status" = "OK" ]; then
 		return 0
