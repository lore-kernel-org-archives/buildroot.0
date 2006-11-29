From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 29 Nov 2006 02:39:30 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/dependencies
Message-ID: <20061129103930.E07C04856B@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-11-29 02:39:30 -0800 (Wed, 29 Nov 2006)
New Revision: 16714

Log:
- move check for which(1) before it's first use
- fix printing a message when erroring out on non-existing HOSTCC


Modified:
   trunk/buildroot/toolchain/dependencies/dependencies.sh


Changeset:
Modified: trunk/buildroot/toolchain/dependencies/dependencies.sh
===================================================================
--- trunk/buildroot/toolchain/dependencies/dependencies.sh	2006-11-29 10:23:54 UTC (rev 16713)
+++ trunk/buildroot/toolchain/dependencies/dependencies.sh	2006-11-29 10:39:30 UTC (rev 16714)
@@ -1,6 +1,5 @@
 #!/bin/sh
 
-set -e
 #set -x
 
 echo ""
@@ -31,6 +30,19 @@
 
 #############################################################
 #
+# check build system 'which'
+#
+#############################################################
+if ! which which > /dev/null ; then
+	echo "which installed:		    FALSE"
+	echo -e "\n\nYou must install 'which' on your build machine\n";
+	exit 1;
+fi;
+echo "which installed:		    Ok"
+
+
+#############################################################
+#
 # check build system 'make'
 #
 #############################################################
@@ -64,12 +76,13 @@
 COMPILER=$(which $HOSTCC)
 if [ -z "$COMPILER" ] ; then
 	COMPILER=$(which cc)
-	if [ -z "$COMPILER" ] ; then
-		echo "gcc installed:		    FALSE"
-		echo -e "\n\nYou must install 'gcc' on your build machine\n";
-		exit 1;
-	fi;
 fi;
+if [ -z "$COMPILER" ] ; then
+	echo "C Compiler installed:		    FALSE"
+	echo -e "\n\nYou must install 'gcc' on your build machine\n";
+	exit 1;
+fi;
+
 COMPILER_VERSION=$($COMPILER --version 2>&1 | head -n1 | $XSED -e 's/^.*(.CC) \([0-9\.]\)/\1/g' -e "s/[-\ ].*//g")
 if [ -z "$COMPILER_VERSION" ] ; then
 	echo "gcc installed:		    FALSE"
@@ -82,26 +95,13 @@
 	echo "You have gcc '$COMPILER_VERSION' installed.  gcc >= 2.95 is required"
 	exit 1;
 fi;
-echo "gcc version '$COMPILER_VERSION':		    Ok"
+echo "C compiler '$COMPILER'"
+echo "C compiler version '$COMPILER_VERSION':	    Ok"
 
 
 
-
 #############################################################
 #
-# check build system 'which'
-#
-#############################################################
-if ! which which > /dev/null ; then
-	echo "which installed:		    FALSE"
-	echo -e "\n\nYou must install 'which' on your build machine\n";
-	exit 1;
-fi;
-echo "which installed:		    Ok"
-
-
-#############################################################
-#
 # check build system 'bison'
 #
 #############################################################
