From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Mar 2020 07:24:46 +0200
Subject: [Buildroot] [git commit] package/busybox: use same S02sysctl script
 as procps-ng
Message-ID: <20200330051124.2ACC98A2E5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8920c41a9d8a1bdd3805d2c2ef498d91e99f1305
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The scripts were already the same, except for some comments, so make the
busybox S02sysctl a symlink to the procps-ng one, which works with both
versions of the "sysctl" utility.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/busybox/S02sysctl | 67 +----------------------------------------------
 1 file changed, 1 insertion(+), 66 deletions(-)

diff --git a/package/busybox/S02sysctl b/package/busybox/S02sysctl
deleted file mode 100644
index 6bb2fa165e..0000000000
--- a/package/busybox/S02sysctl
+++ /dev/null
@@ -1,66 +0,0 @@
-#!/bin/sh
-
-PROGRAM="sysctl"
-
-SYSCTL_ARGS=""
-
-# shellcheck source=/dev/null
-[ -r "/etc/default/$PROGRAM" ] && . "/etc/default/$PROGRAM"
-
-# Files are read from directories in the SYSCTL_SOURCES list, in the given
-# order. A file may be used more than once, since there can be multiple
-# symlinks to it. No attempt is made to prevent this.
-SYSCTL_SOURCES="/etc/sysctl.d/ /usr/local/lib/sysctl.d/ /usr/lib/sysctl.d/ /lib/sysctl.d/ /etc/sysctl.conf"
-
-# Use some scripting to mimic the --system option of the sysctl provided by
-# procps-ng but still reporting errors. Users not interested on error report
-# can put "-e" in SYSCTL_ARGS.
-#
-# The file redirections do the following:
-#
-# - stdout is redirected to syslog with facility.level "kern.info"
-# - stderr is redirected to syslog with facility.level "kern.err"
-# - file dscriptor 4 is used to pass the result to the "start" function.
-#
-# Testing the sysctl exit code is fruitless, as at the moment, since it ends
-# with status zero even if errors happen. Hopefully this will be fixed in a
-# future version of Busybox.
-#
-run_program() {
-	# shellcheck disable=SC2086 # we need the word splitting
-	find $SYSCTL_SOURCES -maxdepth 1 -name '*.conf' -print0 2> /dev/null | \
-	xargs -0 -r -n 1 readlink -f | {
-		prog_status="OK"
-		while :; do
-			read -r file
-			if [ -z "$file" ]; then
-				echo "$prog_status" >&4
-				break
-			fi
-			echo "* Applying $file ..."
-			/sbin/sysctl -p "$file" $SYSCTL_ARGS || prog_status="FAIL"
-		done 2>&1 >&3 | /usr/bin/logger -t sysctl -p kern.err
-	} 3>&1 | /usr/bin/logger -t sysctl -p kern.info
-}
-
-start() {
-	printf '%s %s: ' "$1" "$PROGRAM"
-	status=$(run_program 4>&1)
-	echo "$status"
-	if [ "$status" = "OK" ]; then
-		return 0
-	fi
-	return 1
-}
-
-case "$1" in
-	start)
-		start "Running";;
-	restart|reload)
-		start "Rerunning";;
-	stop)
-		:;;
-	*)
-		echo "Usage: $0 {start|stop|restart|reload}"
-		exit 1
-esac
diff --git a/package/busybox/S02sysctl b/package/busybox/S02sysctl
new file mode 120000
index 0000000000..796855c332
--- /dev/null
+++ b/package/busybox/S02sysctl
@@ -0,0 +1 @@
+../procps-ng/S02sysctl
\ No newline at end of file
