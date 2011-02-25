From: Will Newton <will.newton@gmail.com>
Date: Fri, 25 Feb 2011 17:46:37 +0000
Subject: [Buildroot] [PATCH 6/8] gnuconfig: Update patches to apply to
	2011-02-02 version.
Message-ID: <AANLkTim78SnpkxV1ZBxVTKJ9UW59V18OybssQzq6miQP@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Will Newton <will.newton@imgtec.com>
---
 .../gnuconfig/patches/config.guess.uclibc.patch    |  137 ++++++++------------
 package/gnuconfig/patches/config.sub.ps2.patch     |   19 +--
 2 files changed, 61 insertions(+), 95 deletions(-)

diff --git a/package/gnuconfig/patches/config.guess.uclibc.patch
b/package/gnuconfig/patches/config.guess.uclibc.patch
index 69d88a3..85f9b89 100644
--- a/package/gnuconfig/patches/config.guess.uclibc.patch
+++ b/package/gnuconfig/patches/config.guess.uclibc.patch
@@ -1,11 +1,6 @@
-Index: config.guess
-===================================================================
-RCS file: /cvsroot/config/config/config.guess,v
-retrieving revision 1.366
-diff -u -r1.366 config.guess
---- config.guess	17 May 2007 06:28:53 -0000	1.366
-+++ config.guess	9 Jul 2007 17:32:18 -0000
-@@ -139,6 +139,23 @@
+--- config.guess
++++ config.guess
+@@ -140,6 +141,23 @@ UNAME_RELEASE=`(uname -r) 2>/dev/null` ||
UNAME_RELEASE=unknown
  UNAME_SYSTEM=`(uname -s) 2>/dev/null`  || UNAME_SYSTEM=unknown
  UNAME_VERSION=`(uname -v) 2>/dev/null` || UNAME_VERSION=unknown

@@ -29,12 +24,25 @@ diff -u -r1.366 config.guess
  # Note: order is significant - the case branches are not exclusive.

  case "${UNAME_MACHINE}:${UNAME_SYSTEM}:${UNAME_RELEASE}:${UNAME_VERSION}" in
-@@ -833,28 +850,28 @@
- 	echo ${UNAME_MACHINE}-pc-minix
+@@ -872,33 +890,32 @@ EOF
+ 	  EV68*) UNAME_MACHINE=alphaev68 ;;
+ 	esac
+ 	objdump --private-headers /bin/sh | grep -q ld.so.1
+-	if test "$?" = 0 ; then LIBC="libc1" ; else LIBC="" ; fi
+-	echo ${UNAME_MACHINE}-unknown-linux-gnu${LIBC}
++	if test "$?" = 0 ; then LIBC="gnulibc1" ; fi
++	echo ${UNAME_MACHINE}-unknown-linux-${LIBC}
  	exit ;;
      arm*:Linux:*:*)
--	echo ${UNAME_MACHINE}-unknown-linux-gnu
-+	echo ${UNAME_MACHINE}-unknown-linux-${LIBC}
+ 	eval $set_cc_for_build
+ 	if echo __ARM_EABI__ | $CC_FOR_BUILD -E - 2>/dev/null \
+ 	    | grep -q __ARM_EABI__
+ 	then
+-	    echo ${UNAME_MACHINE}-unknown-linux-gnu
++	    echo ${UNAME_MACHINE}-unknown-linux-${LIBC}
+ 	else
+ 	    echo ${UNAME_MACHINE}-unknown-linux-gnueabi
+ 	fi
  	exit ;;
      avr32*:Linux:*:*)
 -	echo ${UNAME_MACHINE}-unknown-linux-gnu
@@ -49,8 +57,16 @@ diff -u -r1.366 config.guess
 +	echo crisv32-axis-linux-${LIBC}
  	exit ;;
      frv:Linux:*:*)
--    	echo frv-unknown-linux-gnu
-+    	echo frv-unknown-linux-${LIBC}
+-	echo frv-unknown-linux-gnu
++	echo frv-unknown-linux-${LIBC}
+ 	exit ;;
+     i*86:Linux:*:*)
+-	LIBC=gnu
+ 	eval $set_cc_for_build
+ 	sed 's/^	//' << EOF >$dummy.c
+ 	#ifdef __dietlibc__
+@@ -909,13 +926,13 @@ EOF
+ 	echo "${UNAME_MACHINE}-pc-linux-${LIBC}"
  	exit ;;
      ia64:Linux:*:*)
 -	echo ${UNAME_MACHINE}-unknown-linux-gnu
@@ -64,21 +80,12 @@ diff -u -r1.366 config.guess
 -	echo ${UNAME_MACHINE}-unknown-linux-gnu
 +	echo ${UNAME_MACHINE}-unknown-linux-${LIBC}
  	exit ;;
-     mips:Linux:*:*)
- 	eval $set_cc_for_build
-@@ -877,7 +894,7 @@
- 		s: ::g
- 		p
- 	    }'`"
--	test x"${CPU}" != x && { echo "${CPU}-unknown-linux-gnu"; exit; }
-+	test x"${CPU}" != x && { echo "${CPU}-unknown-linux-${LIBC}"; exit; }
- 	;;
-     mips64:Linux:*:*)
+     mips:Linux:*:* | mips64:Linux:*:*)
  	eval $set_cc_for_build
-@@ -900,16 +917,16 @@
- 		s: ::g
- 		p
- 	    }'`"
+@@ -934,10 +951,10 @@ EOF
+ 	#endif
+ EOF
+ 	eval `$CC_FOR_BUILD -E $dummy.c 2>/dev/null | grep '^CPU'`
 -	test x"${CPU}" != x && { echo "${CPU}-unknown-linux-gnu"; exit; }
 +	test x"${CPU}" != x && { echo "${CPU}-unknown-linux-${LIBC}"; exit; }
  	;;
@@ -86,25 +93,9 @@ diff -u -r1.366 config.guess
 -	echo or32-unknown-linux-gnu
 +	echo or32-unknown-linux-${LIBC}
  	exit ;;
-     ppc:Linux:*:*)
--	echo powerpc-unknown-linux-gnu
-+	echo powerpc-unknown-linux-${LIBC}
- 	exit ;;
-     ppc64:Linux:*:*)
--	echo powerpc64-unknown-linux-gnu
-+	echo powerpc64-unknown-linux-${LIBC}
- 	exit ;;
-     alpha:Linux:*:*)
- 	case `sed -n '/^cpu model/s/^.*: \(.*\)/\1/p' < /proc/cpuinfo` in
-@@ -922,40 +939,40 @@
- 	  EV68*) UNAME_MACHINE=alphaev68 ;;
-         esac
- 	objdump --private-headers /bin/sh | grep ld.so.1 >/dev/null
--	if test "$?" = 0 ; then LIBC="libc1" ; else LIBC="" ; fi
--	echo ${UNAME_MACHINE}-unknown-linux-gnu${LIBC}
-+	if test "$?" = 0 ; then LIBC="gnulibc1" ; fi
-+	echo ${UNAME_MACHINE}-unknown-linux-${LIBC}
- 	exit ;;
+     padre:Linux:*:*)
+ 	echo sparc-unknown-linux-gnu
+@@ -948,40 +965,40 @@ EOF
      parisc:Linux:*:* | hppa:Linux:*:*)
  	# Look for CPU level
  	case `grep '^cpu[^a-z]*:' /proc/cpuinfo 2>/dev/null | cut -d' ' -f2` in
@@ -116,15 +107,19 @@ diff -u -r1.366 config.guess
 +	  *)    echo hppa-unknown-linux-${LIBC} ;;
  	esac
  	exit ;;
-     parisc64:Linux:*:* | hppa64:Linux:*:*)
--	echo hppa64-unknown-linux-gnu
-+	echo hppa64-unknown-linux-${LIBC}
+     ppc64:Linux:*:*)
+-	echo powerpc64-unknown-linux-gnu
++	echo powerpc64-unknown-linux-${LIBC}
+ 	exit ;;
+     ppc:Linux:*:*)
+-	echo powerpc-unknown-linux-gnu
++	echo powerpc-unknown-linux-${LIBC}
  	exit ;;
      s390:Linux:*:* | s390x:Linux:*:*)
  	echo ${UNAME_MACHINE}-ibm-linux
  	exit ;;
      sh64*:Linux:*:*)
--    	echo ${UNAME_MACHINE}-unknown-linux-gnu
+-	echo ${UNAME_MACHINE}-unknown-linux-gnu
 +	echo ${UNAME_MACHINE}-unknown-linux-${LIBC}
  	exit ;;
      sh*:Linux:*:*)
@@ -135,6 +130,9 @@ diff -u -r1.366 config.guess
 -	echo ${UNAME_MACHINE}-unknown-linux-gnu
 +	echo ${UNAME_MACHINE}-unknown-linux-${LIBC}
  	exit ;;
+     tile*:Linux:*:*)
+ 	echo ${UNAME_MACHINE}-tilera-linux-gnu
+ 	exit ;;
      vax:Linux:*:*)
 -	echo ${UNAME_MACHINE}-dec-linux-gnu
 +	echo ${UNAME_MACHINE}-dec-linux-${LIBC}
@@ -143,36 +141,9 @@ diff -u -r1.366 config.guess
 -	echo x86_64-unknown-linux-gnu
 +	echo x86_64-unknown-linux-${LIBC}
  	exit ;;
-     xtensa:Linux:*:*)
--    	echo xtensa-unknown-linux-gnu
-+    	echo xtensa-unknown-linux-${LIBC}
+     xtensa*:Linux:*:*)
+-	echo ${UNAME_MACHINE}-unknown-linux-gnu
++	echo ${UNAME_MACHINE}-unknown-linux-${LIBC}
  	exit ;;
-     i*86:Linux:*:*)
- 	# The BFD linker knows what the default object file format is, so
-@@ -970,20 +987,22 @@
- 				    p'`
-         case "$ld_supported_targets" in
- 	  elf32-i386)
--		TENTATIVE="${UNAME_MACHINE}-pc-linux-gnu"
-+		TENTATIVE="${UNAME_MACHINE}-pc-linux-${LIBC}"
- 		;;
- 	  a.out-i386-linux)
--		echo "${UNAME_MACHINE}-pc-linux-gnuaout"
-+		echo "${UNAME_MACHINE}-pc-linux-${LIBC}aout"
- 		exit ;;
- 	  coff-i386)
--		echo "${UNAME_MACHINE}-pc-linux-gnucoff"
-+		echo "${UNAME_MACHINE}-pc-linux-${LIBC}coff"
- 		exit ;;
- 	  "")
- 		# Either a pre-BFD a.out linker (linux-gnuoldld) or
- 		# one that does not give us useful --help.
--		echo "${UNAME_MACHINE}-pc-linux-gnuoldld"
-+		echo "${UNAME_MACHINE}-pc-linux-${LIBC}oldld"
- 		exit ;;
- 	esac
-+	# This should get integrated into the C code below, but now we hack
-+	if [ "$LIBC" != "gnu" ] ; then echo "$TENTATIVE" && exit 0 ; fi
- 	# Determine whether the default compiler is a.out or elf
- 	eval $set_cc_for_build
- 	sed 's/^	//' << EOF >$dummy.c
+     i*86:DYNIX/ptx:4*:*)
+ 	# ptx 4.0 does uname -s correctly, with DYNIX/ptx in there.
diff --git a/package/gnuconfig/patches/config.sub.ps2.patch
b/package/gnuconfig/patches/config.sub.ps2.patch
index ac8dbc6..57d09dc 100644
--- a/package/gnuconfig/patches/config.sub.ps2.patch
+++ b/package/gnuconfig/patches/config.sub.ps2.patch
@@ -1,11 +1,6 @@
-Index: config.sub
-===================================================================
-RCS file: /cvsroot/config/config/config.sub,v
-retrieving revision 1.356
-diff -u -r1.356 config.sub
---- config.sub	28 Jun 2007 06:56:43 -0000	1.356
-+++ config.sub	9 Jul 2007 17:43:32 -0000
-@@ -244,7 +244,7 @@
+--- config.sub
++++ config.sub
+@@ -253,7 +253,7 @@ case $basic_machine in
  	| arc | arm | arm[bl]e | arme[lb] | armv[2345] | armv[345][lb] |
avr | avr32 \
  	| bfin \
  	| c4x | clipper \
@@ -14,7 +9,7 @@ diff -u -r1.356 config.sub
  	| fido | fr30 | frv \
  	| h8300 | h8500 | hppa | hppa1.[01] | hppa2.0 | hppa2.0[nw] | hppa64 \
  	| i370 | i860 | i960 | ia64 \
-@@ -694,6 +694,24 @@
+@@ -773,6 +773,24 @@ case $basic_machine in
  		basic_machine=m68k-atari
  		os=-mint
  		;;
@@ -39,12 +34,12 @@ diff -u -r1.356 config.sub
  	mips3*-*)
  		basic_machine=`echo $basic_machine | sed -e 's/mips3/mips64/'`
  		;;
-@@ -1226,7 +1244,7 @@
+@@ -1325,7 +1343,7 @@ case $os in
  	      | -os2* | -vos* | -palmos* | -uclinux* | -nucleus* \
  	      | -morphos* | -superux* | -rtmk* | -rtmk-nova* | -windiss* \
  	      | -powermax* | -dnix* | -nx6 | -nx7 | -sei* | -dragonfly* \
--	      | -skyos* | -haiku* | -rdos* | -toppers* | -drops*)
-+	      | -skyos* | -haiku* | -rdos* | -toppers* | -drops* | -irx*)
+-	      | -skyos* | -haiku* | -rdos* | -toppers* | -drops* | -es*)
++	      | -skyos* | -haiku* | -rdos* | -toppers* | -drops* | -es* | -irx*)
  	# Remember, each alternative MUST END IN *, to match a version number.
  		;;
  	-qnx*)
-- 
1.7.3.4
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0006-gnuconfig-Update-patches-to-apply-to-2011-02-02-vers.patch
Type: text/x-patch
Size: 9085 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110225/5c9563b0/attachment-0001.bin>
