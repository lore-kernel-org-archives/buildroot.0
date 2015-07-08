From: Baruch Siach <baruch@tkos.co.il>
Date: Wed,  8 Jul 2015 08:24:12 +0300
Subject: [Buildroot] [PATCH 2/2] system/skeleton: don't use random-seed from
	a read-only fs
In-Reply-To: <314559b27c9c888a8939941b1b4ba500f20b4294.1436333052.git.baruch@tkos.co.il>
References: <314559b27c9c888a8939941b1b4ba500f20b4294.1436333052.git.baruch@tkos.co.il>
Message-ID: <ad0a58dabfde218f00f66d1f07620939ce5cc3dc.1436333052.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A random-seed from a read-only filesystem is useless.

Also, drop the check for /etc/random-seed existence; it must exist after a
touch.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 system/skeleton/etc/init.d/S20urandom | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/system/skeleton/etc/init.d/S20urandom b/system/skeleton/etc/init.d/S20urandom
index f73cea59edac..36277ba61815 100755
--- a/system/skeleton/etc/init.d/S20urandom
+++ b/system/skeleton/etc/init.d/S20urandom
@@ -11,22 +11,19 @@
 
 case "$1" in
 	start|"")
-		if [ "$VERBOSE" != no ]
-		then
-			echo -n "Initializing random number generator... "
-		fi
-		# Load and then save 512 bytes,
-		# which is the size of the entropy pool
-		if [ -f /etc/random-seed ]
-		then
-			cat /etc/random-seed >/dev/urandom
-		fi
 		# check for read only file system
 		if ! touch /etc/random-seed 2>/dev/null
 		then
 			echo "read-only file system detected...done"
 			exit
 		fi
+		if [ "$VERBOSE" != no ]
+		then
+			echo -n "Initializing random number generator... "
+		fi
+		# Load and then save 512 bytes,
+		# which is the size of the entropy pool
+		cat /etc/random-seed >/dev/urandom
 		rm -f /etc/random-seed
 		umask 077
 		dd if=/dev/urandom of=/etc/random-seed count=1 \
-- 
2.1.4
