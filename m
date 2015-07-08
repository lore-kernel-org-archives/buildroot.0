From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 8 Jul 2015 23:52:48 +0200
Subject: [Buildroot] [git commit] system/skeleton: don't use random-seed
	from a read-only fs
Message-ID: <20150708215408.9346E81917@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f33f766860a9ff6a62b474343d7859b702b2d713
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A random-seed from a read-only filesystem is useless.

Also, drop the check for /etc/random-seed existence; it must exist after a
touch.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 system/skeleton/etc/init.d/S20urandom |   17 +++++++----------
 1 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/system/skeleton/etc/init.d/S20urandom b/system/skeleton/etc/init.d/S20urandom
index f73cea5..36277ba 100755
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
