From: Will Newton <will.newton@gmail.com>
Date: Fri, 25 Feb 2011 17:46:40 +0000
Subject: [Buildroot] [PATCH 7/8] gnuconfig: Apply patches to config.{sub,
	guess}.
Message-ID: <AANLkTin7pWpxrvk6uk10tQnyKZQDfB=_nBBLPwfx3Kx6@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Will Newton <will.newton@imgtec.com>
---
 package/gnuconfig/config.guess |   64 +++++++++++++++++++++++++---------------
 package/gnuconfig/config.sub   |   22 ++++++++++++-
 2 files changed, 60 insertions(+), 26 deletions(-)

diff --git a/package/gnuconfig/config.guess b/package/gnuconfig/config.guess
index 187cd54..40cf0af 100755
--- a/package/gnuconfig/config.guess
+++ b/package/gnuconfig/config.guess
@@ -140,6 +140,23 @@ UNAME_RELEASE=`(uname -r) 2>/dev/null` ||
UNAME_RELEASE=unknown
 UNAME_SYSTEM=`(uname -s) 2>/dev/null`  || UNAME_SYSTEM=unknown
 UNAME_VERSION=`(uname -v) 2>/dev/null` || UNAME_VERSION=unknown

+if [ "${UNAME_SYSTEM}" = "Linux" ] ; then
+	eval $set_cc_for_build
+	cat << EOF > $dummy.c
+	#include <features.h>
+	#ifdef __UCLIBC__
+	# ifdef __UCLIBC_CONFIG_VERSION__
+	LIBC=uclibc __UCLIBC_CONFIG_VERSION__
+	# else
+	LIBC=uclibc
+	# endif
+	#else
+	LIBC=gnu
+	#endif
+EOF
+	eval `$CC_FOR_BUILD -E $dummy.c 2>/dev/null | grep LIBC= | sed -e 's: ::g'`
+fi
+
 # Note: order is significant - the case branches are not exclusive.

 case "${UNAME_MACHINE}:${UNAME_SYSTEM}:${UNAME_RELEASE}:${UNAME_VERSION}" in
@@ -872,33 +889,32 @@ EOF
 	  EV68*) UNAME_MACHINE=alphaev68 ;;
 	esac
 	objdump --private-headers /bin/sh | grep -q ld.so.1
-	if test "$?" = 0 ; then LIBC="libc1" ; else LIBC="" ; fi
-	echo ${UNAME_MACHINE}-unknown-linux-gnu${LIBC}
+	if test "$?" = 0 ; then LIBC="gnulibc1" ; fi
+	echo ${UNAME_MACHINE}-unknown-linux-${LIBC}
 	exit ;;
     arm*:Linux:*:*)
 	eval $set_cc_for_build
 	if echo __ARM_EABI__ | $CC_FOR_BUILD -E - 2>/dev/null \
 	    | grep -q __ARM_EABI__
 	then
-	    echo ${UNAME_MACHINE}-unknown-linux-gnu
+	    echo ${UNAME_MACHINE}-unknown-linux-${LIBC}
 	else
 	    echo ${UNAME_MACHINE}-unknown-linux-gnueabi
 	fi
 	exit ;;
     avr32*:Linux:*:*)
-	echo ${UNAME_MACHINE}-unknown-linux-gnu
+	echo ${UNAME_MACHINE}-unknown-linux-${LIBC}
 	exit ;;
     cris:Linux:*:*)
-	echo cris-axis-linux-gnu
+	echo cris-axis-linux-${LIBC}
 	exit ;;
     crisv32:Linux:*:*)
-	echo crisv32-axis-linux-gnu
+	echo crisv32-axis-linux-${LIBC}
 	exit ;;
     frv:Linux:*:*)
-	echo frv-unknown-linux-gnu
+	echo frv-unknown-linux-${LIBC}
 	exit ;;
     i*86:Linux:*:*)
-	LIBC=gnu
 	eval $set_cc_for_build
 	sed 's/^	//' << EOF >$dummy.c
 	#ifdef __dietlibc__
@@ -909,13 +925,13 @@ EOF
 	echo "${UNAME_MACHINE}-pc-linux-${LIBC}"
 	exit ;;
     ia64:Linux:*:*)
-	echo ${UNAME_MACHINE}-unknown-linux-gnu
+	echo ${UNAME_MACHINE}-unknown-linux-${LIBC}
 	exit ;;
     m32r*:Linux:*:*)
-	echo ${UNAME_MACHINE}-unknown-linux-gnu
+	echo ${UNAME_MACHINE}-unknown-linux-${LIBC}
 	exit ;;
     m68*:Linux:*:*)
-	echo ${UNAME_MACHINE}-unknown-linux-gnu
+	echo ${UNAME_MACHINE}-unknown-linux-${LIBC}
 	exit ;;
     mips:Linux:*:* | mips64:Linux:*:*)
 	eval $set_cc_for_build
@@ -934,10 +950,10 @@ EOF
 	#endif
 EOF
 	eval `$CC_FOR_BUILD -E $dummy.c 2>/dev/null | grep '^CPU'`
-	test x"${CPU}" != x && { echo "${CPU}-unknown-linux-gnu"; exit; }
+	test x"${CPU}" != x && { echo "${CPU}-unknown-linux-${LIBC}"; exit; }
 	;;
     or32:Linux:*:*)
-	echo or32-unknown-linux-gnu
+	echo or32-unknown-linux-${LIBC}
 	exit ;;
     padre:Linux:*:*)
 	echo sparc-unknown-linux-gnu
@@ -948,40 +964,40 @@ EOF
     parisc:Linux:*:* | hppa:Linux:*:*)
 	# Look for CPU level
 	case `grep '^cpu[^a-z]*:' /proc/cpuinfo 2>/dev/null | cut -d' ' -f2` in
-	  PA7*) echo hppa1.1-unknown-linux-gnu ;;
-	  PA8*) echo hppa2.0-unknown-linux-gnu ;;
-	  *)    echo hppa-unknown-linux-gnu ;;
+	  PA7*) echo hppa1.1-unknown-linux-${LIBC} ;;
+	  PA8*) echo hppa2.0-unknown-linux-${LIBC} ;;
+	  *)    echo hppa-unknown-linux-${LIBC} ;;
 	esac
 	exit ;;
     ppc64:Linux:*:*)
-	echo powerpc64-unknown-linux-gnu
+	echo powerpc64-unknown-linux-${LIBC}
 	exit ;;
     ppc:Linux:*:*)
-	echo powerpc-unknown-linux-gnu
+	echo powerpc-unknown-linux-${LIBC}
 	exit ;;
     s390:Linux:*:* | s390x:Linux:*:*)
 	echo ${UNAME_MACHINE}-ibm-linux
 	exit ;;
     sh64*:Linux:*:*)
-	echo ${UNAME_MACHINE}-unknown-linux-gnu
+	echo ${UNAME_MACHINE}-unknown-linux-${LIBC}
 	exit ;;
     sh*:Linux:*:*)
-	echo ${UNAME_MACHINE}-unknown-linux-gnu
+	echo ${UNAME_MACHINE}-unknown-linux-${LIBC}
 	exit ;;
     sparc:Linux:*:* | sparc64:Linux:*:*)
-	echo ${UNAME_MACHINE}-unknown-linux-gnu
+	echo ${UNAME_MACHINE}-unknown-linux-${LIBC}
 	exit ;;
     tile*:Linux:*:*)
 	echo ${UNAME_MACHINE}-tilera-linux-gnu
 	exit ;;
     vax:Linux:*:*)
-	echo ${UNAME_MACHINE}-dec-linux-gnu
+	echo ${UNAME_MACHINE}-dec-linux-${LIBC}
 	exit ;;
     x86_64:Linux:*:*)
-	echo x86_64-unknown-linux-gnu
+	echo x86_64-unknown-linux-${LIBC}
 	exit ;;
     xtensa*:Linux:*:*)
-	echo ${UNAME_MACHINE}-unknown-linux-gnu
+	echo ${UNAME_MACHINE}-unknown-linux-${LIBC}
 	exit ;;
     i*86:DYNIX/ptx:4*:*)
 	# ptx 4.0 does uname -s correctly, with DYNIX/ptx in there.
diff --git a/package/gnuconfig/config.sub b/package/gnuconfig/config.sub
index 0ef29b0..8ad167c 100755
--- a/package/gnuconfig/config.sub
+++ b/package/gnuconfig/config.sub
@@ -253,7 +253,7 @@ case $basic_machine in
 	| arc | arm | arm[bl]e | arme[lb] | armv[2345] | armv[345][lb] | avr | avr32 \
 	| bfin \
 	| c4x | clipper \
-	| d10v | d30v | dlx | dsp16xx \
+	| d10v | d30v | dlx | dsp16xx | dvp \
 	| fido | fr30 | frv \
 	| h8300 | h8500 | hppa | hppa1.[01] | hppa2.0 | hppa2.0[nw] | hppa64 \
 	| i370 | i860 | i960 | ia64 \
@@ -773,6 +773,24 @@ case $basic_machine in
 		basic_machine=m68k-atari
 		os=-mint
 		;;
+	mipsEE* | ee | ps2)
+		basic_machine=mips64r5900el-scei
+		case $os in
+		    -linux*)
+			;;
+		    *)
+			os=-elf
+			;;
+		esac
+		;;
+	iop)
+		basic_machine=mipsel-scei
+		os=-irx
+		;;
+	dvp)
+		basic_machine=dvp-scei
+		os=-elf
+		;;
 	mips3*-*)
 		basic_machine=`echo $basic_machine | sed -e 's/mips3/mips64/'`
 		;;
@@ -1325,7 +1343,7 @@ case $os in
 	      | -os2* | -vos* | -palmos* | -uclinux* | -nucleus* \
 	      | -morphos* | -superux* | -rtmk* | -rtmk-nova* | -windiss* \
 	      | -powermax* | -dnix* | -nx6 | -nx7 | -sei* | -dragonfly* \
-	      | -skyos* | -haiku* | -rdos* | -toppers* | -drops* | -es*)
+	      | -skyos* | -haiku* | -rdos* | -toppers* | -drops* | -es* | -irx*)
 	# Remember, each alternative MUST END IN *, to match a version number.
 		;;
 	-qnx*)
-- 
1.7.3.4
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0007-gnuconfig-Apply-patches-to-config.-sub-guess.patch
Type: text/x-patch
Size: 6456 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110225/e829b89f/attachment.bin>
