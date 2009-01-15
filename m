From: ulf at uclibc.org <ulf@uclibc.org>
Date: Thu, 15 Jan 2009 23:17:39 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/scripts
Message-ID: <20090115231739.782E476736@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-15 23:17:38 +0000 (Thu, 15 Jan 2009)
New Revision: 24863

Log:
Update package buildscript

Modified:
   trunk/buildroot/scripts/mkpkg


Changeset:
Modified: trunk/buildroot/scripts/mkpkg
===================================================================
--- trunk/buildroot/scripts/mkpkg	2009-01-15 19:36:06 UTC (rev 24862)
+++ trunk/buildroot/scripts/mkpkg	2009-01-15 23:17:38 UTC (rev 24863)
@@ -19,16 +19,21 @@
 
 test=${OK}
 
-function build_package ()
+function	clean_files()
 {
-	printf "%-31s" "$1"
 	rm -f ${LOG}
 	rm -f ${LOG_OK_FILE}
 	rm -f ${LOG_FAIL_FILE}
 	rm -f ${DEPENDENCY}
+}
 
+function	dirclean ()
+{
 	make $1-dirclean > /dev/null 2>&1
+}
 
+function	process ()
+{
 	make $1 >> ${LOG} 2>&1 || test=${FAIL}
 	grep "\.tar\." ${LOG} > ${DEPENDENCY}
 	if [ ${test} == ${OK} ] ; then
@@ -36,10 +41,33 @@
 		echo "OK	"
 	else
 		mv ${LOG} ${LOG_FAIL_FILE}
-		echo "FAIL	"
+		printf "FAIL	"
+		echo	\"$2\"
 	fi
 }
 
-build_package $1
+function build_package ()
+{
+	printf "mk	%-31s" "$1"
+	if [ "$2X" == "X" ] ; then		# no parameters
+		clean_files	$1
+		dirclean	$1
+		process		$1
+	elif [ "$2X" == "OKX" ] ; then	# Previous build was OK
+		clean_files	$1
+		dirclean	$1
+		process		$1
+	elif [ "$2X" == "FAILX" ] ; then
+		clean_files	$1
+		dirclean	$1
+		process		$1 $3
+	elif [ "$2X" == "BROKENX" ] ; then
+		printf  "BROKEN	"
+		echo	\"$3\"
+	fi
+}
 
+build_package $1 $2 $3
 
+
+
