From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat, 10 Jan 2009 00:26:30 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/scripts
Message-ID: <20090110002630.A8D457688F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-10 00:26:30 +0000 (Sat, 10 Jan 2009)
New Revision: 24739

Log:
Add script allowing better overview of build status of single packages

Added:
   trunk/buildroot/scripts/mkpkg


Changeset:
Added: trunk/buildroot/scripts/mkpkg
===================================================================
--- trunk/buildroot/scripts/mkpkg	                        (rev 0)
+++ trunk/buildroot/scripts/mkpkg	2009-01-10 00:26:30 UTC (rev 24739)
@@ -0,0 +1,45 @@
+#!/bin/bash
+OK=0
+FAIL=1
+TOPDIR=`pwd`
+LOG_FILE=$1.log
+LOG_DIR=${TOPDIR}/log/
+LOG=${LOG_DIR}/${LOG_FILE}
+DEPENDENCY=${LOG_DIR}/DEPEND/$1.depend.txt
+
+LOG_OK_DIR=${LOG_DIR}/OK
+LOG_FAIL_DIR=${LOG_DIR}/FAIL
+LOG_OK_FILE=${LOG_OK_DIR}/${LOG_FILE}.OK
+LOG_FAIL_FILE=${LOG_FAIL_DIR}/${LOG_FILE}.FAIL
+
+mkdir -p ${LOG_DIR}
+mkdir -p ${LOG_OK_DIR}
+mkdir -p ${LOG_FAIL_DIR}
+mkdir -p ${LOG_DIR}/DEPEND
+
+test=${OK}
+
+function build_package ()
+{
+	printf "%-52s" "$1"
+	rm -f {LOG}
+	rm -f {LOG_OK_FILE}
+	rm -f {LOG_FAIL_FILE}
+	rm -f ${DEPENDENCY}
+
+	make $1-dirclean > /dev/null 2>&1
+
+	make $1 >> ${LOG} 2>&1 || test=${FAIL}
+	grep "\.tar\." ${LOG} > ${DEPENDENCY}
+	if [ ${test} == ${OK} ] ; then
+		mv ${LOG} ${LOG_OK_FILE}
+		echo "OK"
+	else
+		mv ${LOG} ${LOG_FAIL_FILE}
+		echo "FAIL"
+	fi
+}
+
+build_package $1
+
+


Property changes on: trunk/buildroot/scripts/mkpkg
___________________________________________________________________
Added: svn:executable
   + *
