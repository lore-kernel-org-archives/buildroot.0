From: ulf at uclibc.org <ulf@uclibc.org>
Date: Fri,  2 Jan 2009 15:44:22 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/scripts
Message-ID: <20090102154422.DA6BD769FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-02 15:44:18 +0000 (Fri, 02 Jan 2009)
New Revision: 24648

Log:
Apply some care, when copying the linux configuration file

Modified:
   trunk/buildroot/scripts/get_linux_config.sh


Changeset:
Modified: trunk/buildroot/scripts/get_linux_config.sh
===================================================================
--- trunk/buildroot/scripts/get_linux_config.sh	2009-01-02 12:01:49 UTC (rev 24647)
+++ trunk/buildroot/scripts/get_linux_config.sh	2009-01-02 15:44:18 UTC (rev 24648)
@@ -1,15 +1,57 @@
 #!/bin/bash
+#######################################################################
+#
+# Copy successively all configs from the BSP directory (par #1)
+# to the Linux directory (par #2)
+# Do not copy config files for later linux versions than the current
+# A well-behaved filename is 
+# "<name>-linux-2.6.<major>.<minor>.config" or
+# "<name>-linux-2.6.<major>.config"
+#
+#######################################################################
 
+TOPDIR=`pwd`
+
 # parameter #1	BOARD_PATH
 # parameter #2  LINUX26_DIR
 
-TOPDIR=`pwd`
-BOARD_PATH=$1
-LINUX26_DIR=$2
+CONFIGS=`ls -X $1/*linux*.*.config | sed s/[.]config// - | sort`
+LINUX26_DIR=`basename $2`
+LINUX26_CONFIG=${2}/.config
+LINUX_MAJOR_VERSION=${LINUX26_DIR:10:2}
+LINUX_MINOR_VERSION=${LINUX26_DIR:13}
 
-cd ${TOPDIR}/${BOARD_PATH}
-mkdir -p ${LINUX26_DIR}
-for i in `ls *linux*.config` ; do
-	echo Copying $i ...
-	cp $i ${LINUX26_DIR}/.config
+function linux_version()
+{
+	local KCONFIG
+	KCONFIG=`basename $1`
+	KERNEL=`echo ${KCONFIG} | sed s/.*-linux-/linux-/g -`
+	THIS_MAJOR=${KERNEL:10:2}
+	THIS_MINOR=${KERNEL:13}
+
+}
+
+# Try to be careful...
+
+for i in ${CONFIGS} ; do
+    linux_version $i
+    if [ ${THIS_MAJOR} -le ${LINUX_MAJOR_VERSION} ] ; then
+	    echo Copying `basename $i`.config ...
+	    cp $i.config ${LINUX26_CONFIG}
+    elif [ ${THIS_MAJOR} -eq ${LINUX_MAJOR_VERSION} ] ; then
+	if [ ${THIS_MINOR} -le ${LINUX_MINOR_VERSION} ] ; then
+	    echo Copying `basename $i`.config ...
+	    cp $i.config ${LINUX26_CONFIG}
+	fi
+    fi
 done
+
+# Did not work... - be promisceous
+
+if [ ! -f "${LINUX26_CONFIG}" ] ; then \
+	for i in `ls $1/*linux*.config` ; do
+		echo Copying `basename $i` ...
+		cp $i ${LINUX26_CONFIG}
+	done
+fi
+
