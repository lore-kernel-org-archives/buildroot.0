From: Alex Suykov <alex.suykov@gmail.com>
Date: Thu, 12 Mar 2015 02:20:13 +0200
Subject: [Buildroot] [PATCH] move random-seed from /etc to /var/lib
Message-ID: <20150312002013.GA11018@vostro>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net

In case / is mounted read-only, /etc is likely to be read-only
as well, so the seed will not be saved.

Other non-static files (mtab, resolve.conf) have already been moved
out of /etc, random-seed is the only volatile file there at present.

Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
---
 system/device_table.txt               |   2 +-
 system/skeleton/etc/init.d/S20urandom |  14 +++++++-------
 system/skeleton/etc/random-seed       | Bin 512 -> 0 bytes
 system/skeleton/var/lib/random-seed   | Bin 0 -> 512 bytes
 4 files changed, 8 insertions(+), 8 deletions(-)
 delete mode 100644 system/skeleton/etc/random-seed
 create mode 100644 system/skeleton/var/lib/random-seed

diff --git a/system/device_table.txt b/system/device_table.txt
index 8e7dbd2..77ecc62 100644
--- a/system/device_table.txt
+++ b/system/device_table.txt
@@ -11,7 +11,7 @@
 /etc					d	755	0	0	-	-	-	-	-
 /root					d	700	0	0	-	-	-	-	-
 /var/www				d	755	33	33	-	-	-	-	-
-/etc/random-seed			f	600	0	0	-	-	-	-	-
+/var/lib/random-seed			f	600	0	0	-	-	-	-	-
 /etc/shadow				f	600	0	0	-	-	-	-	-
 /etc/passwd				f	644	0	0	-	-	-	-	-
 /etc/network/if-up.d			d	755	0	0	-	-	-	-	-
diff --git a/system/skeleton/etc/init.d/S20urandom b/system/skeleton/etc/init.d/S20urandom
index f73cea5..f95b47d 100755
--- a/system/skeleton/etc/init.d/S20urandom
+++ b/system/skeleton/etc/init.d/S20urandom
@@ -17,25 +17,25 @@ case "$1" in
 		fi
 		# Load and then save 512 bytes,
 		# which is the size of the entropy pool
-		if [ -f /etc/random-seed ]
+		if [ -f /var/lib/random-seed ]
 		then
-			cat /etc/random-seed >/dev/urandom
+			cat /var/lib/random-seed >/dev/urandom
 		fi
 		# check for read only file system
-		if ! touch /etc/random-seed 2>/dev/null
+		if ! touch /var/lib/random-seed 2>/dev/null
 		then
 			echo "read-only file system detected...done"
 			exit
 		fi
-		rm -f /etc/random-seed
+		rm -f /var/lib/random-seed
 		umask 077
-		dd if=/dev/urandom of=/etc/random-seed count=1 \
+		dd if=/dev/urandom of=/var/lib/random-seed count=1 \
 			>/dev/null 2>&1 || echo "urandom start: failed."
 		umask 022
 		[ "$VERBOSE" != no ] && echo "done."
 		;;
 	stop)
-		if ! touch /etc/random-seed 2>/dev/null
+		if ! touch /var/lib/random-seed 2>/dev/null
                 then
                         exit
                 fi
@@ -43,7 +43,7 @@ case "$1" in
 		# see documentation in linux/drivers/char/random.c
 		[ "$VERBOSE" != no ] && echo -n "Saving random seed... "
 		umask 077
-		dd if=/dev/urandom of=/etc/random-seed count=1 \
+		dd if=/dev/urandom of=/var/lib/random-seed count=1 \
 			>/dev/null 2>&1 || echo "urandom stop: failed."
 		[ "$VERBOSE" != no ] && echo "done."
 		;;
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

diff --git a/system/skeleton/var/lib/random-seed b/system/skeleton/var/lib/random-seed
new file mode 100644
index 0000000000000000000000000000000000000000..f26038adc5d057a0b9d6ce5d3cda02ccb4a4d12e
GIT binary patch
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

literal 0
HcmV?d00001

-- 
2.0.3
