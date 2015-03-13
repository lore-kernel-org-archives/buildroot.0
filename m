From: Alex Suykov <alex.suykov@gmail.com>
Date: Fri, 13 Mar 2015 02:36:05 +0200
Subject: [Buildroot] [PATCH v2] move random-seed from /etc to /var/lib
Message-ID: <20150313003605.GA12181@vostro>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net

In case / is mounted read-only, /etc is likely to be read-only
as well, so the seed will not be saved even if read-write /var
is available.

Also adjust S20urandom script to handle nonexistant random-seed,
and remove the static initial seed to avoid seeding read-only
systems with pre-defined data.

Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
---
 system/device_table.txt               |   1 -
 system/skeleton/etc/init.d/S20urandom |  49 ++++++----------------------------
 system/skeleton/etc/random-seed       | Bin 512 -> 0 bytes
 3 files changed, 8 insertions(+), 42 deletions(-)
 delete mode 100644 system/skeleton/etc/random-seed

diff --git a/system/device_table.txt b/system/device_table.txt
index 8e7dbd2..e15412d 100644
--- a/system/device_table.txt
+++ b/system/device_table.txt
@@ -11,7 +11,6 @@
 /etc					d	755	0	0	-	-	-	-	-
 /root					d	700	0	0	-	-	-	-	-
 /var/www				d	755	33	33	-	-	-	-	-
-/etc/random-seed			f	600	0	0	-	-	-	-	-
 /etc/shadow				f	600	0	0	-	-	-	-	-
 /etc/passwd				f	644	0	0	-	-	-	-	-
 /etc/network/if-up.d			d	755	0	0	-	-	-	-	-
diff --git a/system/skeleton/etc/init.d/S20urandom b/system/skeleton/etc/init.d/S20urandom
index f73cea5..55dcee6 100755
--- a/system/skeleton/etc/init.d/S20urandom
+++ b/system/skeleton/etc/init.d/S20urandom
@@ -1,51 +1,18 @@
 #! /bin/sh
-#
-# urandom	This script saves the random seed between reboots.
-#		It is called from the boot, halt and reboot scripts.
-#
-# Version:	@(#)urandom  1.33  22-Jun-1998  miquels at cistron.nl
-#
 
-[ -c /dev/urandom ] || exit 0
-#. /etc/default/rcS
+# This script saves the random seed between reboots.
+
+test -c /dev/urandom || exit 0
 
 case "$1" in
-	start|"")
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
-		# check for read only file system
-		if ! touch /etc/random-seed 2>/dev/null
-		then
-			echo "read-only file system detected...done"
-			exit
-		fi
-		rm -f /etc/random-seed
-		umask 077
-		dd if=/dev/urandom of=/etc/random-seed count=1 \
-			>/dev/null 2>&1 || echo "urandom start: failed."
-		umask 022
-		[ "$VERBOSE" != no ] && echo "done."
+	start)
+		# Load 512 bytes which is the size of the entropy pool
+		test -f /var/lib/random-seed && \
+			cat /var/lib/random-seed >/dev/urandom
 		;;
 	stop)
-		if ! touch /etc/random-seed 2>/dev/null
-                then
-                        exit
-                fi
-		# Carry a random seed from shut-down to start-up;
-		# see documentation in linux/drivers/char/random.c
-		[ "$VERBOSE" != no ] && echo -n "Saving random seed... "
 		umask 077
-		dd if=/dev/urandom of=/etc/random-seed count=1 \
-			>/dev/null 2>&1 || echo "urandom stop: failed."
-		[ "$VERBOSE" != no ] && echo "done."
+		dd if=/dev/urandom of=/var/lib/random-seed count=1 2>/dev/null
 		;;
 	*)
 		echo "Usage: urandom {start|stop}" >&2
diff --git a/system/skeleton/etc/random-seed b/system/skeleton/etc/random-seed
deleted file mode 100644
index f26038adc5d057a0b9d6ce5d3cda02ccb4a4d12e..0000000000000000000000000000000000000000
GIT binary patch
literal 0
HcmV?d00001

literal 512
zcmV+b0{{Iq0UOB42;n<rZ7)sf8Kr=fg87_s+y&vLYgGJP-sY`OWMEj0aQ&I{*g5$)
zH?Zu5*rX8>4xpAvJIL$H4mg*!B4&9jh)7+B2j-fX7o at K*bzj;pJ$FwoQzl&MuZ^Wy
zrYS)x9vq<)#e~&1uB|_ITW-fntEg1^KXs3>vvgL7?_kg!+6=fg{S7mwkr$#pm<zB(
zu)oAUWFK-u-)cWcuSL*8$Q<cmC?ll~NEK@l5k|75(YzZ_p!I6FJ}YI_3>PZ13liCc
zi|M+im&71p*p+Z|7f(m-aedNFtEezFN<xKEd-wQ71%XuGfKr+6VcDycMQ(v6+Z0G|
z-MPjg@JHu%y(|h1cTa=a4(m?GyU)ZD-T+-vLXX}cCXyn}vCXC3Hn1ft`zDTL(};Rr
z?3wX?Eh5%n+AXAeDtXvl!o>-nZHytAhV~}?OM$-f$(%cG(ioV{==Ub4mfZP}OaJJ7
z25tvCcku=>;L?}O-dvK9`}<^gmg@IrnfQm#P>RRF|C9c;GDgEg_bw26{dkIVt1`{`
z3#ol{Q_FL91TBD~{uZn<gw?^=VUuSaIf)=p`07n=>RRZ(Otf!KXM&;q)8B<Q8(T)k
z?Z}a{1Jyf~bQPL{qVQk6jFNfBr)0;57HwN`o6Kw{wdPGHUWrfsJ}0VmW|Tr22whlO
C+W_DI

-- 
2.0.3
