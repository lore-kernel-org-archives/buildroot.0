From: ulf at uclibc.org <ulf@uclibc.org>
Date: Mon,  2 Feb 2009 07:18:22 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/scripts
Message-ID: <20090202071822.9871B764CB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-02-02 07:18:19 +0000 (Mon, 02 Feb 2009)
New Revision: 25214

Log:
Create a log file as well as stdout during test

Modified:
   trunk/buildroot/scripts/testheader.inc


Changeset:
Modified: trunk/buildroot/scripts/testheader.inc
===================================================================
--- trunk/buildroot/scripts/testheader.inc	2009-02-02 07:17:23 UTC (rev 25213)
+++ trunk/buildroot/scripts/testheader.inc	2009-02-02 07:18:19 UTC (rev 25214)
@@ -1,13 +1,14 @@
 ARCH=`make -f scripts/test/Makefile ARCH`
-
+DATE=`date +%Y%m%d`
+LOGFILE=build-results-${DATE}-${ARCH}.log
 function mk()
 {
-	scripts/mkpkg $1 $2 "$3"
+	scripts/mkpkg $1 $2 "$3"			| tee -a ${LOGFILE}
 }
 
 function	header()
 {
-	echo "#!/bin/sh"
+	echo "#!/bin/sh"				| tee -a ${LOGFILE}
 	echo "source \"scripts/testheader.inc\""
 	
 }
@@ -17,51 +18,51 @@
 
 function	SKIP()
 {
-	echo SKIP
+	echo SKIP					| tee -a ${LOGFILE}
 	active=0
 }
 
 function	RESTART()
 {
-	echo RESTART
+	echo RESTART					| tee -a ${LOGFILE}
 	active=1
 }
 
 function	EXE()
 {
-	printf 	"EXE	"
+	printf 	"EXE	"				| tee -a ${LOGFILE}
 	if [ ${active} == 1 ] ; then
 		$1 $2 $3 "$4"
 		return 0;
 	else
-		printf	"%-8s"	"$1"
-		printf	"%-32s"	"$2"
-		printf	"%-16s"	"$3"
+		printf	"%-8s"	"$1"			| tee -a ${LOGFILE}
+		printf	"%-32s"	"$2"			| tee -a ${LOGFILE}
+		printf	"%-16s"	"$3"			| tee -a ${LOGFILE}
 		if [ "${4}X" != "X" ] ; then
-			printf	"%-64s"	"\"$4\""
+			printf	"%-64s"	"\"$4\""	| tee -a ${LOGFILE}
 		fi
-		echo
+		echo					| tee -a ${LOGFILE}
 		return 1;
 	fi
 }
 
 function	AVR()
 {
-	printf 	"AVR	"
+	printf 	"AVR	"				| tee -a ${LOGFILE}
 	if [ "${ARCH}X" == "avr32X" ] ; then
-		echo "mk $2 UNSUPPORTED \"$4\" $5 $6"
+		echo "mk $2 UNSUPPORTED \"$4\" $5 $6"	| tee -a ${LOGFILE}
 		return 1;
 	elif [ ${active} == 1 ] ; then
 		$1 $2 "$3" "$4"
 		return 0;
 	else
-		printf	"%-8s"	"$1"
-		printf	"%-32s"	"$2"
-		printf	"%-16s"	"$3"
+		printf	"%-8s"	"$1"			| tee -a ${LOGFILE}
+		printf	"%-32s"	"$2"			| tee -a ${LOGFILE}
+		printf	"%-16s"	"$3"			| tee -a ${LOGFILE}
 		if [ "${4}X" != "X" ] ; then
-			printf	"%-64s"	"\"$4\"";
+			printf	"%-64s"	"\"$4\""	| tee -a ${LOGFILE}
 		fi
-		echo
+		echo					| tee -a ${LOGFILE}
 		return 1;
 	fi
 }
@@ -69,53 +70,53 @@
 
 function skip()
 {
-	printf "skip	%-8s" "$1"
-	printf "%-32s" "$2"
+	printf "skip	%-8s" "$1"			| tee -a ${LOGFILE}
+	printf "%-32s" "$2"				| tee -a ${LOGFILE}
 	if [   "$3X" == "OKX" ] ; then
-		printf "%-16s"	"DISABLED"
+		printf "%-16s"	"DISABLED"		| tee -a ${LOGFILE}
 		if [ "${4}X" != "X" ] ; then
-			printf	"%-64s"	"\"$4\""
+			printf	"%-64s"	"\"$4\""	| tee -a ${LOGFILE}
 		fi
 	elif [ "$3X" == "FAILX" ] ; then
-		printf "%-16s"	"DISABLED"
+		printf "%-16s"	"DISABLED"		| tee -a ${LOGFILE}
 		if [ "${4}X" != "X" ] ; then
-			printf	"%-64s"	"\"$4\""
+			printf	"%-64s"	"\"$4\""	| tee -a ${LOGFILE}
 		fi
 	elif [ "$3X" == "BROKENX" ] ; then
-		printf "%-16s"	"DISABLED"
+		printf "%-16s"	"DISABLED"		| tee -a ${LOGFILE}
 		if [ "${4}X" != "X" ] ; then
-			printf	"%-64s"	"\"$4\""
+			printf	"%-64s"	"\"$4\""	| tee -a ${LOGFILE}
 		fi
 	elif [ "$3X" == "DISABLEDX" ] ; then
-		printf "%-16s"	"DISABLED"
+		printf "%-16s"	"DISABLED"		| tee -a ${LOGFILE}
 		if [ "${4}X" != "X" ] ; then
-			printf	"%-64s"	"\"$4\""
+			printf	"%-64s"	"\"$4\""	| tee -a ${LOGFILE}
 		fi
 	else
-		printf "%-16s"	"DISABLED"
+		printf "%-16s"	"DISABLED" 		| tee -a ${LOGFILE}
 		if [ "${4}X" != "X" ] ; then
-			printf	"%-64s"	"\"$4\""
+			printf	"%-64s"	"\"$4\""	| tee -a ${LOGFILE}
 		fi
 	fi
-	echo
+	echo						| tee -a ${LOGFILE}
 }
 
 function bb()
 {
-	printf 	"%-8s"	"bb"
+	printf 	"%-8s"	"bb"				| tee -a ${LOGFILE}
 	if [ ${busybox} == 1 ] ; then
-		printf "%-8s"	"$1"
+		printf "%-8s"	"$1"			| tee -a ${LOGFILE}
 		$1 $2 $3 $4 $5 $6
 		return 0;
 	else
-		echo "$1	$2 $3 $4 $5 $6"
+		echo "$1	$2 $3 $4 $5 $6"		| tee -a ${LOGFILE}
 		return 1;
 	fi
 }
 
 function	comment()
 {
-	echo	"comment	$1"
+	echo	"comment	$1"			| tee -a ${LOGFILE}
 }
 
 # Enable HASERL
