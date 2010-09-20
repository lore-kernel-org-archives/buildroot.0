From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Mon, 20 Sep 2010 23:26:08 +0200
Subject: [Buildroot] [PATCH 3/4] scripts: fix for POSIX compliance
In-Reply-To: <1285017969-32280-1-git-send-email-yann.morin.1998@anciens.enib.fr>
References: <1285017969-32280-1-git-send-email-yann.morin.1998@anciens.enib.fr>
Message-ID: <1285017969-32280-4-git-send-email-yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Using two '=' for string comparison is a bashism.
Revert to using one, as stated in POSIX 1003.1-2008.

Of the three affected scripts, two are explicitly called vi #!/bin/bash.
Those two do not _need_ the fix, but gets it nonetheless, in case we
later switch to a POSIX-compliant shell for those scripts.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
---
 scripts/get_linux_config.sh |    6 +++---
 scripts/mkpkg               |   14 +++++++-------
 scripts/testheader.inc      |   16 ++++++++--------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/scripts/get_linux_config.sh b/scripts/get_linux_config.sh
index 5cd0e37..6c00036 100755
--- a/scripts/get_linux_config.sh
+++ b/scripts/get_linux_config.sh
@@ -23,7 +23,7 @@ LINUX_MINOR_VERSION=${LINUX26_DIR:13}
 
 function DBG_PRINT
 {
-	if [ ${DEBUG} == 1 ] ; then
+	if [ ${DEBUG} = 1 ] ; then
 		echo $1
 	fi
 }
@@ -50,8 +50,8 @@ for i in ${CONFIGS} ; do
 	    echo Copying `basename $i`.config ...
 	    cp $i.config ${LINUX26_CONFIG}
     elif [ ${THIS_MAJOR} -eq ${LINUX_MAJOR_VERSION} ] ; then
-	if [ "${LINUX_MINOR_VERSION}X" == "X" ] ; then
-		if [ "${THIS_MINOR}X" == "X" ] ; then
+	if [ "${LINUX_MINOR_VERSION}X" = "X" ] ; then
+		if [ "${THIS_MINOR}X" = "X" ] ; then
 		    echo Copying `basename $i`.config ...
 		    cp $i.config ${LINUX26_CONFIG}
 		else		
diff --git a/scripts/mkpkg b/scripts/mkpkg
index af47f42..4db0fef 100755
--- a/scripts/mkpkg
+++ b/scripts/mkpkg
@@ -36,7 +36,7 @@ function	process ()
 {
 	make $1 >> ${LOG} 2>&1 || test=${FAIL}
 	grep "\.tar\." ${LOG} > ${DEPENDENCY}
-	if [ ${test} == ${OK} ] ; then
+	if [ ${test} = ${OK} ] ; then
 		mv ${LOG} ${LOG_OK_FILE}
 		printf "%-16s" "OK"
 		if [ "${2}X" != "X" ] ; then
@@ -65,29 +65,29 @@ function build_package ()
 {
 	# echo "BUILD PACKAGE:1=$1 2=$2 3=$3 4=$4 5=$5 6=$6 7=$7"
 	printf "mk	%-32s" "$1"
-	if [ "$2X" == "X" ] ; then		# no parameters
+	if [ "$2X" = "X" ] ; then		# no parameters
 		clean_files	$1
 		dirclean	$1
 		process		$1 "$3"
-	elif [ "$2X" == "?X" ] ; then		# no parameters
+	elif [ "$2X" = "?X" ] ; then		# no parameters
 		clean_files	$1
 		dirclean	$1
 		process		$1 "$3"
-	elif [ "$2X" == "OKX" ] ; then	# Previous build was OK
+	elif [ "$2X" = "OKX" ] ; then	# Previous build was OK
 		clean_files	$1
 		dirclean	$1
 		process		$1 "$3"
-	elif [ "$2X" == "FAILX" ] ; then
+	elif [ "$2X" = "FAILX" ] ; then
 		clean_files	$1
 		dirclean	$1
 		process		$1 "$3"
-	elif [ "$2X" == "BROKENX" ] ; then
+	elif [ "$2X" = "BROKENX" ] ; then
 		printf  "%-16s" "BROKEN"
 		if [ "${3}X" != "X" ] ; then
 			printf	"%s"	"\"$3\"";
 		fi
 		echo
-	elif [ "$2X" == "DISABLEDX" ] ; then
+	elif [ "$2X" = "DISABLEDX" ] ; then
 		printf  "%-16s" "DISABLED"
 		if [ "${3}X" != "X" ] ; then
 			printf	"%s"	"\"$3\"";
diff --git a/scripts/testheader.inc b/scripts/testheader.inc
index 232e1e0..44b5585 100644
--- a/scripts/testheader.inc
+++ b/scripts/testheader.inc
@@ -31,7 +31,7 @@ function	RESTART()
 function	EXE()
 {
 	printf 	"EXE	"				| tee -a ${LOGFILE}
-	if [ ${active} == 1 ] ; then
+	if [ ${active} = 1 ] ; then
 		$1 $2 $3 "$4"
 		return 0;
 	else
@@ -49,10 +49,10 @@ function	EXE()
 function	AVR()
 {
 	printf 	"AVR	"				| tee -a ${LOGFILE}
-	if [ "${ARCH}X" == "avr32X" ] ; then
+	if [ "${ARCH}X" = "avr32X" ] ; then
 		echo "mk $2 UNSUPPORTED \"$4\" $5 $6"	| tee -a ${LOGFILE}
 		return 1;
-	elif [ ${active} == 1 ] ; then
+	elif [ ${active} = 1 ] ; then
 		$1 $2 "$3" "$4"
 		return 0;
 	else
@@ -72,22 +72,22 @@ function skip()
 {
 	printf "skip	%-8s" "$1"			| tee -a ${LOGFILE}
 	printf "%-32s" "$2"				| tee -a ${LOGFILE}
-	if [   "$3X" == "OKX" ] ; then
+	if [   "$3X" = "OKX" ] ; then
 		printf "%-16s"	"DISABLED"		| tee -a ${LOGFILE}
 		if [ "${4}X" != "X" ] ; then
 			printf	"%-64s"	"\"$4\""	| tee -a ${LOGFILE}
 		fi
-	elif [ "$3X" == "FAILX" ] ; then
+	elif [ "$3X" = "FAILX" ] ; then
 		printf "%-16s"	"DISABLED"		| tee -a ${LOGFILE}
 		if [ "${4}X" != "X" ] ; then
 			printf	"%-64s"	"\"$4\""	| tee -a ${LOGFILE}
 		fi
-	elif [ "$3X" == "BROKENX" ] ; then
+	elif [ "$3X" = "BROKENX" ] ; then
 		printf "%-16s"	"DISABLED"		| tee -a ${LOGFILE}
 		if [ "${4}X" != "X" ] ; then
 			printf	"%-64s"	"\"$4\""	| tee -a ${LOGFILE}
 		fi
-	elif [ "$3X" == "DISABLEDX" ] ; then
+	elif [ "$3X" = "DISABLEDX" ] ; then
 		printf "%-16s"	"DISABLED"		| tee -a ${LOGFILE}
 		if [ "${4}X" != "X" ] ; then
 			printf	"%-64s"	"\"$4\""	| tee -a ${LOGFILE}
@@ -104,7 +104,7 @@ function skip()
 function bb()
 {
 	printf 	"%-8s"	"bb"				| tee -a ${LOGFILE}
-	if [ ${busybox} == 1 ] ; then
+	if [ ${busybox} = 1 ] ; then
 		printf "%-8s"	"$1"			| tee -a ${LOGFILE}
 		$1 $2 $3 $4 $5 $6
 		return 0;
-- 
1.7.1
