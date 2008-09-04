From: hamish at uclibc.org <hamish@uclibc.org>
Date: Wed,  3 Sep 2008 19:30:57 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/dependencies
Message-ID: <20080904023057.53A113C7CA@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: hamish
Date: 2008-09-03 19:30:56 -0700 (Wed, 03 Sep 2008)
New Revision: 23316

Log:
Applied change from Ben Nizette and Hans-Christian Egtvedt to
correctly detect version of gcc on recent distros.  Supplied 
patch was against git and didn't apply cleanly to svn, so applied 
by hand.


Modified:
   trunk/buildroot/toolchain/dependencies/dependencies.sh


Changeset:
Modified: trunk/buildroot/toolchain/dependencies/dependencies.sh
===================================================================
--- trunk/buildroot/toolchain/dependencies/dependencies.sh	2008-09-04 01:39:40 UTC (rev 23315)
+++ trunk/buildroot/toolchain/dependencies/dependencies.sh	2008-09-04 02:30:56 UTC (rev 23316)
@@ -188,7 +188,8 @@
 	exit 1;
 fi;
 
-COMPILER_VERSION=$($COMPILER --version 2>&1 | $XSED -e 's/^.*(.CC) \([0-9\.]\)/\1/g' -e "s/[-\ ].*//g" -e '1q')
+COMPILER_VERSION=$($COMPILER -v 2>&1 | $XSED -n '/^gcc version/p' |
+	$XSED -e 's/^gcc version \([0-9\.]\)/\1/g' -e 's/[-\ ].*//g' -e '1q')
 if [ -z "$COMPILER_VERSION" ] ; then
 	echo "gcc installed:		    FALSE"
 	/bin/echo -e "\n\nYou must install 'gcc' on your build machine\n";
@@ -215,7 +216,8 @@
 	#exit 1
 fi
 if [ ! -z "$CXXCOMPILER" ] ; then
-	CXXCOMPILER_VERSION=$($CXXCOMPILER --version 2>&1 | $XSED -e 's/^.*(.CC) \([0-9\.]\)/\1/g' -e "s/[-\ ].*//g" -e '1q')
+	CXXCOMPILER_VERSION=$($CXXCOMPILER -v 2>&1 | $XSED -n '/^gcc version/p' |
+		$XSED -e 's/^gcc version \([0-9\.]\)/\1/g' -e 's/[-\ ].*//g' -e '1q')
 	if [ -z "$CXXCOMPILER_VERSION" ] ; then
 		echo "c++ installed:		    FALSE"
 		/bin/echo -e "\nYou may have to install 'g++' on your build machine\n"
