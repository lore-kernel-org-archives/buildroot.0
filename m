From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  9 May 2020 13:00:39 +0200
Subject: [Buildroot] [PATCH 3/3] support/gnuconfig: update
In-Reply-To: <cover.1589022016.git.yann.morin.1998@free.fr>
References: <cover.1589022016.git.yann.morin.1998@free.fr>
Message-ID: <0c4bc29d6423a6791afcf37fa05d27f855247355.1589022016.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/gnuconfig/README.buildroot |  2 +-
 support/gnuconfig/config.guess     | 80 ++++++++++++++++++------------
 support/gnuconfig/config.sub       | 37 ++++++--------
 3 files changed, 65 insertions(+), 54 deletions(-)

diff --git a/support/gnuconfig/README.buildroot b/support/gnuconfig/README.buildroot
index fbf0662543..3b59510fa5 100644
--- a/support/gnuconfig/README.buildroot
+++ b/support/gnuconfig/README.buildroot
@@ -18,4 +18,4 @@ Run the script 'update' in this directory, and commit the result.
 The current Buildroot version is based on this commit of the config.git
 repository (leave alone on its own line, the script updates it):
 
-104ee6463c4bfaac3f3029d9be9bdd6e93879323
+e78c96e5288993aaea3ec44e5c6ee755c668da79
diff --git a/support/gnuconfig/config.guess b/support/gnuconfig/config.guess
index b40e17b137..11fda528bc 100755
--- a/support/gnuconfig/config.guess
+++ b/support/gnuconfig/config.guess
@@ -1,8 +1,8 @@
 #! /bin/sh
 # Attempt to guess a canonical system name.
-#   Copyright 1992-2019 Free Software Foundation, Inc.
+#   Copyright 1992-2020 Free Software Foundation, Inc.
 
-timestamp='2019-05-28'
+timestamp='2020-04-26'
 
 # This file is free software; you can redistribute it and/or modify it
 # under the terms of the GNU General Public License as published by
@@ -50,7 +50,7 @@ version="\
 GNU config.guess ($timestamp)
 
 Originally written by Per Bothner.
-Copyright 1992-2019 Free Software Foundation, Inc.
+Copyright 1992-2020 Free Software Foundation, Inc.
 
 This is free software; see the source for copying conditions.  There is NO
 warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE."
@@ -99,6 +99,8 @@ tmp=
 trap 'test -z "$tmp" || rm -fr "$tmp"' 0 1 2 13 15
 
 set_cc_for_build() {
+    # prevent multiple calls if $tmp is already set
+    test "$tmp" && return 0
     : "${TMPDIR=/tmp}"
     # shellcheck disable=SC2039
     { tmp=`(umask 077 && mktemp -d "$TMPDIR/cgXXXXXX") 2>/dev/null` && test -n "$tmp" && test -d "$tmp" ; } ||
@@ -262,6 +264,9 @@ case "$UNAME_MACHINE:$UNAME_SYSTEM:$UNAME_RELEASE:$UNAME_VERSION" in
     *:SolidBSD:*:*)
 	echo "$UNAME_MACHINE"-unknown-solidbsd"$UNAME_RELEASE"
 	exit ;;
+    *:OS108:*:*)
+	echo "$UNAME_MACHINE"-unknown-os108_"$UNAME_RELEASE"
+	exit ;;
     macppc:MirBSD:*:*)
 	echo powerpc-unknown-mirbsd"$UNAME_RELEASE"
 	exit ;;
@@ -271,12 +276,15 @@ case "$UNAME_MACHINE:$UNAME_SYSTEM:$UNAME_RELEASE:$UNAME_VERSION" in
     *:Sortix:*:*)
 	echo "$UNAME_MACHINE"-unknown-sortix
 	exit ;;
+    *:Twizzler:*:*)
+	echo "$UNAME_MACHINE"-unknown-twizzler
+	exit ;;
     *:Redox:*:*)
 	echo "$UNAME_MACHINE"-unknown-redox
 	exit ;;
     mips:OSF1:*.*)
-        echo mips-dec-osf1
-        exit ;;
+	echo mips-dec-osf1
+	exit ;;
     alpha:OSF1:*:*)
 	case $UNAME_RELEASE in
 	*4.0)
@@ -918,7 +926,7 @@ EOF
 	echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"
 	exit ;;
     alpha:Linux:*:*)
-	case `sed -n '/^cpu model/s/^.*: \(.*\)/\1/p' < /proc/cpuinfo` in
+	case `sed -n '/^cpu model/s/^.*: \(.*\)/\1/p' /proc/cpuinfo 2>/dev/null` in
 	  EV5)   UNAME_MACHINE=alphaev5 ;;
 	  EV56)  UNAME_MACHINE=alphaev56 ;;
 	  PCA56) UNAME_MACHINE=alphapca56 ;;
@@ -1325,38 +1333,39 @@ EOF
 	echo "$UNAME_MACHINE"-apple-rhapsody"$UNAME_RELEASE"
 	exit ;;
     *:Darwin:*:*)
-	set_cc_for_build
 	UNAME_PROCESSOR=`uname -p`
 	case $UNAME_PROCESSOR in
 	    unknown) UNAME_PROCESSOR=powerpc ;;
 	esac
-	if test "`echo "$UNAME_RELEASE" | sed -e 's/\..*//'`" -le 10 ; then
-	    if [ "$CC_FOR_BUILD" != no_compiler_found ]; then
-		if (echo '#ifdef __LP64__'; echo IS_64BIT_ARCH; echo '#endif') | \
-		       (CCOPTS="" $CC_FOR_BUILD -E - 2>/dev/null) | \
-		       grep IS_64BIT_ARCH >/dev/null
-		then
-		    case $UNAME_PROCESSOR in
-			i386) UNAME_PROCESSOR=x86_64 ;;
-			powerpc) UNAME_PROCESSOR=powerpc64 ;;
-		    esac
-		fi
-		# On 10.4-10.6 one might compile for PowerPC via gcc -arch ppc
-		if (echo '#ifdef __POWERPC__'; echo IS_PPC; echo '#endif') | \
-		       (CCOPTS="" $CC_FOR_BUILD -E - 2>/dev/null) | \
-		       grep IS_PPC >/dev/null
-		then
-		    UNAME_PROCESSOR=powerpc
-		fi
+	if command -v xcode-select > /dev/null 2> /dev/null && \
+		! xcode-select --print-path > /dev/null 2> /dev/null ; then
+	    # Avoid executing cc if there is no toolchain installed as
+	    # cc will be a stub that puts up a graphical alert
+	    # prompting the user to install developer tools.
+	    CC_FOR_BUILD=no_compiler_found
+	else
+	    set_cc_for_build
+	fi
+	if [ "$CC_FOR_BUILD" != no_compiler_found ]; then
+	    if (echo '#ifdef __LP64__'; echo IS_64BIT_ARCH; echo '#endif') | \
+		   (CCOPTS="" $CC_FOR_BUILD -E - 2>/dev/null) | \
+		   grep IS_64BIT_ARCH >/dev/null
+	    then
+		case $UNAME_PROCESSOR in
+		    i386) UNAME_PROCESSOR=x86_64 ;;
+		    powerpc) UNAME_PROCESSOR=powerpc64 ;;
+		esac
+	    fi
+	    # On 10.4-10.6 one might compile for PowerPC via gcc -arch ppc
+	    if (echo '#ifdef __POWERPC__'; echo IS_PPC; echo '#endif') | \
+		   (CCOPTS="" $CC_FOR_BUILD -E - 2>/dev/null) | \
+		   grep IS_PPC >/dev/null
+	    then
+		UNAME_PROCESSOR=powerpc
 	    fi
 	elif test "$UNAME_PROCESSOR" = i386 ; then
-	    # Avoid executing cc on OS X 10.9, as it ships with a stub
-	    # that puts up a graphical alert prompting to install
-	    # developer tools.  Any system running Mac OS X 10.7 or
-	    # later (Darwin 11 and later) is required to have a 64-bit
-	    # processor. This is not true of the ARM version of Darwin
-	    # that Apple uses in portable devices.
-	    UNAME_PROCESSOR=x86_64
+	    # uname -m returns i386 or x86_64
+	    UNAME_PROCESSOR=$UNAME_MACHINE
 	fi
 	echo "$UNAME_PROCESSOR"-apple-darwin"$UNAME_RELEASE"
 	exit ;;
@@ -1620,6 +1629,12 @@ copies of config.guess and config.sub with the latest versions from:
   https://git.savannah.gnu.org/gitweb/?p=config.git;a=blob_plain;f=config.guess
 and
   https://git.savannah.gnu.org/gitweb/?p=config.git;a=blob_plain;f=config.sub
+EOF
+
+year=`echo $timestamp | sed 's,-.*,,'`
+# shellcheck disable=SC2003
+if test "`expr "\`date +%Y\`" - "$year"`" -lt 3 ; then
+   cat >&2 <<EOF
 
 If $0 has already been updated, send the following data and any
 information you think might be pertinent to config-patches at gnu.org to
@@ -1647,6 +1662,7 @@ UNAME_RELEASE = "$UNAME_RELEASE"
 UNAME_SYSTEM  = "$UNAME_SYSTEM"
 UNAME_VERSION = "$UNAME_VERSION"
 EOF
+fi
 
 exit 1
 
diff --git a/support/gnuconfig/config.sub b/support/gnuconfig/config.sub
index 5b158ac41c..973a2980ac 100755
--- a/support/gnuconfig/config.sub
+++ b/support/gnuconfig/config.sub
@@ -1,8 +1,8 @@
 #! /bin/sh
 # Configuration validation subroutine script.
-#   Copyright 1992-2019 Free Software Foundation, Inc.
+#   Copyright 1992-2020 Free Software Foundation, Inc.
 
-timestamp='2019-05-23'
+timestamp='2020-05-04'
 
 # This file is free software; you can redistribute it and/or modify it
 # under the terms of the GNU General Public License as published by
@@ -67,7 +67,7 @@ Report bugs and patches to <config-patches@gnu.org>."
 version="\
 GNU config.sub ($timestamp)
 
-Copyright 1992-2019 Free Software Foundation, Inc.
+Copyright 1992-2020 Free Software Foundation, Inc.
 
 This is free software; see the source for copying conditions.  There is NO
 warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE."
@@ -337,17 +337,14 @@ case $1 in
 				basic_machine=m88k-harris
 				os=sysv3
 				;;
-			hp300)
-				basic_machine=m68k-hp
-				;;
-			hp300bsd)
-				basic_machine=m68k-hp
-				os=bsd
-				;;
-			hp300hpux)
+			hp300 | hp300hpux)
 				basic_machine=m68k-hp
 				os=hpux
 				;;
+			hp300bsd)
+				basic_machine=m68k-hp
+				os=bsd
+				;;
 			hppaosf)
 				basic_machine=hppa1.1-hp
 				os=osf
@@ -360,10 +357,6 @@ case $1 in
 				basic_machine=i386-mach
 				os=mach
 				;;
-			vsta)
-				basic_machine=i386-pc
-				os=vsta
-				;;
 			isi68 | isi)
 				basic_machine=m68k-isi
 				os=sysv
@@ -612,6 +605,10 @@ case $1 in
 				basic_machine=vax-dec
 				os=vms
 				;;
+			vsta)
+				basic_machine=i386-pc
+				os=vsta
+				;;
 			vxworks960)
 				basic_machine=i960-wrs
 				os=vxworks
@@ -1346,11 +1343,11 @@ case $os in
 	     | hpux* | unos* | osf* | luna* | dgux* | auroraux* | solaris* \
 	     | sym* | kopensolaris* | plan9* \
 	     | amigaos* | amigados* | msdos* | newsos* | unicos* | aof* \
-	     | aos* | aros* | cloudabi* | sortix* \
+	     | aos* | aros* | cloudabi* | sortix* | twizzler* \
 	     | nindy* | vxsim* | vxworks* | ebmon* | hms* | mvs* \
 	     | clix* | riscos* | uniplus* | iris* | isc* | rtu* | xenix* \
 	     | knetbsd* | mirbsd* | netbsd* \
-	     | bitrig* | openbsd* | solidbsd* | libertybsd* \
+	     | bitrig* | openbsd* | solidbsd* | libertybsd* | os108* \
 	     | ekkobsd* | kfreebsd* | freebsd* | riscix* | lynxos* \
 	     | bosx* | nextstep* | cxux* | aout* | elf* | oabi* \
 	     | ptx* | coff* | ecoff* | winnt* | domain* | vsta* \
@@ -1368,7 +1365,8 @@ case $os in
 	     | powermax* | dnix* | nx6 | nx7 | sei* | dragonfly* \
 	     | skyos* | haiku* | rdos* | toppers* | drops* | es* \
 	     | onefs* | tirtos* | phoenix* | fuchsia* | redox* | bme* \
-	     | midnightbsd* | amdhsa* | unleashed* | emscripten* | wasi*)
+	     | midnightbsd* | amdhsa* | unleashed* | emscripten* | wasi* \
+	     | nsk* | powerunix* | genode*)
 	# Remember, each alternative MUST END IN *, to match a version number.
 		;;
 	qnx*)
@@ -1452,9 +1450,6 @@ case $os in
 	ns2)
 		os=nextstep2
 		;;
-	nsk*)
-		os=nsk
-		;;
 	# Preserve the version number of sinix5.
 	sinix5.*)
 		os=`echo $os | sed -e 's|sinix|sysv|'`
-- 
2.20.1
