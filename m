From: unixmania at gmail.com <unixmania@gmail.com>
Date: Thu, 24 Oct 2019 11:01:51 -0300
Subject: [Buildroot] [PATCH v2] package/initscripts: refactor S20urandom
Message-ID: <20191024140151.546-1-unixmania@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <unixmania@gmail.com>

Adapt the format to the current template, used in other init scripts,
but do not use start/stop functions due to peculiarities.

Treat RNG initialization and random seed backup as separate operations.

Read /proc/sys/kernel/random/poolsize to calculate the pool size, as
suggestred by the urandom manual page.

Ensure that the random seed file has the correct size to prevent dumping
an empty file to /dev/urandom on the first boot.

Save the seed at /var/lib/random-seed as other non-systemd distributions
do (e.g.  RHEL6), since /etc can be in a red-only rootfs. The Filesystem
Hierarchy Standard defines that /var/lib holds persistent data modified
by programs as they run.

Users willing to use a different path just need to redefine URANDOM_SEED
in /etc/default/urandom instead of rewriting the init script.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
---
CC: Matthew Weber <matthew.weber@collins.com>
---
Changes v1->v2
  - Convert start and stop function in init_rng and save_random_seed to
    avoid duplicated code.
  - Improve sanity checks
  - Keep failing gracefully in read-only rootfs cases, as pointed by
    Matthew Weber.
---
 package/initscripts/init.d/S20urandom | 98 ++++++++++++++++-----------
 1 file changed, 60 insertions(+), 38 deletions(-)

diff --git a/package/initscripts/init.d/S20urandom b/package/initscripts/init.d/S20urandom
index cababe1023..4f6936a200 100644
--- a/package/initscripts/init.d/S20urandom
+++ b/package/initscripts/init.d/S20urandom
@@ -1,51 +1,73 @@
 #! /bin/sh
 #
-# urandom	This script saves the random seed between reboots.
-#		It is called from the boot, halt and reboot scripts.
-#
-# Version:	@(#)urandom  1.33  22-Jun-1998  miquels at cistron.nl
+# Preserve the random seed between reboots. See urandom(4).
 #
 
+# Quietly do nothing if /dev/urandom does not exist
 [ -c /dev/urandom ] || exit 0
-#. /etc/default/rcS
 
-case "$1" in
-	start|"")
-		# check for read only file system
-		if ! touch /etc/random-seed 2>/dev/null
-		then
-			echo "read-only file system detected...done"
-			exit
-		fi
-		if [ "$VERBOSE" != no ]
-		then
-			printf "Initializing random number generator... "
+URANDOM_SEED="/var/lib/random-seed"
+
+# shellcheck source=/dev/null
+[ -r "/etc/default/urandom" ] && . "/etc/default/urandom"
+
+if pool_bits=$(cat /proc/sys/kernel/random/poolsize 2> /dev/null); then
+	pool_size=$((pool_bits/8))
+else
+	pool_size=512
+fi
+
+check_file_size() {
+	[ -f "$URANDOM_SEED" ] || return 1
+	# Try to read two blocks but exactly one will be read if the file has
+	# the correct size.
+	size=$(dd if="$URANDOM_SEED" bs="$pool_size" count=2 2> /dev/null | wc -c)
+	test "$size" -eq "$pool_size"
+}
+
+init_rng() {
+	if check_file_size; then
+		printf 'Initializing random number generator: '
+		dd if="$URANDOM_SEED" bs="$pool_size" of=/dev/urandom count=1 2> /dev/null
+		status=$?
+		if [ "$status" -eq 0 ]; then
+			echo "OK"
+		else
+			echo "FAIL"
 		fi
-		# Load and then save 512 bytes,
-		# which is the size of the entropy pool
-		cat /etc/random-seed >/dev/urandom
-		rm -f /etc/random-seed
+		return "$status"
+	fi
+}
+
+save_random_seed() {
+	printf 'Saving random seed: '
+	if touch "$URANDOM_SEED" 2> /dev/null; then
 		umask 077
-		dd if=/dev/urandom of=/etc/random-seed count=1 \
-			>/dev/null 2>&1 || echo "urandom start: failed."
+		dd if=/dev/urandom of="$URANDOM_SEED" bs="$pool_size" count=1 2> /dev/null
+		status=$?
 		umask 022
-		[ "$VERBOSE" != no ] && echo "done."
-		;;
-	stop)
-		if ! touch /etc/random-seed 2>/dev/null
-		then
-			exit
+		if [ "$status" -eq 0 ]; then
+			echo "OK"
+		else
+			echo "FAIL"
 		fi
-		# Carry a random seed from shut-down to start-up;
-		# see documentation in linux/drivers/char/random.c
-		[ "$VERBOSE" != no ] && printf "Saving random seed... "
-		umask 077
-		dd if=/dev/urandom of=/etc/random-seed count=1 \
-			>/dev/null 2>&1 || echo "urandom stop: failed."
-		[ "$VERBOSE" != no ] && echo "done."
-		;;
+	else
+		status=$?
+		echo "SKIP (read-only file system detected)"
+	fi
+	return "$status"
+}
+
+case "$1" in
+	start|restart|reload)
+		# Carry a random seed from start-up to start-up
+		# Load and then save the whole entropy pool
+		init_rng && save_random_seed;;
+	stop)
+		# Carry a random seed from shut-down to start-up
+		# Save the whole entropy pool
+		save_random_seed;;
 	*)
-		echo "Usage: urandom {start|stop}" >&2
+		echo "Usage: $0 {start|stop|restart|reload}"
 		exit 1
-		;;
 esac
-- 
2.18.1
