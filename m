From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue, 28 Nov 2006 02:06:48 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/dependencies
Message-ID: <20061128100648.032E448587@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-11-28 02:06:48 -0800 (Tue, 28 Nov 2006)
New Revision: 16703

Log:
- fix parsing the gcc version. Also look at the HOSTCC's version rather than a random gcc that may be installed.
  Closes #961 and #1097 


Modified:
   trunk/buildroot/toolchain/dependencies/dependencies.mk
   trunk/buildroot/toolchain/dependencies/dependencies.sh


Changeset:
Modified: trunk/buildroot/toolchain/dependencies/dependencies.mk
===================================================================
--- trunk/buildroot/toolchain/dependencies/dependencies.mk	2006-11-28 10:01:46 UTC (rev 16702)
+++ trunk/buildroot/toolchain/dependencies/dependencies.mk	2006-11-28 10:06:48 UTC (rev 16703)
@@ -6,7 +6,7 @@
 ######################################################################
 
 dependencies: host-sed
-	@$(TOPDIR)/toolchain/dependencies/dependencies.sh
+	@HOSTCC="$(firstword $(HOSTCC))" $(TOPDIR)/toolchain/dependencies/dependencies.sh
 
 dependencies-source:
 

Modified: trunk/buildroot/toolchain/dependencies/dependencies.sh
===================================================================
--- trunk/buildroot/toolchain/dependencies/dependencies.sh	2006-11-28 10:01:46 UTC (rev 16702)
+++ trunk/buildroot/toolchain/dependencies/dependencies.sh	2006-11-28 10:06:48 UTC (rev 16703)
@@ -61,7 +61,7 @@
 # check build system 'gcc'
 #
 #############################################################
-COMPILER=$(which gcc)
+COMPILER=$(which $HOSTCC)
 if [ -z "$COMPILER" ] ; then
 	COMPILER=$(which cc)
 	if [ -z "$COMPILER" ] ; then
@@ -70,7 +70,7 @@
 		exit 1;
 	fi;
 fi;
-COMPILER_VERSION=$($COMPILER --version 2>&1 | head -n1 | $XSED -e 's/^.* \([0-9\.]\)/\1/g' -e "s/[-\ ].*//g")
+COMPILER_VERSION=$($COMPILER --version 2>&1 | head -n1 | $XSED -e 's/^.*(.CC) \([0-9\.]\)/\1/g' -e "s/[-\ ].*//g")
 if [ -z "$COMPILER_VERSION" ] ; then
 	echo "gcc installed:		    FALSE"
 	echo -e "\n\nYou must install 'gcc' on your build machine\n";
