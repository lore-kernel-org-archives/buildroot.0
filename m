From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 25 Oct 2019 21:21:24 +0200
Subject: [Buildroot] [git commit] package/initscripts: refactor S20urandom
Message-ID: <20191025191454.17B1F88165@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d9e5c2b6278506b73ccdc808933ec9077b4f2ab3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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

[Peter: save/restore umask]
Signed-off-by: Carlos Santos <unixmania@gmail.com>
Tested-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/initscripts/init.d/S20urandom | 101 +++++++++++++++++++++-------------
 1 file changed, 62 insertions(+), 39 deletions(-)

diff --git a/package/initscripts/init.d/S20urandom b/package/initscripts/init.d/S20urandom
index cababe1023..e4fd125721 100644
--- a/package/initscripts/init.d/S20urandom
+++ b/package/initscripts/init.d/S20urandom
@@ -1,51 +1,74 @@
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
+		old_umask=$(umask)
 		umask 077
-		dd if=/dev/urandom of=/etc/random-seed count=1 \
-			>/dev/null 2>&1 || echo "urandom start: failed."
-		umask 022
-		[ "$VERBOSE" != no ] && echo "done."
-		;;
-	stop)
-		if ! touch /etc/random-seed 2>/dev/null
-		then
-			exit
+		dd if=/dev/urandom of="$URANDOM_SEED" bs="$pool_size" count=1 2> /dev/null
+		status=$?
+		umask "$old_umask"
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
