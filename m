From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat,  3 Jan 2009 16:59:04 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/scripts
Message-ID: <20090103165904.DD4DC76BC9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-03 16:59:04 +0000 (Sat, 03 Jan 2009)
New Revision: 24679

Log:
Do not copy linux config with higher minor version than current kernel

Modified:
   trunk/buildroot/scripts/get_linux_config.sh


Changeset:
Modified: trunk/buildroot/scripts/get_linux_config.sh
===================================================================
--- trunk/buildroot/scripts/get_linux_config.sh	2009-01-03 16:30:09 UTC (rev 24678)
+++ trunk/buildroot/scripts/get_linux_config.sh	2009-01-03 16:59:04 UTC (rev 24679)
@@ -11,38 +11,57 @@
 #######################################################################
 
 TOPDIR=`pwd`
-
+DEBUG=0
 # parameter #1	BOARD_PATH
 # parameter #2  LINUX26_DIR
 
-CONFIGS=`ls -X $1/*linux*.*.config | sed s/[.]config// - | sort`
+CONFIGS=`ls -X $1/*linux-2.6.*.config | sed s/[.]config// - | sort`
 LINUX26_DIR=`basename $2`
 LINUX26_CONFIG=${2}/.config
 LINUX_MAJOR_VERSION=${LINUX26_DIR:10:2}
 LINUX_MINOR_VERSION=${LINUX26_DIR:13}
 
+function DBG_PRINT
+{
+	if [ ${DEBUG} == 1 ] ; then
+		echo $1
+	fi
+}
+
 function linux_version()
 {
 	local KCONFIG
 	KCONFIG=`basename $1`
-	KERNEL=`echo ${KCONFIG} | sed s/.*-linux-/linux-/g -`
+	KERNEL=`echo ${KCONFIG} | sed s/.*linux-2.6./linux-2.6./g -`
 	THIS_MAJOR=${KERNEL:10:2}
 	THIS_MINOR=${KERNEL:13}
-
 }
 
 # Try to be careful...
+DBG_PRINT MAJOR=\"${LINUX_MAJOR_VERSION}\"
+DBG_PRINT MINOR=\"${LINUX_MINOR_VERSION}\"
 
 for i in ${CONFIGS} ; do
+    DBG_PRINT FILE=$i
     linux_version $i
-    if [ ${THIS_MAJOR} -le ${LINUX_MAJOR_VERSION} ] ; then
+    DBG_PRINT KERNEL=${KERNEL}
+    if [ ${THIS_MAJOR} -lt ${LINUX_MAJOR_VERSION} ] ; then
 	    echo Copying `basename $i`.config ...
 	    cp $i.config ${LINUX26_CONFIG}
     elif [ ${THIS_MAJOR} -eq ${LINUX_MAJOR_VERSION} ] ; then
-	if [ ${THIS_MINOR} -le ${LINUX_MINOR_VERSION} ] ; then
+	if [ "${LINUX_MINOR_VERSION}X" == "X" ] ; then
+		if [ "${THIS_MINOR}X" == "X" ] ; then
+		    echo Copying `basename $i`.config ...
+		    cp $i.config ${LINUX26_CONFIG}
+		else		
+			return
+		fi
+	elif [ ${THIS_MINOR} -le ${LINUX_MINOR_VERSION} ] ; then
 	    echo Copying `basename $i`.config ...
 	    cp $i.config ${LINUX26_CONFIG}
 	fi
+    else		
+	return
     fi
 done
 
