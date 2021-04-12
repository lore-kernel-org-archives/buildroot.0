From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 12 Apr 2021 11:47:33 -0500
Subject: [Buildroot] [PATCH v2] package/haveged: set write_wakeup_threshold
 to 2048
Message-ID: <20210412164733.17098-1-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adjust the low water mark to wake-up the haveged daemon at the
same time that rngd would wake-up when a hardware RNG is present.

This supports the theory that rngd then can't dominate the entropy
pool. Instead haveged and rngd would complete to fill the pool.
https://tails.boum.org/contribute/design/random/#index5h2

If rngd isn't enabled or there isn't a hardware RNG, this change
should not impact the behavior of the entropy pool other then
the pool should be less likely to deplete and cause an entropy
starve with haveged filling it earlier.

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
Changes
v1 -> v2
 - Rebased on master
 - verified no CPE ids match
---
 package/haveged/S21haveged | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/haveged/S21haveged b/package/haveged/S21haveged
index 4b6e6ced4e..22b84e4f27 100644
--- a/package/haveged/S21haveged
+++ b/package/haveged/S21haveged
@@ -3,7 +3,7 @@
 case "$1" in
 	start)
 		printf "Starting haveged: "
-		start-stop-daemon -S -x /usr/sbin/haveged -- -w 1024 -r 0
+		start-stop-daemon -S -x /usr/sbin/haveged -- -w 2048 -r 0
 		[ $? = 0 ] && echo "OK" || echo "FAIL"
 		;;
 	stop)
-- 
2.17.1
