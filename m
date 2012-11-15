From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 15 Nov 2012 21:30:32 +0100
Subject: [Buildroot] [git commit] support/gnuconfig: update config.{guess,
	sub} to a newer version
Message-ID: <20121115210309.418859A012@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6713fbd3301bcdca06c435f8b2ce1ac6664a096d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We need more recent versions of config.guess and config.sub in order
to support the aarch64 architecture. Otherwise, all autoconf packages
fail to build with failures like:

  http://autobuild.buildroot.org/results/abcdbe1aaf1c203c82dc3e4ec8c002b9b9e550e0/build-end.log

We take this opportunity to turn the config.* patches into proper Git
patches, and note which Git commit of the config.git repository we
used as the original source.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 support/gnuconfig/README.buildroot                 |    5 +-
 support/gnuconfig/config.guess                     |   74 +++++++----
 support/gnuconfig/config.sub                       |  138 +++++++++++++------
 ...ch => 0001-config-add-support-for-uClibc.patch} |   73 ++++++++---
 ...patch => 0002-config-add-support-for-ps2.patch} |   29 +++-
 5 files changed, 224 insertions(+), 95 deletions(-)

diff --git a/support/gnuconfig/README.buildroot b/support/gnuconfig/README.buildroot
index 83a4e9c..5f96b3c 100644
--- a/support/gnuconfig/README.buildroot
+++ b/support/gnuconfig/README.buildroot
@@ -17,9 +17,12 @@ GNU config is now managed in git, so to update:
 
 # git clone git://git.savannah.gnu.org/config.git
 # cp config/config.* .
-# for p in $(ls patches/*.patch); do patch -p0 < $p; done
+# for p in $(ls patches/*.patch); do patch -p1 < $p; done
 # rm -rf config
 
 A few local customizations are used to support uClibc so you may
 have to make sure they're still needed.  The patches are broken
 out in the patches/ dir to keep things simple.
+
+The current Buildroot version is based on the Git commit
+9582436dfae5755279f96898ce30bde28e4e69ea of the config.git repository.
diff --git a/support/gnuconfig/config.guess b/support/gnuconfig/config.guess
index 40cf0af..9509179 100755
--- a/support/gnuconfig/config.guess
+++ b/support/gnuconfig/config.guess
@@ -2,9 +2,9 @@
 # Attempt to guess a canonical system name.
 #   Copyright (C) 1992, 1993, 1994, 1995, 1996, 1997, 1998, 1999,
 #   2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010,
-#   2011 Free Software Foundation, Inc.
+#   2011, 2012 Free Software Foundation, Inc.
 
-timestamp='2011-02-02'
+timestamp='2012-09-25'
 
 # This file is free software; you can redistribute it and/or modify it
 # under the terms of the GNU General Public License as published by
@@ -17,9 +17,7 @@ timestamp='2011-02-02'
 # General Public License for more details.
 #
 # You should have received a copy of the GNU General Public License
-# along with this program; if not, write to the Free Software
-# Foundation, Inc., 51 Franklin Street - Fifth Floor, Boston, MA
-# 02110-1301, USA.
+# along with this program; if not, see <http://www.gnu.org/licenses/>.
 #
 # As a special exception to the GNU General Public License, if you
 # distribute this file as part of a program that contains a
@@ -57,8 +55,8 @@ GNU config.guess ($timestamp)
 
 Originally written by Per Bothner.
 Copyright (C) 1992, 1993, 1994, 1995, 1996, 1997, 1998, 1999, 2000,
-2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011 Free
-Software Foundation, Inc.
+2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012
+Free Software Foundation, Inc.
 
 This is free software; see the source for copying conditions.  There is NO
 warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE."
@@ -162,7 +160,7 @@ fi
 case "${UNAME_MACHINE}:${UNAME_SYSTEM}:${UNAME_RELEASE}:${UNAME_VERSION}" in
     *:NetBSD:*:*)
 	# NetBSD (nbsd) targets should (where applicable) match one or
-	# more of the tupples: *-*-netbsdelf*, *-*-netbsdaout*,
+	# more of the tuples: *-*-netbsdelf*, *-*-netbsdaout*,
 	# *-*-netbsdecoff* and *-*-netbsd*.  For targets that recently
 	# switched to ELF, *-*-netbsd* would select the old
 	# object file format.  This provides both forward
@@ -219,6 +217,10 @@ case "${UNAME_MACHINE}:${UNAME_SYSTEM}:${UNAME_RELEASE}:${UNAME_VERSION}" in
 	# CPU_TYPE-MANUFACTURER-OPERATING_SYSTEM is used.
 	echo "${machine}-${os}${release}"
 	exit ;;
+    *:Bitrig:*:*)
+	UNAME_MACHINE_ARCH=`arch | sed 's/Bitrig.//'`
+	echo ${UNAME_MACHINE_ARCH}-unknown-bitrig${UNAME_RELEASE}
+	exit ;;
     *:OpenBSD:*:*)
 	UNAME_MACHINE_ARCH=`arch | sed 's/OpenBSD.//'`
 	echo ${UNAME_MACHINE_ARCH}-unknown-openbsd${UNAME_RELEASE}
@@ -321,7 +323,7 @@ case "${UNAME_MACHINE}:${UNAME_SYSTEM}:${UNAME_RELEASE}:${UNAME_VERSION}" in
     arm:RISC*:1.[012]*:*|arm:riscix:1.[012]*:*)
 	echo arm-acorn-riscix${UNAME_RELEASE}
 	exit ;;
-    arm:riscos:*:*|arm:RISCOS:*:*)
+    arm*:riscos:*:*|arm*:RISCOS:*:*)
 	echo arm-unknown-riscos
 	exit ;;
     SR2?01:HI-UX/MPP:*:* | SR8000:HI-UX/MPP:*:*)
@@ -809,21 +811,26 @@ EOF
 	echo ${UNAME_MACHINE}-unknown-bsdi${UNAME_RELEASE}
 	exit ;;
     *:FreeBSD:*:*)
-	case ${UNAME_MACHINE} in
-	    pc98)
-		echo i386-unknown-freebsd`echo ${UNAME_RELEASE}|sed -e 's/[-(].*//'` ;;
+	UNAME_PROCESSOR=`/usr/bin/uname -p`
+	case ${UNAME_PROCESSOR} in
 	    amd64)
 		echo x86_64-unknown-freebsd`echo ${UNAME_RELEASE}|sed -e 's/[-(].*//'` ;;
 	    *)
-		echo ${UNAME_MACHINE}-unknown-freebsd`echo ${UNAME_RELEASE}|sed -e 's/[-(].*//'` ;;
+		echo ${UNAME_PROCESSOR}-unknown-freebsd`echo ${UNAME_RELEASE}|sed -e 's/[-(].*//'` ;;
 	esac
 	exit ;;
     i*:CYGWIN*:*)
 	echo ${UNAME_MACHINE}-pc-cygwin
 	exit ;;
+    *:MINGW64*:*)
+	echo ${UNAME_MACHINE}-pc-mingw64
+	exit ;;
     *:MINGW*:*)
 	echo ${UNAME_MACHINE}-pc-mingw32
 	exit ;;
+    i*:MSYS*:*)
+	echo ${UNAME_MACHINE}-pc-msys
+	exit ;;
     i*:windows32*:*)
 	# uname -m includes "-pc" on this system.
 	echo ${UNAME_MACHINE}-mingw32
@@ -878,6 +885,13 @@ EOF
     i*86:Minix:*:*)
 	echo ${UNAME_MACHINE}-pc-minix
 	exit ;;
+    aarch64:Linux:*:*)
+	echo ${UNAME_MACHINE}-unknown-linux-${LIBC}
+	exit ;;
+    aarch64_be:Linux:*:*)
+	UNAME_MACHINE=aarch64_be
+	echo ${UNAME_MACHINE}-unknown-linux-${LIBC}
+	exit ;;
     alpha:Linux:*:*)
 	case `sed -n '/^cpu model/s/^.*: \(.*\)/\1/p' < /proc/cpuinfo` in
 	  EV5)   UNAME_MACHINE=alphaev5 ;;
@@ -899,20 +913,29 @@ EOF
 	then
 	    echo ${UNAME_MACHINE}-unknown-linux-${LIBC}
 	else
-	    echo ${UNAME_MACHINE}-unknown-linux-gnueabi
+	    if echo __ARM_PCS_VFP | $CC_FOR_BUILD -E - 2>/dev/null \
+		| grep -q __ARM_PCS_VFP
+	    then
+		echo ${UNAME_MACHINE}-unknown-linux-gnueabi
+	    else
+		echo ${UNAME_MACHINE}-unknown-linux-gnueabihf
+	    fi
 	fi
 	exit ;;
     avr32*:Linux:*:*)
 	echo ${UNAME_MACHINE}-unknown-linux-${LIBC}
 	exit ;;
     cris:Linux:*:*)
-	echo cris-axis-linux-${LIBC}
+	echo ${UNAME_MACHINE}-axis-linux-${LIBC}
 	exit ;;
     crisv32:Linux:*:*)
-	echo crisv32-axis-linux-${LIBC}
+	echo ${UNAME_MACHINE}-axis-linux-${LIBC}
 	exit ;;
     frv:Linux:*:*)
-	echo frv-unknown-linux-${LIBC}
+	echo ${UNAME_MACHINE}-unknown-linux-${LIBC}
+	exit ;;
+    hexagon:Linux:*:*)
+	echo ${UNAME_MACHINE}-unknown-linux-${LIBC}
 	exit ;;
     i*86:Linux:*:*)
 	eval $set_cc_for_build
@@ -953,7 +976,7 @@ EOF
 	test x"${CPU}" != x && { echo "${CPU}-unknown-linux-${LIBC}"; exit; }
 	;;
     or32:Linux:*:*)
-	echo or32-unknown-linux-${LIBC}
+	echo ${UNAME_MACHINE}-unknown-linux-${LIBC}
 	exit ;;
     padre:Linux:*:*)
 	echo sparc-unknown-linux-gnu
@@ -988,13 +1011,13 @@ EOF
 	echo ${UNAME_MACHINE}-unknown-linux-${LIBC}
 	exit ;;
     tile*:Linux:*:*)
-	echo ${UNAME_MACHINE}-tilera-linux-gnu
+	echo ${UNAME_MACHINE}-unknown-linux-gnu
 	exit ;;
     vax:Linux:*:*)
 	echo ${UNAME_MACHINE}-dec-linux-${LIBC}
 	exit ;;
     x86_64:Linux:*:*)
-	echo x86_64-unknown-linux-${LIBC}
+	echo ${UNAME_MACHINE}-unknown-linux-${LIBC}
 	exit ;;
     xtensa*:Linux:*:*)
 	echo ${UNAME_MACHINE}-unknown-linux-${LIBC}
@@ -1201,6 +1224,9 @@ EOF
     BePC:Haiku:*:*)	# Haiku running on Intel PC compatible.
 	echo i586-pc-haiku
 	exit ;;
+    x86_64:Haiku:*:*)
+	echo x86_64-unknown-haiku
+	exit ;;
     SX-4:SUPER-UX:*:*)
 	echo sx4-nec-superux${UNAME_RELEASE}
 	exit ;;
@@ -1256,7 +1282,7 @@ EOF
     NEO-?:NONSTOP_KERNEL:*:*)
 	echo neo-tandem-nsk${UNAME_RELEASE}
 	exit ;;
-    NSE-?:NONSTOP_KERNEL:*:*)
+    NSE-*:NONSTOP_KERNEL:*:*)
 	echo nse-tandem-nsk${UNAME_RELEASE}
 	exit ;;
     NSR-?:NONSTOP_KERNEL:*:*)
@@ -1325,11 +1351,11 @@ EOF
     i*86:AROS:*:*)
 	echo ${UNAME_MACHINE}-pc-aros
 	exit ;;
+    x86_64:VMkernel:*:*)
+	echo ${UNAME_MACHINE}-unknown-esx
+	exit ;;
 esac
 
-#echo '(No uname command or uname output not recognized.)' 1>&2
-#echo "${UNAME_MACHINE}:${UNAME_SYSTEM}:${UNAME_RELEASE}:${UNAME_VERSION}" 1>&2
-
 eval $set_cc_for_build
 cat >$dummy.c <<EOF
 #ifdef _SEQUENT_
diff --git a/support/gnuconfig/config.sub b/support/gnuconfig/config.sub
index 8ad167c..8509813 100755
--- a/support/gnuconfig/config.sub
+++ b/support/gnuconfig/config.sub
@@ -2,9 +2,9 @@
 # Configuration validation subroutine script.
 #   Copyright (C) 1992, 1993, 1994, 1995, 1996, 1997, 1998, 1999,
 #   2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010,
-#   2011 Free Software Foundation, Inc.
+#   2011, 2012 Free Software Foundation, Inc.
 
-timestamp='2011-02-24'
+timestamp='2012-10-10'
 
 # This file is (in principle) common to ALL GNU software.
 # The presence of a machine in this file suggests that SOME GNU software
@@ -21,9 +21,7 @@ timestamp='2011-02-24'
 # GNU General Public License for more details.
 #
 # You should have received a copy of the GNU General Public License
-# along with this program; if not, write to the Free Software
-# Foundation, Inc., 51 Franklin Street - Fifth Floor, Boston, MA
-# 02110-1301, USA.
+# along with this program; if not, see <http://www.gnu.org/licenses/>.
 #
 # As a special exception to the GNU General Public License, if you
 # distribute this file as part of a program that contains a
@@ -76,8 +74,8 @@ version="\
 GNU config.sub ($timestamp)
 
 Copyright (C) 1992, 1993, 1994, 1995, 1996, 1997, 1998, 1999, 2000,
-2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011 Free
-Software Foundation, Inc.
+2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012
+Free Software Foundation, Inc.
 
 This is free software; see the source for copying conditions.  There is NO
 warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE."
@@ -125,13 +123,17 @@ esac
 maybe_os=`echo $1 | sed 's/^\(.*\)-\([^-]*-[^-]*\)$/\2/'`
 case $maybe_os in
   nto-qnx* | linux-gnu* | linux-android* | linux-dietlibc | linux-newlib* | \
-  linux-uclibc* | uclinux-uclibc* | uclinux-gnu* | kfreebsd*-gnu* | \
+  linux-musl* | linux-uclibc* | uclinux-uclibc* | uclinux-gnu* | kfreebsd*-gnu* | \
   knetbsd*-gnu* | netbsd*-gnu* | \
   kopensolaris*-gnu* | \
   storm-chaos* | os2-emx* | rtmk-nova*)
     os=-$maybe_os
     basic_machine=`echo $1 | sed 's/^\(.*\)-\([^-]*-[^-]*\)$/\1/'`
     ;;
+  android-linux)
+    os=-linux-android
+    basic_machine=`echo $1 | sed 's/^\(.*\)-\([^-]*-[^-]*\)$/\1/'`-unknown
+    ;;
   *)
     basic_machine=`echo $1 | sed 's/-[^-]*$//'`
     if [ $basic_machine != $1 ]
@@ -154,7 +156,7 @@ case $os in
 	-convergent* | -ncr* | -news | -32* | -3600* | -3100* | -hitachi* |\
 	-c[123]* | -convex* | -sun | -crds | -omron* | -dg | -ultra | -tti* | \
 	-harris | -dolphin | -highlevel | -gould | -cbm | -ns | -masscomp | \
-	-apple | -axis | -knuth | -cray | -microblaze)
+	-apple | -axis | -knuth | -cray | -microblaze*)
 		os=
 		basic_machine=$1
 		;;
@@ -223,6 +225,12 @@ case $os in
 	-isc*)
 		basic_machine=`echo $1 | sed -e 's/86-.*/86-pc/'`
 		;;
+	-lynx*178)
+		os=-lynxos178
+		;;
+	-lynx*5)
+		os=-lynxos5
+		;;
 	-lynx*)
 		os=-lynxos
 		;;
@@ -247,20 +255,27 @@ case $basic_machine in
 	# Some are omitted here because they have special meanings below.
 	1750a | 580 \
 	| a29k \
+	| aarch64 | aarch64_be \
 	| alpha | alphaev[4-8] | alphaev56 | alphaev6[78] | alphapca5[67] \
 	| alpha64 | alpha64ev[4-8] | alpha64ev56 | alpha64ev6[78] | alpha64pca5[67] \
 	| am33_2.0 \
-	| arc | arm | arm[bl]e | arme[lb] | armv[2345] | armv[345][lb] | avr | avr32 \
+	| arc \
+	| arm | arm[bl]e | arme[lb] | armv[2-8] | armv[3-8][lb] | armv7[arm] \
+	| avr | avr32 \
+	| be32 | be64 \
 	| bfin \
 	| c4x | clipper \
 	| d10v | d30v | dlx | dsp16xx | dvp \
+	| epiphany \
 	| fido | fr30 | frv \
 	| h8300 | h8500 | hppa | hppa1.[01] | hppa2.0 | hppa2.0[nw] | hppa64 \
+	| hexagon \
 	| i370 | i860 | i960 | ia64 \
 	| ip2k | iq2000 \
+	| le32 | le64 \
 	| lm32 \
 	| m32c | m32r | m32rle | m68000 | m68k | m88k \
-	| maxq | mb | microblaze | mcore | mep | metag \
+	| maxq | mb | microblaze | microblazeel | mcore | mep | metag \
 	| mips | mipsbe | mipseb | mipsel | mipsle \
 	| mips16 \
 	| mips64 | mips64el \
@@ -286,22 +301,23 @@ case $basic_machine in
 	| nds32 | nds32le | nds32be \
 	| nios | nios2 \
 	| ns16k | ns32k \
+	| open8 \
 	| or32 \
 	| pdp10 | pdp11 | pj | pjl \
-	| powerpc | powerpc64 | powerpc64le | powerpcle | ppcbe \
+	| powerpc | powerpc64 | powerpc64le | powerpcle \
 	| pyramid \
-	| rx \
+	| rl78 | rx \
 	| score \
 	| sh | sh[1234] | sh[24]a | sh[24]aeb | sh[23]e | sh[34]eb | sheb | shbe | shle | sh[1234]le | sh3ele \
 	| sh64 | sh64le \
 	| sparc | sparc64 | sparc64b | sparc64v | sparc86x | sparclet | sparclite \
 	| sparcv8 | sparcv9 | sparcv9b | sparcv9v \
-	| spu | strongarm \
-	| tahoe | thumb | tic4x | tic54x | tic55x | tic6x | tic80 | tron \
+	| spu \
+	| tahoe | tic4x | tic54x | tic55x | tic6x | tic80 | tron \
 	| ubicom32 \
-	| v850 | v850e \
+	| v850 | v850e | v850e1 | v850e2 | v850es | v850e2v3 \
 	| we32k \
-	| x86 | xc16x | xscale | xscalee[bl] | xstormy16 | xtensa \
+	| x86 | xc16x | xstormy16 | xtensa \
 	| z8k | z80)
 		basic_machine=$basic_machine-unknown
 		;;
@@ -314,8 +330,7 @@ case $basic_machine in
 	c6x)
 		basic_machine=tic6x-unknown
 		;;
-	m6811 | m68hc11 | m6812 | m68hc12 | picochip)
-		# Motorola 68HC11/12.
+	m6811 | m68hc11 | m6812 | m68hc12 | m68hcs12x | picochip)
 		basic_machine=$basic_machine-unknown
 		os=-none
 		;;
@@ -325,6 +340,21 @@ case $basic_machine in
 		basic_machine=mt-unknown
 		;;
 
+	strongarm | thumb | xscale)
+		basic_machine=arm-unknown
+		;;
+	xgate)
+		basic_machine=$basic_machine-unknown
+		os=-none
+		;;
+	xscaleeb)
+		basic_machine=armeb-unknown
+		;;
+
+	xscaleel)
+		basic_machine=armel-unknown
+		;;
+
 	# We use `pc' rather than `unknown'
 	# because (1) that's what they normally are, and
 	# (2) the word "unknown" tends to confuse beginning users.
@@ -339,11 +369,13 @@ case $basic_machine in
 	# Recognize the basic CPU types with company name.
 	580-* \
 	| a29k-* \
+	| aarch64-* | aarch64_be-* \
 	| alpha-* | alphaev[4-8]-* | alphaev56-* | alphaev6[78]-* \
 	| alpha64-* | alpha64ev[4-8]-* | alpha64ev56-* | alpha64ev6[78]-* \
 	| alphapca5[67]-* | alpha64pca5[67]-* | arc-* \
 	| arm-*  | armbe-* | armle-* | armeb-* | armv*-* \
 	| avr-* | avr32-* \
+	| be32-* | be64-* \
 	| bfin-* | bs2000-* \
 	| c[123]* | c30-* | [cjt]90-* | c4x-* \
 	| clipper-* | craynv-* | cydra-* \
@@ -352,12 +384,15 @@ case $basic_machine in
 	| f30[01]-* | f700-* | fido-* | fr30-* | frv-* | fx80-* \
 	| h8300-* | h8500-* \
 	| hppa-* | hppa1.[01]-* | hppa2.0-* | hppa2.0[nw]-* | hppa64-* \
+	| hexagon-* \
 	| i*86-* | i860-* | i960-* | ia64-* \
 	| ip2k-* | iq2000-* \
+	| le32-* | le64-* \
 	| lm32-* \
 	| m32c-* | m32r-* | m32rle-* \
 	| m68000-* | m680[012346]0-* | m68360-* | m683?2-* | m68k-* \
-	| m88110-* | m88k-* | maxq-* | mcore-* | metag-* | microblaze-* \
+	| m88110-* | m88k-* | maxq-* | mcore-* | metag-* \
+	| microblaze-* | microblazeel-* \
 	| mips-* | mipsbe-* | mipseb-* | mipsel-* | mipsle-* \
 	| mips16-* \
 	| mips64-* | mips64el-* \
@@ -382,24 +417,26 @@ case $basic_machine in
 	| nds32-* | nds32le-* | nds32be-* \
 	| nios-* | nios2-* \
 	| none-* | np1-* | ns16k-* | ns32k-* \
+	| open8-* \
 	| orion-* \
 	| pdp10-* | pdp11-* | pj-* | pjl-* | pn-* | power-* \
-	| powerpc-* | powerpc64-* | powerpc64le-* | powerpcle-* | ppcbe-* \
+	| powerpc-* | powerpc64-* | powerpc64le-* | powerpcle-* \
 	| pyramid-* \
-	| romp-* | rs6000-* | rx-* \
+	| rl78-* | romp-* | rs6000-* | rx-* \
 	| sh-* | sh[1234]-* | sh[24]a-* | sh[24]aeb-* | sh[23]e-* | sh[34]eb-* | sheb-* | shbe-* \
 	| shle-* | sh[1234]le-* | sh3ele-* | sh64-* | sh64le-* \
 	| sparc-* | sparc64-* | sparc64b-* | sparc64v-* | sparc86x-* | sparclet-* \
 	| sparclite-* \
-	| sparcv8-* | sparcv9-* | sparcv9b-* | sparcv9v-* | strongarm-* | sv1-* | sx?-* \
-	| tahoe-* | thumb-* \
+	| sparcv8-* | sparcv9-* | sparcv9b-* | sparcv9v-* | sv1-* | sx?-* \
+	| tahoe-* \
 	| tic30-* | tic4x-* | tic54x-* | tic55x-* | tic6x-* | tic80-* \
-	| tile-* | tilegx-* \
+	| tile*-* \
 	| tron-* \
 	| ubicom32-* \
-	| v850-* | v850e-* | vax-* \
+	| v850-* | v850e-* | v850e1-* | v850es-* | v850e2-* | v850e2v3-* \
+	| vax-* \
 	| we32k-* \
-	| x86-* | x86_64-* | xc16x-* | xps100-* | xscale-* | xscalee[bl]-* \
+	| x86-* | x86_64-* | xc16x-* | xps100-* \
 	| xstormy16-* | xtensa*-* \
 	| ymp-* \
 	| z8k-* | z80-*)
@@ -697,7 +734,6 @@ case $basic_machine in
 	i370-ibm* | ibm*)
 		basic_machine=i370-ibm
 		;;
-# I'm not sure what "Sysv32" means.  Should this be sysv3.2?
 	i*86v32)
 		basic_machine=`echo $1 | sed -e 's/86.*/86-pc/'`
 		os=-sysv32
@@ -755,9 +791,13 @@ case $basic_machine in
 		basic_machine=ns32k-utek
 		os=-sysv
 		;;
-	microblaze)
+	microblaze*)
 		basic_machine=microblaze-xilinx
 		;;
+	mingw64)
+		basic_machine=x86_64-pc
+		os=-mingw64
+		;;
 	mingw32)
 		basic_machine=i386-pc
 		os=-mingw32
@@ -812,10 +852,18 @@ case $basic_machine in
 	ms1-*)
 		basic_machine=`echo $basic_machine | sed -e 's/ms1-/mt-/'`
 		;;
+	msys)
+		basic_machine=i386-pc
+		os=-msys
+		;;
 	mvs)
 		basic_machine=i370-ibm
 		os=-mvs
 		;;
+	nacl)
+		basic_machine=le32-unknown
+		os=-nacl
+		;;
 	ncr3000)
 		basic_machine=i486-ncr
 		os=-sysv4
@@ -968,9 +1016,10 @@ case $basic_machine in
 		;;
 	power)	basic_machine=power-ibm
 		;;
-	ppc)	basic_machine=powerpc-unknown
+	ppc | ppcbe)	basic_machine=powerpc-unknown
 		;;
-	ppc-*)	basic_machine=powerpc-`echo $basic_machine | sed 's/^[^-]*-//'`
+	ppc-* | ppcbe-*)
+		basic_machine=powerpc-`echo $basic_machine | sed 's/^[^-]*-//'`
 		;;
 	ppcle | powerpclittle | ppc-le | powerpc-little)
 		basic_machine=powerpcle-unknown
@@ -1064,6 +1113,9 @@ case $basic_machine in
 		basic_machine=i860-stratus
 		os=-sysv4
 		;;
+	strongarm-* | thumb-*)
+		basic_machine=arm-`echo $basic_machine | sed 's/^[^-]*-//'`
+		;;
 	sun2)
 		basic_machine=m68000-sun
 		;;
@@ -1120,13 +1172,8 @@ case $basic_machine in
 		basic_machine=t90-cray
 		os=-unicos
 		;;
-	# This must be matched before tile*.
-	tilegx*)
-		basic_machine=tilegx-unknown
-		os=-linux-gnu
-		;;
 	tile*)
-		basic_machine=tile-unknown
+		basic_machine=$basic_machine-unknown
 		os=-linux-gnu
 		;;
 	tx39)
@@ -1196,6 +1243,9 @@ case $basic_machine in
 	xps | xps100)
 		basic_machine=xps100-honeywell
 		;;
+	xscale-* | xscalee[bl]-*)
+		basic_machine=`echo $basic_machine | sed 's/^xscale/arm/'`
+		;;
 	ymp)
 		basic_machine=ymp-cray
 		os=-unicos
@@ -1327,15 +1377,15 @@ case $os in
 	      | -nindy* | -vxsim* | -vxworks* | -ebmon* | -hms* | -mvs* \
 	      | -clix* | -riscos* | -uniplus* | -iris* | -rtu* | -xenix* \
 	      | -hiux* | -386bsd* | -knetbsd* | -mirbsd* | -netbsd* \
-	      | -openbsd* | -solidbsd* \
+	      | -bitrig* | -openbsd* | -solidbsd* \
 	      | -ekkobsd* | -kfreebsd* | -freebsd* | -riscix* | -lynxos* \
 	      | -bosx* | -nextstep* | -cxux* | -aout* | -elf* | -oabi* \
 	      | -ptx* | -coff* | -ecoff* | -winnt* | -domain* | -vsta* \
 	      | -udi* | -eabi* | -lites* | -ieee* | -go32* | -aux* \
 	      | -chorusos* | -chorusrdb* | -cegcc* \
-	      | -cygwin* | -pe* | -psos* | -moss* | -proelf* | -rtems* \
-	      | -mingw32* | -linux-gnu* | -linux-android* \
-	      | -linux-newlib* | -linux-uclibc* \
+	      | -cygwin* | -msys* | -pe* | -psos* | -moss* | -proelf* | -rtems* \
+	      | -mingw32* | -mingw64* | -linux-gnu* | -linux-android* \
+	      | -linux-newlib* | -linux-musl* | -linux-uclibc* \
 	      | -uxpv* | -beos* | -mpeix* | -udk* \
 	      | -interix* | -uwin* | -mks* | -rhapsody* | -darwin* | -opened* \
 	      | -openstep* | -oskit* | -conix* | -pw32* | -nonstopux* \
@@ -1518,6 +1568,9 @@ case $basic_machine in
 	c4x-* | tic4x-*)
 		os=-coff
 		;;
+	hexagon-*)
+		os=-elf
+		;;
 	tic54x-*)
 		os=-coff
 		;;
@@ -1545,9 +1598,6 @@ case $basic_machine in
 		;;
 	m68000-sun)
 		os=-sunos3
-		# This also exists in the configure program, but was not the
-		# default.
-		# os=-sunos4
 		;;
 	m68*-cisco)
 		os=-aout
diff --git a/support/gnuconfig/patches/config.guess.uclibc.patch b/support/gnuconfig/patches/0001-config-add-support-for-uClibc.patch
similarity index 67%
rename from support/gnuconfig/patches/config.guess.uclibc.patch
rename to support/gnuconfig/patches/0001-config-add-support-for-uClibc.patch
index 85f9b89..3627e8e 100644
--- a/support/gnuconfig/patches/config.guess.uclibc.patch
+++ b/support/gnuconfig/patches/0001-config-add-support-for-uClibc.patch
@@ -1,6 +1,18 @@
---- config.guess
-+++ config.guess
-@@ -140,6 +141,23 @@ UNAME_RELEASE=`(uname -r) 2>/dev/null` || UNAME_RELEASE=unknown
+From eee83aa62993b15b7f460cca9583cd69a15b5357 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Thu, 15 Nov 2012 17:01:13 +0100
+Subject: [PATCH 1/2] config: add support for uClibc
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ config.guess |   70 ++++++++++++++++++++++++++++++++++++----------------------
+ 1 file changed, 43 insertions(+), 27 deletions(-)
+
+diff --git a/config.guess b/config.guess
+index 872b96a..9509179 100755
+--- a/config.guess
++++ b/config.guess
+@@ -138,6 +138,23 @@ UNAME_RELEASE=`(uname -r) 2>/dev/null` || UNAME_RELEASE=unknown
  UNAME_SYSTEM=`(uname -s) 2>/dev/null`  || UNAME_SYSTEM=unknown
  UNAME_VERSION=`(uname -v) 2>/dev/null` || UNAME_VERSION=unknown
  
@@ -24,7 +36,21 @@
  # Note: order is significant - the case branches are not exclusive.
  
  case "${UNAME_MACHINE}:${UNAME_SYSTEM}:${UNAME_RELEASE}:${UNAME_VERSION}" in
-@@ -872,33 +890,32 @@ EOF
+@@ -869,11 +886,11 @@ EOF
+ 	echo ${UNAME_MACHINE}-pc-minix
+ 	exit ;;
+     aarch64:Linux:*:*)
+-	echo ${UNAME_MACHINE}-unknown-linux-gnu
++	echo ${UNAME_MACHINE}-unknown-linux-${LIBC}
+ 	exit ;;
+     aarch64_be:Linux:*:*)
+ 	UNAME_MACHINE=aarch64_be
+-	echo ${UNAME_MACHINE}-unknown-linux-gnu
++	echo ${UNAME_MACHINE}-unknown-linux-${LIBC}
+ 	exit ;;
+     alpha:Linux:*:*)
+ 	case `sed -n '/^cpu model/s/^.*: \(.*\)/\1/p' < /proc/cpuinfo` in
+@@ -886,15 +903,15 @@ EOF
  	  EV68*) UNAME_MACHINE=alphaev68 ;;
  	esac
  	objdump --private-headers /bin/sh | grep -q ld.so.1
@@ -41,7 +67,9 @@
 -	    echo ${UNAME_MACHINE}-unknown-linux-gnu
 +	    echo ${UNAME_MACHINE}-unknown-linux-${LIBC}
  	else
- 	    echo ${UNAME_MACHINE}-unknown-linux-gnueabi
+ 	    if echo __ARM_PCS_VFP | $CC_FOR_BUILD -E - 2>/dev/null \
+ 		| grep -q __ARM_PCS_VFP
+@@ -906,22 +923,21 @@ EOF
  	fi
  	exit ;;
      avr32*:Linux:*:*)
@@ -49,23 +77,27 @@
 +	echo ${UNAME_MACHINE}-unknown-linux-${LIBC}
  	exit ;;
      cris:Linux:*:*)
--	echo cris-axis-linux-gnu
-+	echo cris-axis-linux-${LIBC}
+-	echo ${UNAME_MACHINE}-axis-linux-gnu
++	echo ${UNAME_MACHINE}-axis-linux-${LIBC}
  	exit ;;
      crisv32:Linux:*:*)
--	echo crisv32-axis-linux-gnu
-+	echo crisv32-axis-linux-${LIBC}
+-	echo ${UNAME_MACHINE}-axis-linux-gnu
++	echo ${UNAME_MACHINE}-axis-linux-${LIBC}
  	exit ;;
      frv:Linux:*:*)
--	echo frv-unknown-linux-gnu
-+	echo frv-unknown-linux-${LIBC}
+-	echo ${UNAME_MACHINE}-unknown-linux-gnu
++	echo ${UNAME_MACHINE}-unknown-linux-${LIBC}
+ 	exit ;;
+     hexagon:Linux:*:*)
+-	echo ${UNAME_MACHINE}-unknown-linux-gnu
++	echo ${UNAME_MACHINE}-unknown-linux-${LIBC}
  	exit ;;
      i*86:Linux:*:*)
 -	LIBC=gnu
  	eval $set_cc_for_build
  	sed 's/^	//' << EOF >$dummy.c
  	#ifdef __dietlibc__
-@@ -909,13 +926,13 @@ EOF
+@@ -932,13 +948,13 @@ EOF
  	echo "${UNAME_MACHINE}-pc-linux-${LIBC}"
  	exit ;;
      ia64:Linux:*:*)
@@ -82,7 +114,7 @@
  	exit ;;
      mips:Linux:*:* | mips64:Linux:*:*)
  	eval $set_cc_for_build
-@@ -934,10 +951,10 @@ EOF
+@@ -957,10 +973,10 @@ EOF
  	#endif
  EOF
  	eval `$CC_FOR_BUILD -E $dummy.c 2>/dev/null | grep '^CPU'`
@@ -90,12 +122,12 @@
 +	test x"${CPU}" != x && { echo "${CPU}-unknown-linux-${LIBC}"; exit; }
  	;;
      or32:Linux:*:*)
--	echo or32-unknown-linux-gnu
-+	echo or32-unknown-linux-${LIBC}
+-	echo ${UNAME_MACHINE}-unknown-linux-gnu
++	echo ${UNAME_MACHINE}-unknown-linux-${LIBC}
  	exit ;;
      padre:Linux:*:*)
  	echo sparc-unknown-linux-gnu
-@@ -948,40 +965,40 @@ EOF
+@@ -971,40 +987,40 @@ EOF
      parisc:Linux:*:* | hppa:Linux:*:*)
  	# Look for CPU level
  	case `grep '^cpu[^a-z]*:' /proc/cpuinfo 2>/dev/null | cut -d' ' -f2` in
@@ -131,15 +163,15 @@
 +	echo ${UNAME_MACHINE}-unknown-linux-${LIBC}
  	exit ;;
      tile*:Linux:*:*)
- 	echo ${UNAME_MACHINE}-tilera-linux-gnu
+ 	echo ${UNAME_MACHINE}-unknown-linux-gnu
  	exit ;;
      vax:Linux:*:*)
 -	echo ${UNAME_MACHINE}-dec-linux-gnu
 +	echo ${UNAME_MACHINE}-dec-linux-${LIBC}
  	exit ;;
      x86_64:Linux:*:*)
--	echo x86_64-unknown-linux-gnu
-+	echo x86_64-unknown-linux-${LIBC}
+-	echo ${UNAME_MACHINE}-unknown-linux-gnu
++	echo ${UNAME_MACHINE}-unknown-linux-${LIBC}
  	exit ;;
      xtensa*:Linux:*:*)
 -	echo ${UNAME_MACHINE}-unknown-linux-gnu
@@ -147,3 +179,6 @@
  	exit ;;
      i*86:DYNIX/ptx:4*:*)
  	# ptx 4.0 does uname -s correctly, with DYNIX/ptx in there.
+-- 
+1.7.9.5
+
diff --git a/support/gnuconfig/patches/config.sub.ps2.patch b/support/gnuconfig/patches/0002-config-add-support-for-ps2.patch
similarity index 60%
rename from support/gnuconfig/patches/config.sub.ps2.patch
rename to support/gnuconfig/patches/0002-config-add-support-for-ps2.patch
index 57d09dc..781b958 100644
--- a/support/gnuconfig/patches/config.sub.ps2.patch
+++ b/support/gnuconfig/patches/0002-config-add-support-for-ps2.patch
@@ -1,15 +1,27 @@
---- config.sub
-+++ config.sub
-@@ -253,7 +253,7 @@ case $basic_machine in
- 	| arc | arm | arm[bl]e | arme[lb] | armv[2345] | armv[345][lb] | avr | avr32 \
+From 144194fe916a14b630324c19f7b098109122bca2 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Thu, 15 Nov 2012 17:01:25 +0100
+Subject: [PATCH 2/2] config: add support for ps2
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ config.sub |   22 ++++++++++++++++++++--
+ 1 file changed, 20 insertions(+), 2 deletions(-)
+
+diff --git a/config.sub b/config.sub
+index 89b1286..8509813 100755
+--- a/config.sub
++++ b/config.sub
+@@ -265,7 +265,7 @@ case $basic_machine in
+ 	| be32 | be64 \
  	| bfin \
  	| c4x | clipper \
 -	| d10v | d30v | dlx | dsp16xx \
 +	| d10v | d30v | dlx | dsp16xx | dvp \
+ 	| epiphany \
  	| fido | fr30 | frv \
  	| h8300 | h8500 | hppa | hppa1.[01] | hppa2.0 | hppa2.0[nw] | hppa64 \
- 	| i370 | i860 | i960 | ia64 \
-@@ -773,6 +773,24 @@ case $basic_machine in
+@@ -813,6 +813,24 @@ case $basic_machine in
  		basic_machine=m68k-atari
  		os=-mint
  		;;
@@ -34,7 +46,7 @@
  	mips3*-*)
  		basic_machine=`echo $basic_machine | sed -e 's/mips3/mips64/'`
  		;;
-@@ -1325,7 +1343,7 @@ case $os in
+@@ -1375,7 +1393,7 @@ case $os in
  	      | -os2* | -vos* | -palmos* | -uclinux* | -nucleus* \
  	      | -morphos* | -superux* | -rtmk* | -rtmk-nova* | -windiss* \
  	      | -powermax* | -dnix* | -nx6 | -nx7 | -sei* | -dragonfly* \
@@ -43,3 +55,6 @@
  	# Remember, each alternative MUST END IN *, to match a version number.
  		;;
  	-qnx*)
+-- 
+1.7.9.5
+
